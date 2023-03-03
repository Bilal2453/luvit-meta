---@meta

---
---It is possible to stream data through a child's stdin, stdout, and stderr 
---in a fully non-blocking way.
---
local childprocess = {}

---
---@class luvit.childprocess.Spawn-Options
---@field detached? boolean
---@field verbatim? boolean
---@field env? {[string]: string}
---@field stdio? {[1]: luvit.net.Socket?, [2]: luvit.net.Socket?, [3]: luvit.net.Socket?}
---@field cwd? string
---@field uid? integer
---@field gid? integer

---
---@class luvit.childprocess.Process: luvit.core.Emitter
---@field protected initialize fun(stdin: luvit.net.Socket?, stdout: luvit.net.Socket?, stderr: luvit.net.Socket?,)
---@field stdin luvit.net.Socket?
---@field stdout luvit.net.Socket?
---@field stderr luvit.net.Socket?
---@field handle uv_process_t?
---@field pid integer|string
---@field exitCode integer?
---@field signal string?
---@field on fun(self: luvit.childprocess.Process, name: 'error', err: luvit.core.Error|string|any)
---@field once fun(self: luvit.childprocess.Process, name: 'error', err: luvit.core.Error|string|any)
---@field on fun(self: luvit.childprocess.Process, name: 'exit', exitCode: integer, signal: integer?)
---@field once fun(self: luvit.childprocess.Process, name: 'exit', exitCode: integer, signal: integer?)
---@field on fun(self: luvit.childprocess.Process, name: 'close', exitCode: integer, signal: integer)
---@field once fun(self: luvit.childprocess.Process, name: 'close', exitCode: integer, signal: integer)
local Process = {}

---
---Creates a new instance and initializes it.
---
---@param stdin luvit.core.Emitter?
---@param stdout luvit.core.Emitter?
---@param stderr luvit.core.Emitter?
---@return luvit.childprocess.Process
function Process:new(stdin, stdout, stderr) end

---
---Sets the handle as return by `uv.spawn`.
---
---@see uv.spawn
---@param handle uv_handle_t
function Process:setHandle(handle) end

---
---Sets the process ID as returned by `uv.spawn`.
---
---@param pid integer
function Process:setPid(pid) end

---
---Send a signal to the process handle.
---
---@param signal? string -- default is `"sigterm"`
function Process:kill(signal) end

---
---Close the process handle, emitting `err` on the "error" event.
---
---@param err? luvit.core.Error|string|any
function Process:close(err) end

---
---If `err` is not nil, emit an error event and pass `err` to it.
---
---@param err? luvit.core.Error|string|any
function Process:destroy(err) end

---
---Spawns a command line process.
---
---Since the data coming in is a stream, you may want to pass it through a 
---filter like the luvit `line-emitter` package to get lines instead.
---
---@param command string
---@param args string[]
---@param options luvit.childprocess.Spawn-Options
---@return luvit.childprocess.Process
function childprocess.spawn(command, args, options) end

---
---@class luvit.childprocess.Exec-Options: luvit.childprocess.Spawn-Options
---@field timeout? number # Default is no timeout.
---@field maxBuffer? integer # Default is `4 * 1024`.
---@field signal? string # Default is `'SIGTERM'`
---@field shell? string # Default is `'cmd.exe'` or `'/bin/sh'`.

---@alias luvit.childprocess.ExecErrArg {message?: string, code?: integer, singal?: uv.aliases.signals}
---@alias luvit.childprocess.ExecCallback async fun(err?: luvit.childprocess.ExecErrArg, stdout: string, stderr: string)

---
---Executes the supplied `command` and returns data returned in the `callback`.
---The `callback` can be either a function or a thread for coroutine style 
---code. The `command` can have arguments e.g. 
---`childprocess.exec('ls -a', print)`.
---
---@param command string
---@param options? luvit.childprocess.Exec-Options
---@param callback? luvit.childprocess.ExecCallback
---@return luvit.childprocess.Process
---@overload fun(command: string, callback?: luvit.childprocess.ExecCallback): luvit.childprocess.Process
---@overload fun(command: string, options?: luvit.childprocess.Exec-Options, callback?: thread): string|nil, string|luvit.childprocess.ExecErrArg
---@overload fun(command: string, callback?: thread): string|nil, string|luvit.childprocess.ExecErrArg
function childprocess.exec(command, options, callback) end

---
---Similar to `childprocess.exec` but the arguments for the command/file must 
---be supplied as a string to the second parameter. `callback` is optional 
---as well here.
---
---@param file string
---@param args string[]
---@param options luvit.childprocess.Exec-Options
---@param callback luvit.childprocess.ExecCallback
---@return luvit.childprocess.Process
---@overload fun(file: string): luvit.childprocess.Process
---@overload fun(file: string, callback: function): luvit.childprocess.Process
---@overload fun(file: string, args: string, callback: function): luvit.childprocess.Process
---@overload fun(file: string, callback: thread): string|nil, string|luvit.childprocess.ExecErrArg
---@overload fun(file: string, args: string, callback: thread): string|nil, string|luvit.childprocess.ExecErrArg
---@overload fun(file: string, args: string, options: luvit.childprocess.Exec-Options, callback: thread): string|nil, string|luvit.childprocess.ExecErrArg
function childprocess.execFile(file, args, options, callback) end

return childprocess
