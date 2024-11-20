---@meta _

---
---Iterable class that wraps another iterable and serves a subset of the objects that the original iterable contains.
---
---*Instances of this class should not be constructed by users.*
---
---@class FilteredIterable: Iterable
---@overload fun(): FilteredIterable
local FilteredIterable = {}

---
---Returns an iterator that returns all contained objects. The order of the objects is not guaranteed.
---
---*This method only operates on data in memory.*
---
---@return function
function FilteredIterable:iter() end
