---@meta

---@class luvit.httpHeader
local http_header = {
  ---@type httpHeader_metatable
  headerMeta = {}
}

---@alias httpHeader_metatable {__index: function, __newindex: function}
-- TODO: do we want to consider httpHeader_metatable returns?

---
---Creates a new headers table or sets the metatable of `tbl` to headerMeta.
---
---@param tbl? table
---@return table metatable
---@nodiscard
function http_header.newHeaders(tbl) end

---
---Converts a table of headers into a headers table.
---The input tables can have keys in any of the following formats:
---
---```lua
---{
---  ["name"] = value,
---  ["name"] = {multiple, values},
---  {"name", value},
---}
---```
---
---@param tbl? table
---@return table metatable
function http_header.toHeaders(tbl) end

---Converts and combines any table(s) of headers to a single headers table.
---The input tables can have keys in any of the following formats:
---
---```lua
---{
---  ["name"] = value,
---  ["name"] = {multiple, values},
---  {"name", value},
---}
---```
---
function http_header.combineHeaders(...) end

---
---Extracts headers from a table that has array-like keys of {headerName, value} tables.
---Ignores any non-array-like keys of the table.
---
---@param tbl? table
---@return table metatable
---@nodiscard
function http_header.getHeaders(tbl) end

return http_header
