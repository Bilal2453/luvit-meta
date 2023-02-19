---@meta

---Utilities for loading relative resources
local resource = {}

---The full path of the file that called this function.
---@type string
resource.path = nil

---The full path of the parent directory of the file that called this function.
---@type string
resource.dir = nil

---Returns the absolute path given relative `path`.
---@param path string
---@return string absPath
function resource.resolve(path) end

---Returns the content of the file at `path` as well as its absolute path.
---@param path string
---@return string data, string absPath
function resource.load(path) end

return resource