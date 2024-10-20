local fs = require('fs')
local utils = require('useful')
local pathJoin = require('pathjoin')

local insert, concat = table.insert, table.concat
local join = pathJoin.pathJoin

---@param class Class
---@return boolean
local function checkParent(class, parent)
  for _, pa in ipairs(class.parents) do
    if parent == pa then
      return true
    end
  end
  return false
end

local EVENTS_DIR = './events'
local FILE_PAT = '^(%w+)%.events%.lua$'
local class_to_events = {}

local function getDefinedEvents()
  for path, typ in fs.scandirSync(EVENTS_DIR) do
    if typ == 'file' then
      local name = path:match(FILE_PAT)
      if name then
        class_to_events[name] = dofile(join(EVENTS_DIR, path))
      end
    end
  end
end
-- load the event files in the events directory
-- those provide a base for events
getDefinedEvents()

---@type {[string]: fun(docs: Class[], contents: string, filePath: string): any}
local scanners = {}

function scanners.scanEmitter(docs, content, class)
  -- detect emits
  local fired_events = {}
  for line, contents in content:gmatch('(%w:emit%((.-)%))') do
    -- p(line)
    insert(fired_events, line)
  end
  return fired_events
end

---@type {[string]: fun(w: fun(str: string, ...: any), class: Class, ...: any): (any), scanDir: fun(string): Class[]}
local writers = {}

local templates = {
  listeners           = '---@field %s fun(self: self, name: "%s", fn:%s fun(%s):(any)): function # %s\n',
  listeners_default   = '---@field %s fun(self: self, name: %s, fn:%s function): function # %s\n',
  emitter             = '---@field emit fun(self: self, name: %s, ...: any) # %s\n'
}

--[[
---
---%s
---
---@param name '"%s"' # %s
---@param callback fun(%s):any # The callback to run when the event is fired.
---@return function # The original callback.
function %s:%s(name, callback) end
]]

local function writeListenMethods(w, class, event)
  local cb_signature = {}
  if #event > 2 then
    for i = 3, #event do
      insert(cb_signature, ('%s: %s'):format(
        event[i][1],
        event[i][3]
      ))
    end
  end
  local name = event[1]
  local cb_args = concat(cb_signature, ', ')
  local desc = event[2]:trim():singleline()
  w(templates.listeners, 'on', name, ' async', cb_args, desc)
  w(templates.listeners, 'once', name, ' async', cb_args, desc)
  w(templates.listeners, 'onSync', name, '', cb_args, desc)
  w(templates.listeners, 'onceSync', name, '', cb_args, desc)
end

---@return any
function writers.writeEventFields(w, class)
  if not checkParent(class, 'Emitter') then
    return nil
  end
  if not class_to_events[class.name] then
    return nil
  end
  for _, event in ipairs(class_to_events[class.name]) do
    writeListenMethods(w, class, event)
  end
  -- redefine the emitter methods
  -- because the language server override them
  w(templates.listeners_default, 'on', 'string', ' async', 'Subscribes a callback to be called every time the named event is emitted. Callbacks registered with this method will automatically be wrapped as a new coroutine when they are called. Returns the original callback for convenience.')
  w(templates.listeners_default, 'once', 'string', ' async', 'Subscribes a callback to be called only the first time this event is emitted. Callbacks registered with this method will automatically be wrapped as a new coroutine when they are called. Returns the original callback for convenience.')
  w(templates.listeners_default, 'onSync', 'string', '', 'Subscribes a callback to be called every time the named event is emitted. Callbacks registered with this method are not automatically wrapped as a coroutine. Returns the original callback for convenience.')
  w(templates.listeners_default, 'onceSync', 'string', '', 'Subscribes a callback to be called only the first time this event is emitted. Callbacks registered with this method are not automatically wrapped as a coroutine. Returns the original callback for convenience.')
  w(templates.emitter, 'Client.events', 'Emits the named event and a variable number of arguments to pass to the event callbacks.<br><br>*This method only operates on data in memory.*')
end

function writers.writeEventAlias(w, class)
  if not checkParent(class, 'Emitter') then
    return nil
  end
  if not class_to_events[class.name] then
    return nil
  end
  local aliases = {}
  for _, event in ipairs(class_to_events[class.name]) do
    insert(aliases, ('---|"%s" # %s'):format(event[1], event[2]:trim():singleline()))
  end
  w('---@alias %s.events\n%s\n', class.name, concat(aliases, '\n'))
end

return {
  writers = writers,
  scanners = scanners,
}
