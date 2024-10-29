local utils = require('useful') -- defines string methods

local insert, concat = table.insert, table.concat
local events = utils.initDir('./writers/class/events', 'events')

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

---@type Scanners
local scanners = {}

function scanners.scanEmitters(docs, content, class)
  -- TODO: scan code files for more events we haven't caught
  -- detect emits
  local fired_events = {}
  for line, contents in content:gmatch('(%w:emit%((.-)%))') do
    -- p(line)
    insert(fired_events, line)
  end
  return fired_events
end

---@type Writers
local writers = {}

local templates = {
  listeners           = '---@field %s fun(self: self, name: "%s", fn:%s fun(%s):(any)): function # %s\n',
  listeners_default   = '---@field %s fun(self: self, name: %s, fn:%s function): function # %s\n',
  emitter             = '---@field emit fun(self: self, name: %s, ...: any) # %s\n',
  alias_name          = 'discordia.aliases.%s.events',
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

local function eventSignature(event)
  local signature = {}
  if #event > 2 then
    for i = 3, #event do
      insert(signature, ('%s: %s'):format(
        event[i][1],
        event[i][3]
      ))
    end
  end
  return concat(signature, ', ')
end

local function writeListenMethods(w, class, event)
  local cb_args = eventSignature(event)
  local name = event[1]
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
  if not events[class.name] then
    return nil
  end
  local events_alias = templates.alias_name:format(class.name)
  -- redefine the emitter methods
  -- because the language server override them
  w(templates.emitter, events_alias, 'Emits the named event and a variable number of arguments to pass to the event callbacks.<br><br>*This method only operates on data in memory.*')
  -- makes it possible to see descriptions for events
  -- but the event names will get duplicated as of LuaLS v3.8.1
  w(templates.listeners_default, 'on', events_alias, ' async', 'Subscribes a callback to be called every time the named event is emitted. Callbacks registered with this method will automatically be wrapped as a new coroutine when they are called. Returns the original callback for convenience.')
  w(templates.listeners_default, 'once', events_alias, ' async', 'Subscribes a callback to be called only the first time this event is emitted. Callbacks registered with this method will automatically be wrapped as a new coroutine when they are called. Returns the original callback for convenience.')
  w(templates.listeners_default, 'onSync', events_alias, '', 'Subscribes a callback to be called every time the named event is emitted. Callbacks registered with this method are not automatically wrapped as a coroutine. Returns the original callback for convenience.')
  w(templates.listeners_default, 'onceSync', events_alias, '', 'Subscribes a callback to be called only the first time this event is emitted. Callbacks registered with this method are not automatically wrapped as a coroutine. Returns the original callback for convenience.')
  for _, event in ipairs(events[class.name]) do
    writeListenMethods(w, class, event)
  end
end

function writers.writeEventAlias(w, class)
  if not checkParent(class, 'Emitter') then
    return nil
  end
  if not events[class.name] then
    return nil
  end
  local aliases = {}
  for _, event in ipairs(events[class.name]) do
    insert(aliases, ('---|"%s" # %s'):format(event[1], event[2]:trim():singleline()))
  end
  insert(aliases, '---|string # The event name.')
  local name = templates.alias_name:format(class.name)
  w('---@alias %s\n%s\n\n', name, concat(aliases, '\n'))
end

return {
  writers = writers,
  scanners = scanners,
}
