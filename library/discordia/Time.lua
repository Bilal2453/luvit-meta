---@meta _

---
---Represents a length of time and provides utilities for converting to and from different formats. Supported units are: weeks, days, hours, minutes, seconds, and milliseconds.
---
---@class Time
---@overload fun(value?: number): Time
local Time = {}

---
---Constructs a new Time object from a value interpreted as weeks, where a week is equal to 7 days.
---
---*This method only operates on data in memory.*
---
---@param t number
---@return Time
function Time.fromWeeks(t) end

---
---Constructs a new Time object from a value interpreted as days, where a day is equal to 24 hours.
---
---*This method only operates on data in memory.*
---
---@param t number
---@return Time
function Time.fromDays(t) end

---
---Constructs a new Time object from a value interpreted as hours, where an hour is equal to 60 minutes.
---
---*This method only operates on data in memory.*
---
---@param t number
---@return Time
function Time.fromHours(t) end

---
---Constructs a new Time object from a value interpreted as minutes, where a minute is equal to 60 seconds.
---
---*This method only operates on data in memory.*
---
---@param t number
---@return Time
function Time.fromMinutes(t) end

---
---Constructs a new Time object from a value interpreted as seconds, where a second is equal to 1000 milliseconds.
---
---*This method only operates on data in memory.*
---
---@param t number
---@return Time
function Time.fromSeconds(t) end

---
---Constructs a new Time object from a value interpreted as milliseconds, the base unit represented.
---
---*This method only operates on data in memory.*
---
---@param t number
---@return Time
function Time.fromMilliseconds(t) end

---
---Constructs a new Time object from a table of time values where the keys are defined in the constructors above (eg: `weeks`, `days`, `hours`).
---
---*This method only operates on data in memory.*
---
---@param t table
---@return Time
function Time.fromTable(t) end

---
---Returns a human-readable string built from the set of normalized time values that the object represents.
---
---*This method only operates on data in memory.*
---
---@return string
function Time:toString() end

---
---Returns the total number of weeks that the time object represents.
---
---*This method only operates on data in memory.*
---
---@return number
function Time:toWeeks() end

---
---Returns the total number of days that the time object represents.
---
---*This method only operates on data in memory.*
---
---@return number
function Time:toDays() end

---
---Returns the total number of hours that the time object represents.
---
---*This method only operates on data in memory.*
---
---@return number
function Time:toHours() end

---
---Returns the total number of minutes that the time object represents.
---
---*This method only operates on data in memory.*
---
---@return number
function Time:toMinutes() end

---
---Returns the total number of seconds that the time object represents.
---
---*This method only operates on data in memory.*
---
---@return number
function Time:toSeconds() end

---
---Returns the total number of milliseconds that the time object represents.
---
---*This method only operates on data in memory.*
---
---@return number
function Time:toMilliseconds() end

---
---Returns a table of normalized time values that represent the time object in a more accessible form.
---
---*This method only operates on data in memory.*
---
---@return number
function Time:toTable() end

