---@meta

---
---Node-style url codec for luvit.
---
---@class luvit.url
local url = {}

---@alias url_parsed {protocol?: string, host?: string, hostname?: string, port?: string, path: string, pathname: string, search?: string, query?: table<string, string|string[]>, auth?: string, hash?: string, href: string}

---
---The `url.parse()` method takes a URL string, parses it, and returns a table representing the URL structure.
---
---`url.parse()` uses a lenient, non-standard algorithm for parsing URL strings. It is prone to security issues such as [host name spoofing](https://hackerone.com/reports/678487) and incorrect handling of usernames and passwords.
---**Use with caution.**
---
---@param url string # The URL string to parse.
---@param parseQueryString boolean # If `true`, the `query` property will always be set to an object returned by the `querystring` module's `parse()` method. If `false`, the `query` property on the returned URL object will be an unparsed, undecoded string. Default: `false`.
---@return url_parsed result
---@nodiscard
function url.parse(url, parseQueryString) end

---
---The `url.format()` method returns a formatted URL string derived from `parsed`.
---
---```lua
---local url = require('url')
---url.format({
---  protocol = 'https',
---  hostname = 'example.com',
---  pathname = '/some/path',
---  query = {
---    page = 1,
---    format = 'json'
---  }
---})
---
-----> 'https://example.com/some/path?page=1&format=json'
---```
---
---@param parsed string|url_parsed # A table represanting a URL (as returned by `url.parse()`). If a `string`, it is converted to a table by passing it to `url.parse()`.
---@return string result
function url.format(parsed) end

---
---The `url.resolve()` method resolves a target URL relative to a base URL in a manner similar to that of a web browser resolving an anchor tag.
---
---```lua
---local url = require('url')
---url.resolve('/one/two/three', 'four')         --> '/one/two/four'
---url.resolve('http://example.com/', '/one')    --> 'http://example.com/one'
---url.resolve('http://example.com/one', '/two') --> 'http://example.com/two'
---```
---
---@param source string|url_parsed # The base URL to use if `relative` is a relative URL.
---@param relative string|url_parsed # The target URL to resolve.
---@return string result
function url.resolve(source, relative) end

---
---Similar to `url.resolve`, but instead of returning the result as string, it returns a URL structure table.
---
---@param source string|url_parsed
---@param relative string|url_parsed
---@return url_parsed result
function url.resolveObject(source, relative) end

return url
