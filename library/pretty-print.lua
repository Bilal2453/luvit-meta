---@meta

-- TODO: Description for methods

---
---A lua value pretty printer and colorizer for terminals.
---
---@class luvit.prettyPrint
---@field theme table<colors_names, string> # The currently loaded theme.
---@field stdin  uv_tty_t|uv_pipe_t # stdin stream
---@field stdout uv_tty_t|uv_pipe_t # stdout stream
---@field stderr uv_tty_t|uv_pipe_t # stderr stream
local prettyPrint = {}

---
---@param str string
---@return string stripped
---@nodiscard
function prettyPrint.strip(str) end

---
---@param index? 16|265
---@return nil
function prettyPrint.loadColor(index) end

---
---@param colorName? colors_names
---@return string
---@nodiscard
function prettyPrint.color(colorName) end

---
---@param colorName? colors_names
---@param string string
---@param resetName? colors_names
---@return string
---@nodiscard
function prettyPrint.colorize(colorName, string, resetName) end

---
---@param c number
---@return string
---@nodiscard
function prettyPrint.stringEscape(c) end

---
---@param value any
---@param recurse? boolean  # default true
---@param nocolor? boolean # default false
---@return string
---@nodiscard
function prettyPrint.dump(value, recurse, nocolor) end


---
---@param fs userdata
---@param s string
---@return nil
function prettyPrint.console_write(fs, s) end

---
---Pretty prints any number of arguments.
---@vararg any
---@return nil
function prettyPrint.prettyPrint(...) end
p = prettyPrint.prettyPrint


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

return prettyPrint
