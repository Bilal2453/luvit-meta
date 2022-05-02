-- TODO: Description for methods

---
---A lua value pretty printer and colorizer for terminals.
---
---@class pretty-print
---@field theme table<colors_names, string> # The currently loaded theme.
---@field stdin  uv_stream_t|uv_pipe_t # stdin stream
---@field stdout uv_stream_t|uv_pipe_t # stdout stream
---@field stderr uv_stream_t|uv_pipe_t # stderr stream
local pretty_print = {}

---
---@param str string
---@return string stripped
---@nodiscard
function pretty_print.strip(str) end

---
---@param index? 16|265
---@return nil
function pretty_print.loadColor(index) end

---
---@param colorName? colors_names
---@return string
---@nodiscard
function pretty_print.color(colorName) end

---
---@param colorName? colors_names
---@param string string
---@param resetName? colors_names
---@return string
---@nodiscard
function pretty_print.colorize(colorName, string, resetName) end

---
---@param c number
---@return string
---@nodiscard
function pretty_print.stringEscape(c) end

---
---@param value any
---@param recuse? boolean  # default true
---@param nocolor? boolean # default false
---@return string
---@nodiscard
function pretty_print.dump(value, recuse, nocolor) end


---
---@param fs userdata
---@param s string
---@return nil
function pretty_print.console_write(fs, s) end

---
---Pretty prints any number of arguments.
---@vararg any
---@return nil
function pretty_print.prettyPrint(...) end


-- TODO: Continue themes

---@alias colors_names
---|"property"
---|"braces"
---|"sep"
---|"nil"
---|"boolean"
---|"number"
---|"string"
---|"quotes"
---|"escape"
---|"function"
---|"thread"
---|"table"
---|"userdata"
---|"cdata"
---|"err"
---|"success"
---|"failure"
---|"highlight"
---|string

return pretty_print
