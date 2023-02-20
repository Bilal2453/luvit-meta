---@meta

---A mutable buffer using ffi for luvit.
local buffer = {}

---A mutable buffer using ffi for luvit.
---@class luvit.buffer.Buffer : luvit.core.Object
---@field length integer
---@field ctype unknown
local Buffer = {}
buffer.Buffer = Buffer

---
---@param lengthOrString string|number
function Buffer:initialize(lengthOrString) end

---
---@generic obj
---@param self obj
---@param lengthOrString string|number
---@return obj
function Buffer:new(lengthOrString) end

---Inspect a buffer.
---@return string -- a string of hexes like `"<Buffer Hexes>"`"
function Buffer:inspect() end

---Read an unsigned 8 bit integer at `offset`
---@param offset integer
---@return integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf[1] = 0xFB
---buf[2] = 0x04
---buf[3] = 0x23
---buf[4] = 0x42
---
---assert(buf:readUInt8(1) == 0xFB)
---assert(buf:readUInt8(2) == 0x04)
---assert(buf:readUInt8(3) == 0x23)
---assert(buf:readUInt8(4) == 0x42)
---```
function Buffer:readUInt8(offset) end

---Read a signed 8 bit integer at `offset`
---@param offset integer
---@return integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf[1] = 0xFB
---buf[2] = 0x04
---buf[3] = 0x23
---buf[4] = 0x42
---
---assert(buf:readInt8(1) == -0x05)
---assert(buf:readInt8(2) == 0x04)
---assert(buf:readInt8(3) == 0x23)
---assert(buf:readInt8(4) == 0x42)
---```
function Buffer:readInt8(offset) end

---Read an unsigned 16 bit integer in little endian at `offset`
---@param offset integer
---@return integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf[1] = 0xFB
---buf[2] = 0x04
---buf[3] = 0x23
---buf[4] = 0x42
---
---assert(buf:readUInt16LE(1) == 0x04FB)
---assert(buf:readUInt16LE(2) == 0x2304)
---assert(buf:readUInt16LE(3) == 0x4223)
---```
function Buffer:readUInt16LE(offset) end

---Read an unsigned 16 bit integer in big endian at `offset`
---@param offset integer
---@return integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf[1] = 0xFB
---buf[2] = 0x04
---buf[3] = 0x23
---buf[4] = 0x42
---
---assert(buf:readUInt16BE(1) == 0xFB04)
---assert(buf:readUInt16BE(2) == 0x0423)
---assert(buf:readUInt16BE(3) == 0x2342)
---```
function Buffer:readUInt16BE(offset) end

---Read a signed 16 bit integer in little endian at `offset`
---@param offset integer
---@return integer
function Buffer:readInt16LE(offset) end

---Read a signed 16 bit integer in big endian at `offset`
---@param offset integer
---@return integer
function Buffer:readInt16BE(offset) end

---Read an unsigned 32 bit integer in big endian at `offset`
---@param offset integer
---@return integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf[1] = 0xFB
---buf[2] = 0x04
---buf[3] = 0x23
---buf[4] = 0x42
---
---assert(buf:readUInt32BE(1) == 0xFB042342)
---```
function Buffer:readUInt32BE(offset) end

---Read an unsigned 32 bit integer in little endian at `offset`
---@param offset integer
---@return integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf[1] = 0xFB
---buf[2] = 0x04
---buf[3] = 0x23
---buf[4] = 0x42
---
---assert(buf:readUInt32LE(1) == 0x422304FB)
---```
function Buffer:readUInt32LE(offset) end

---Read a signed 32 bit integer in little endian at `offset`
---@param offset integer
---@return integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf[1] = 0xFB
---buf[2] = 0x04
---buf[3] = 0x23
---buf[4] = 0x42
---
---assert(buf:readInt32LE(1) == 0x422304FB)
---```
function Buffer:readInt32LE(offset) end

---Read a signed 32 bit integer in big endian at `offset`
---@param offset integer
---@return integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf[1] = 0xFB
---buf[2] = 0x04
---buf[3] = 0x23
---buf[4] = 0x42
---
---assert(buf:readInt32BE(1) == -0x04FBDCBE)
---```
function Buffer:readInt32BE(offset) end

