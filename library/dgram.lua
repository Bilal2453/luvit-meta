---@meta

---
---Node-style udp module for luvit.
---
---@class luvit.dgram
local dgram = {}

---@class luvit.dgram.Socket: luvit.core.Emitter
---@field _handle uv_udp_t|nil
---@field _family 'udp4'|'udp6'
local Socket = {}
dgram.Socket = Socket

---
---Creates a new instance and initializes it.
---
---@param type 'udp4'|'udp6'
---@param callback? fun(msg: string, rinfo: {ip: string, port: integer, family: uv_network_family}, flags: {partial: boolean|nil, mmsg_chunk: boolean|nil})
---@return luvit.dgram.Socket
---@nodiscard
function Socket:initialize(type, callback) end

---
---
function Socket:recvStart() end

---
---@return 0|nil success, string? err_name, string? err_msg
function Socket:recvStop() end

---
---@param msecs number # milliseconds
---@param callback? fun()
function Socket:setTimeout(msecs, callback) end

---
---Send data over the UDP socket. If the socket has not previously been bound
---with `Socket:bind()` it will be bound to `0.0.0.0` (the "all interfaces" IPv4
---address) and a random port number.
---
---@param data buffer
---@param host string
---@param port integer
---@param callback fun(err?: string)
function Socket:send(data, port, host, callback) end

---
---Bind the UDP handle to an IP address and port.
---
---@param host string
---@param port integer
---@param options? {ipv6only: boolean, reuseaddr: boolean}
function Socket:bind(port, host, options) end

---
---Request the UDP handle to be closed. `callback` will be called asynchronously after this call.
---
---In-progress requests are cancelled and have their callbacks called asynchronously with `ECANCELED`.
---
---@param callback? function
function Socket:close(callback) end

---
---Get the local IP and port of the UDP handle.
---
---@return {ip: string, family: uv_network_family, port: integer}|nil, string? err_name, string? err_msg
---@nodiscard
function Socket:address() end

---
---Set broadcast on or off.
---
---@param status boolean
function Socket:setBroadcast(status) end

---
---Set membership for a multicast address. `multicastAddress` is multicast address to
---set membership for. `multicastInterface` is interface address. `membership` can be
---the string `"leave"` or `"join"`.
---
---@param multicastAddress string
---@param multicastInterface? string
---@param op "leave"|"join"
---@return 0|nil success, string? err_name, string? err_msg
function Socket:setMembership(multicastAddress, multicastInterface, op) end

---
---Same as `Socket:setMembership(multicastAddress, interfaceAddress, 'join')`.
---
---@param multicastAddress string
---@param interfaceAddress? string
---@return 0|nil success, string? err_name, string? err_msg
function Socket:addMembership(multicastAddress, interfaceAddress) end

---
---Same as `Socket:setMembership(multicastAddress, interfaceAddress, 'leave')`.
---
---@param multicastAddress string
---@param interfaceAddress? string
---@return 0|nil success, string? err_name, string? err_msg
function Socket:dropMembership(multicastAddress, interfaceAddress) end

---
---Set the time to live.
---`ttl` is an integer 1 through 255.
---
---@param ttl integer
function Socket:setTTL(ttl) end

---
---@param type 'udp4'|'udp6'
---@param callback? fun(msg: string, rinfo: {ip: string, port: integer, family: uv_network_family}, flags: {partial: boolean|nil, mmsg_chunk: boolean|nil})
---@return luvit.dgram.Socket
---@nodiscard
function dgram.createSocket(type, callback) end

return dgram
