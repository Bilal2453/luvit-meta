---@meta _

---
---**Does not exists in Luvi**!
---See `args` instead.
---
---@type nil
arg = nil

---
---The raw `argc` and `argv` from C side exposed as a **zero** indexed lua table of strings.
---
---```lua
---p('Your args were ', args)
---```
---
---@type string[]
args = {}

---
---A global that holds information about the current loaded module
---
--- - path: the path to the module.
--- - dir: the path to directory containing the module.
--- - exports: an initially empty table that can be used to export values out of the module. Module returns override this,
---
---@type {exports: any[], path: string, dir: string}
module = {}
