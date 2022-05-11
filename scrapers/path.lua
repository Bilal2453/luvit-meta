local fs = require('fs')
local read = fs.readFileSync
local write = fs.writeFileSync
local exists = fs.existsSync

local markdown_path = './path.markdown'
local output = {'---'}

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
  return s:gsub('^%s+', ''):gsub('%s+$', '')
end

if not exists(markdown_path) then
  error('path.json file not found, please download it from https://raw.githubusercontent.com/luvit/luvit-docs/master/doc/api/path.markdown', 0)
end

local doc = assert(read(markdown_path)) .. '##'

do
  local desc = assert(doc:match('# Path%s+(.-)\n##'))
  add(desc)
end

add('@class luvit.path')
output[#output+1] = 'local path = {}\n\n'

for method in doc:gmatch('## (.-)\n') do
  local desc
  do
    local start, finish = doc:find(method, nil, true)
    print(doc:sub(finish + 1, #doc))
    desc = doc:sub(finish + 1, #doc):match('^(.-)%s*##')
  end
  local args = {}
  for arg in method:match('%((.-)%)'):gmatch('[^,]+') do
    arg = trun(arg)
    args[#args+1] = '@param ' .. arg .. (arg:match('^%[') and '? ' or ' ') .. 'unknown'
  end
  add()
  add(trun(desc))
  add(table.concat(args, '\n'))
  output[#output+1] = 'function ' .. method:gsub('[%[%]]', '') .. ' end\n'
end

for i = 1, #output do
  output[i] = output[i]:gsub('%-%-%- +', '---'):gsub('%-%-%-(.-) +\n', '---%1\n')
end

write('./path-output.lua', table.concat(output, '\n'))
