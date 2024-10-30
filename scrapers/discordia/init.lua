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

---@alias Writer fun(str: string, ...: any)|table
---@alias Writers {[string]: fun(w: Writer, class: Class, ...: any): (any), scanDir: fun(string): Class[]}
---@alias Scanners {[string]: fun(docs: Class[], contents: string, class: Class): any}

local fs = require('fs')
local utils = require('useful') -- defines string methods
local pathJoin = require('pathjoin').pathJoin

local insert, concat = table.insert, table.concat

_G.INC_DIR = './resources/libs'
_G.OUT_DIR = './resources/docs'

assert(fs.existsSync(INC_DIR), INC_DIR .. " directory must contain Discordia's libs folder")
if not fs.existsSync(OUT_DIR) then
	fs.mkdirSync(OUT_DIR)
end

---Create a new Writer buffer, a writer is a higher level interface for a file.
---Returns a buffer object, which consists of an array of strings that are concatenated on save.
---Calling the buffer object directly inserts a new entry into the array.
---@return Writer
---@return fun(path: string): boolean, string? # Writes the buffer into `OUT_DIR .. path`.
local function openBuf()
  local buf = setmetatable({}, {
    __call = function(self, str, ...)
      if select('#', ...) > 0 then
        str = str:format(...)
      end
      insert(self, str)
    end,
  })

  local function close(path)
    return fs.writeFileSync(pathJoin(OUT_DIR, path), concat(buf))
  end

  return buf, close
end


-- load the writers and start initializing them
-- Note that the order in which writers are loaded *does* matter, `class.writer.lua` is expected to load first.
-- initDir does not provide a direct way to define the order, so instead we sort writers alphabetically.
-- One way to explicitly define the order would be to prefix all writers with a number such as `1- `.
local writers = utils.initDir('./writers', 'writer')
local names = {}
for name in pairs(writers) do
  insert(names, name)
end
table.sort(names)
for _, name in ipairs(names) do
  writers[name](openBuf)
end
