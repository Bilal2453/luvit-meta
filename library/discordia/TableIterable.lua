---@meta _

---
---Iterable class that wraps a basic Lua table, where order is not guaranteed. Some versions may use a map function to shape the objects before they are accessed.
---
---*Instances of this class should not be constructed by users.*
---
---@class TableIterable: Iterable
---@overload fun(): TableIterable
local TableIterable = {}

---
---Returns an iterator that returns all contained objects. The order of the objects is not guaranteed.
---
---*This method only operates on data in memory.*
---
---@return function
function TableIterable:iter() end
