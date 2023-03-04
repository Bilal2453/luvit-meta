---@meta

---
---The `re` module supports a somewhat conventional regex syntax for pattern usage within LPeg.
---
---@class relib
local re = {}

---
---Compiles the given string and returns an equivalent LPeg pattern. The given string may define either an expression or a grammar. The optional `defs` table provides extra Lua values to be used by the pattern.
---
---@param string string
---@param defs? table
---@return lpeg-pattern
---@nodiscard
function re.compile(string, defs) end

---
---Searches the given pattern in the given subject. If it finds a match, returns the index where this occurrence starts and the index where it ends. Otherwise, returns nil.
---
---An optional numeric argument `init` makes the search starts at that position in the subject string. As usual in Lua libraries, a negative value counts from the end.
---
---@param subject string
---@param pattern pattern
---@param init? number
---@return number? start  # The index at which the find begins.
---@return number? finish # The index at which the find finishes.
---@nodiscard
function re.find(subject, pattern, init) end

---
---Does a *global substitution*, replacing all occurrences of pattern in the given subject by replacement.
---
---@param subject string
---@param pattern pattern
---@param replacement string
---@return string
---@nodiscard
function re.gsub(subject, pattern, replacement) end

---
---Matches the given pattern against the given subject, returning all captures.
---
---@param subject string
---@param pattern pattern
---@return number|string|table|nil
---@return ...? any
---@nodiscard
function re.match(subject, pattern) end

---
---Updates the pre-defined character classes to the current locale.
---
function re.updatelocale() end

return re
