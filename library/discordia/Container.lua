---@meta _

---
---Defines the base methods and properties for all Discord objects and structures. Container classes are constructed internally with information received from Discord and should never be manually constructed.
---
---*This is an abstract base class. Direct instances should never exist.*
---
---@class Container
---@field client Client # A shortcut to the client object to which this container is visible.
---@field parent Container|Client # The parent object of to which this container is a child. For example, the parent of a role is the guild in which the role exists.
---@overload fun(): Container
local Container = {}

---
---Defines the behavior of the `==` operator. Allows containers to be directly compared according to their type and `__hash` return values.
---
---@return boolean
function Container:__eq() end

---
---Defines the behavior of the `tostring` function. All containers follow the format `ClassName: hash`.
---
---@return string
function Container:__tostring() end
