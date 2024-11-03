local fs = require('fs')
local pathJoin = require('pathjoin')

local insert, concat = table.insert, table.concat
local scandir = fs.scandirSync
local join = pathJoin.pathJoin

local methodTags = {
  ['http']  = 'This method always makes an HTTP request.',
  ['http?'] = 'This method may make an HTTP request.',
  ['ws']    = 'This method always makes a WebSocket request.',
  ['mem']   = 'This method only operates on data in memory.',
}

local function prepareType(typ)
  return typ:gsub('/', '|')
            :gsub('*', 'any')
						:gsub('nothing', '')
end
string.prepareType = prepareType

local function prepareField(str)
  return str:gsub('^private$', 'public private')
end
string.prepareField = prepareField

local function trim(str)
  return str:gsub('^%s*', ''):gsub('%s*$', '')
end
string.trim = trim

local function multiline(str)
  return str:gsub('\r?\n([^\n]*)', '\n%-%-%-%1')
end
string.multiline = multiline

local function singleline(str)
  return str:gsub('\r?\n', '')
end
string.singleline = singleline

local function newlineToBr(str)
  return str:gsub('\r?\n', '<br>')
end
string.newlineToBr = newlineToBr

--- Formats string according to the varargs
--- and inserts it into table `tbl`.
---@param str string
---@param tbl table
---@return string
local function insertfmt(str, tbl, ...)
  if select('#', ...) > 0 then
    str = str:format(...)
  end
  insert(tbl, str)
  return str
end
string.infmt = insertfmt

local function encodeString(value)
  local t = type(value)
  if t == 'string' then
    return '"' .. value .. '"'
  end
  return value
end
string.encodeString = encodeString

---@param func Static|Method
local function writeFunction(w, func, sep)
  -- write description and tags
  w('---\n---%s\n', func.desc)
  local tag = next(func.tags) -- technically only one tag is used mutually
  if methodTags[tag] then
    w('---\n---*%s*\n', methodTags[tag])
  end
  w('---\n')

  -- write params
  for _, param in ipairs(func.parameters) do
    w('---@param %s%s %s\n', param[1], param[3] and '?' or '', param[2]:prepareType())
  end
  -- write returns
  for _, rtn in ipairs(func.returns) do
		local t = rtn:prepareType()
		if t and t ~= '' then
			w('---@return %s\n', t)
		end
  end

  -- write signature
  local param_names = {}
  for _, param in ipairs(func.parameters) do
    insert(param_names, param[1])
  end
  w('function %s%s%s(%s) end\n', func.class.name, sep, func.name, concat(param_names, ', '))

  -- write an overload in case of possible error returns
  if not WITHOUT_ERROR_HANDLING and func.tags.http or func.tags["http?"] then
    w('---@return nil, string error_msg\n')
    w('function %s%s%s(%s) end\n', func.class.name, sep, func.name, concat(param_names, ', '))
  end

  w('\n')
end

local function initDir(dir_path, suffix)
  local pattern = '^([^%.]+)%.' .. suffix .. '%.lua$'
  local rtn = {}
  for path, typ in scandir(dir_path) do
    if typ == 'file' then
      local name = path:match(pattern)
      if name then
        local chunk = assert(loadfile(join(dir_path, path), 'bt', getfenv()))
        rtn[name] = chunk()
      end
    end
  end
  return rtn
end

return {
  writeFunction = writeFunction,
  encodeString = encodeString,
  prepareField = prepareField,
  prepareType = prepareType,
  newlineToBr = newlineToBr,
  singleline = singleline,
  multiline = multiline,
  insertfmt = insertfmt,
  initDir = initDir,
  trim = trim,
}
