---@meta

---
---Javascript style setTimeout and setInterval for luvit
---
---@class luvit.timer.Timer: luvit.core.Object
---@field _handle uv_timer_t
---@field _active boolean
local Timer = {}

-- TODO: descriptions
-- TODO: should we consider removing the timer class?

---@type uv
local uv = {}

---
---@param timeout integer # time in millisecond until first call to `callback`, `0` means on next event loop iteration.
---@param interval integer # how much time in millisecond between each call to `callback`.
---@param callback function
function Timer:start(timeout, interval, callback) end

---
function Timer:stop() end

---
function Timer:again() end

---
function Timer:close() end

Timer.setRepeat = uv.timer_set_repeat

Timer.getRepeat = uv.timer_get_repeat

Timer.now = uv.now

-------

---@class luvit.timer
local timer_module = {}

---
---@param delay integer # millisecond
---@param thread? thread
---@return any
function timer_module.sleep(delay, thread) end

---
---@generic T: any
---@param delay integer # millisecond
---@param callback fun(...: T)
---@param ... T
function timer_module.setTimeout(delay, callback, ...) end

---
---@generic T: any
---@param interval integer # millisecond
---@param callback fun(...: T)
---@param ... T
function timer_module.setInterval(interval, callback, ...) end

---
---@param timer uv_timer_t
function timer_module.clearInterval(timer) end
timer_module.clearTimeout = timer_module.clearInterval
timer_module.clearTimer = timer_module.clearInterval

---
---@generic T: any
---@param callback fun(...: T)
---@param ... T
function timer_module.setImmediate(callback, ...) end

---
---@param item table
function timer_module.unenroll(item) end

---
---@param item table
---@param msecs number # millisecond
function timer_module.enroll(item, msecs) end

---
---@param item table
function timer_module.active(item) end

return timer_module
