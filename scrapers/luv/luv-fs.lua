--[[
  Do note this script is a bit hacky.
  I just wanted something that "works", and since it is a one time thing...

  Hacky as in, parsing is done in both `re` module and Lua patterns.
  Parsing is done in one single big function inside a one big gmatch loop.
  Some parts of the code (grammars specifically) are repeated.

  With that being said, proceed at your own risk
]]

local fs = require('fs')
local read = fs.readFileSync
local write = fs.writeFileSync

local re = require('re')
local concat = table.concat

local source = read('./docs.md') -- luv's docs that is
source = source:match('## File system operations(.-)## Thread pool work scheduling')

local function parseSource()
  local methods = {}
  for content in source:gmatch('### `[^`]-`[^#]+') do
    methods[#methods+1] = content
  end

  for i, content in ipairs(methods) do
    local method = {
      params = {},
      fields = {},
    }
    method.name = content:match('###%s*`([^%(]+).-`')
    assert(method.name, 'no method name found: ' .. content)

    local params = content:match('%*%*Parameters:%*%*%s*(.-)\n\n')
    for indent, param in params:gmatch('( *)%-%s+([^\n]+)') do
      if #indent == 0 then
        local name = param:match('^`(.-)`')
        if name == 'callback' then
          method.callback = {}
        else
          method.params[#method.params+1] = {
            name = name,
            types = {re.match(param, [['`'[^`]+'`: ' ('`' {[^`]+} '`' ' '* 'or'? ' '*)+]])}
          }
        end
      elseif #indent == 2 and method.callback then
        method.callback[#method.callback+1] = {
          name = param:match('^`(.-)`'),
          types = {re.match(param, [['`'[^`]+'`: ' ('`' {[^`]+} '`' ' '* 'or'? ' '*)+]])}
        }
      else
        method.fields[#method.fields+1] = param
      end
    end

    method.desc = content:match('%*%*Parameters:%*%*%s*.-\n\n(.-)%s*%*%*Returns')

    local sync_returns = content:match('%*%*Returns %(sync version%):%*%*%s*(.-)\n')
    if sync_returns then
      method.sync_returns = {
        re.match(sync_returns, [[('`' {[^`]+} '`' ' '* 'or'? ' '*)+]])
      }
    end

    local async_returns = content:match('%*%*Returns %(async version%):%*%*%s*(.-)\n')
    if async_returns then
      method.async_returns = {
        re.match(async_returns, [[('`' {[^`]+} '`' ' '* 'or'? ' '*)+]])
      }
    end

    if not sync_returns and not async_returns then
      local returns = content:match('%*%*Returns:%*%*%s*(.-)\n')
      -- if returns then
        method.returns = {
          re.match(returns, [[('`' {[^`]+} '`' ' '* 'or'? ' '*)+]])
        }
      -- end
    end

    local notes = re.match(content, [[
      main <- {| (note_line+ / .)+ |}
      note_line <- {'**Note' ':'? '**' ':'? [^*]+}
    ]])
    if type(notes) == 'table' then
      method.notes = notes
    end

    methods[i] = method
  end


  return methods
end

-- do
--   p(parseSource())
--   return
-- end

-- only handles fail
local fail_pair = {'nil', 'string?', 'string?'}
local function handlePseudoTypes(types)
  local found, rtn = false, {}
  for i, v in ipairs(types) do
    if v == 'fail' then
      table.remove(types, i)
      found = true
      break
    end
  end
  if not found then return types end
  for i, v in ipairs(fail_pair) do
    if types[i] then
      rtn[i] = types[i] .. '|' .. v
    else
      rtn[i] = v
    end
  end
  return rtn
end

local function getArgs(args, sep)
  if not args or #args == 0 then return '' end
  local result = {}
  for _, v in ipairs(args) do
    result[#result+1] = v.name
  end
  return concat(result, sep or ', ')
end

local methods = parseSource()
local file = {}

for _, method in ipairs(methods) do
  local content = {'---'}

  -- fields, these are manually removed later on
  -- they are just sorta of a reminder that they exists when I am manually reviewing aliases
  for _, alias in ipairs(method.fields) do
    content[#content+1] = '---' .. alias
  end

  -- description
  content[#content+1] = '---' .. method.desc:gsub('^%s+', ''):gsub('%s+$', ''):gsub('\n', '\n---')

  -- separator
  content[#content+1] = '---'

  -- notes
  for _, note in ipairs(method.notes) do
    content[#content+1] = '---' .. note:gsub('^%s+', ''):gsub('%s+$', ''):gsub('\n', '\n---') .. '\n---'
    print(note)
  end

  -- overload for the optional callback
  local overload = '---@overload fun('
  for _, v in ipairs(method.params) do
    overload = overload .. v.name .. ': ' .. concat(v.types, '|') .. ', '
  end
  overload = overload:sub(1, -3)
  content[#content+1] = overload .. ')' .. (method.sync_returns and ': ' .. concat(handlePseudoTypes(method.sync_returns), ', '):gsub(' userdata', '') or '')

  -- parameters
  for _, param in ipairs(method.params) do
    local types = handlePseudoTypes(param.types)
    types = concat(types, '|')
    content[#content+1] = '---@param ' .. param.name .. ' ' .. types
  end

  -- callback parameter
  if method.callback then
    local cb = '---@param callback fun('
    for _, v in ipairs(method.callback) do
      local types = concat(handlePseudoTypes(v.types), '|')
      cb = cb .. v.name .. ': ' .. types .. ', '
    end
    cb = cb:sub(1, -3) .. ')'
    content[#content+1] = cb
  end

  -- returns
  if method.async_returns or method.returns then
    local types = concat(handlePseudoTypes(method.async_returns or method.returns), ', ')
    types = types:gsub(' userdata', '')
    content[#content+1] = '---@return ' .. types
  end

  -- function definition
  -- (do note, we assume the callback always exists and is always last param, which is not always correct)
  content[#content+1] = 'function ' .. method.name .. '(' .. getArgs(method.params) .. ', callback) end'

  file[#file+1] = concat(content, '\n')
end

write('output-luv-fs.lua', concat(file, '\n\n'))
