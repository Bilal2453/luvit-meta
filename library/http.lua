---@meta

---@type luvit.httpCodec
local httpCodec = {}
-- TODO: proper header types

---@class luvit.http
local http = {}

---@class luvit.http.IncomingMessage: luvit.net.Socket
---@field httpVersion string
---@field headers table
---@field method? httpCodec_method
---@field url? string
---@field statusCode? httpCodec_code
---@field statusMessage? httpCodec_reason
---@field socket luvit.net.Socket
---Emitted on error, as well as on `Emitter:wrap()`.
---@field on fun(self: luvit.http.IncomingMessage, name: 'error', callback: fun(err: string|luvit.core.Error))
---Emitted on error, as well as on `Emitter:wrap()`.
---@field once fun(self: luvit.http.IncomingMessage, name: 'error', callback: fun(err: string|luvit.core.Error))
---@field on fun(self: luvit.http.IncomingMessage, name: 'pipe', callback: fun(source: luvit.http.IncomingMessage))
---@field once fun(self: luvit.http.IncomingMessage, name: 'pipe', callback: fun(source: luvit.http.IncomingMessage))
---@field on fun(self: luvit.http.IncomingMessage, name: 'drain', callback: fun())
---@field once fun(self: luvit.http.IncomingMessage, name: 'drain', callback: fun())
---@field on fun(self: luvit.http.IncomingMessage, name: 'prefinish', callback: fun())
---@field once fun(self: luvit.http.IncomingMessage, name: 'prefinish', callback: fun())
---@field on fun(self: luvit.http.IncomingMessage, name: 'finish', callback: fun())
---@field once fun(self: luvit.http.IncomingMessage, name: 'finish', callback: fun())
---@field on fun(self: luvit.http.IncomingMessage, name: 'end', callback: fun())
---@field once fun(self: luvit.http.IncomingMessage, name: 'end', callback: fun())
---@field on fun(self: luvit.http.IncomingMessage, name: 'data', callback: fun(chunk: string))
---@field once fun(self: luvit.http.IncomingMessage, name: 'data', callback: fun(chunk: string))
---@field on fun(self: luvit.http.IncomingMessage, name: 'readable', callback: fun())
---@field once fun(self: luvit.http.IncomingMessage, name: 'readable', callback: fun())
---@field on fun(self: luvit.http.IncomingMessage, name: 'unpipe', callback: fun(source: luvit.http.IncomingMessage))
---@field once fun(self: luvit.http.IncomingMessage, name: 'unpipe', callback: fun(source: luvit.http.IncomingMessage))
---@field on fun(self: luvit.http.IncomingMessage, name: 'resume', callback: fun())
---@field once fun(self: luvit.http.IncomingMessage, name: 'resume', callback: fun())
---@field on fun(self: luvit.http.IncomingMessage, name: 'pause', callback: fun())
---@field once fun(self: luvit.http.IncomingMessage, name: 'pause', callback: fun())
---@field on fun(self: luvit.http.IncomingMessage, name: '_socketEnd', callback: fun())
---@field once fun(self: luvit.http.IncomingMessage, name: '_socketEnd', callback: fun())
---@field on fun(self: luvit.http.IncomingMessage, name: 'connect', callback: fun())
---@field once fun(self: luvit.http.IncomingMessage, name: 'connect', callback: fun())
---@field on fun(self: luvit.http.IncomingMessage, name: 'close', callback: fun())
---@field once fun(self: luvit.http.IncomingMessage, name: 'close', callback: fun())
---@field on fun(self: luvit.http.IncomingMessage, name: 'connection', callback: fun(connection: luvit.net.Socket))
---@field once fun(self: luvit.http.IncomingMessage, name: 'connection', callback: fun(connection: luvit.net.Socket))
local IncomingMessage = {}

---
---Creates a new instance and initializes it.
---
---@param head httpCodec_head
---@param socket luvit.net.Socket
---@return luvit.http.IncomingMessage
---@nodiscard
function IncomingMessage:new(head, socket) end

---
---
function IncomingMessage:_read() end

