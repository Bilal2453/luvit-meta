---@meta

---
---[coro-http](https://github.com/luvit/lit/blob/master/deps/coro-http.lua) is a library for manipulating the HTTP(s) protocol in a sync code-style making use of Lua coroutines, while actually keeping it async behind the scenes.
---
---Can be used as a great replacement for the Luvit 2 built-in http & https libraries, to get rid of the callback code-style, with a more user-friendly interface. This is achieved through coroutines yielding and resuming without blocking the main event loop of [luv](https://github.com/luvit/luv/).
---
---Visit the [coro-docs](https://bilal2453.github.io/coro-docs/docs/coro-http.html) for further documentation.
---
local coro_http = {}

---@alias coro-http.alias.header {[1]: string, [2]: string}
---@alias coro-http.alias.response {method: httpCodec_method, code: integer, reason: string, version: number, keepAlive: boolean, [integer]: coro-http.alias.header}
---@alias coro-http.alias.reader fun(): string|boolean, string?
---@alias coro-http.alias.writer fun(chunk: uv.aliases.buffer): boolean, string?
---@alias coro-http.alias.tlsOptions {protocol?: string, ciphers?: string, key?: string, cert?: string, ca?: uv.aliases.buffer, insecure?: boolean}
---@alias coro-http.alias.options {followRedirects?: boolean, timeout?: number}
---@alias coro-http.alias.onConnect fun(req: coro-http.alias.response, body: string, socket: uv_tcp_t): coro-http.alias.response, string?

---
---A table structure that represents a TCP connection (wrapped using coro-channel).
---The structure offers methods to directly read and write from the socket, and other details about the connection.
---Generally speaking you should only use these when it is the only way to accomplish what you need since they are for advanced uses.
---
---@class coro-http.class.Connection
---The TCP socket (handle) used to bind the established connection.
---@field socket uv_tcp_t
---Same as the passed parameter `host` when establishing.
---@field host string
---Same as the passed parameter `port` when establishing.
---@field port integer
---Same as the passed parameter `tls` when establishing.
---@field tls boolean|coro-http.alias.tlsOptions
---A [coro-channel reader](https://bilal2453.github.io/coro-docs/docs/coro-channel.html#reader) that receives a new chunk of data each time it is resumed.
---@field read coro-http.alias.reader
---A [coro-channel writer](https://bilal2453.github.io/coro-docs/docs/coro-channel.html#writer) that sends a chunk of data each time it is called through the socket.
---@field write coro-http.alias.writer
---Takes a single function argument, and uses the said argument as the new [encoder](https://bilal2453.github.io/coro-docs/docs/coro-wrapper.html#encoder).
---@field updateEncoder fun(new_encoder: function)
---Takes a single function argument, and uses the said argument as the new [decoder](https://bilal2453.github.io/coro-docs/docs/coro-wrapper.html#decoder).
---@field updateDecoder fun(new_decoder: function)
---Updates the decoder back to the original, `httpCodec.decoder()`.
---@field reset function

---
---A parsed URL is often returned by `parseUrl` as a table that represents an HTTP(s) URL.
---
---@class coro-http.class.URL: table
---Whether or not the parsed URL uses TLS/SSL (HTTPS).
---@field tls boolean
---The authority of the parsed URL (hostname:port).
---@field host string
---The host name of the parsed URL (hostname only).
---@field hostname string
---The host port of the parsed URL if supplied(defaults to `80` for HTTP and `443` for HTTPS).
---@field port integer
---Everything following the host of the parsed URL (including first `/`)
---@field path string

---
---Synchronously performs an HTTP(s) request after establishing a connection with the said host.
---
---  - This method will raise an error up upon failure. Advised to be called with pcall/xpcall.
---
---  - If said connection [with the host specified in `url`] was already established and is still alive, it will be used instead of establishing another connection. Generally this is done either by a previous `request` call or by manually calling `saveConnection`.
---
---***This method MUST be run in a coroutine***
---
---@param method httpCodec_method                 # The HTTP method. Must be upper-case.
---@param url string                              # The URL to send request to. Must start with `http://` or `https://`.
---@param headers? coro-http.alias.header[]       # E.x: `{{'Content-Type', 'application/json'}}`.
---@param body? string                            # The request's payload (if needed).
---@param options? number|coro-http.alias.options # If number, it is treated as the timeout.
---@return coro-http.alias.response response      # A [Response](https://bilal2453.github.io/coro-docs/docs/coro-http.html#request-response) structure representing the received response.
---@return string body                            # The response payload the server responded with as a string if any, otherwise an empty string.
---@nodiscard
function coro_http.request(method, url, headers, body, options) end

---
---Creates a new server instance and asynchronously binds it to host:port.
---
---*This method does not require running in a coroutine*
---
---@param host string       # The host which the server corresponds to.
---@param port integer      # The port to which the created server should listen on.
---@param onConnect coro-http.alias.onConnect # See [onConnect](https://bilal2453.github.io/coro-docs/docs/coro-http.html#createServer-onConnect) for details.
---@return uv_tcp_t server  # The TCP socket of the created server. Server connection can be stopped and manipulated using this.
function coro_http.createServer(host, port, onConnect) end

---
---Parses the given string representing a valid HTTP(s) URL into a Lua table.
---
---*This method does not require running in a coroutine*
---
---@param url string # The HTTP URL to be parsed. An error will be raised up if it is not a valid HTTP URL.
---@return coro-http.class.URL result # A [Parsed URL](https://bilal2453.github.io/coro-docs/docs/coro-http.html#parsed-url) structure representing the URL as a Lua table.
---@nodiscard
function coro_http.parseUrl(url) end

---
---Establishes a new TCP connection with the given host on the given port.
---
---  - If the connection was previously saved using `saveConnection`, calling this will return that connection and un-save it.
---
---  - If the saved connection was closed, or there were none previously saved, a new connection will be established instead.
---
---  - User should never need this in normal scenarios.
---
---***This method MUST be run in a coroutine***
---
---@param host string                      # The host which the established connection refers to.
---@param port integer                     # The port that this connection should refer to when connecting to the host.
---@param tls? boolean|coro-http.alias.tlsOptions # The use of SSL/TLS cryptographic protocol. <br> - Boolean value whether to use SSL/TLS cert or not.<br>- Table value to use SSL/TLS, with optional configurations. See [TLS Options](https://bilal2453.github.io/coro-docs/docs/coro-http.html#tls-options) for acceptable fields.
---@param timeout? number                  # How much time to wait for the response before canceling the request out in millisecond.
---@return coro-http.class.Connection
---@nodiscard
function coro_http.getConnection(host, port, tls, timeout) end

---
---Saves a pre-established [TCP connection](https://bilal2453.github.io/coro-docs/docs/coro-http.html#tcp-connection) to be used later instead of establishing a new one (e.g. would be used by [request](https://bilal2453.github.io/coro-docs/docs/coro-http.html#request)).
---
---  - If the passed connection is dead nothing will be saved.
---
---  - User should never need this in normal scenarios.
---
---*This method does not require running in a coroutine*
---
---@param connection coro-http.class.Connection # A table representing a TCP connection returned by `getConnection`.
function coro_http.saveConnection(connection) end

return coro_http
