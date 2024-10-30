

local function generateTemplate()
  local url = 'https://raw.githubusercontent.com/wiki/SinisterRectus/Discordia/Extensions.md'
  local res, body = require('coro-http').request('GET', url)
  assert(res.code == 200, 'expected response code 200; got ' .. res.code)

  local docs = {}
  for section in body:gmatch('%-%-%-%-(.-)%-') do
    local name = section:match('### ([^\n]+)')
  end
end
-- generateTemplate()

local template = [[
---
---**Discordia** has some built-in Lua standard library extensions. These provide complementary or supplementary, commonly used functions that the Lua standard library does not provide.
---
---Extensions can be used directly...
---```lua
---local str = "  abc  "
---print(discordia.extensions.string.trim(str)) -- "abc"
---```
---... or they can be loaded into the global tables:
---```lua
---local str = "  abc  "
---discordia.extensions.string()
---print(string.trim(str)) -- "abc"
---```
---
---Note that calling the whole extensions module will load all sub-modules:
---```lua
---discordia.extensions()
---```
---
---@class discoria.extensions: table
---@overload fun()
local extensions = {}

---@class discordia.extensions.table: table
---@overload fun()
extensions.table = {}

---
---Returns the total number of elements in a table. This uses the global `pairs` function and respects any `__pairs` metamethods.
---
---@param tbl table
---@return integer
---@nodiscard
function extensions.table.count(tbl) end

---
---Returns the total number of elements in a table, recursively.
---If a table is encountered, it is recursively counted instead of being directly added to the total count.
---This uses the global `pairs` function and respects any `__pairs` metamethods.
---
---@param tbl table
---@return integer
---@nodiscard
function extensions.table.deepcount(tbl) end

---
---Returns a copy of the original table, recursively.
---If a table is encountered, it is recursively deep-copied. Metatables are not copied.
---
---@param tbl table
---@return table
---@nodiscard
function extensions.table.copy(tbl) end

---
---Returns a copy of the original table, recursively.
---If a table is encountered, it is recursively deep-copied. Metatables are not copied.
---
---@param tbl table
---@return table
---@nodiscard
function extensions.table.deepcopy(tbl) end

---
---Reverses the elements of an array-like table in place.
---
---@param tbl any[]
function extensions.table.reverse(tbl) end

---
---Returns a copy of an array-like table with its elements in reverse order.
---The original table remains unchanged.
---
---@generic T: any[]
---@param tbl T
---@return T
---@nodiscard
function extensions.table.reversed(tbl) end

---
---Returns a new array-like table where all of its values are the keys of the original table.
---
---@generic K
---@param tbl {[K]: any}
---@return K[]
---@nodiscard
function extensions.table.keys(tbl) end

---
---Returns a new array-like table where all of its values are the values of the original table.
---
---@generic V
---@param tbl {[any]: V}
---@return V[]
---@nodiscard
function extensions.table.values(tbl) end

---
---Returns a random (index, value) pair from an array-like table.
---
---@generic V
---@param tbl V[]
---@return number, V
---@nodiscard
function extensions.table.randomipair(tbl) end

---
---Returns a random (key, value) pair from a dictionary-like table.
---
---@generic K, V
---@param tbl {[K]: V}
---@return K, V
---@nodiscard
function extensions.table.randompair(tbl) end

---
---Returns a copy of an array-like table sorted using Lua's `table.sort`.
---
---@generic V
---@param tbl V[]
---@return V[]
---@nodiscard
function extensions.table.sorted(tbl, fn) end

---
---Iterates through a table until it finds a value that is equal to `value` according to the `==` operator.
---The key is returned if a match is found.
---
---@generic K, V
---@param tbl {[K]: V}
---@param value V
---@return K
---@nodiscard
function extensions.table.search(tbl, value) end

---
---Returns a new table that is a slice of the original, defined by the start and stop bounds and the step size.
---Default start, stop, and step values are 1, #tbl, and 1, respectively.
---
---@generic T: table
---@param tbl T
---@param start? number # Default `1`
---@param stop? number # Default `#tbl`
---@param step? number # Default `1`
---@return T
---@nodiscard
function extensions.table.slice(tbl, start, stop, step) end

---@class discoria.extensions.string: table
---@overload fun()
extensions.string = {}

---
---Splits a string into a table of specifically delimited sub-strings.
---If the delimiter is omitted or empty, the string is split into a table of characters.
---
---@param str string
---@param delim? string # Default `""`
---@return string[]
---@nodiscard
function extensions.string.split(str, delim) end

---
---Returns a new string with all whitespace removed from the left and right sides of the original string.
---
---@param str string
---@return string
---@nodiscard
function extensions.string.trim(str) end

---
---Returns a new string that is padded up to the desired length.
---The alignment, either `left`, `right`, or `center` with left being the default, defines the placement of the original string.
---The default pattern is a single space.
---
---@param str string
---@param len? number
---@param align? "left"|"center"|"right"
---@param pattern? string # Default '` `'
---@return string
---@nodiscard
function extensions.string.pad(str, len, align, pattern) end

---
---Returns whether a string starts with a specified sub-string or pattern.
---The plain parameter is the same as that used in Lua's `string.find`.
---
---@param str string
---@param pattern string
---@param plain? boolean # Default `false`
---@return boolean
---@nodiscard
function extensions.string.startswith(str, pattern, plain) end

---
---Returns whether a string ends with a specified sub-string or pattern.
---The plain parameter is the same as that used in Lua's `string.find`.
---
---@param str string
---@param pattern string
---@param plain? boolean # Default `false`
---@return boolean
---@nodiscard
function extensions.string.endswith(str, pattern, plain) end

---
---Returns the Levenshtein distance between two strings.
---A higher number indicates a greater distance.
---
---@param str1 string
---@param str2 string
---@return number
---@nodiscard
function extensions.string.levenshtein(str1, str2) end

---
---Returns a string of random characters with the specified length.
---If provided, the min and max bounds cannot be outside 0 to 255.
---Use 32 to 126 for printable ASCII characters.
---
---@param len number
---@param min? number
---@param max? number
---@return string
---@nodiscard
function extensions.string.random(len, min, max) end

---@class discordia.extensions.math: table
---@overload fun()
extensions.math = {}

---
---Returns a number that is at least as small as the minimum value and at most as large as the maximum value, inclusively.
---If the original number is already with the bounds, the same number is returned.
---
---@param n number
---@param min number
---@param max number
---@return number
---@nodiscard
function extensions.math.clamp(n, min, max) end

---
---Returns a number that is rounded to the nearest defined digit.
---The nearest integer is returned if the digit is omitted.
---Negative values can be used for higher order places.
---
---@param n number
---@param digits? number
---@return number
---@nodiscard
function extensions.math.round(n, digits) end
]]

-- TODO: how do we handle globally injected functions?

return function(w)
  w(template)
end
