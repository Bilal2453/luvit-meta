local function generateBaseTable()
  local URL = 'https://github.com/SinisterRectus/Discordia/wiki/Events.md'
  local res, body = assert(require('coro-http').request("GET", URL))
  assert(res.code == 200, 'response code is ' .. res.code .. '; instead of 200')

  local baseTypes = {
    ['relationship'] = 'Relationship',
    ['timestamp'] = 'string',
    ['reaction'] = 'Reaction',
    ['channel'] = 'Channel',
    ['message'] = 'Message',
    ['latency'] = 'number',
    ['member'] = 'Member',
    ['string'] = 'string',
    ['debug'] = 'string',
    ['guild'] = 'Guild',
    ['hash'] = 'string',
    ['user'] = 'User',
    ['role'] = 'Role',
    ['%a+Id'] = 'string',
  }
  function string.base(str)
    if baseTypes[str] then
      return baseTypes[str]
    end
    for k, v in pairs(baseTypes) do
      if str:match(k) then
        return v
      end
    end
  end

  function string.trim(str)
    return str:gsub('^%s*', ''):gsub('%s*$', ''):gsub('\n', '\\n')
  end

  local buf = {}
  for name, description, args in body:gmatch '###%s(%S+)\n([^\n]+)\n([^#]+)' do
    local pargs = {}
    for arg_name, arg_desc in args:gmatch '%-%s`(.-)`%s%-%s([^\n]+)' do
      table.insert(pargs,
        ('{"%s", "%s", "%s"}'):format(arg_name:trim(), arg_desc:trim(), arg_name:trim():base())
      )
    end
    table.insert(buf,
      ('\t{"%s", "%s"%s}'):format(
        name:trim(),
        description:trim(),
        #pargs > 0 and (', ' .. table.concat(pargs, ', ')) or ''
      )
    )
  end
  return 'return {\n' .. table.concat(buf, ',\n') .. '\n}'
end
-- require'fs'.writeFileSync('generated-events.lua', generateBaseTable())

