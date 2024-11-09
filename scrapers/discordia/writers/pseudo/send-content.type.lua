
local _shortcuts_map = {}
local function f(str, key)
  key = key or str:match('^(%w+):')
  local rtn = str:gsub('$([%w_]+)', _shortcuts_map)
  if key then
    str = str:gsub('^(%w+):%s*', '')
    _shortcuts_map[key] = rtn
  end
  return rtn
end

local shortcuts = {
  mentionable = 'Channel|Emoji|Role|User|{mentionString: string}',
  file = 'string|{[1]: string, [2]: string}',
}

for k, str in pairs(shortcuts) do
  _shortcuts_map[k] = str
end
for k, str in pairs(shortcuts) do
  f(str, k)
end

return {
  {'discordia.aliases.Channel.send', '', {
      'string',
      f[[{
        code?: string|boolean,
        mention?: $mentionable,
        mentions?: ($mentionable)[],
        embed?: discordia.aliases.Embed,
        embeds?: discordia.aliases.Embed[],
        file?: $file,
        files?: ($file)[],
        reference?: {message: Message-ID-Resolvable, mention?: boolean},
        sticker?: Sticker-ID-Resolvable,
        tts?: boolean,
        nonce?: string|number|boolean,
        silent?: boolean
      }]]
    }
  },
}