---@class luvit.http.ServerResponse: luvit.stream.Writable
---Override this in the instance to not send the date.
---@field sendDate boolean
---@field socket luvit.net.Socket
---@field headersSent boolean
---@field headers table
---@field _extra_http table
---@field statusCode httpCodec_code
---@field keepAlive? boolean
---@field hasBody? boolean
---Emitted on error, as well as on `Emitter:wrap()`.
---@field on fun(self: luvit.http.ServerResponse, name: 'error', callback: fun(err: string|luvit.core.Error))
---Emitted on error, as well as on `Emitter:wrap()`.
---@field once fun(self: luvit.http.ServerResponse, name: 'error', callback: fun(err: string|luvit.core.Error))
---@field on fun(self: luvit.http.ServerResponse, name: 'pipe', callback: fun(source: luvit.http.ServerResponse))
---@field once fun(self: luvit.http.ServerResponse, name: 'pipe', callback: fun(source: luvit.http.ServerResponse))
---@field on fun(self: luvit.http.ServerResponse, name: 'drain', callback: fun())
---@field once fun(self: luvit.http.ServerResponse, name: 'drain', callback: fun())
---@field on fun(self: luvit.http.ServerResponse, name: 'prefinish', callback: fun())
---@field once fun(self: luvit.http.ServerResponse, name: 'prefinish', callback: fun())
---@field on fun(self: luvit.http.ServerResponse, name: 'finish', callback: fun())
---@field once fun(self: luvit.http.ServerResponse, name: 'finish', callback: fun())
---@field on fun(self: luvit.http.ServerResponse, name: 'end', callback: fun())
---@field once fun(self: luvit.http.ServerResponse, name: 'end', callback: fun())
local ServerResponse = {
	encode = httpCodec.encoder(),
}

---
---Creates a new instance and initializes it.
---
---@param socket luvit.net.Socket
---@return luvit.http.ServerResponse
---@nodiscard
function ServerResponse:new(socket) end

---
---@param name string
---@param value string
function ServerResponse:setHeader(name, value) end

---
---@param name string
---@return string|nil
---@nodiscard
function ServerResponse:getHeader(name) end

---
---@param name string
function ServerResponse:removeHeader(name) end

---
---
function ServerResponse:flushHeaders() end

---@param chunk string
---@param callback fun(err?: luvit.core.Error)
---@return boolean
function ServerResponse:write(chunk, callback) end

---
---Same as `ServerResponse:finish()`.
---
function ServerResponse:_end() end

---
---@param chunk? string
function ServerResponse:finish(chunk) end

---
---@param newStatusCode httpCodec_code
---@param newHeaders table
function ServerResponse:writeHead(newStatusCode, newHeaders) end

---@alias http_onRequest fun(req: luvit.http.IncomingMessage, res: luvit.http.ServerResponse)

---
---@param socket luvit.net.Socket
---@param onRequest http_onRequest
function http.handleConnection(socket, onRequest) end

---
---@param onRequest http_onRequest
---@return luvit.net.Server
function http.createServer(onRequest) end

