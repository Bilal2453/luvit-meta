---@meta

-- TODO: events for stream emitter class
-- TODO: nodiscard

---
---A port of node.js's stream module for luvit.
---
---@class luvit.stream
local module = {}



---
---This is the stream core or base. Extends the emitter class described in Core.
---
---You will most likely not use this class. The only relevant part of this class, the pipe method, is overriden in Readable.
---
---@class luvit.stream.Stream: luvit.core.Emitter
---@field initialize nil|function
local Stream = {}
module.Stream = Stream

---
---@generic T: luvit.stream.Stream
---@param dest T
---@param options? {_end?: boolean}
---@return T pipe
function Stream:pipe(dest, options) end



---@alias Writable-Chunk nil|string|any

---
---@class luvit.stream.WriteReq: luvit.core.Object
---@field chunk Writable-Chunk
---@field callback fun(err?: luvit.core.Error)
local WriteReq = {}

---
---Creates a new instance and initialize it.
---
---@param chunk Writable-Chunk
---@param cb fun(err?: luvit.core.Error)
---@return luvit.stream.WriteReq
---@nodiscard
function WriteReq:new(chunk, cb) end



---@alias Writable-State-Options {objectMode?: boolean, highWaterMark?: integer}

---
---@class luvit.stream.WritableState: luvit.core.Object
---@field objectMode boolean
---@field highWaterMark integer
---@field needDrain boolean
---@field ending boolean
---@field ended boolean
---@field finished boolean
---@field length integer
---@field writing boolean
---@field corked integer
---@field sync boolean
---@field bufferProcessing boolean
---@field onwrite fun(er?: luvit.core.Error)
---@field writecb nil|fun(er?: luvit.core.Error)
---@field writelen integer
---@field buffer luvit.stream.WriteReq[]
---@field pendingcb integer
---@field prefinished boolean
---@field errorEmitted boolean
local WritableState = {}

---
---Creates a new instance and initialize it.
---
---@param options? Writable-State-Options
---@param stream luvit.stream.Writable
---@return luvit.stream.WritableState
---@nodiscard
function WritableState:new(options, stream) end



---
---The writable stream class
---Emits end when done
---
---@class luvit.stream.Writable: luvit.stream.Stream
---@field _writableState luvit.stream.WritableState
local Writable = {}
module.Writable = Writable

---
---Creates a new instance and initialize it
---You can modify or set the writable state options here.
---
---@param options? Writable-State-Options
---@return luvit.stream.Writable
---@nodiscard
function Writable:new(options) end

---
---Emits an `error`. Cannot pipe a non-readable stream.
---
function Writable:pipe() end

---
---@param chunk Writable-Chunk
---@param cb fun(er?: luvit.core.Error)
---@return boolean
function Writable:write(chunk, cb) end

---
---
function Writable:cork() end

---
---
function Writable:uncork() end

---
---@param chunk? Writable-Chunk
---@param cb fun(er?: luvit.core.Error)
function Writable:_write(chunk, cb) end

---
---@overload fun(cb: fun(er?: luvit.core.Error))
---@param chunk Writable-Chunk
---@param cb fun(er?: luvit.core.Error)
function Writable:_end(chunk, cb) end



---
---@class luvit.stream.ReadableState: luvit.core.Object
---@field highWaterMark integer
---@field buffer table
---@field length integer
---@field pipes nil
---@field pipesCount integer
---@field flowing nil
---@field ended boolean
---@field endEmitted boolean
---@field reading boolean
---@field sync boolean
---@field needReadable boolean
---@field emittedReadable boolean
---@field readableListening boolean
---@field objectMode boolean
---@field ranOut boolean
---@field awaitDrain integer
---@field readingMore boolean
local ReadableState = {}

---@alias Readable_State_Options {highWaterMark?: integer, objectMode?: boolean, readableObjectMode?: boolean}

---
---Creates a new instance and initialize it.
---
---@param options? Readable_State_Options
---@param stream luvit.stream.Readable
---@return luvit.stream.ReadableState
---@nodiscard
function ReadableState:new(options, stream) end



---
---@class luvit.stream.Readable: luvit.stream.Stream
---@field _readableState luvit.stream.ReadableState
local Readable = {}
module.Readable = Readable

---
---Manually shove something into the `read()` buffer.
---This returns `true` if the highWaterMark has not been hit yet,
---similar to how `Writable.write()` returns true if you should `write()` some more.
---
---@param chunk string
---@return boolean
function Readable:push(chunk) end

---
---Unshift should *always* be something directly out of `read()`
---
---Returns `true` if the highWaterMark has not been hit yet
---
---@param chunk string
---@return boolean
function Readable:unshift(chunk) end

---
---@param n integer
---@return nil|string
function Readable:read(n) end

---
---@generic T: luvit.stream.Stream
---@param dest T
---@param pipeOpts? {_end?: boolean}
---@return T
function Readable:pipe(dest, pipeOpts) end

---
---@generic T: luvit.stream.Readable
---@param self T
---@param dest luvit.stream.Stream
---@return T self
function Readable:unpipe(dest) end

Readable.addListener = Readable.on

---
---`pause()` and `resume()` are remnants of the legacy readable stream API
---If the user uses them, then switch into old mode.
---
---@generic T: luvit.stream.Readable
---@param self T
---@return T self
function Readable:resume() end

---
---`pause()` and `resume()` are remnants of the legacy readable stream API
---If the user uses them, then switch into old mode.
---
---@generic T: luvit.stream.Readable
---@param self T
---@return T self
function Readable:pause() end

---
---wrap an old-style stream as the async data source.
---
---This is *not* part of the readable stream interface.
---It is an ugly unfortunate mess of history.
---
---@generic T: luvit.stream.Readable
---@param stream luvit.stream.Readable
---@return T self
function Readable:wrap(stream) end

