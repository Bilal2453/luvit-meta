---@meta _

---
---Used to measure an elapsed period of time. If a truthy value is passed as an argument, then the stopwatch will initialize in an idle state; otherwise, it will initialize in an active state. Although nanosecond precision is available, Lua can only reliably provide microsecond accuracy due to the lack of native 64-bit integer support. Generally, milliseconds should be sufficient here.
---
---@class Stopwatch
---@field milliseconds number # The total number of elapsed milliseconds. If the stopwatch is running, this will naturally be different each time that it is accessed.
---@overload fun(stopped?: boolean): Stopwatch
local Stopwatch = {}

---
---Defines the behavior of the `tostring` function. Returns a string that represents the elapsed milliseconds for convenience of introspection.
---
---*This method only operates on data in memory.*
---
---@return string
function Stopwatch:__tostring() end

---
---Effectively stops the stopwatch.
---
---*This method only operates on data in memory.*
---
---@return nil
function Stopwatch:stop() end

---
---Effectively starts the stopwatch.
---
---*This method only operates on data in memory.*
---
---@return nil
function Stopwatch:start() end

---
---Effectively resets the stopwatch.
---
---*This method only operates on data in memory.*
---
---@return nil
function Stopwatch:reset() end

---
---Returns a new Time object that represents the currently elapsed time. This is useful for "catching" the current time and comparing its many forms as required.
---
---*This method only operates on data in memory.*
---
---@return Time
function Stopwatch:getTime() end

