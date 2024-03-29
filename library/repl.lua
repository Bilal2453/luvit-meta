---@meta

---@class luvit.repl.repl
local REPL = {}

---
---@param line string
---@return string response
function REPL.evaluateLine(line) end

---
---@param historyLines? string
---@param onSaveHistoryLines? fun(historyDump: string)
function REPL.start(historyLines, onSaveHistoryLines) end

---
---Implementation of a read-execute-print-loop in Luvit. Used by the Luvit repl 
---which is returned when the Luvit binary is executed without args.
---
---Some of the examples/samples in these docs are generated by running luvit 
---code in this repl.
---
---Additionally require names in the docs follow the ones automatically added 
---into the repl during bootup (e.g. pretty-print is name-spaced as prettyPrint 
---in the repl).
---
---All the luvit deps are injected into the repl at runtime to make it easier 
---to try and experiment with the luvit ecosystem.
---
---@param stdin luvit.stream.Readable
---@param stdout luvit.stream.Writable
---@param greeting string
---@return luvit.repl.repl
local function repl(stdin, stdout, greeting) end

return repl
