---@meta _

---
---Represents a voice channel in a Discord guild, where guild members can connect and communicate via voice chat.
---
---*Instances of this class should not be constructed by users.*
---
---@class GuildVoiceChannel: GuildChannel
---@field bitrate number # The channel's bitrate in bits per second (bps). This should be between 8000 and 96000 (or 128000 for partnered servers).
---@field userLimit number # The amount of users allowed to be in this channel. Users with `moveMembers` permission ignore this limit.
---@field connectedMembers TableIterable # An iterable of all users connected to the channel.
---@field connection VoiceConnection|nil # The VoiceConnection for this channel if one exists.
---@overload fun(): GuildVoiceChannel
local GuildVoiceChannel = {}

---
---Sets the channel's audio bitrate in bits per second (bps). This must be between 8000 and 96000 (or 128000 for partnered servers). If `nil` is passed, the default is set, which is 64000.
---
---*This method always makes an HTTP request.*
---
---@param bitrate number
---@return boolean|nil
---@return string error_msg
function GuildVoiceChannel:setBitrate(bitrate) end

---
---Sets the channel's user limit. This must be between 0 and 99 (where 0 is unlimited). If `nil` is passed, the default is set, which is 0.
---
---*This method always makes an HTTP request.*
---
---@param user_limit number
---@return boolean|nil
---@return string error_msg
function GuildVoiceChannel:setUserLimit(user_limit) end

---
---Join this channel and form a connection to the Voice Gateway.
---
---*This method always makes a WebSocket request.*
---
---@return VoiceConnection
function GuildVoiceChannel:join() end

---
---Leave this channel if there is an existing voice connection to it. Equivalent to GuildVoiceChannel.connection:close()
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function GuildVoiceChannel:leave() end

