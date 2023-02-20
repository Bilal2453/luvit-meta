---@meta

---Thread module for luvit
local thread = {}

---Creates and initializes a `luv_thread_t` (not `uv_thread_t`). Returns the 
---Lua userdata wrapping it and asynchronously executes `threadFunc`. 
---Additional arguments `...` are passed to the `threadFunc` function.
---@param threadFunc function | string # If a string, it must come from `string.dump`.
---@param ... any # arguments passed to `threadFunc`
---@return luv_thread_t?, string? err_msg, string? err_name
function thread.start(threadFunc, ...) end

---Waits for the `thread` to finish executing its `threadFunc` function.
---@param thread luv_thread_t
function thread.join(thread) end

---Returns a boolean indicating whether two threads are the same. This function is equivalent to the `__eq` metamethod.
---@nodiscard
---@param thread1 luv_thread_t
---@param thread2 luv_thread_t
---@return boolean
function thread.equals(thread1, thread2) end

---Returns the thread in which this is called.
---@return luv_thread_t
function thread.self() end

---
---@class luvit.thread.Worker : luvit.core.Object
---@field dumped string # `threadFunc` passed through `string.dump`
---@field bundlePaths string
---@field handler luv_work_ctx_t
local Worker = {}

---
---@param ... any # arguments passed to `threadFunc`
function Worker:queue(...) end

---Creates and initializes a new `Worker`.
---@nodiscard
---@param threadFunc function | string # Takes arguments (`...`) passed to `thread.queue(worker, ...)` or `worker:queue(...)`. If a string, it must come from `string.dump`.
---@param notifyEntry function # Takes arguments returned from `threadFunc`
---@return luvit.thread.Worker
function thread.work(threadFunc, notifyEntry) end

---Queues a work request which will run `threadFunc` in a new Lua state in a 
---thread from the threadpool with any additional arguments from `...`. Values 
---returned from `threadFunc` are passed to `notifyEntry`, which is called in 
---the main loop thread.
---@param worker luvit.thread.Worker
---@param ... any # arguments passed to the worker's `threadFunc`
function thread.queue(worker, ...) end

return thread