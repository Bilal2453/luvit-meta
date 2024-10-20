local template = [[
---@meta discordia

---@alias discordia.package {files: string[], license: string, version: string, dependencies: string[], author: 'Sinister Rectus', homepage: 'https://github.com/SinisterRectus/Discordia', name: 'SinisterRectus/discordia', tags: string[]}

---@type {enums: table, class: class, date: Date, extensions: table, package: discordia.package, Client: Client, Clock: Clock, Color: Color, Date: Date, Deque: Deque, Emitter: Emitter, Logger: Logger, Mutex: Mutex, Permissions: Permissions, Stopwatch: Stopwatch, Time: Time, storage: table}
local discordia = {}

return discordia
]]

return function(open)
  local w, save = open()
  w(template)
  save('discordia.lua')
end
