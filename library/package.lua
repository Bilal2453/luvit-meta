---@meta package

---
---Loads the given module, returns any value returned by the given module (`{}` "empty table" when `nil`).
---`modname` can either be a name of the module that is inside a `deps` folder, or inside a `libs` folder. Or alternatively a path to the module.
---
---**NOTE**: If your module IS NOT inside of `deps` or `libs` directories, and `modname` is not a path to a module,
---Luvit require will fallback to Lua's require, causing the required module to be outside of Luvit's environment.
---That is, the `require` you use inside the required `modname` is Lua's, which does not understand `deps`/`libs` directories.
---
---[View Lua 5.1 documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-require"])
---
---[View Luvit documents](https://luvit.io/api/require.html)
---
---@param modname string
---@return unknown
function require(modname) end

---
---A table used by `require` to control how to load modules.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.loaders"])
---
---@type function[]
package.loaders = {}

---
---A table used by `require` to control how to load modules.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.searchers"])
---
---@type (fun(modname: string): function?, string?)[]
package.searchers = {}

---
---Sets a metatable for `module` with its `__index` field referring to the global environment, so that this module inherits values from the global environment. To be used as an option to function `module` .
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-package.seeall"])
---
---@param module table
function package.seeall(module) end

return package
