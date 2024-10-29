local template = [[
---@meta discordia

---@alias discordia.package {files: string[], license: string, version: string, dependencies: string[], author: 'Sinister Rectus', homepage: 'https://github.com/SinisterRectus/Discordia', name: 'SinisterRectus/discordia', tags: string[]}

---
---Discordia is an asynchronous Discord API library written in Lua for the Luvit runtime. Here, you can find tutorials and API references for the library. You can find more general information about Discordia in the repository's readme and more general information about Luvit at https://luvit.io/.
---
---@class discordia: table
---Used to create custom enumerations or access a variety of pre-defined enumerations.
---
---See the [Enumerations](https://github.com/SinisterRectus/Discordia/wiki/Enumerations) page for more information.
---@field enums table
---Used to create custom classes and provides tools for inspecting classes and class instances.
---
---See the [Classes](https://github.com/SinisterRectus/Discordia/wiki/Classes) page for more information.
---@field class discordia.class
---Extensions to the Lua standard library. Functions can be used directly or can be loaded into the Lua global tables. See [Extensions](https://github.com/SinisterRectus/Discordia/wiki/Extensions) for more information.
---@field extensions table
---@field package discordia.package
---@field Client Client
---@field Clock Clock
---@field Color Color
---@field Date Date
---@field Deque Deque
---@field Emitter Emitter
---@field Logger Logger
---@field Mutex Mutex
---@field Permissions Permissions
---@field Stopwatch Stopwatch
---@field Time Time
---An empty table that can be used to store user data. This may be used an alternative to storing values on class instances or in global variables, both of which are not recommended.
---@field storage table
local discordia = {}

return discordia
]]

return function(open)
  local w, save = open()
  w(template)
  save('discordia.lua')
end
