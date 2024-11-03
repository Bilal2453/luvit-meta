---@meta _

---
---Mutual exclusion class used to control Lua coroutine execution order.
---
---@class Mutex
---@overload fun(): Mutex
local Mutex = {}

---
---If the mutex is not active (if a coroutine is not queued), this will activate the mutex; otherwise, this will yield and queue the current coroutine.
---
---*This method only operates on data in memory.*
---
---@param prepend? boolean
---@return nil
function Mutex:lock(prepend) end

---
---If the mutex is active (if a coroutine is queued), this will dequeue and resume the next available coroutine; otherwise, this will deactivate the mutex.
---
---*This method only operates on data in memory.*
---
---@return nil
function Mutex:unlock() end

---
---Asynchronously unlocks the mutex after a specified time in milliseconds. The relevant `uv_timer` object is returned.
---
---*This method only operates on data in memory.*
---
---@param delay number
---@return uv_timer_t
function Mutex:unlockAfter(delay) end

