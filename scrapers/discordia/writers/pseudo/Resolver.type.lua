require('useful') -- defines string methods

local concat = table.concat

-- TODO: The follow types are not currently in the wiki
-- Message-Flag-Resolvable
-- Message-ID-Resolvables
-- Role-ID-Resolvables
-- Permissions-Resolvables

-- semi-automatically generated - types are manually filled in
-- types are automatically refilled in when regenerating!
local template = {
  {"Integer-Resolvable", "<br>Due to Luvit/LuaJIT's lack of native 64-bit integers, integers are resolved as strings in Discordia. If you wish to input the purest type where ever an integer is accepted, usually a Discord Snowflake ID, use a Lua string.", {"string", "integer"}},
  {"User-ID-Resolvable", "- [User](https://github.com/SinisterRectus/Discordia/wiki/User) object via `User.id`<br>- [Member](https://github.com/SinisterRectus/Discordia/wiki/Member) object via `Member.user.id`<br>- [Message](https://github.com/SinisterRectus/Discordia/wiki/Message) object via `Message.author.id`<br>- [Guild](https://github.com/SinisterRectus/Discordia/wiki/Guild) object via `Guild.ownerId`<br>- Integer", {"User", "Member", "Message", "Guild", "Integer-Resolvable"}},
  {"Message-ID-Resolvable", "- [Message](https://github.com/SinisterRectus/Discordia/wiki/Message) object via `Message.id`<br>- Integer", {"Message", "Integer-Resolvable"}},
  {"Channel-ID-Resolvable", "- [Channel](https://github.com/SinisterRectus/Discordia/wiki/Channel) object via `Channel.id`<br>- Integer", {"Channel", "Integer-Resolvable"}},
  {"Role-ID-Resolvable", "- [Role](https://github.com/SinisterRectus/Discordia/wiki/Role) object via `Role.id`<br>- Integer", {"Role", "Integer-Resolvable"}},
  {"Emoji-ID-Resolvable", "- [Emoji](https://github.com/SinisterRectus/Discordia/wiki/Emoji) object via `Emoji.id`<br>- Integer", {"Emoji", "Integer-Resolvable"}},
  {"Sticker-ID-Resolvable", "- [Sticker](https://github.com/SinisterRectus/Discordia/wiki/Sticker) object via `Sticker.id`<br>- Integer", {"Sticker", "Integer-Resolvable"}},
  {"Guild-ID-Resolvable", "- [Guild](https://github.com/SinisterRectus/Discordia/wiki/Guild) object via `Guild.id`<br>- Integer", {"Guild", "Integer-Resolvable"}},
  {"Entry-ID-Resolvable", "- [AuditLogEntry](https://github.com/SinisterRectus/Discordia/wiki/AuditLogEntry) object via `Entry.id`<br>- Integer", {"AuditLogEntry", "Integer-Resolvable"}},
  -- TODO: what other iterables acceptable for the below resolver?
  {"Message-IDs-Resolvable", "- [Iterable](https://github.com/SinisterRectus/Discordia/wiki/Iterable) of Message ID resolveables<br>- Lua table of Message ID resolveables", {"Iterable", "(Message|Integer-Resolvable)[]"}},
  {"Role-IDs-Resolvable", "- [Iterable](https://github.com/SinisterRectus/Discordia/wiki/Iterable) of Role ID resolveables<br>- Lua table of Role ID resolveables", {"Iterable", "(Role|Integer-Resolvable)[]"}},
  {"Emoji-Resolvable", "- [Emoji](https://github.com/SinisterRectus/Discordia/wiki/Emoji) object via `Emoji.hash`<br>- [Reaction](https://github.com/SinisterRectus/Discordia/wiki/Reaction) object via `Reaction.emojiHash`<br>- Lua string, where the string is a unicode emoji or of the form `\"{Emoji.name}:{Emoji.id}\"`", {"Emoji", "Reaction", "string"}},
  {"Sticker-Resolvable", "- [Sticker](https://github.com/SinisterRectus/Discordia/wiki/Sticker) object via `Sticker.hash`<br>- Lua string, TODO: what string exactly?", {"Sticker", "string"}},
  {"Color-Resolvable", "- [Color](https://github.com/SinisterRectus/Discordia/wiki/Color) object via `Color.value`<br>- Lua number via `tonumber(obj)`", {"Color", "number"}},
  {"Permissions-Resolvable", "- [Permissions](https://github.com/SinisterRectus/Discordia/wiki/Permissions) object via `Permissions.value`<br>- Lua number via `tonumber(obj)`", {"Permissions", "integer"}},
  {"Permission-Resolvable", "- Lua string equivalent to the name of a Discordia permissions enumeration<br>- Lua number equivalent to the value of a Discordia permissions enumeration", {"discordia.enums.permission_key", "discordia.enums.permission_value", "string", "integer"}},
  {"Intents-Resolvable", "- Lua string equivalent to the name of a Discordia gateway intent enumeration<br>- Lua number equivalent to the value of a Discordia gateway intent enumeration", {"discordia.enums.gatewayIntent_key", "discordia.enums.gatewayIntent_value", "string", "integer"}},
  {"Action-Type-Resolvable", "- Lua string equivalent to the name of a Discordia action type enumeration<br>- Lua number equivalent to the value of a Discordia action type enumeration", {"discordia.enums.actionType_key", "discordia.enums.actionType_value", "string", "integer"}},
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
      content:newlineToBr():gsub('%[%[(.-)%]%]', '[%1](https://github.com/SinisterRectus/Discordia/wiki/%1)'),
      concat(args, ', ')
    )
  end
  assert(fs.writeFileSync('./resolver-result.lua', concat(buf, ',\n')))
end
-- generateNames()

return template
