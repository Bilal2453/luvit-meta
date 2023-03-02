---@meta string

---
---Returns the size of a string resulting from `string.pack` with the given format string `fmt` (see [§6.4.2](command:extension.lua.doc?["en-us/51/manual.html/6.4.2"])) .
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-string.packsize"])
---
---@param fmt string
---@return integer
---@nodiscard
function string.packsize(fmt) end

---
---Returns a binary string containing the values `v1`, `v2`, etc. packed (that is, serialized in binary form) according to the format string `fmt` (see [§6.4.2](command:extension.lua.doc?["en-us/51/manual.html/6.4.2"])) .
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-string.pack"])
---
---@param fmt string
---@param v1  string|number
---@param ... string|number
---@return string binary
---@nodiscard
function string.pack(fmt, v1, v2, ...) end

---
---Returns the values packed in string according to the format string `fmt` (see [§6.4.2](command:extension.lua.doc?["en-us/51/manual.html/6.4.2"])) .
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-string.unpack"])
---
---@param fmt  string
---@param s    string
---@param pos? integer
---@return any ...
---@return integer offset
---@nodiscard
function string.unpack(fmt, s, pos) end

---
---Returns the Levenshtein distance between `str1` and `str2`.
---
---@overload fun(): 0
---@param str1 string
---@param str2 string
---@return number
---@nodiscard
function string.levenshtein(str1, str2) end

---
---Injects a `__mod` metamethod into string values.
---
---An example:
---```lua
---string.luvitGlobalExtend()
---print( "%s has %1.2f %s" % {'Bilal', 25.5001, 'USD'} )
---```
function string.luvitGlobalExtend() end

return string
