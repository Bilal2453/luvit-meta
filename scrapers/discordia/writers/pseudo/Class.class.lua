local template = [[
---
---The Lua language does not have classes, but it does have all of the tools needed to write them. Discordia uses a custom class system that was written explicitly to encapsulate data provided by Discord in intuitive, efficient structures.
---
---The class module used by Discordia is available to users in the main Discordia module. The class module is both the module table and a callable class constructor.
---
---@class discordia.class: table
---@field classes discordia.class.classes # Table of all defined classes, indexed by name.
local class = {}

---
---Function that returns true only if the provided argument is a Discordia class module.
---
---@param cls any
---@return boolean
---@nodiscard
function class.isClass(cls) end

---
---Function that returns true only if the provided argument is an instance of a Discordia class.
---
---@param obj any
---@return boolean
---@nodiscard
function class.isObject(obj) end

---
---Function that returns true if the first argument is a subclass of the second argument. Note that classes are considered to be subclasses of themselves.
---
---@param sub any
---@param cls any
---@return boolean
---@nodiscard
function class.isSubclass(sub, cls) end

---
---Function that returns true if the first argument (an object) is an instance of the second argument (a class). Note that inheritance is considered.
---
---@param obj any
---@param cls any
---@return boolean
---@nodiscard
function class.isInstance(obj, cls) end

---
---Function that returns the type of the provided argument. If the argument is a Discordia object, then this will return the name of its class; otherwise, it will return the result of calling Lua's global type function.
---
---@param obj any
---@return string
---@nodiscard
function class.type(obj) end

---
---Function that returns the number of each class instance currently alive (ie, not garbage collected) in table form.
---
---@return table<string, integer>
---@nodiscard
function class.profile() end
]]

return function(w)
  local types = {}
  for t in pairs(DOCS) do
    types[#types+1] = t .. ': ' .. t
  end
  w('---@alias discordia.class.classes {%s}\n\n', table.concat(types, ', '))
  w(template)
end
