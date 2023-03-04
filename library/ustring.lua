---@meta

---@class luvit.ustring
local ustring = {}

---@class luvit.ustring.UStr
local meta = {
	__index = ustring,
}
---@param ustr1 luvit.ustring.UStr
---@param ustr2 luvit.ustring.UStr
---@return boolean
function meta.__eq(ustr1, ustr2) end
---@param self luvit.ustring.UStr
---@return string
function meta.__tostring(self) end
---@param ustr1 luvit.ustring.UStr
---@param ustr2 luvit.ustring.UStr
---@return luvit.ustring.UStr
function meta.__concat(ustr1, ustr2) end
meta.__len = ustring.len

---
---@param byte integer
---@return 0|1|2|3|4
---@nodiscard
function ustring.chlen(byte) end

---
---@param str? string
---@param allowInvaild? boolean # Default: `false`.
---@return luvit.ustring.UStr
---@nodiscard
function ustring.new(str, allowInvaild) end

---
---@param ustr luvit.ustring.UStr
---@return luvit.ustring.UStr
---@nodiscard
function ustring.copy(ustr) end

---
---Convert a raw index into the index of a UTF-8. Returns `nil` if uindex is invaild
---The last 2 arguments are optional and used for better performance (only if rawindex isn't negative).
---
---@param ustr luvit.ustring.UStr
---@param rawindex integer
---@param initrawindex? integer
---@param initindex? integer
---@return integer|nil
---@nodiscard
function ustring.index2uindex(ustr, rawindex, initrawindex, initindex) end

---
---Convert the index of a UIF-8 char into a raw index.
---
---@param ustr luvit.ustring.UStr
---@param uindex integer
---@param initrawindex? nil # Ignored.
---@param inituindex? integer
---@return integer
---@nodiscard
function ustring.uindex2index(ustr, uindex, initrawindex, inituindex) end

ustring.len = rawlen

---
---@param ustr luvit.ustring.UStr
---@param pattern string
---@param repl string|table|function
---@param n integer
---@return luvit.ustring.UStr
---@nodiscard
function ustring.gsub(ustr, pattern, repl, n) end

---
---@param ustr luvit.ustring.UStr
---@param i  integer
---@param j? integer
---@return luvit.ustring.UStr
---@nodiscard
function ustring.sub(ustr, i, j) end

---
---@param ustr luvit.ustring.UStr
---@param pattern string
---@param init?   integer
---@param plain?  boolean
---@return integer start
---@return integer end
---@nodiscard
function ustring.find(ustr, pattern, init, plain) end

---
---@param formatstring luvit.ustring.UStr
---@param ... string
---@return luvit.ustring.UStr
---@nodiscard
function ustring.format(formatstring, ...) end

---
---@param ustr luvit.ustring.UStr
---@param pattern string
---@return fun():string, ...
---@nodiscard
function ustring.gmatch(ustr, pattern) end

---
---@param ustr luvit.ustring.UStr
---@param pattern string
---@param init?   integer
---@return string | number captured
---@nodiscard
function ustring.match(ustr, pattern, init) end

---
---@param ustr luvit.ustring.UStr
---@return luvit.ustring.UStr
---@nodiscard
function ustring.lower(ustr) end

---
---@param ustr luvit.ustring.UStr
---@return luvit.ustring.UStr
---@nodiscard
function ustring.upper(ustr) end

---
---@param ustr luvit.ustring.UStr
---@param n integer
---@return luvit.ustring.UStr
---@nodiscard
function ustring.rep(ustr, n) end

---
---@param ustr luvit.ustring.UStr
---@return luvit.ustring.UStr
---@nodiscard
function ustring.reverse(ustr) end

return ustring
