---@meta _

---
---Used to log formatted messages to stdout (the console) or to a file. The `dateTime` argument should be a format string that is accepted by `os.date`. The file argument should be a relative or absolute file path or `nil` if no log file is desired. See the `logLevel` enumeration for acceptable log level values.
---
---@class Logger
---@overload fun(level: number, dateTime: string, file?: string): Logger
local Logger = {}

---
---If the provided level is less than or equal to the log level set on initialization, this logs a message to stdout as defined by Luvit's `process` module and to a file if one was provided on initialization. The `msg, ...` pair is formatted according to `string.format` and returned if the message is logged.
---
---*This method only operates on data in memory.*
---
---@param level number
---@param msg string
---@param ... any
---@return string
function Logger:log(level, msg, ...) end
