---@alias MethodTags {mem: boolean, ws?: boolean, ["http?"]?: boolean, http?: boolean}
---@alias ClassTags {ui?: boolean, abc?: boolean}
---@alias Parameter {[1]: string, [2]: string, [3]: boolean}

---@class Property
---@field name string
---@field desc string
---@field type string

---@class Method
---@field desc string
---@field parameters Parameter[]
---@field returns string[]
---@field class table
---@field name string
---@field tags MethodTags

---@class Static
---@field name string
---@field desc string
---@field parameters Parameter[]
---@field returns string[]
---@field tags MethodTags
---@field class Class

---@class Class
---@field name string
---@field tags ClassTags
---@field parameters Parameter[]
---@field methods Method[]
---@field statics Static[]
---@field properties Property[]
---@field parents string[]
---@field methodTags MethodTags
---@field desc string
---@field filePath string

local fs = require('fs')
local pathjoin = require('pathjoin')

local insert, concat = table.insert, table.concat
local pathJoin = pathjoin.pathJoin

local classes = require('./discordia-classes')
local events = require('./discordia-events')

local DOCS = {}
local INC_DIR = './libs'
local OUT_DIR = 'docs'

local function scan(dir)
	for fileName, fileType in fs.scandirSync(dir) do
		local path = pathJoin(dir, fileName)
		if fileType == 'file' then
			coroutine.yield(path)
		else
			scan(path)
		end
	end
end

for f in coroutine.wrap(scan), INC_DIR do
  local d = assert(fs.readFileSync(f))
  local c = classes.scanners.scanClass(DOCS, d, f)
  events.scanners.scanEmitter(DOCS, d, c)
end

if not fs.existsSync(OUT_DIR) then
	fs.mkdirSync(OUT_DIR)
end

for _, class in pairs(DOCS) do
  local buf = setmetatable({}, {
    __call = function(self, str, ...)
      if ... then
        str = str:format(...)
      end
      insert(self, str)
    end,
  })
  ---@diagnostic disable-next-line: assign-type-mismatch
  local w = buf --[[@type fun(str, ...)]]

  w('---@meta\n\n')

  -- write description
  classes.writers.writeDesc(w, class)
  -- write tags
  classes.writers.writeTags(w, class)
  -- write class and inheritance
	classes.writers.writeInherits(w, class)

  -- write fields (properties)
  classes.writers.writeProperties(w, class)
  -- write class events, if any
  events.writers.writeEvents(w, class)

  -- write init call overload
  classes.writers.writeOverload(w, class)

	-- write the class table container signature
	classes.writers.writeSignature(w, class)

  -- write static functions
  classes.writers.writeStatics(w, class)
	-- write methods
  classes.writers.writeMethods(w, class)

  -- write results to the file
  fs.writeFileSync(pathJoin(OUT_DIR, class.name .. '.lua'), concat(buf))
end
