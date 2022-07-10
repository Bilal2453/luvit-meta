---@meta

---#DES 'string'
---@class stringlib
string = {}

---#DES 'string.byte'
---@param s  string
---@param i? integer
---@param j? integer
---@return integer
---@return ...
---@nodiscard
function string.byte(s, i, j) end

---#DES 'string.char'
---@param byte integer
---@param ... integer
---@return string
---@return ...
---@nodiscard
function string.char(byte, ...) end

---#DES 'string.dump'
---@param f      async fun()
---@param strip? boolean
---@return string
---@nodiscard
function string.dump(f, strip) end

---#DES 'string.find'
---@param s       string
---@param pattern string
---@param init?   integer
---@param plain?  boolean
---@return integer start
---@return integer end
---@return ... captured
---@nodiscard
function string.find(s, pattern, init, plain) end

---#DES 'string.format'
---@param s any
---@param ... any
---@return string
---@nodiscard
function string.format(s, ...) end

---#DES 'string.gmatch'
---@param s       string
---@param pattern string
---@return fun():string, ...
---@nodiscard
function string.gmatch(s, pattern) end

---#DES 'string.gsub'
---@param s       string
---@param pattern string
---@param repl    string|number|table|function
---@param n?      integer
---@return string
---@return integer count
---@nodiscard
function string.gsub(s, pattern, repl, n) end

---#DES 'string.len'
---@param s string
---@return integer
---@nodiscard
function string.len(s) end

---#DES 'string.lower'
---@param s string
---@return string
---@nodiscard
function string.lower(s) end

---#DES 'string.match'
---@param s       string
---@param pattern string
---@param init?   integer
---@return ... captured
---@nodiscard
function string.match(s, pattern, init) end

---#DES 'string.pack'
---@param fmt string
---@param v1  string|number
---@param ... string|number
---@return string binary
---@nodiscard
function string.pack(fmt, v1, v2, ...) end

---#DES 'string.packsize'
---@param fmt string
---@return integer
---@nodiscard
function string.packsize(fmt) end

---#DES 'string.rep>5.2'
---@param s    string
---@param n    integer
---@param sep? string
---@return string
---@nodiscard
function string.rep(s, n, sep) end

---#DES 'string.reverse'
---@param s string
---@return string
---@nodiscard
function string.reverse(s) end

---#DES 'string.sub'
---@param s  string
---@param i  integer
---@param j? integer
---@return string
---@nodiscard
function string.sub(s, i, j) end

---#DES 'string.unpack'
---@param fmt  string
---@param s    string
---@param pos? integer
---@return ...
---@return integer offset
---@nodiscard
function string.unpack(fmt, s, pos) end

---#DES 'string.upper'
---@param s string
---@return string
---@nodiscard
function string.upper(s) end

---
---Returns the Levenshtein distance between `str1` and `str2`.
---
---@overload fun(): 0
---@param str1 string
---@param str2 string
---@return number
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
