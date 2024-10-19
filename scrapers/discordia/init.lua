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

local fs = require('fs')
local pathjoin = require('pathjoin')

local insert, concat = table.insert, table.concat
local pathJoin = pathjoin.pathJoin

local classes = require('./discordia-classes')

local output = 'docs'
if not fs.existsSync(output) then
	fs.mkdirSync(output)
end

local docs = classes.scanDir('./libs')

for _, class in pairs(docs) do
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
  classes.writeDesc(w, class)
  -- write tags
  classes.writeTags(w, class)
  -- write class and inheritance
	classes.writeInherits(w, class)

  -- write fields (properties)
  classes.writeProperties(w, class)

  -- write init call overload
  classes.writeOverload(w, class)

	-- write the class table container signature
	classes.writeSignature(w, class)

  -- write static functions
  classes.writeStatics(w, class)
	-- write methods
  classes.writeMethods(w, class)

  -- write results to the file
  fs.writeFileSync(pathJoin(output, class.name .. '.lua'), concat(buf))
end
