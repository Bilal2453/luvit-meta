---@meta

---
---The raw `argc` and `argv` from C side exposed as a **zero** indexed lua table of strings.
---
---```lua
---p('Your args were ', args)
---```
---
---@type string[]
args = {
  [0] = 'string'
}

---#DES 'assert'
---@generic T
---@param v? T
---@param message? any
---@return T
function assert(v, message) end

---@alias gcoptions
---|>'"collect"'      # ---#DESTAIL 'cgopt.collect'
---| '"stop"'         # ---#DESTAIL 'cgopt.stop'
---| '"restart"'      # ---#DESTAIL 'cgopt.restart'
---| '"count"'        # ---#DESTAIL 'cgopt.count'
---| '"step"'         # ---#DESTAIL 'cgopt.step'
---| '"isrunning"'    # ---#DESTAIL 'cgopt.isrunning'
---| '"setpause"'     # ---#DESTAIL 'cgopt.setpause'
---| '"setstepmul"'   # ---#DESTAIL 'cgopt.setstepmul'

---#DES 'collectgarbage'
---@param opt? gcoptions
---@param arg? integer
---@return any
function collectgarbage(opt, arg) end

---#DES 'dofile'
---@param filename? string
---@return any ...
function dofile(filename) end

---#DES 'error'
---@param message any
---@param level?  integer
function error(message, level) end

---#DES '_G'
---@class _G
_G = {}

---#DES 'getfenv'
---@param f? async fun()
---@return table
---@nodiscard
function getfenv(f) end

---#DES 'getmetatable'
---@param object any
---@return table metatable
---@nodiscard
function getmetatable(object) end

---#DES 'ipairs'
---@generic T: table, V
---@param t T
---@return fun(table: V[], i?: integer):integer, V
---@return T
---@return integer i
function ipairs(t) end

---@alias loadmode
---| '"b"'  # ---#DESTAIL 'loadmode.b'
---| '"t"'  # ---#DESTAIL 'loadmode.t'
---|>'"bt"' # ---#DESTAIL 'loadmode.bt'

---#DES 'load>5.2'
---@param chunk      string|function
---@param chunkname? string
---@param mode?      loadmode
---@param env?       table
---@return function?
---@return string?   error_message
---@nodiscard
function load(chunk, chunkname, mode, env) end

---#DES 'loadfile'
---@param filename? string
---@param mode?     loadmode
---@param env?      table
---@return function?
---@return string?  error_message
---@nodiscard
function loadfile(filename, mode, env) end

---#DES 'loadstring'
---@param text       string
---@param chunkname? string
---@return function?
---@return string?   error_message
---@nodiscard
function loadstring(text, chunkname) end

---@param proxy boolean|table
---@return userdata
---@nodiscard
function newproxy(proxy) end

---
---A global that holds information about the current loaded module
---
--- - path: the path to the module.
--- - dir: the path to directory containing the module.
--- - exports: an initially empty table that can be used to export values out of the module. Module returns override this,
---
---@type {exports: any[], path: string, dir: string}
module = {}

---#DES 'next'
---@generic K, V
---@param table table<K, V>
---@param index? K
---@return K?
---@return V?
---@nodiscard
function next(table, index) end

---#DES 'pairs'
---@generic T: table, K, V
---@param t T
---@return fun(table: table<K, V>, index?: K):K, V
---@return T
function pairs(t) end

---#DES 'pcall'
---@param f     async fun()
---@param arg1? any
---@return boolean success
---@return any result
---@return ...
function pcall(f, arg1, ...) end

---#DES 'print'
function print(...) end

---#DES 'rawequal'
---@param v1 any
---@param v2 any
---@return boolean
---@nodiscard
function rawequal(v1, v2) end

---#DES 'rawget'
---@param table table
---@param index any
---@return any
---@nodiscard
function rawget(table, index) end

---#DES 'rawlen'
---@param v table|string
---@return integer len
---@nodiscard
function rawlen(v) end

---#DES 'rawset'
---@param table table
---@param index any
---@param value any
---@return table
function rawset(table, index, value) end

---#DES 'select'
---@param index integer|'"#"'
---@return any
---@nodiscard
function select(index, ...) end

---#DES 'setfenv'
---@param f     async fun()|integer
---@param table table
---@return function
function setfenv(f, table) end

---#DES 'setmetatable'
---@param table      table
---@param metatable? table
---@return table
function setmetatable(table, metatable) end

---#DES 'tonumber'
---@overload fun(e: string, base: integer):integer
---@param e any
---@return number?
---@nodiscard
function tonumber(e) end

---#DES 'tostring'
---@param v any
---@return string
---@nodiscard
function tostring(v) end

---@alias type
---| '"nil"'
---| '"number"'
---| '"string"'
---| '"boolean"'
---| '"table"'
---| '"function"'
---| '"thread"'
---| '"userdata"'

---#DES 'type'
---@param v any
---@return type type
---@nodiscard
function type(v) end

---#DES '_VERSION'
_VERSION = 'Lua 5.1'

---#DES 'xpcall>5.2'
---@param f     async fun()
---@param msgh  function
---@param arg1? any
---@return boolean success
---@return any result
---@return ...
function xpcall(f, msgh, arg1, ...) end

---#DES 'unpack'
---@generic T
---@param list T[]
---@param i?   integer
---@param j?   integer
---@return T   ...
---@nodiscard
function unpack(list, i, j) end
