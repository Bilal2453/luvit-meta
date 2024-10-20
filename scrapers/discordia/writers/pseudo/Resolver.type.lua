require('useful') -- defines string methods

local concat = table.concat

-- automatically generated - types are manually filled in
local template = {
  {"Integer-Resolvable", "Due to Luvit/LuaJIT's lack of native 64-bit integers, integers are resolved as strings in Discordia. If you wish to input the purest type where ever an integer is accepted, usually a Discord Snowflake ID, use a Lua string.", {"string", "integer"}},
  {"User-ID-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/User]] object via `User.id`<br>- [[https://github.com/SinisterRectus/Discordia/wiki/Member]] object via `Member.user.id`<br>- [[https://github.com/SinisterRectus/Discordia/wiki/Message]] object via `Message.author.id`<br>- [[https://github.com/SinisterRectus/Discordia/wiki/Guild]] object via `Guild.ownerId`<br>- Integer", {"User", "Member", "Message", "Guild", "discordia.aliases.Integer"}},
  {"Message-ID-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Message]] object via `Message.id`<br>- Integer", {"Message", "discordia.aliases.Integer"}},
  {"Channel-ID-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Channel]] object via `Channel.id`<br>- Integer", {"Channel", "discordia.aliases.Integer"}},
  {"Role-ID-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Role]] object via `Role.id`<br>- Integer", {"Role", "discordia.aliases.Integer"}},
  {"Emoji-ID-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Emoji]] object via `Emoji.id`<br>- Integer", {"Emoji", "discordia.aliases.Integer"}},
  {"Sticker-ID-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Sticker]] object via `Sticker.id`<br>- Integer", {"Sticker", "discordia.aliases.Integer"}},
  {"Guild-ID-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Guild]] object via `Guild.id`<br>- Integer", {"Guild", "discordia.aliases.Integer"}},
  {"Entry-ID-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/AuditLogEntry]] object via `Entry.id`<br>- Integer", {"AuditLogEntry", "discordia.aliases.Integer"}},
  -- TODO: what other iterables acceptable for the below resolver?
  {"Message-IDs-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Iterable]] of Message ID resolveables<br>- Lua table of Message ID resolveables", {"Iterable", "(Message|discordia.aliases.Integer)[]"}},
  {"Role-IDs-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Iterable]] of Role ID resolveables<br>- Lua table of Role ID resolveables", {"Iterable", "(Role|discordia.aliases.Integer)[]"}},
  {"Emoji-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Emoji]] object via `Emoji.hash`<br>- [[https://github.com/SinisterRectus/Discordia/wiki/Reaction]] object via `Reaction.emojiHash`<br>- Lua string, where the string is a unicode emoji or of the form `\"{Emoji.name}:{Emoji.id}\"`", {"Emoji", "Reaction", "string"}},
  {"Sticker-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Sticker]] object via `Sticker.hash`<br>- Lua string, TODO: what string exactly?", {"Sticker", "string"}},
  {"Color-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Color]] object via `Color.value`<br>- Lua number via `tonumber(obj)`", {"Color", "number"}},
  -- TODO: might want to add enum type for the below resolvable
  {"Permissions-Resolvable", "- [[https://github.com/SinisterRectus/Discordia/wiki/Permissions]] object via `Permissions.value`<br>- Lua number via `tonumber(obj)`", {"Permissions", "integer"}},
  {"Permission-Resolvable", "- Lua string equivalent to the name of a Discordia permissions enumeration<br>- Lua number equivalent to the value of a Discordia permissions enumeration", {"string", "integer"}},
  {"Gateway-Intent-Resolvable", "- Lua string equivalent to the name of a Discordia gateway intent enumeration<br>- Lua number equivalent to the value of a Discordia gateway intent enumeration", {"string", "integer"}},
  {"Action-Type-Resolvable", "- Lua string equivalent to the name of a Discordia action type enumeration<br>- Lua number equivalent to the value of a Discordia action type enumeration", {"string", "integer"}},
  {"Base64-Resolvable", "- Lua string representing the base64 string, prefixed by an appropriate `\"data:.*;base64\"` URI scheme<br>- Lua string representing a relative or absolute path to a local file, read via `fs.readFileSync`", {"string"}}
}

-- used when updating resolvers from the markdown
local function generateNames()
  local fs = require('fs')
  local url = 'https://raw.githubusercontent.com/wiki/SinisterRectus/Discordia/Input-resolution.md'
  local res, body
  if fs.existsSync('./cache') then
    res = {code = 200}
    body = fs.readFileSync('./cache')
  else
    res, body = require('coro-http').request('GET', url)
    assert(res.code == 200, 'res.code expected to be 200; got ' .. res.code)
    fs.writeFileSync('./cache', body)
  end
  ---@cast body string

  local buf = {}
  for name, content in body:gmatch '### ([^\n]+)\r\n(.-)\r\n\r\n' do
    name = ('%s-Resolvable'):format(name:gsub(' ', '-'))
    local args = {}
    for i, v in ipairs(template) do
      if v[1] == name then
        for _, t in ipairs(template[i][3]) do
          ('"%s"'):infmt(args, t)
        end
      end
    end
    ('{"%s", "%s", {%s}}'):infmt(
      buf,
      name,
      content:newlineToBr():gsub('%[%[(.-)%]%]', '[[https://github.com/SinisterRectus/Discordia/wiki/%1]]'),
      concat(args, ', ')
    )
  end
  assert(fs.writeFileSync('./resolver-result.lua', concat(buf, ',\n')))
end
-- generateNames()

return template
