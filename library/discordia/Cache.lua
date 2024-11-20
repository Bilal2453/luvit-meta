---@meta _

---
---Iterable class that holds references to Discordia Class objects in no particular order.
---
---*Instances of this class should not be constructed by users.*
---
---@class Cache: Iterable
---@overload fun(): Cache
local Cache = {}

---
---Returns an individual object by key, where the key should match the result of calling `__hash` on the contained objects. Unlike Iterable:get, this method operates with O(1) complexity.
---
---*This method only operates on data in memory.*
---
---@param k any
---@return any
function Cache:get(k) end

---
---Returns an iterator that returns all contained objects. The order of the objects is not guaranteed.
---
---*This method only operates on data in memory.*
---
---@return function
function Cache:iter() end
