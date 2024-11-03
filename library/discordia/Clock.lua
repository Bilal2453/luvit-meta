---@meta _

---@alias discordia.aliases.Clock.events
---|"year" # Emitted on the first second of every new year.
---|"month" # Emitted on the first second of every new month.
---|"day" # Emitted on the first second of every new day.
---|"yday" # Emitted on the first second of every new day in a year.
---|"wday" # Emitted on the first second of every new day in a week.
---|"hour" # Emitted on the first second of every new hour.
---|"min" # Emitted on the first second of every new minute.
---|"sec" # Emitted every second.
---|string # The event name.

---
---Used to periodically execute code according to the ticking of the system clock instead of an arbitrary interval.
---
---@class Clock: Emitter
---@field emit fun(self: self, name: discordia.aliases.Clock.events, ...: any) # Emits the named event and a variable number of arguments to pass to the event callbacks.<br><br>*This method only operates on data in memory.*
---@field on fun(self: self, name: discordia.aliases.Clock.events, fn: async function): function # Subscribes a callback to be called every time the named event is emitted. Callbacks registered with this method will automatically be wrapped as a new coroutine when they are called. Returns the original callback for convenience.
---@field once fun(self: self, name: discordia.aliases.Clock.events, fn: async function): function # Subscribes a callback to be called only the first time this event is emitted. Callbacks registered with this method will automatically be wrapped as a new coroutine when they are called. Returns the original callback for convenience.
---@field onSync fun(self: self, name: discordia.aliases.Clock.events, fn: function): function # Subscribes a callback to be called every time the named event is emitted. Callbacks registered with this method are not automatically wrapped as a coroutine. Returns the original callback for convenience.
---@field onceSync fun(self: self, name: discordia.aliases.Clock.events, fn: function): function # Subscribes a callback to be called only the first time this event is emitted. Callbacks registered with this method are not automatically wrapped as a coroutine. Returns the original callback for convenience.
---@field on fun(self: self, name: "year", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new year.
---@field once fun(self: self, name: "year", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new year.
---@field onSync fun(self: self, name: "year", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new year.
---@field onceSync fun(self: self, name: "year", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new year.
---@field on fun(self: self, name: "month", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new month.
---@field once fun(self: self, name: "month", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new month.
---@field onSync fun(self: self, name: "month", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new month.
---@field onceSync fun(self: self, name: "month", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new month.
---@field on fun(self: self, name: "day", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new day.
---@field once fun(self: self, name: "day", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new day.
---@field onSync fun(self: self, name: "day", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new day.
---@field onceSync fun(self: self, name: "day", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new day.
---@field on fun(self: self, name: "yday", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new day in a year.
---@field once fun(self: self, name: "yday", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new day in a year.
---@field onSync fun(self: self, name: "yday", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new day in a year.
---@field onceSync fun(self: self, name: "yday", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new day in a year.
---@field on fun(self: self, name: "wday", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new day in a week.
---@field once fun(self: self, name: "wday", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new day in a week.
---@field onSync fun(self: self, name: "wday", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new day in a week.
---@field onceSync fun(self: self, name: "wday", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new day in a week.
---@field on fun(self: self, name: "hour", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new hour.
---@field once fun(self: self, name: "hour", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new hour.
---@field onSync fun(self: self, name: "hour", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new hour.
---@field onceSync fun(self: self, name: "hour", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new hour.
---@field on fun(self: self, name: "min", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new minute.
---@field once fun(self: self, name: "min", fn: async fun(time: osdate):(any)): function # Emitted on the first second of every new minute.
---@field onSync fun(self: self, name: "min", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new minute.
---@field onceSync fun(self: self, name: "min", fn: fun(time: osdate):(any)): function # Emitted on the first second of every new minute.
---@field on fun(self: self, name: "sec", fn: async fun(time: osdate):(any)): function # Emitted every second.
---@field once fun(self: self, name: "sec", fn: async fun(time: osdate):(any)): function # Emitted every second.
---@field onSync fun(self: self, name: "sec", fn: fun(time: osdate):(any)): function # Emitted every second.
---@field onceSync fun(self: self, name: "sec", fn: fun(time: osdate):(any)): function # Emitted every second.
---@overload fun(): Clock
local Clock = {}

---
---Starts the main loop for the clock. If a truthy argument is passed, then UTC time is used; otherwise, local time is used. As the clock ticks, an event is emitted for every `os.date` value change. The event name is the key of the value that changed and the event argument is the corresponding date table.
---
---*This method only operates on data in memory.*
---
---@param utc? boolean
---@return nil
function Clock:start(utc) end

---
---Stops the main loop for the clock.
---
---*This method only operates on data in memory.*
---
---@return nil
function Clock:stop() end

