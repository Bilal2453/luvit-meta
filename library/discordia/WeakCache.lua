---@meta _

---
---Extends the functionality of a regular cache by making use of weak references to the objects that are cached. If all references to an object are weak, as they are here, then the object will be deleted on the next garbage collection cycle.
---
---*Instances of this class should not be constructed by users.*
---
---@class WeakCache: Cache
---@overload fun(): WeakCache
local WeakCache = {}

