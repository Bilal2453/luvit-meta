---@meta

---@class utils: pretty-print
local utils = {}

-- TODO: description for assertResume

---
---@param thread thread
---@param ... any
function utils.assertResume(thread, ...) end

---
---@generic T: any, S: any
---@param fn fun(self: S, ...: T): any
---@param self S
---@param ... T
---@return fun(...: T): any
function utils.bind(fn, self, ...) end

---
---Default callback handler. If `err` is provided prints `"Unhandled callback error"` with the provided error.
---
---@param err? string
function utils.noop(err) end

---
---Used heavily within luvit to wrap luv methods and expose them.
---
---When `c` is a function, that function is passed as a callback to the luv method `fn`.
---When it is a coroutine thread, the thread is yielded until callback execution, then resumed with the callback results.
---
---@param c? async fun(err?: string, ...: any)|thread # noop is used as a default
---@param fn function
---@param ... any
---@return any|nil, Error?
function utils.adapt(c, fn, ...) end

