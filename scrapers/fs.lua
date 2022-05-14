local fs = require('fs')
local read = fs.readFileSync
local write = fs.writeFileSync
local exists = fs.existsSync

-- fs.lua deps
local path = '../test/fs-t.lua'
local markdown_path = './fs.markdown'
local output = {}
local list = {}

local function add(t, s)
  if t then
    output[#output+1] = '---' .. tostring(t)
      :gsub('\n *', '\n---')
  else
    output[#output+1] = '---'
  end
  if s then output[#output+1] = '---' end
end

local function trun(s)
  if not s then return end
  return (s):gsub('^%s+', ''):gsub('%s+$', '')
end

assert(exists(markdown_path), markdown_path .. ' does not exists')

local doc = assert(read(markdown_path)) .. '\n\n##'
local source = assert(read(path))
local uv_def = assert(read('../library/uv.lua'))

for method in source:gmatch('function (fs%..-)\n') do
  list[#list+1] = method
end

local function getUvReturnsAsync(name)
  local ret = uv_def:match('%-%-%-@param callback[^\n]+\n%-%-%-@return ([^\n]+)\nfunction uv%.' .. name)
  assert(ret)
  return ret
end

local function getUvReturnsSync(name)
  local ret = uv_def:match('function uv%.' .. name .. '.-%-%-%-@return ([^\n]+)\nfunction uv%.' .. name .. '.-$')
  assert(ret)
  return ret
end

local function getUvCallback(name)
  local ret = uv_def:match('%-%-%-@param callback fun%(([^%)]+)%)[^\n]*\n%-%-%-@return[^\n]+\nfunction uv%.' .. name)
  p(ret)
  assert(ret)
  return ret
end

local param_types = {
  ['[a-zA-Z]*fd'] = 'integer',
  ['[a-zA-Z]*path'] = 'string',
  ['[a-zA-Z]*offset'] = 'integer',
  size = 'integer',
  length = 'integer',
  mode = 'integer',
}
---@param match string
param_types.callback = function(m, _, match)
  p(1, match, m)
  local args
  if not match then
    return 'unknown'
  else
    args = getUvCallback(match)
  end
  args = args:gsub(',? *callback', '')
  return 'fun(' .. args .. ') | thread | nil'
end

local ret_types = {
  ['^true$'] = 'boolean',
  ['^false$'] = 'boolean',
  ['^not err, err'] = 'boolean success, string? err',
  ['^uv%.([%w_]+)'] = getUvReturnsSync,
  ['^adapt%(.-, uv%.([%w_]+)'] = getUvReturnsAsync,
}

for _, method in ipairs(list) do
  local m = method:match('[^%(]+') -- the name of the method without its arguments
  local method_docs = doc:match('## ' .. m:gsub('%.', '%%.') .. '.-\n') or ''

  -- handle description
  local desc do
    local _, finish = doc:find('## ' .. m, nil, true) -- position at which method name ends
    local _, arg_finish = doc:find('%s*%(.-%) *\n', finish) -- position at which method arguments end (in the markdown docs)
    -- does the method not exists in the docs?
    if not finish then
      -- print(m)
      goto skip_desc
    end
    -- get the description by removing the first `## method(args)\n` and matching until first `##`
    desc = doc:sub(finish + (arg_finish - finish) + 1, #doc):match('^(.-)%s*##')
  end
  ::skip_desc::

  -- TODO: do we want to handle overloads for callbacks?

  -- handle returns
  -- this tries to predict the returns using variable/function name from the source code
  -- the uv return types are taken from ./library/uv.lua
  local returns, match = {}, nil do
    local code_defintion = source:match('function ' .. m .. '.-\nend')
    assert(code_defintion, 'cannot find definition for method ' .. m)

    for ret in code_defintion:gmatch('return (.-)\n') do
      for ret_match, search in pairs(ret_types) do
        match = ret:match(ret_match)
        if match then
          typ = type(search) == 'function' and search(match) or search
          if typ then
            returns[#returns+1] = '@return ' .. typ
            break
          end
        end
      end
    end
    if #returns < 1 then returns[#returns+1] = '@return unknown' end
  end

  -- handle arguments
  local args = {}
  local args_string_code = method:match('%((.-)%)')
  local args_string_docs = method_docs:match('%((.-)%)') or ''
  for arg in args_string_code:gmatch('[^,]+') do
    arg = trun(arg)
    local is_optional = args_string_docs:match('(%[), *' .. arg) and '? ' or ' '
    local typ = 'unknown'
    for type_match, value in pairs(param_types) do
      if arg:match(type_match) then
        if type(value) == 'string' then
          typ = value:gsub('$(%w+)', {
            args = args_string_code,
            match = match,
            method = m,
          })
        else
          typ = value(m, args_string_code, match)
        end
      end
    end
    args[#args+1] = '@param ' .. arg .. is_optional .. typ
  end


  -- write the results
  add() -- empty line at the beginning
  add(trun(desc)) -- the description
  add(table.concat(args, '\n')) -- the arguments
  add(table.concat(returns, '\n')) -- the returns
  output[#output+1] = 'function ' .. method:gsub('[%[%]]', '') .. ' end\n' -- method definition
end

for i = 1, #output do
  output[i] = output[i]:gsub('%-%-%- +', '---'):gsub('%-%-%-(.-) +\n', '---%1\n')
end

write('./fs-output.lua', table.concat(output, '\n'))