---
---Pluck off n bytes from an array of buffers.
---Length is the combined lengths of all the buffers in the list.
---
---@param n integer
---@param state luvit.stream.ReadableState
---@return nil|string
function Readable._fromList(n, state) end



---@class luvit.stream.Duplex: luvit.stream.Readable, luvit.stream.Writable
---@field meta nil
---@field readable boolean
---@field writable boolean
---@field allowHalfOpen boolean
local Duplex = {}
module.Duplex = Duplex

---@alias Duplex_Options {readable?: boolean, writable?: boolean, allowHalfOpen?: boolean, highWaterMark?: integer, objectMode?: boolean, readableObjectMode?: boolean}

---
---Creates a new instance and initialize it.
---You can modify or set the Duplex options here, including writable and readable states.
---
---@param options Duplex_Options
---@return luvit.stream.Duplex
---@nodiscard
function Duplex:new(options) end



---@class luvit.stream.TransformState: luvit.core.Object
---@field needTransform boolean
---@field transforming boolean
---@field writecb nil|fun(er?: luvit.core.Error)
---@field writechunk nil|any
local TransformState = {}

---
---@param er? luvit.core.Error
---@param data? string
---@return nil|luvit.stream.Transform
function TransformState:afterTransform(er, data) end

---
---Creates a new instance and initialize it.
---
---@param options any # not internally implemented
---@param stream luvit.stream.Transform
---@return luvit.stream.TransformState
---@nodiscard
function TransformState:new(options, stream) end

---
---a transform stream is a readable/writable stream where you do
---something with the data.  Sometimes it's called a "filter",
---but that's not a great name for it, since that implies a thing where
---some bits pass through, and others are simply ignored.  (That would
---be a valid example of a transform, of course.)
---
---While the output is causally related to the input, it's not a
---necessarily symmetric or synchronous transformation.  For example,
---a zlib stream might take multiple plain-text writes(), and then
---emit a single compressed chunk some time in the future.
---
---Here's how this works:
---
---The Transform stream has all the aspects of the readable and writable
---stream classes.  When you write(chunk), that calls _write(chunk,cb)
---internally, and returns false if there's a lot of pending writes
---buffered up.  When you call read(), that calls _read(n) until
---there's enough pending readable data buffered up.
---
---In a transform stream, the written data is placed in a buffer.  When
---_read(n) is called, it transforms the queued up data, calling the
---buffered _write cb's as it consumes chunks.  If consuming a single
---written chunk would result in multiple output chunks, then the first
---outputted bit calls the readcb, and subsequent chunks just go into
---the read buffer, and will cause it to emit 'readable' if necessary.
---
---This way, back-pressure is actually determined by the reading side,
---since _read has to be called to start processing a new chunk.  However,
---a pathological inflate type of transform can cause excessive buffering
---here.  For example, imagine a stream where every byte of input is
---interpreted as an integer from 0-255, and then results in that many
---bytes of output.  Writing the 4 bytes {ff,ff,ff,ff} would result in
---1kb of data being output.  In this case, you could write a very small
---amount of input, and end up with a very large amount of output.  In
---such a pathological inflating mechanism, there'd be no way to tell
---the system to stop doing the transform.  A single 4MB write could
---cause the system to run out of memory.
---
---However, even in such a pathological case, only a single written chunk
---would be consumed, and then the rest would wait (un-transformed) until
---the results of the previous transformed chunk were consumed.
---
---@class luvit.stream.Transform: luvit.stream.Duplex
---@field _transformState luvit.stream.TransformState
---@field _flush nil|fun(er?: luvit.core.Error)
local Transform = {}
module.Transform = Transform

---@alias Transform_Options Duplex_Options

---
---Creates a new instance and initialize it.
---
---@param options? Transform_Options
---@return luvit.stream.Transform
---@nodiscard
function Transform:new(options) end

---
---@param chunk string
---@return boolean
function Transform:push(chunk) end

---
---This is the part where you do stuff!
---override this function in implementation classes.
---'chunk' is an input chunk.
---
---Call `push(newChunk)` to pass along transformed output
---to the readable side (note, if `cb(nil, data)` is used `Transform:push(data)` is automaticall called).
---You may call 'push' zero or more times.
---
---Call `cb(err)` when you are done with this chunk.  If you pass
---an error, then that'll put the hurt on the whole operation.  If you
---never call cb(), then you'll never get another chunk.
---
---@param chunk any
---@param cb fun(er?: luvit.core.Error, data?: string)
---@return unknown
function Transform:_transform(chunk, cb) end

---
---@param chunk any
---@param cb fun(er?: luvit.core.Error)
function Transform:_write(chunk, cb) end

function Transform:_read() end

---
---A passthrough stream.
---Basically just the most minimal sort of Transform stream.
---Every written chunk gets output as-is.
---
---@class luvit.stream.PassThrough: luvit.stream.Transform
local PassThrough = {}
module.PassThrough = PassThrough

---
---Creates a new instance and initialize it.
---
---@param options? Transform_Options
---@return luvit.stream.PassThrough
---@nodiscard
function PassThrough:new(options) end

---
---Observable is a stream that can be observed outside the pipeline. `observe()`
---returns a new Readable stream that emits all data that passes through this
---stream. Streams created by `observe()` do not affect back-pressure.
---
---@class luvit.stream.Observable: luvit.stream.Transform
---@field options Transform_Options
---@field observers luvit.stream.Readable[]
local Observable = {}
module.Observable = Observable

---
---Creates a new instance and initialize it.
---
---@param options? Transform_Options
---@return luvit.stream.Observable
---@nodiscard
function Observable:new(options) end

---
---@return luvit.stream.Readable
function Observable:observe() end



return module
