---@meta

---A readline interface for terminals in pure lua.
---
---Heavily inspired by ljlinenoise : <http://fperrad.github.io/ljlinenoise/>
local readline = {}

---
---@class luvit.readline.History
---@field [integer] string
---@field maxLength integer -- Defaults to `100`.
local History = {}
readline.History = History

---
---@param line string
---@return true
function History:add(line) end

---
---@param length number
---@return true
function History:setMaxLength(length) end

---
---@return true
function History:clean() end

---
---@nodiscard
---@return string
function History:dump() end

---
---@param data string
---@return true
function History:load(data) end

---
---@param line string
function History:updateLastLine(line) end

---
---@return luvit.readline.History
function History.new() end


---
---@class luvit.readline.Editor
local Editor = {}
readline.Editor = Editor

---
function Editor:refreshLine() end

---
---@param line string
function Editor:insertAbove(line) end

---
---@param character string
function Editor:insert(character) end

---
function Editor:moveLeft() end

---
function Editor:moveRight() end

---@param delta integer
function Editor:getHistory(delta) end

---
function Editor:backspace() end

---
function Editor:delete() end

---
function Editor:swap() end

---
function Editor:deleteLine() end

---
function Editor:deleteEnd() end

---
function Editor:moveHome() end

---
function Editor:moveEnd() end

---
function Editor:deleteWord() end

---
function Editor:jumpLeft() end

---
function Editor:jumpRight() end

---
function Editor:clearScreen() end

---
function Editor:beep() end

---
function Editor:complete() end

---
---@param key string
---@return boolean? success, string? err
function Editor:onKey(key) end

---
---@param prompt string
---@param callback fun(err?: string, success?: boolean, reason?: string): ...any
function Editor:readLine(prompt, callback) end

---@alias luvit.readline.Editor-Options {}
---@alias luvit.readline.Editor-Options.history luvit.readline.History?
---@alias luvit.readline.Editor-Options.stdin luvit.stream.Readable?
---@alias luvit.readline.Editor-Options.stdout luvit.stream.Writable?
---@alias luvit.readline.Editor-Options.wordPattern string?
---@alias luvit.readline.Editor-Options.completionCallback fun(line: string): (string|string[]|nil)?
---@alias luvit.readline.Editor-Options.cover string?

---
---@nodiscard
---@param options? luvit.readline.Editor-Options
---@return luvit.readline.Editor
function Editor.new(options) end

---
---@param prompt string
---@param options luvit.readline.Editor-Options
---@param callback fun(err?: string, success?: boolean, reason?: string)
---@return luvit.readline.Editor
---@overload fun(prompt: string, callback: fun(err?: string, success?: boolean, reason?: string)): luvit.readline.Editor
---@overload fun(prompt: string, options: luvit.readline.Editor-Options): luvit.readline.Editor
---@overload fun(prompt: string): luvit.readline.Editor
function readline.readLine(prompt, options, callback) end

return readline
