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

-- TODO: extensions.lua

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

---@return Writer
---@return fun(path: string): boolean, string?
local function openBuf()
  local buf = setmetatable({}, {
    __call = function(self, str, ...)
      if select('#', {...}) > 0 then
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

local writers = utils.initDir('./writers', 'writer')
local names = {}
for name in pairs(writers) do
  insert(names, name)
end
table.sort(names)
for _, name in ipairs(names) do
  writers[name](openBuf)
end