---Write an unsigned 8 bit integer `value` at `offset`
---@param offset integer
---@param value integer
---
---Equivalent to `Buffer[offset] = value`.
---
---```lua
---local buf = Buffer:new(4)
---
---buf:writeUInt8(1, 0xFB)
---assert(buf:readUInt8(1) == 0xFB)
---buf:writeUInt8(2, 0x04)
---assert(buf:readUInt8(2) == 0x04)
---buf:writeUInt8(3, 0x23)
---assert(buf:readUInt8(3) == 0x23)
---buf:writeUInt8(4, 0x42)
---assert(buf:readUInt8(4) == 0x42)
---```
function Buffer:writeUInt8(offset, value) end

---Write a signed 8 bit integer `value` at `offset`
---@param offset integer
---@param value integer
---
---Equivalent to `Buffer[offset] = value`.
---
---```lua
---local buf = Buffer:new(4)
---
---buf:writeInt8(1, -0x05)
---assert(buf:readInt8(1) == -0x05)
---buf:writeInt8(2, 0x04)
---assert(buf:readInt8(2) == 0x04)
---buf:writeInt8(3, 0x23)
---assert(buf:readInt8(3) == 0x23)
---buf:writeInt8(4, 0x42)
---assert(buf:readInt8(4) == 0x42)
---```
function Buffer:writeInt8(offset, value) end

---Write an unsigned 16 bit integer `value` in little endian at `offset`
---@param offset integer
---@param value integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf:writeUInt16LE(1, 0x04FB)
---assert(buf:readUInt16LE(1) == 0x04FB)
---buf:writeUInt16LE(2, 0x2304)
---assert(buf:readUInt16LE(2) == 0x2304)
---buf:writeUInt16LE(3, 0x4223)
---assert(buf:readUInt16LE(3) == 0x4223)
---```
function Buffer:writeUInt16LE(offset, value) end

---Write an unsigned 16 bit integer `value` in big endian at `offset`
---@param offset integer
---@param value integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf:writeUInt16BE(1, 0xFB04)
---assert(buf:readUInt16BE(1) == 0xFB04)
---buf:writeUInt16BE(2, 0x0423)
---assert(buf:readUInt16BE(2) == 0x0423)
---buf:writeUInt16BE(3, 0x2342)
---assert(buf:readUInt16BE(3) == 0x2342)
---```
function Buffer:writeUInt16BE(offset, value) end

---Write a signed 16 bit integer `value` in little endian at `offset`
---@param offset integer
---@param value integer
function Buffer:writeInt16LE(offset, value) end

---Write a signed 16 bit integer `value` in big endian at `offset`
---@param offset integer
---@param value integer
function Buffer:writeInt16BE(offset, value) end

---Write an unsigned 32 bit integer `value` in little endian at `offset`
---@param offset integer
---@param value integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf:writeUInt32LE(1, 0x422304FB)
---assert(buf:readUInt32LE(1) == 0x422304FB)
---```
function Buffer:writeUInt32LE(offset, value) end

---Write an unsigned 32 bit integer `value` in big endian at `offset`
---@param offset integer
---@param value integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf:writeUInt32BE(1, 0xFB042342)
---assert(buf:readUInt32BE(1) == 0xFB042342)
---```
function Buffer:writeUInt32BE(offset, value) end

---Write a signed 32 bit integer `value` in little endian at `offset`
---@param offset integer
---@param value integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf:writeInt32LE(1, 0x422304FB)
---assert(buf:readInt32LE(1) == 0x422304FB)
---```
function Buffer:writeInt32LE(offset, value) end

---Write a signed 32 bit integer `value` in big endian at `offset`
---@param offset integer
---@param value integer
---
---```lua
---local buf = Buffer:new(4)
---
---buf:writeInt32BE(1, -0x04FBDCBE)
---assert(buf:readInt32BE(1) == -0x04FBDCBE)
---```
function Buffer:writeInt32BE(offset, value) end

---Stringify the buffer from the `i`th to the `j`th position, or the whole thing
---if `i` and `j` arent specified
---@param i integer
---@param j integer
---@return string
---
---```lua
---local buf2 = Buffer:new('abcd')
---
---assert(tostring(buf2) == 'abcd')
---assert(buf2:toString(1, 2) == 'ab')
---assert(buf2:toString(2, 3) == 'bc')
---assert(buf2:toString(3) == 'cd')
---assert(buf2:toString() == 'abcd')
---```
function Buffer:toString(i, j) end

---
---@param b any
---@return boolean
function Buffer.isBuffer(b) end

return buffer
