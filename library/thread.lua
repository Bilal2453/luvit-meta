---@meta

---
---Thread module for luvit
---
local thread = {}

<<<<<<< HEAD
---Creates and initializes a `luv_thread_t` (not `uv_thread_t`). Returns the
---Lua userdata wrapping it and asynchronously executes `threadFunc`.
---Additional arguments `...` are passed to the `threadFunc` function.
---@param threadFunc function | string # If a string, it must come from `string.dump`.
---@param ... any # arguments passed to `threadFunc`
=======
---
---Creates and initializes a new system thread (`luv_thread_t`) and injects the Luvit environment.
---Returns the Lua userdata wrapping it and asynchronously executes `thread_func`, which can be
---either a Lua function or a string containing Lua code or bytecode dumped from a function.
---Additional arguments `...` are passed to the `thread_func` function.
---
---@generic T: uv.aliases.threadargs
---@param thread_func fun(...: T)|string
---@param ... T
>>>>>>> main
---@return luv_thread_t?, string? err_msg, string? err_name
function thread.start(thread_func, ...) end

---
---Waits for the `thread` to finish executing its `thread_func` function.
---
---@param thread luv_thread_t
function thread.join(thread) end

---
---Returns a boolean indicating whether two threads are the same.
---This function is equivalent to the `__eq` metamethod.
---
---@param thread1 luv_thread_t
---@param thread2 luv_thread_t
---@return boolean
---@nodiscard
function thread.equals(thread1, thread2) end

---
---Returns the thread in which this is called.
---
---@return luv_thread_t
function thread.self() end



---
---Libuv provides a threadpool which can be used to run user code and get notified
---in the loop thread. This threadpool is internally used to run all file system
---operations, as well as `getaddrinfo` and `getnameinfo` requests.
---This is a wrapper class which injects the Luvit environment into the worker.
---
---@class luvit.thread.Worker: luvit.core.Object
---The thread function's bytecode if a function was passed,
---otherwise the original string value.
---@field dumped string
---Luvi's bundle paths concatinated as a string seperated by `;`.
---@field bundlePaths string
---The luv userdata wrapping the worker.
---@field handler luv_work_ctx_t
local Worker = {}

---
---@param ... uv.aliases.threadargs # arguments passed to `thread_func`
function Worker:queue(...) end

---
---Creates and initializes a new `Worker`.
---
---@param thread_func function | string # Takes arguments (`...`) passed to `thread.queue(worker, ...)` or `worker:queue(...)`. If a string, it must come from `string.dump`.
---@param notify_entry function # Takes arguments returned from `thread_func`
---@return luvit.thread.Worker
---@nodiscard
function thread.work(thread_func, notify_entry) end

<<<<<<< HEAD
---Queues a work request which will run `threadFunc` in a new Lua state in a
---thread from the threadpool with any additional arguments from `...`. Values
---returned from `threadFunc` are passed to `notifyEntry`, which is called in
=======
---
---Queues a work request which will run `thread_func` in a new Lua state in a 
---thread from the threadpool with any additional arguments from `...`. Values 
---returned from `thread_func` are passed to `notify_entry`, which is called in 
>>>>>>> main
---the main loop thread.
---
---@param worker luvit.thread.Worker
---@param ... uv.aliases.threadargs # arguments passed to the worker's `thread_func`
function thread.queue(worker, ...) end

return thread