---
---@class luvit.http.ClientRequest: luvit.stream.Writable
---@field host? string
---@field method httpCodec_method|'GET'
---@field path string|'/'
---@field port integer|80
---@field self_sent boolean
---@field connection? string
---@field socket luvit.net.Socket
---@field connected? boolean
---@field ended boolean
---@field headers_sent boolean
---@field _defaultUserAgent? 'luvit/http luvi/?'
---Emitted on error, as well as on `Emitter:wrap()`.
---@field on fun(self: luvit.http.ClientRequest, name: 'error', callback: fun(err: string|luvit.core.Error))
---Emitted on error, as well as on `Emitter:wrap()`.
---@field once fun(self: luvit.http.ClientRequest, name: 'error', callback: fun(err: string|luvit.core.Error))
---@field on fun(self: luvit.http.ClientRequest, name: 'pipe', callback: fun(source: luvit.http.ClientRequest))
---@field once fun(self: luvit.http.ClientRequest, name: 'pipe', callback: fun(source: luvit.http.ClientRequest))
---@field on fun(self: luvit.http.ClientRequest, name: 'drain', callback: fun())
---@field once fun(self: luvit.http.ClientRequest, name: 'drain', callback: fun())
---@field on fun(self: luvit.http.ClientRequest, name: 'prefinish', callback: fun())
---@field once fun(self: luvit.http.ClientRequest, name: 'prefinish', callback: fun())
---@field on fun(self: luvit.http.ClientRequest, name: 'finish', callback: fun())
---@field once fun(self: luvit.http.ClientRequest, name: 'finish', callback: fun())
---@field on fun(self: luvit.http.ClientRequest, name: 'end', callback: fun())
---@field once fun(self: luvit.http.ClientRequest, name: 'end', callback: fun())
---@field on fun(self: luvit.http.ClientRequest, name: 'socket', callback: fun(socket: luvit.net.Socket))
---@field once fun(self: luvit.http.ClientRequest, name: 'socket', callback: fun(socket: luvit.net.Socket))
---@field on fun(self: luvit.http.ClientRequest, name: 'connect', callback: fun(res: luvit.http.IncomingMessage, socket: luvit.net.Socket, head: httpCodec_head))
---@field once fun(self: luvit.http.ClientRequest, name: 'connect', callback: fun(res: luvit.http.IncomingMessage, socket: luvit.net.Socket, head: httpCodec_head))
---@field on fun(self: luvit.http.ClientRequest, name: 'upgrade', callback: fun(res: luvit.http.IncomingMessage, socket: luvit.net.Socket, head: httpCodec_head))
---@field once fun(self: luvit.http.ClientRequest, name: 'upgrade', callback: fun(res: luvit.http.IncomingMessage, socket: luvit.net.Socket, head: httpCodec_head))
---@field on fun(self: luvit.http.ClientRequest, name: 'response', callback: fun(res: luvit.http.IncomingMessage))
---@field once fun(self: luvit.http.ClientRequest, name: 'response', callback: fun(res: luvit.http.IncomingMessage))
local ClientRequest = {
	encode = httpCodec.encoder(),
	decode = httpCodec.decoder(),
}

---
---@return 'luvit/http luvi/?'
---@nodiscard
function ClientRequest.getDefaultUserAgent() end

---
---Creates a new instance and initializes it.
---
---@param options {headers?: table, host?: string, method?: httpCodec_method, path?: string, port?: integer, socket?: luvit.net.Socket, connect_emitter?: string}
---@param callback? fun(res: luvit.http.IncomingMessage)
---@return luvit.http.ClientRequest
---@nodiscard
function ClientRequest:new(options, callback) end

---
---
function ClientRequest:flushHeaders() end

---
---@param data string
---@param cb fun()
function ClientRequest:write(data, cb) end

---
---@param data string
---@param cb fun(err?: luvit.core.Error)
function ClientRequest:_write(data, cb) end

---
---@param data string
---@param cb? fun()
function ClientRequest:_done(data, cb) end

---
---
function ClientRequest:_setConnection() end

---
---@param data? string
---@param cb? fun()
function ClientRequest:done(data, cb) end

---
---@param msecs number # millisecond
---@param callback fun()
function ClientRequest:setTimeout(msecs, callback) end

---
---
function ClientRequest:destroy() end

---@param options? string
---@return url_parsed result
---@nodiscard
function http.parseUrl(options) end

---
---`options` is either the URL, or a table of options.
---
---@param options string|{headers?: table, host?: string, method?: httpCodec_method, path?: string, port?: integer, socket?: luvit.net.Socket, connect_emitter?: string}
---@param onResponse? fun(res: luvit.http.IncomingMessage)
---@return luvit.http.ClientRequest
---@nodiscard
function http.request(options, onResponse) end

---
---@param options string|{headers?: table, host?: string, method?: httpCodec_method, path?: string, port?: integer, socket?: luvit.net.Socket, connect_emitter?: string}
---@param onResponse? fun(res: luvit.http.IncomingMessage)
---@return luvit.http.ClientRequest
function http.get(options, onResponse) end

return http
