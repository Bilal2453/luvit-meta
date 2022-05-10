---@meta

---@class luvi.env
---@field os 'Windows'|'Linux'|'OSX'|'BSD'|'POSIX'|'Other'
---@field arch 'x86'|'x64'|'arm'|'arm64'|'ppc'|'mips'|'other'
local env = {}

---
---@param show_hidden? boolean # whether or not to show variables beginning with `=`, hidden variables on Windows that is. Default `false`. Only respected on Windows.
---@return string[] keys
---@nodiscard
function env.keys(show_hidden) end

---
---@param name string # the environment variable name to get the value of
---@return string|nil value
---@nodiscard
function env.get(name) end

---
---@param name string # the environment variable name to set
---@param value string # the new value of the specified variable
function env.set(name, value) end

---
---@param name string # the name of the environment variable to be unset
function env.unset(name) end

return env
