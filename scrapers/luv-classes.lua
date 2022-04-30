--[[
  This is a semi-automated scraper for Luv classes.
  The scraping is done per section (per class that is) to make the manual part easier.

  The manual part includes: making aliases, tagging `nodiscard`, markdown enchantments.

  Each section is manually inputted in the `source` string below, if the class has method derived
  the class name has to go into `METHOD_DERIVED_FROM`. Setting the class description and value is manual.
]]

local METHOD_DERIVED_FROM = ''
local source = [[]]

local fs = require('fs')
local write = fs.writeFileSync

local re = require('re')
local compile = re.compile

local grammar = compile [[
  match_rule <- ({| method_name method_form? method_args? method_desc method_returns? method_notes? |} / .)*

  method_notes   <- {:notes: {| note_line+ |} :}
  method_returns <- '**Returns' ':'? '**' ':'? ({:returns: {| return_values+ |} :} / 'Nothing') [s%nl]*
  method_desc    <- [s%nl]* {:desc: content :}
  method_args    <- [s%nl]* '**Parameters:**' s %nl {:args: {| {| argument_line |}* |} :}
  method_form    <- [s%nl]* '> method form `' [^:]+ ':' {:method_form: [^(]+ :} [^%nl]* %nl
  method_name    <- '###' s '`' {:method_name: [^(]+ :} [^%nl]* %nl

  argument_line <- '- ' {:arg_name: argument_name :} {:types: {| argument_type* |} :} s {:arg_desc: [^%nl]* :} %nl
  argument_name <- '`' { [^`]+ } '`' s
  argument_type <- ':'s ('`' { [^`]+ } '`' s 'or'? s)+

  return_values <- (s '`' { [^`]+ } '`' s 'or'?)

  note_line <- [s%nl]* { [^#]+ }

  content <- ([^*#])+
  s <- ' '*
]]

local function pseudoFailureReturn(success_return)
  local types = {'nil', 'string?', 'string?'}
  local returns = ''
  if type(success_return) == 'string' then
    success_return = {success_return}
  end
  for i, v in ipairs(success_return) do
    if v == 'fail' then table.remove(success_return, i) end
  end
  for i, v in ipairs(types) do
    returns = returns .. (success_return[i] and success_return[i] .. '|' .. v or v) .. ', '
  end
  returns = returns:sub(1, -3)
  return returns
end

local function getArgs(args)
  if not args or #args == 0 then return '' end
  local result = {}
  for _, v in ipairs(args) do
    result[#result+1] = v.arg_name
  end
  return table.concat(result, ', ')
end

-- do
--   p(grammar:match(source))
--   return
-- end

local matches = {grammar:match(source)}
local file = {}

for _, value in ipairs(matches) do
  local result = {'---'}

  local desc = value.desc:gsub('^[\n ]+', ''):gsub('[\n ]+$', '')
  for line in desc:gmatch('[^\n]+') do
    line = line:gsub('^[\n ]+', ''):gsub('[\n ]+$', '')
    result[#result+1] = '---' .. line
  end
  result[#result+1] = '---'

  if not value.notes then goto skip_notes end
  for i, v in ipairs(value.notes) do
    -- if i == 1 then v = '**Note**: ' .. v end
    for line in v:gmatch('[^\n]+') do
      result[#result+1] = '---' .. line
    end
  end
  result[#result+1] = '---'
  ::skip_notes::

  if not value.args then goto skip_args end
  for _, arg in ipairs(value.args) do
    result[#result+1] = '---@param ' .. arg.arg_name .. ' ' .. (arg.types and table.concat(arg.types, '|') or 'any') .. (not arg.desc and '' or '# ' .. arg.desc)
  end
  ::skip_args::

  local found = false
  if not value.returns or #value.returns == 0 then goto skip_returns end
  for _, v in ipairs(value.returns) do
    if v == 'fail' then found = true; break end
  end
  if found then
    result[#result+1] = '---@return ' .. pseudoFailureReturn(value.returns)
  else
    result[#result+1] = '---@return ' .. table.concat(value.returns, '|')
  end
  ::skip_returns::

  result[#result+1] = 'function ' .. value.method_name .. '(' .. getArgs(value.args) .. ') end'
  if value.method_form then
    result[#result+1] = METHOD_DERIVED_FROM .. '.' .. value.method_form .. ' = ' .. value.method_name
  end

  file[#file+1] = table.concat(result, '\n')
end

write('output-luv-classes.lua', table.concat(file, '\n\n'))
