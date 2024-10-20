local insert, concat = table.insert, table.concat

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
  return str:gsub('\n([^\n]*)', '\n%-%-%-%1')
end
string.multiline = multiline

local function singleline(str)
  return str:gsub('\n', '')
end
string.singleline = singleline

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
  w('function %s%s%s(%s) end\n\n', func.class.name, sep, func.name, concat(param_names, ', '))
end

return {
  writeFunction = writeFunction,
}
