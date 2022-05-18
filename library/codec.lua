---@meta

---@class luvit.codec
local codec = {}

---
---@param emitter luvit.core.Emitter
---@return async fun(): any read # Reads a new chunk each time called. If there is nothing to read, yield until there is.
---@return fun(data: any) write # Writes `data` into the emitter chain. If the emitter is paused, this yields until the emitter is resumed back.
---@nodiscard
function codec.wrapEmitter(emitter)
  function emitter:pause() end
  function emitter:resume() end
  ---
  ---@param data any # The data to chain into the emitter.
  ---@return boolean is_queued # Whether the write has been queued for next `read` call, or was written to the waiting `read`.
  function emitter:write(data) end
  function emitter:shutdown() end
end

---
---@param socket uv_stream_t
---@return fun(): string?, string? read # Returns a new chunk each time called, if nothing to read yields until there is. On failure returns `nil, err_msg`.
---@return fun(chunk: string|string[]) write # Writes a new chunk. If chunk is `nil`, it will shutdown the stream and close it.
function codec.wrapStream(socket) end

---
---@param ... fun(r?: fun(), w?: fun(...))
---@return fun(read, write)
function codec.chain(...) end
-- TODO: make sure of the types

return codec
