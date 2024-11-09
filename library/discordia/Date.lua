---@meta _

---
---Represents a single moment in time and provides utilities for converting to and from different date and time formats. Although microsecond precision is available, most formats are implemented with only second precision.
---
---@class Date
---@overload fun(seconds?: number, microseconds?: number): Date
local Date = {}

---
---Converts an ISO 8601 string into a Unix time in seconds. For compatibility with Discord's timestamp format, microseconds are also provided as a second return value.
---
---@param str string
---@return number
---@return number
---@nodiscard
function Date.parseISO(str) end

---
---Converts an RFC 2822 string (an HTTP Date header) into a Unix time in seconds.
---
---@param str string
---@return number
---@nodiscard
function Date.parseHeader(str) end

---
---Converts a Discord Snowflake ID into a Unix time in seconds. Additional decimal points may be present, though only the first 3 (milliseconds) should be considered accurate.
---
---@param id string
---@return number
---@nodiscard
function Date.parseSnowflake(id) end

---
---Interprets a Lua date table as a local time and converts it to a Unix time in seconds. Equivalent to `os.time(tbl)`.
---
---@param tbl? table
---@return number
---@nodiscard
function Date.parseTable(tbl) end

---
---Interprets a Lua date table as a UTC time and converts it to a Unix time in seconds. Equivalent to `os.time(tbl)` with a correction for UTC.
---
---@param tbl? table
---@return number
---@nodiscard
function Date.parseTableUTC(tbl) end

---
---Constructs a new Date object from an ISO 8601 string. Equivalent to `Date(Date.parseISO(str))`.
---
---@param str string
---@return Date
---@nodiscard
function Date.fromISO(str) end

---
---Constructs a new Date object from an RFC 2822 string. Equivalent to `Date(Date.parseHeader(str))`.
---
---@param str string
---@return Date
---@nodiscard
function Date.fromHeader(str) end

---
---Constructs a new Date object from a Discord/Twitter Snowflake ID. Equivalent to `Date(Date.parseSnowflake(id))`.
---
---@param id string
---@return Date
---@nodiscard
function Date.fromSnowflake(id) end

---
---Constructs a new Date object from a Lua date table interpreted as a local time. Equivalent to `Date(Date.parseTable(tbl))`.
---
---@param tbl table
---@return Date
---@nodiscard
function Date.fromTable(tbl) end

---
---Constructs a new Date object from a Lua date table interpreted as a UTC time. Equivalent to `Date(Date.parseTableUTC(tbl))`.
---
---@param tbl table
---@return Date
---@nodiscard
function Date.fromTableUTC(tbl) end

---
---Constructs a new Date object from a Unix time in seconds.
---
---@param s number
---@return Date
---@nodiscard
function Date.fromSeconds(s) end

---
---Constructs a new Date object from a Unix time in milliseconds.
---
---@param ms number
---@return Date
---@nodiscard
function Date.fromMilliseconds(ms) end

---
---Constructs a new Date object from a Unix time in microseconds.
---
---@param us number
---@return Date
---@nodiscard
function Date.fromMicroseconds(us) end

---
---Constructs a new Date object from the Discord timestamp format `<t:seconds:style>`.
---
---@param str string
---@return Date
---@nodiscard
function Date.fromDiscordTimestamp(str) end

---
---Returns a string from this Date object via Lua's `os.date`. If no format string is provided, the default is '%a %b %d %Y %T GMT%z (%Z)'.
---
---*This method only operates on data in memory.*
---
---@param fmt? string
---@return string
---@nodiscard
function Date:toString(fmt) end

---
---Interprets a Discord timestamp format string `<t:seconds:style>`, returns Unix time in seconds and the style if one was present.
---
---*This method only operates on data in memory.*
---
---@param str string
---@return number
---@return string
---@nodiscard
function Date:parseDiscordTimestamp(str) end

---
---Returns an ISO 8601 string that represents the stored date and time. If `sep` and `tz` are both provided, then they are used as a custom separator and timezone; otherwise, `T` is used for the separator and `+00:00` is used for the timezone, plus microseconds if available.
---
---*This method only operates on data in memory.*
---
---@param sep? string
---@param tz? string
---@return string
---@nodiscard
function Date:toISO(sep, tz) end

---
---Returns an RFC 2822 string that represents the stored date and time.
---
---*This method only operates on data in memory.*
---
---@return string
---@nodiscard
function Date:toHeader() end

---
---Returns a synthetic Discord Snowflake ID based on the stored date and time. Due to the lack of native 64-bit support, the result may lack precision. In other words, `Date.fromSnowflake(id):toSnowflake() == id` may be `false`.
---
---*This method only operates on data in memory.*
---
---@return string
---@nodiscard
function Date:toSnowflake() end

---
---Returns a Lua date table that represents the stored date and time as a local time. Equivalent to `os.date('*t', s)` where `s` is the Unix time in seconds.
---
---*This method only operates on data in memory.*
---
---@return table
---@nodiscard
function Date:toTable() end

---
---Returns a Lua date table that represents the stored date and time as a UTC time. Equivalent to `os.date('!*t', s)` where `s` is the Unix time in seconds.
---
---*This method only operates on data in memory.*
---
---@return table
---@nodiscard
function Date:toTableUTC() end

---
---Returns a Unix time in seconds that represents the stored date and time.
---
---*This method only operates on data in memory.*
---
---@return number
---@nodiscard
function Date:toSeconds() end

---
---Returns a Unix time in milliseconds that represents the stored date and time.
---
---*This method only operates on data in memory.*
---
---@return number
---@nodiscard
function Date:toMilliseconds() end

---
---Returns a Unix time in microseconds that represents the stored date and time.
---
---*This method only operates on data in memory.*
---
---@return number
---@nodiscard
function Date:toMicroseconds() end

---
---Returns the date converted to the Discord timestamp format `<t:seconds:style>`.
---
---*This method only operates on data in memory.*
---
---@param style? discordia.enums.timestampStyle_value
---@return string
---@nodiscard
function Date:toDiscordTimestamp(style) end

---
---Returns the seconds and microseconds that are stored in the date object.
---
---*This method only operates on data in memory.*
---
---@return number
---@return number
---@nodiscard
function Date:toParts() end

