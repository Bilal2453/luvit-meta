---@meta _

---
---Iterable class that wraps another cache. Objects added to or removed from a secondary cache are also automatically added to or removed from the primary cache that it wraps.
---
---*Instances of this class should not be constructed by users.*
---
---@class SecondaryCache: Iterable
---@overload fun(): SecondaryCache
local SecondaryCache = {}

---
---Returns an individual object by key, where the key should match the result of calling `__hash` on the contained objects. Unlike the default version, this method operates with O(1) complexity.
---
---*This method only operates on data in memory.*
---
---@param k any
---@return any
function SecondaryCache:get(k) end

---
---Returns an iterator that returns all contained objects. The order of the objects is not guaranteed.
---
---*This method only operates on data in memory.*
---
---@return function
function SecondaryCache:iter() end
