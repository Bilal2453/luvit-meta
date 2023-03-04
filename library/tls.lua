---@meta

---@class luvit.tls
---@field DEFAULT_SECUREPROTOCOL 'TLS'|'SSLv23'
local tls = {}

---
---@return boolean
---@nodiscard
function tls.isLibreSSL() end

---
---@return boolean
---@nodiscard
function tls.isTLSv1_3() end

---
---@class luvit.tls.Credential: luvit.core.Object
---@field rejectUnauthorized? boolean
---@field context unknown
---@field store? unknown
local Credential = {}

---
---@param secureProtocol? 'SSLv3'|'SSLv23'|'SSLv2'|'TSLv1'|'TSLv1_1'|'TSLv1_2'|'TLS'|'DTLSv1'|'DTLSv1_2'
---@param defaultCiphers? string
---@param flags? integer
---@param rejectUnauthorized? boolean
---@param context? unknown
function Credential:new(secureProtocol, defaultCiphers, flags, rejectUnauthorized, context) end

---
---
function Credential:addRootCerts() end

---
---@param certs string[]|string
function Credential:setCA(certs) end

---
---@param key string
---@param cert string
function Credential:setKeyCert(key, cert) end

---@alias TLSSocket-Options {secureContext?: unknown, server?: boolean, requestCert?: boolean, rejectUnauthorized?: boolean}

---
---@class luvit.tls.TLSSocket: luvit.net.Socket
---@field options TLSSocket-Options
---@field ctx unknown
---@field server boolean
---@field requestCert boolean
---@field rejectUnauthorized boolean
---@field _connected boolean
---@field encrypted boolean
---@field inp? unknown
---@field out? unknown
---@field ssl? unknown
---@field sessionReused? boolean
---@field authorized? boolean
---@field authorizationError? unknown
---@field _shutdown? boolean
---@field _shutdownTimer? uv_timer_t
local TLSSocket = {}
tls.TLSSocket = TLSSocket

---
---Creates a new instance and initializes it.
---
---@param socket? luvit.net.Socket
---@param options TLSSocket-Options
---@return luvit.tls.TLSSocket
---@nodiscard
function TLSSocket:new(socket, options) end

---
---
function TLSSocket:_init() end

---
---@return 'SSLv3'|'TLSv1'|'TLSv1.1'|'TLSv1.2'|'TLSv1.3'|'unknown'
---@nodiscard
function TLSSocket:version() end

---
---@return unknown
---@nodiscard
function TLSSocket:getPeerCertificate() end

---
---
function TLSSocket:_verifyClient() end

---
---
function TLSSocket:_verifyServer() end

---
---@param err? string
function TLSSocket:destroy(err) end

---
---@param ... unknown
function TLSSocket:connect(...) end

---
---@param hosts table
function TLSSocket:sni(hosts) end

---
---@param callback? fun(err?: string)|nil
function TLSSocket:flush(callback) end

---
---@param data buffer
---@param callback fun(err?: string)|nil
function TLSSocket:_write(data, callback) end

---
---@param n integer
function TLSSocket:_read(n) end

---@param options? {secureProtocol?: 'SSLv3'|'SSLv23'|'SSLv2'|'TSLv1'|'TSLv1_1'|'TSLv1_2'|'TLS'|'DTLSv1'|'DTLSv1_2', ciphers?: string, secureOptions?: integer, rejectUnauthorized?: boolean, key?: string, cert?: string, ca?: string}
---@param context any
---@return luvit.tls.Credential
---@nodiscard
function tls.createCredentials(options, context) end

---
---@class luvit.tls.Server: luvit.net.Server
---@field sni_hosts? string[]
local Server = {}

---
---@param options {secureContext?: luvit.tls.Credential, secureProtocol?: 'SSLv3'|'SSLv23'|'SSLv2'|'TSLv1'|'TSLv1_1'|'TSLv1_2'|'TLS'|'DTLSv1'|'DTLSv1_2', ciphers?: string, secureOptions?: integer, rejectUnauthorized?: boolean, key?: string, cert?: string, ca?: string, handle?: luvit.net.Socket, secureContext?: unknown, server?: boolean, requestCert?: boolean, rejectUnauthorized?: boolean}
---@param connectionListener fun(client: uv_tcp_t)
function Server:init(options, connectionListener) end

---
---@param hosts string[]
function Server:sni(hosts) end

---
---@param options {ciphers?: string, rejectUnauthorized?: boolean, port?: integer, host?: string, hostname?: string, }
---@param callback? fun(self: luvit.tls.TLSSocket)
---@return luvit.tls.TLSSocket
function tls.connect(options, callback) end

---
---@param options {secureContext?: luvit.tls.Credential, secureProtocol?: 'SSLv3'|'SSLv23'|'SSLv2'|'TSLv1'|'TSLv1_1'|'TSLv1_2'|'TLS'|'DTLSv1'|'DTLSv1_2', ciphers?: string, secureOptions?: integer, rejectUnauthorized?: boolean, key?: string, cert?: string, ca?: string, handle?: luvit.net.Socket, secureContext?: unknown, server?: boolean, requestCert?: boolean, rejectUnauthorized?: boolean}
---@param secureCallback fun(client: uv_tcp_t)
---@return luvit.tls.Server
---@nodiscard
function tls.createServer(options, secureCallback) end

return tls
