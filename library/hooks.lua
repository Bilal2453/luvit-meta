---@meta

---Core global event hooks for luvit
---
---Hooks are intended to be a global event emitter for internal
---Luvit events. For example, process.exit and signals can feed
---through this emitter.
---
---@type luvit.core.Emitter
local hook = {
  ---@type nil|fun(self: luvit.core.Emitter)
  init = nil
}

return hook
