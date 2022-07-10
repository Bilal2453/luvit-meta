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

---#DES 'package'
---@class packagelib
---#DES 'package.cpath'
---@field cpath     string
---#DES 'package.loaded'
---@field loaded    table
---#DES 'package.path'
---@field path      string
---#DES 'package.preload'
---@field preload   table<string, function>
package = {}

---#DES 'package.config'
package.config = [[
/
;
?
!
-]]

---@version <5.1,JIT
---
---A table used by `require` to control how to load modules.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.loaders"])
---@type function[]
package.loaders = {}

---#DES 'package.loadlib'
---@param libname string
---@param funcname string
---@return any
function package.loadlib(libname, funcname) end

---#DES 'package.searchers'
---@version >5.2,JIT
---@type {[number]: fun(modname: string): function?, string?}
package.searchers = {}

---#DES 'package.searchpath'
---@version >5.2,JIT
---@param name string
---@param path string
---@param sep? string
---@param rep? string
---@return string? filename
---@return string? errmsg
---@nodiscard
function package.searchpath(name, path, sep, rep) end

---#DES 'package.seeall'
---@version <5.1,JIT
---@param module table
function package.seeall(module) end

return package
