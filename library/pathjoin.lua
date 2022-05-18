---@meta

---
---The path utilities that used to be part of luvi.
---
---@class luvi.pathjoin
---@field isWindows boolean # Whether the current environment uses Windows paths or not.
local pathjoin = {}

---
---@param path string
---@return string prefix
---@nodiscard
function pathjoin.getPrefix(path) end

---
---@param path string
---@return string[] paths
---@nodiscard
function pathjoin.splitPath(path) end

---
---@param prefix? string
---@param parts string[]
---@param i? integer
---@param j? integer
---@return string path
---@nodiscard
function pathjoin.joinParts(prefix, parts, i, j) end

---
---@param ... string
---@return string path
---@nodiscard
function pathjoin.pathJoin(...) end

return pathjoin
