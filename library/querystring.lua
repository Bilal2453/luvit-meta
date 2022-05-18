---@meta

---
---Node-style query-string codec for luvit.
---
---@class luvit.querystring
local querystring = {}

---
---@param str string
---@return string decoded
---@nodiscard
function querystring.urldecode(str) end

---
---@param str string
---@return string encoded
---@nodiscard
function querystring.urlencode(str) end

---
---The `querystring.stringify()` method produces a URL query string from given `params`.
---
---```lua
---local querystring = require('querystring')
---
---querystring.stringify({ foo = 'bar', baz = {'qux', 'quux'}, corge = '' }) --> 'foo=bar&baz=qux&baz=quux&corge='
---
---querystring.stringify({ foo = 'bar', baz = 'qux' }, ';', ':') --> 'foo:bar;baz:qux'
---```
---
---@param params? table<string, string|string[]> # The table to serialize into a URL query string
---@param sep? string # The substring used to delimit key and value pairs in the query string. Default: `&`.
---@param eq? string The substring used to delimit keys and values in the query string. # Default: `=`.
---@return string result
---@nodiscard
function querystring.stringify(params, sep, eq) end

---
---The `querystring.parse()` method parses a URL query string (`str`) into a collection of key and value pairs.
---
---For example, the query string 'foo=bar&abc=xyz&abc=123' is parsed into:
---```lua
---{
---  foo = 'bar',
---  abc = {'xyz', '123'}
---}
---```
---
---@param str string # The URL query string to parse
---@param sep? string # The substring used to delimit key and value pairs in the query string. Default: `&`.
---@param eq? string # The substring used to delimit keys and values in the query string. Default: `=`.
---@return table<string, string|string[]> result
---@nodiscard
function querystring.parse(str, sep, eq) end

return querystring
