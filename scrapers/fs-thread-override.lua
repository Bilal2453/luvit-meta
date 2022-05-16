-- Creates a new overload of any function that has a callback accepting a thread
--
-- We do this to make sure returns in case of async versions getting a thread passed are correct (and not use a uv_fs_t return)
--
-- Although, how to handle this highly depend on the language server identifying the user passing a thread instead of a function
-- due to a bug in sumneko's language server, returns are always every possible return despite the context
-- see https://github.com/sumneko/lua-language-server/issues/1146
--
-- This only outputs the new definitions and does not replace old ones. The copy-paste process is manual, since it doesn't take much effort

local re = require('re')
local fs = require('fs')
local compile = re.compile

local extract_meta = compile [[
  def <- {| (section / .)+ |}
  section <- {| tags_section function_def |}

  tags_section <- {:meta: (&'---' tag)+ :}
  tag <- '---@' [^ ]+ [^%nl]+ %nl

  function_def   <- {:func: 'function fs.' fun_name s 'end' :}
  fun_name <- ([^%nl] !'Sync' !'end')+

  s <- ' '*
]]


local source = fs.readFileSync('../library/fs.lua')
local output = {}
local meta = extract_meta:match(source)

local buffer = {}
for _, def in ipairs(meta) do
  local optional, callback_params = def.meta:match('%-%-%-@param callback(%??) fun(%b())')

  if not callback_params then goto continue end
  callback_params = callback_params:gsub('[%(%)]', '')

  local name = def.func:match('function (fs%.[^%(]+)')

  if buffer.name and name ~= buffer.name then
    output[#output+1] = table.concat(buffer, '\n') .. '\n\n'
    buffer = {}
  end

  local old_meta = def.meta:gsub(' ?|? ?thread', '') .. def.func
  -- not the main definition rather just an overload of it
  -- remove the thread option if any and leave the rest as is
  if optional ~= '?' then
    buffer.name = name
    buffer[#buffer+1] = old_meta:gsub('\n*$', '')
    goto continue
  end

  local returns = {}
  for name, optional, value in callback_params:gmatch('([%w_]+)(%??) *: * ([^%),]+)') do
    returns[#returns+1] = value .. optional .. ' ' .. name
  end
  returns = table.concat(returns, ', ') .. '\n---@nodiscard'

  local new_meta = def.meta:gsub('%-%-%-@param callback%? .-\n', '%-%-%-@param callback thread\n')
  :gsub('%-%-%-@return.-\n', '%-%-%-@return ' .. returns)
  :gsub('\n*$', '')

  output[#output+1] = old_meta .. '\n' .. new_meta .. '\n' .. def.func

  ::continue::
end

fs.writeFileSync('./fs-thread-override-output.lua', table.concat(output, '\n'))
