---@meta

---
---Loads the given module, returns any value returned by the given module (`{}` "empty table" when `nil`).
---`modname` can either be a name of the module that is inside a `deps` folder, or inside a `libs` folder. Or alternatively a path to the module.
---
---**NOTE**: If your module IS NOT inside of `deps` or `libs` directories, and `modname` is not a path to a module,
---Luvit require will fallback to Lua's require, causing the required module to be outside of Luvit's environment.
---That is, the `require` you use inside the required `modname` is Lua's, which does not understand `deps`/`libs` directories.
---
---[View Lua 5.1 documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-require"])
---[View Luvit documents](https://luvit.io/api/require.html)
---
---@param modname string
---@return unknown
function require(modname) end

---
---
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package"])
---
---@class packagelib
---
---The path used by `require` to search for a C loader.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.cpath"])
---
---@field cpath     string
---
---A table used by `require` to control which modules are already loaded.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.loaded"])
---
---@field loaded    table
---
---The path used by `require` to search for a Lua loader.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.path"])
---
---@field path      string
---
---A table to store loaders for specific modules.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.preload"])
---
---@field preload   table<string, function>
package = {}

---
---A string describing some compile-time configurations for packages.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.config"])
---
package.config = [[
/
;
?
!
-
]]

---@version <5.1,JIT
---
---A table used by `require` to control how to load modules.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.loaders"])
---@type function[]
package.loaders = {}

---
---Dynamically links the host program with the C library `libname`.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.loadlib"])
---
---@param libname string
---@param funcname string
---@return any
function package.loadlib(libname, funcname) end

---
---A table used by `require` to control how to load modules.
---
---[View documents](command:extension.lua.doc?["en-us/52/manual.html/pdf-package.searchers"])
---
---@version >5.2,JIT
---@type {[number]: fun(modname: string): function?, string?}
package.searchers = {}

---
---Searches for the given `name` in the given `path`.
---
---[View documents](command:extension.lua.doc?["en-us/52/manual.html/pdf-package.searchpath"])
---
---@version >5.2,JIT
---@param name string
---@param path string
---@param sep? string
---@param rep? string
---@return string? filename
---@return string? errmsg
---@nodiscard
function package.searchpath(name, path, sep, rep) end

---
---Sets a metatable for `module` with its `__index` field referring to the global environment, so that this module inherits values from the global environment. To be used as an option to function `module` .
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.seeall"])
---
---@version <5.1,JIT
---@param module table
function package.seeall(module) end

return package
