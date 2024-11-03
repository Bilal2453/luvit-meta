---@meta _

---
---Defines the base methods and/or properties for all Discord objects that have a Snowflake ID.
---
---*This is an abstract base class. Direct instances should never exist.*
---
---@class Snowflake: Container
---@field id string # The Snowflake ID that can be used to identify the object. This is guaranteed to be unique except in cases where an object shares the ID of its parent.
---@field createdAt number # The Unix time in seconds at which this object was created by Discord. Additional decimal points may be present, though only the first 3 (milliseconds) should be considered accurate. Equivalent to `Date.parseSnowflake(Snowflake.id)`.
---@field timestamp string # The date and time at which this object was created by Discord, represented as an ISO 8601 string plus microseconds when available. Equivalent to `Date.fromSnowflake(Snowflake.id):toISO()`.
---@overload fun(): Snowflake
local Snowflake = {}

---
---Returns `Snowflake.id`
---
---@return string
function Snowflake:__hash() end

---
---Returns a unique Date object that represents when the object was created by Discord. Equivalent to `Date.fromSnowflake(Snowflake.id)`
---
---*This method only operates on data in memory.*
---
---@return Date
function Snowflake:getDate() end

