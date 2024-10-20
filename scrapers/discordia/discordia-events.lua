local fs = require('fs')
local pathJoin = require('pathjoin')

local insert = table.insert
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
local FILE_PAT = '^%w+%.events%.lua$'
local class_to_events = {}

local function getDefinedEvents()
  for path, typ in fs.scandirSync(EVENTS_DIR) do
    if typ == 'file' and FILE_PAT:match(path) then
      insert(class_to_events, dofile(join(EVENTS_DIR, path)))
    end
  end
end
-- load the event files in the events directory
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

---@type {[string]: fun(w: fun(str: string, ...: any), class: Class), scanDir: fun(string): Class[]}
local writers = {}

---@return any any
function writers.writeEvents(w, class)
  if not checkParent(class, 'Emitter') then
    return nil
  end
  if not class_to_events[class.name] then
    return nil
  end

end

return {
  writers = writers,
  scanners = scanners,
}
