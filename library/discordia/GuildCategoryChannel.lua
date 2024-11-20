---@meta _

---
---Represents a channel category in a Discord guild, used to organize individual text or voice channels in that guild.
---
---*Instances of this class should not be constructed by users.*
---
---@class GuildCategoryChannel: GuildChannel
---@field textChannels FilteredIterable # Iterable of all textChannels in the Category.
---@field voiceChannels FilteredIterable # Iterable of all voiceChannels in the Category.
---@overload fun(): GuildCategoryChannel
local GuildCategoryChannel = {}

---
---Creates a new GuildTextChannel with this category as it's parent. Similar to `Guild:createTextChannel(name)`
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return GuildTextChannel|nil
---@return string error_msg
function GuildCategoryChannel:createTextChannel(name) end

---
---Creates a new GuildVoiceChannel with this category as it's parent. Similar to `Guild:createVoiceChannel(name)`
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return GuildVoiceChannel|nil
---@return string error_msg
function GuildCategoryChannel:createVoiceChannel(name) end
