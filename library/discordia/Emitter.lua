---@meta _

---
---Implements an asynchronous event emitter where callbacks can be subscribed to specific named events. When events are emitted, the callbacks are called in the order that they were originally registered.
---
---@class Emitter
---@overload fun(): Emitter
local Emitter = {}

---
---Subscribes a callback to be called every time the named event is emitted. Callbacks registered with this method will automatically be wrapped as a new coroutine when they are called. Returns the original callback for convenience.
---
---*This method only operates on data in memory.*
---
---@param name string
---@param fn function
---@return function
function Emitter:on(name, fn) end

---
---Subscribes a callback to be called only the first time this event is emitted. Callbacks registered with this method will automatically be wrapped as a new coroutine when they are called. Returns the original callback for convenience.
---
---*This method only operates on data in memory.*
---
---@param name string
---@param fn function
---@return function
function Emitter:once(name, fn) end

---
---Subscribes a callback to be called every time the named event is emitted. Callbacks registered with this method are not automatically wrapped as a coroutine. Returns the original callback for convenience.
---
---*This method only operates on data in memory.*
---
---@param name string
---@param fn function
---@return function
function Emitter:onSync(name, fn) end

---
---Subscribes a callback to be called only the first time this event is emitted. Callbacks registered with this method are not automatically wrapped as a coroutine. Returns the original callback for convenience.
---
---*This method only operates on data in memory.*
---
---@param name string
---@param fn function
---@return function
function Emitter:onceSync(name, fn) end

---
---Emits the named event and a variable number of arguments to pass to the event callbacks.
---
---*This method only operates on data in memory.*
---
---@param name string
---@param ...? any
---@return nil
function Emitter:emit(name, ...) end

---
---Returns an iterator for all callbacks registered to the named event.
---
---*This method only operates on data in memory.*
---
---@param name string
---@return function
function Emitter:getListeners(name) end

---
---Returns the number of callbacks registered to the named event.
---
---*This method only operates on data in memory.*
---
---@param name string
---@return number
function Emitter:getListenerCount(name) end

---
---Unregisters all instances of the callback from the named event.
---
---*This method only operates on data in memory.*
---
---@param name string
---@param fn function
---@return nil
function Emitter:removeListener(name, fn) end

---
---Unregisters all callbacks for the emitter. If a name is passed, then only callbacks for that specific event are unregistered.
---
---*This method only operates on data in memory.*
---
---@param name string|nil
---@return nil
function Emitter:removeAllListeners(name) end

---
---When called inside of a coroutine, this will yield the coroutine until the named event is emitted. If a timeout (in milliseconds) is provided, the function will return after the time expires, regardless of whether the event is emitted, and `false` will be returned; otherwise, `true` is returned. If a predicate is provided, events that do not pass the predicate will be ignored.
---
---*This method only operates on data in memory.*
---
---@param name string
---@param timeout? number
---@param predicate? function
---@return boolean
---@return ...
function Emitter:waitFor(name, timeout, predicate) end
