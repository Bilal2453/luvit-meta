---@meta table

---
---Moves elements from table `a1` to table `a2`.
---```lua
---a2[t],··· =
---a1[f],···,a1[e]
---return a2
---```
---
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-table.move"])
---
---@param a1  table
---@param f   integer
---@param e   integer
---@param t   integer
---@param a2? table
---@return table a2
function table.move(a1, f, e, t, a2) end

---
---Returns a new table with all arguments stored into keys `1`, `2`, etc. and with a field `"n"` with the total number of arguments.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-table.pack"])
---
---@return table
---@nodiscard
function table.pack(...) end

---
---Returns the elements from the given list. This function is equivalent to
---```lua
---    return list[i], list[i+1], ···, list[j]
---```
---By default, `i` is `1` and `j` is `#list`.
---
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-table.unpack"])
---
---@generic T
---@param list T[]
---@param i?   integer
---@param j?   integer
---@return T   ...
---@nodiscard
function table.unpack(list, i, j) end

---
---Executes the given f over all elements of table. For each element, f is called with the index and respective value as arguments. If f returns a non-nil value, then the loop is broken, and this value is returned as the final value of foreach.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-table.foreach"])
---
---@generic T
---@param list any
---@param callback fun(key: string, value: any):T|nil
---@return T|nil
function table.foreach(list, callback) end

---
---Executes the given f over the numerical indices of table. For each index, f is called with the index and respective value as arguments. Indices are visited in sequential order, from 1 to n, where n is the size of the table. If f returns a non-nil value, then the loop is broken and this value is returned as the result of foreachi.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-table.foreachi"])
---
---@generic T
---@param list any
---@param callback fun(key: string, value: any):T|nil
---@return T|nil
function table.foreachi(list, callback) end

---
---Returns the number of elements in the table. This function is equivalent to `#list`.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-table.getn"])
---
---@generic T
---@param list T[]
---@return integer
---@nodiscard
function table.getn(list) end

return table
