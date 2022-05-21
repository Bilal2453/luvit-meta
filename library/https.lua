---@meta

---
---@class luvit.https
local https = {}

---
---@param options {secureContext?: luvit.tls.Credential, secureProtocol?: 'SSLv3'|'SSLv23'|'SSLv2'|'TSLv1'|'TSLv1_1'|'TSLv1_2'|'TLS'|'DTLSv1'|'DTLSv1_2', ciphers?: string, secureOptions?: integer, rejectUnauthorized?: boolean, key?: string, cert?: string, ca?: string, handle?: luvit.net.Socket, secureContext?: unknown, server?: boolean, requestCert?: boolean, rejectUnauthorized?: boolean}
---@param onRequest http_onRequest
---@return luvit.tls.Server
---@nodiscard
function https.createServer(options, onRequest) end

---
---@param options string|{headers?: table, host?: string, method?: httpCodec_method, path?: string, port?: integer, socket?: luvit.net.Socket}
---@param callback? fun(res: luvit.http.IncomingMessage)
---@return luvit.http.ClientRequest
---@nodiscard
function https.request(options, callback) end

---
---@param options string|{headers?: table, host?: string, method?: httpCodec_method, path?: string, port?: integer, socket?: luvit.net.Socket}
---@param onResponse? fun(res: luvit.http.IncomingMessage)
---@return luvit.http.ClientRequest
function https.get(options, onResponse) end

return https
