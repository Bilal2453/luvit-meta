local fs = require('fs')
local content = fs.readFileSync('/etc/protocols')
:gsub('# /etc/protocols%:.-# See also.-\n\n', '')

local protocols = {'---@alias network_protocols'}

for protocol in content:gmatch('[^\n]+') do
  local desc
  protocol, desc = protocol:match('^(%S+).-#%s*([^\n]+)$')
  if not protocol then goto continue end
  protocols[#protocols+1] = ('---|\'"%s"\''):format(protocol) .. '\t\t\t' .. '# ' .. desc
  ::continue::
end

fs.writeFileSync('output-protocols.lua', table.concat(protocols, '\n'))

