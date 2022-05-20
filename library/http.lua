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
local ServerResponse = {
  encode = httpCodec.encoder()
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
