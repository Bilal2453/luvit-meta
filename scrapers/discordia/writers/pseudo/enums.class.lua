local pathjoin = require('pathjoin')
local join = pathjoin.pathJoin

local insertfmt = string.infmt
local encodeString = string.encodeString
local insert = table.insert
local concat = table.concat

local discordia_enums = dofile(join(INC_DIR, 'enums.lua'))
local PREFIX = 'discordia.enums.'

local function sortEnum(enum)
  local sorted_values = {}
  for _, value in pairs(enum) do
    insert(sorted_values, value)
  end
  table.sort(sorted_values)
  local sorted_names = {} -- according to values
  for _, value in ipairs(sorted_values) do
    for name, other_value in pairs(enum) do
      if value == other_value then
        insert(sorted_names, name)
      end
    end
  end
  return sorted_names, sorted_values
end

-- sorts an enum and returns an iterator of the sorted enum
local function iterateEnum(enum)
  local names, values = sortEnum(enum)
  local i = 0
  return function()
    i = i + 1
    return names[i], values[i]
  end
end


local function writeEnums(enums)
  local buf_enums = {}

  local enums_names = {}
  for k, v in pairs(enums) do
    if type(v) == 'table' then
      insert(enums_names, k)
    end
  end
  table.sort(enums_names)

  for _, k in ipairs(enums_names) do
    local v = enums[k]

    local buf = {}
    insertfmt('---@alias %s%s_key', buf, PREFIX, k)
    for name, value in iterateEnum(v) do
      insertfmt('---|%s # %s', buf, encodeString(name), value)
    end
    insert(buf_enums, concat(buf, '\n'))

    buf = {}
    insertfmt('---@alias %s%s_value', buf, PREFIX, k)
    for name, value in iterateEnum(v) do
      insertfmt('---|%s # %s', buf, encodeString(value), name)
    end
    insert(buf_enums, concat(buf, '\n'))

    buf = {}
    local prefix_k = PREFIX .. k
    insertfmt('---@class %s: table\n---@overload fun(k: %s_value): %s_key', buf, prefix_k, prefix_k, prefix_k)
    local fields = {}
    for name, value in iterateEnum(v) do
      insertfmt('\t%s = %s,', fields, name, encodeString(value))
    end
    insertfmt('local %s = {\n%s\n}', buf, k, concat(fields, '\n'))
    insert(buf_enums, concat(buf, '\n'))
  end
  return buf_enums, enums_names
end

local function writeFields(names)
  local buf = {}
  for _, name in ipairs(names) do
    ('---@field %s %s'):infmt(buf, name, PREFIX .. name)
  end
  return buf
end

local template = [[
%s

---
---The Discord API uses numbers to represent certain data types. For convenience, these are enumerated in Discord as special read-only tables, found in the main Discordia module. All available enumerations are listed at the end of this page.
---
---Users are highly encouraged to use values in this page for a better code quality.
---
---```lua
---local discordia = require("discordia")
---local enums = discordia.enums
---```
---
---Enumerations (enums) can be accessed like a regular Lua table, but they cannot be modified. This is completely optional, but it is generally easier to use and read enumerations than it is to use and read plain numbers. For example, given a text channel object, the following are logically equivalent:
---
---```lua
---if channel.type == 0 then
---    print("This is a text channel")
---end
---
---if channel.type == enums.channelType.text then
---    print("This is still a text channel!")
---end
---
---print(enums.verificationLevel.low) -- 1
---```
---
---Additionally, enumerations work in reverse. If you have the number, but you want to recall the human-readable version, simply call the enum; it will return a string if the enumeration is valid.
---
---```lua
---print(enums.channelType(channel.type)) -- "text"
---print(enums.verificationLevel(1)) -- "low"
---```
---
---If necessary, custom enumerations can be written using the `enum` constructor:
---
---```lua
---local fruit = enums.enum({
---    apple = 0,
---    orange = 1,
---    banana = 2,
---    cherry = 3
---})
---
---print(enums.fruit.apple) -- 0
---print(enums.fruit(2)) -- "banana"
---```
---
---@class discordia.enums: table
%s
local enums = {}

---@class discordia.enums.enum<K, V>: {[K]: V}
---@overload fun(k: any): any

---
---Create a custom enumerator.
---
---@generic K, V
---@param v {[K]: V}
---@return discordia.enums.enum<`K`, `V`>
---@nodiscard
function enums.enum(v) end
]]

return function(w)
  local buf_enums, enums_names = writeEnums(discordia_enums)
  local fields = writeFields(enums_names)
  w(template, concat(buf_enums, '\n\n'), concat(fields, '\n'))
end
