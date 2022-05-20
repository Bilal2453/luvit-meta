---@meta

---
---@class luvit.net
local net = {}

---
---@class luvit.net.Socket: luvit.stream.Duplex
---@field _handle uv_tcp_t|uv_pipe_t
---@field _connecting boolean
---@field _reading boolean
---@field _destroyed boolean
local Socket = {}
net.Socket = Socket

---@alias luvit.net.Socket-Options {fd?: integer, handle?: uv_tcp_t|uv_pipe_t}

---
---Creates a new instance and initializes it.
---
---@param options? integer|luvit.net.Socket-Options
---@return luvit.net.Socket
---@nodiscard
function Socket:new(options) end

---
---
function Socket:_onSocketFinish() end

---
---
function Socket:_onSocketEnd() end

---
---@param ip string
---@param port integer
function Socket:bind(ip, port) end

---
---@return {ip: string, family: network_family, port: integer}|nil, string? err_name, string? err_msg
---@nodiscard
function Socket:address() end

---
---@param msecs number # millisecond
---@param callback? fun()
function Socket:setTimeout(msecs, callback) end

---
---@param data buffer
---@param callback fun(err?: string)|nil
function Socket:_write(data, callback) end

---
---@param n integer
function Socket:_read(n) end

---
---@param callback? fun(err?: string)
function Socket:shutdown(callback) end

---
---@param enable boolean
function Socket:nodelay(enable) end

---
---@param enable boolean
---@param delay? integer
function Socket:keepalive(enable, delay) end

---
---@return integer|nil, string? err_name, string? err_msg
---@nodiscard
function Socket:getSendBufferSize() end

---
---@return integer|nil, string? err_name, string? err_msg
---@nodiscard
function Socket:getRecvBufferSize() end

---
---@param size? integer # (default: `0`)
---@return integer|nil, string? err_name, string? err_msg
function Socket:setSendBufferSize(size) end

---
---@param size? integer # (default: `0`)
---@return integer|nil, string? err_name, string? err_msg
function Socket:setRecvBufferSize(size) end

---
---
function Socket:pause() end

---
---
function Socket:resume() end

---
---@generic self: luvit.net.Socket
---@param self self
---@param options {port: string, host?: string} # Default `host`: `'0.0.0.0''.
---@param callback? fun()
---@return self|nil
function Socket:connect(options, callback) end
---@generic self: luvit.net.Socket
---@param self self
---@param port string
---@param host? string # Default: `'0.0.0.0'`.
---@param callback? fun()
---@return self|nil
function Socket:connect(port, host, callback) end

---
---@param exception? string
---@param callback? fun()
function Socket:destroy(exception, callback) end

---
---@return {ip: string, family: network_family, port: integer}|nil, string? err_name, string? err_msg
---@nodiscard
function Socket:getsockname() end



---
---@class luvit.net.Server: luvit.core.Emitter
---@field _handle luvit.net.Socket|nil
---@field _connectionListener function|nil
local Server = {}
net.Server = Server

---
---@param options {handle?: luvit.net.Socket}
---@param connectionListener fun(client: uv_tcp_t)
function Server:init(options, connectionListener) end
---@param connectionListener fun(client: uv_tcp_t)
function Server:init(connectionListener) end

---
---@param err? string
---@param callback? fun()
function Server:destroy(err, callback) end

---
---Default `ip`: `"0.0.0.0"`.
---
---@generic self: luvit.net.Server
---@param self self
---@param ip string
---@param callback fun()
---@return self self
function Server:listen(ip, callback) end
---@generic self: luvit.net.Server
---@param self self
---@param callback fun()
---@return self self
function Server:listen(callback) end
---@generic self: luvit.net.Server
---@param self self
---@return self self
function Server:listen() end

---
---@return {ip: string, family: network_family, port: integer}|nil, string? err_name, string? err_msg
---@nodiscard
function Server:address() end

---
---@param callback? fun()
function Server:close(callback) end


---
---@param port string
---@param host? string # Default: `'0.0.0.0'`.
---@param callback? fun()
---@return luvit.net.Socket connection
function net.createConnection(port, host, callback) end
---@param options {port: string, host?: string}
---@param callback? fun()
---@return luvit.net.Socket connection
function net.createConnection(options, callback) end
net.connect = net.createConnection

---
---@param options {handle?: luvit.net.Socket}
---@param connectionListener fun(client: uv_tcp_t)
---@return luvit.net.Server
---@nodiscard
function net.createServer(options, connectionListener) end
---@param connectionListener fun(client: uv_tcp_t)
---@return luvit.net.Server
---@nodiscard
function net.createServer(connectionListener) end

return net
