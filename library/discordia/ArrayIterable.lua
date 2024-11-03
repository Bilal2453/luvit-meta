---@meta _

---
---Iterable class that contains objects in a constant, ordered fashion, although the order may change if the internal array is modified. Some versions may use a map function to shape the objects before they are accessed.
---
---*Instances of this class should not be constructed by users.*
---
---@class ArrayIterable: Iterable
---@field first any # The first object in the array
---@field last any # The last object in the array
---@overload fun(): ArrayIterable
local ArrayIterable = {}

---
---Returns an iterator for all contained objects in a consistent order.
---
---*This method only operates on data in memory.*
---
---@return function
function ArrayIterable:iter() end