-- this table is half auto-generated
-- make sure when regenerating to merge the manually typed types
return {
  {"ready", "Emitted after all shards and guilds are fully loaded."},
  {"shardReady", "Emitted after a shard successfully connects to a Discord gateway and loads all corresponding guilds.", {"shardId", "ID of the shard", "string"}},
  {"shardResumed", "Emitted after the client successfully resumes a severed gateway connection.", {"shardId", "ID of the shard", "string"}},
  {"channelCreate", "Emitted when a guild channel is created, when a private channel is opened, or when a group channel is joined.", {"channel", "the created channel", "ChannelUnion"}},
  {"channelUpdate", "Emitted when a channel property is updated, such as its name, topic, bitrate, etc.", {"channel", "the updated channel", "ChannelUnion"}},
  {"channelDelete", "Emitted when a guild channel is deleted, when a private channel is closed, or when a group channel is left.", {"channel", "the deleted channel", "ChannelUnion"}},
  {"recipientAdd", "Emitted when a new recipient is added to a group channel. User-accounts only.", {"channel", "the group channel to which the user was added", "GroupChannel"}, {"user", "the user that was added", "User"}},
  {"recipientRemove", "Emitted when a new recipient is removed from a group channel. User-accounts only.", {"channel", "the group channel from which the user was removed", "GroupChannel"}, {"user", "the user that was removed", "User"}},
  {"guildAvailable", "Emitted when a guild becomes available. This can occur after a server outage or as guild data is streamed in after login.", {"guild", "the available guild", "Guild"}},
  {"guildCreate", "Emitted when a guild is created from the perspective of the current user, usually after the client user joins a new one.", {"guild", "the created guild", "Guild"}},
  {"guildUpdate", "Emitted when a guild property is updated such as its name, region, icon, etc.", {"guild", "the updated guild", "Guild"}},
  {"guildUnavailable", "Emitted when a guild becomes unavailable, potentially due to a server outage.  Unavailable guilds may lack significant data.", {"guild", "the unavailable guild", "Guild"}},
  {"guildDelete", "Emitted when a guild is deleted from the perspective of the current user, usually after the client leaves one.", {"guild", "the deleted guild", "Guild"}},
  {"userBan", "Emitted when a user is banned from a guild.", {"user", "the user that was banned", "User"}, {"guild", "the guild from which the user was banned", "Guild"}},
  {"userUnban", "Emitted when a user is unbanned from a guild.", {"user", "the user that was unbanned", "User"}, {"guild", "the guild from which the user was unbanned", "Guild"}},
  {"emojisUpdate", "Emitted when a guild's custom emoji is updated.", {"guild", "the guild in which the emoji exists", "Guild"}},
  {"memberJoin", "Emitted when a new user joins a guild.", {"member", "the member that joined the guild", "Member"}},
  {"memberLeave", "Emitted when a user leaves a guild.", {"member", "the member that left the guild", "Member"}},
  {"memberUpdate", "Emitted when a guild member property is updated, such as its roles or nickname. See [presenceUpdate](#presenceUpdate) for status changes.", {"member", "the member that was updated", "Member"}},
  {"roleCreate", "Emitted when a guild role is created.", {"role", "the role that was created", "Role"}},
  {"roleUpdate", "Emitted when a guild role property is updated, such as its name, color, permissions, etc.", {"role", "the role that was updated", "Role"}},
  {"roleDelete", "Emitted when a guild role is deleted.", {"role", "the role that was deletes", "Role"}},
  {"messageCreate", "Emitted when a text channel message is created.", {"message", "the message that was created", "Message"}},
  {"messageUpdate", "Emitted when the content of a text channel message is edited.", {"message", "the message that was updated", "Message"}},
  {"messageUpdateUncached", "Emitted when the content of a text channel message is edited, but the message is not cached by the client.", {"channel", "the channel in which the message was created", "TextChannelUnion"}, {"messageId", "the Snowflake ID of the message", "string"}},
  {"messageDelete", "Emitted when a text channel message is deleted. Bulk deletions will fire this for every message that is deleted.", {"message", "the message that was deleted", "Message"}},
  {"messageDeleteUncached", "Emitted when a text channel message is deleted, but the message is not cached by the client. Bulk deletions will fire this for every message that is deleted, but not cached.", {"channel", "the channel in which the message was deleted", "TextChannelUnion"}, {"messageId", "the Snowflake ID of the message", "string"}},
  {"reactionAdd", "Emitted when an emoji reaction is added to message.", {"reaction", "the reaction object that was added", "Reaction"}, {"userId", "the Snowflake ID of the user that added the reaction", "string"}},
  {"reactionAddAny", "Emitted when an emoji reaction is added to message, whether the message is cached or not.", {"channel", "the channel in which the reaction was added", "TextChannelUnion"}, {"messageId", "The Snowflake ID of the reacted message", "string"}, {"hash", "the hash of the reaction; either an emoji ID or emoji name", "string"}, {"userId", "the Snowflake ID of the user that added the reaction", "string"}},
  {"reactionAddUncached", "Emitted when an emoji reaction is added to message, but the message is not cached by the client.", {"channel", "the channel in which the reaction was added", "TextChannelUnion"}, {"messageId", "the Snowflake ID of the reacted message", "string"}, {"hash", "the hash of the reaction; either an emoji ID or emoji name", "string"}, {"userId", "the Snowflake ID of the user that added the reaction", "string"}},
  {"reactionRemove", "Emitted when an emoji reaction is removed from a message.", {"reaction", "the reaction object that was removed", "Reaction"}, {"userId", "the Snowflake ID of the user whose reaction was removed", "string"}},
  {"reactionRemoveAny", "Emitted when an emoji reaction is removed from a message, whether the message is cached or not.", {"channel", "the channel in which the reaction was removed", "TextChannelUnion"}, {"messageId", "the Snowflake ID of the reacted message", "string"}, {"hash", "the hash of the reaction; either an emoji ID or emoji name", "string"}, {"userId", "the Snowflake ID of the user whose reaction was removed", "string"}},
  {"reactionRemoveUncached", "Emitted when an emoji reaction is removed from a message, but the message is not cached by the client.", {"channel", "the channel in which the reaction was removed", "TextChannelUnion"}, {"messageId", "the Snowflake ID of the reacted message", "string"}, {"hash", "the hash of the reaction; either an emoji ID or emoji name", "string"}, {"userId", "the Snowflake ID of the user whose reaction was removed", "string"}},
  {"reactionRemoveAll", "Emitted when all emoji reactions are removed from a message.", {"message", "the message from which the reactions were removed", "Message"}},
  {"reactionRemoveAllAny", "Emitted when all emoji reactions are removed from a message, whether the message is cached or not.", {"channel", "the channel in which the reactions were removed", "TextChannelUnion"}, {"messageId", "the Snowflake ID of the reacted message", "string"}},
  {"reactionRemoveAllUncached", "Emitted when all emoji reactions are removed from a message, but the message is not cached by the client.", {"channel", "the channel in which the reactions were removed", "TextChannelUnion"}, {"messageId", "the Snowflake ID of the reacted message", "string"}},
  {"pinsUpdate", "Emitted when a message is pinned or unpinned in a channel.", {"channel", "the channel in which the message was pinned or unpinned", "TextChannelUnion"}},
  {"presenceUpdate", "Emitted when a guild member's status or user properties change. See [memberUpdate](#memberUpdate) for role and nickname changes.", {"member", "the member whose presence has changed", "Member"}},
  {"relationshipUpdate", "Emitted when a relationship's (friend, blocked user)  status or user properties change. User-accounts only.", {"relationship", "the relationship that was updated", "Relationship"}},
  {"relationshipAdd", "Emitted when a relationship (friend, blocked user) is added. User-accounts only.", {"relationship", "the relationship that was added", "Relationship"}},
  {"relationshipRemove", "Emitted when a relationship (friend, blocked user) is removed. User-accounts only.", {"relationship", "the relationship that was removed", "Relationship"}},
  {"typingStart", "Emitted when a user starts typing in a text channel.", {"userId", "the Snowflake ID of the user that started typing", "string"}, {"channelId", "the Snowflake ID of the channel in which the user started typing", "string"}, {"timestamp", "Unix timestamp in seconds at which the user started typing", "string"}},
  {"userUpdate", "Emitted when the client user updates itself.", {"user", "the user that was updated (equivalent to `client.user`)", "User"}},
  {"voiceConnect", "Emitted when a guild member connects to voice chat.", {"member", "the member that connected", "Member"}},
  {"voiceDisconnect", "Emitted when a guild member disconnects from voice chat.", {"member", "the member that connected", "Member"}},
  {"voiceUpdate", "Emitted when a guild member's mute/deaf status changes.", {"member", "the member that connected", "Member"}},
  {"voiceChannelJoin", "Emitted when a guild member joins a voice channel.", {"member", "the member that joined", "Member"}, {"channel", "the channel that was joined", "GuildVoiceChannel"}},
  {"voiceChannelLeave", "Emitted when a guild member leaves a voice channel.", {"member", "the member that left", "Member"}, {"channel", "the channel that was left", "GuildVoiceChannel"}},
  {"webhooksUpdate", "Emitted when a guild's text channel's webhooks have updated.", {"channel", "the channel in which the webhook updated", "GuildTextChannel"}},
  {"debug", "Emitted to provide detailed information regarding specific library behavior.", {"debug", "The unformatted debug message", "string"}},
  {"info", "Emitted to provide helpful information regarding general library behavior.", {"message", "The unformatted info message", "Message"}},
  {"warning", "Emitted when something went wrong, but your code will probably continue operating normally.", {"message", "The unformatted warning message", "Message"}},
  {"error", "Emitted when something went wrong and your code may not continue operating normally.", {"message", "The unformatted error message", "Message"}},
  {"heartbeat", "Emitted when Discord responds with a heartbeat acknowledgement.", {"shardId", "the ID of the shard that received the acknowledgement", "string"}, {"latency", "round-trip latency of the heartbeat in milliseconds", "number"}},
  {"raw", "Emitted for every Discord gateway event.", {"string", "Raw JSON string of the gateway payload", "string"}}
}
