---@meta

---
---[coro-http](https://github.com/luvit/lit/blob/master/deps/coro-http.lua) is a library for manipulating the HTTP(s) protocol in a sync code-style making use of Lua coroutines, while actually keeping it async behind the scenes.
---
---Can be used as a great replacement for the Luvit 2 built-in http & https libraries, to get rid of the callback code-style, with a more user-friendly interface. This is achieved through coroutines yielding and resuming without blocking the main event loop of [luv](https://github.com/luvit/luv/).
---
---Visit the [coro-docs](https://bilal2453.github.io/coro-docs/docs/coro-http.html) for further documentation.
---
local coro_http = {}

---@alias coroHttp_res {code: integer, reason: string, version: number, keepAlive: boolean, [integer]: string[]}
---@alias coroHttp_read fun(): string|boolean, string?
---@alias coroHttp_write fun(chunk: string|string[]): boolean, string?
---@alias coroHttp_tlsOptions {protocol?: string, ciphers?: string, key?: string, cert?: string, ca?: string|string[], insecure?: boolean}
---@alias coroHttp_connection {socket: uv_tcp_t, host: string, port: integer, tls: boolean|coroHttp_tlsOptions, read: coroHttp_read, write: coroHttp_write, updateEncoder: fun(new_encoder: function), updateDecoder: fun(new_decoder: function), reset: function}

---Synchronously performs an HTTP(s) request after establishing a connection with the said host.
---
---  - This method will raise an error up upon failure. Advised to be called with pcall/xpcall.
---
---  - If said connection [with the host specified in `url`] was already established and is still alive, it will be used instead of establishing another connection. Generally this is done either by a previous `request` call or by manually calling `saveConnection`.
---
---***This method MUST be run in a coroutine***
---@param method httpCodec_method # The HTTP method. Must be upper-case.
---@param url string # The URL to send request to. Must start with `http://` or `https://`.
---@param headers? table<integer, string[]> # E.x: `{{'Content-Type', 'application/json'}}`.
---@param body? string # The request's payload (if needed).
---@param options? number|{followRedirects?: boolean, timeout?: number} # If number, it is treated as the timeout.
---@return coroHttp_res response # A [Response](https://bilal2453.github.io/coro-docs/docs/coro-http.html#request-response) structure representing the received response.
---@return string body # The response payload the server responded with as a string if any, otherwise an empty string.
---@nodiscard
function coro_http.request(method, url, headers, body, options) end

---Creates a new server instance and asynchronously binds it to host:port.
---
---*This method does not require running in a coroutine*
---@param host string # The host which the server corresponds to.
---@param port integer # The port to which the created server should listen on.
---@param onConnect fun(read: coroHttp_read, write: coroHttp_write, socket: uv_tcp_t) # See [onConnect](https://bilal2453.github.io/coro-docs/docs/coro-http.html#createServer-onConnect) for details.
---@return uv_tcp_t server # The TCP socket of the created server. Server connection can be stopped and manipulated using this.
function coro_http.createServer(host, port, onConnect) end

---Parses the given string representing a valid HTTP(s) URL into a Lua table.
---
---*This method does not require running in a coroutine*
---@param url string # The HTTP URL to be parsed. An error will be raised up if it is not a valid HTTP URL.
---@return {tls: boolean, host: string, hostname: string, port: integer, path: string} result # A [Parsed URL](https://bilal2453.github.io/coro-docs/docs/coro-http.html#parsed-url) structure representing the URL as a Lua table.
---@nodiscard
function coro_http.parseUrl(url) end

---Establishes a new TCP connection with the given host on the given port.
---
---  - If the connection was previously saved using `saveConnection`, calling this will return that connection and un-save it.
---
---  - If the saved connection was closed, or there were none previously saved, a new connection will be established instead.
---
---  - User should never need this in normal scenarios.
---
---***This method MUST be run in a coroutine***
---@param host string                      # The host which the established connection refers to.
---@param port integer                     # The port that this connection should refer to when connecting to the host.
---@param tls? boolean|coroHttp_tlsOptions # The use of SSL/TLS cryptographic protocol. <br> - Boolean value whether to use SSL/TLS cert or not.<br>- Table value to use SSL/TLS, with optional configurations. See [TLS Options](https://bilal2453.github.io/coro-docs/docs/coro-http.html#tls-options) for acceptable fields.
---@param timeout? number                  # How much time to wait for the response before canceling the request out in millisecond.
---@return coroHttp_connection
---@nodiscard
function coro_http.getConnection(host, port, tls, timeout) end

---Saves a pre-established [TCP connection](https://bilal2453.github.io/coro-docs/docs/coro-http.html#tcp-connection) to be used later instead of establishing a new one (e.g. would be used by [request](https://bilal2453.github.io/coro-docs/docs/coro-http.html#request)).
---
---  - If the passed connection is dead nothing will be saved.
---
---  - User should never need this in normal scenarios.
---
---*This method does not require running in a coroutine*
---@param connection coroHttp_connection # A table representing a TCP connection returned by `getConnection`.
function coro_http.saveConnection(connection) end

return coro_http
