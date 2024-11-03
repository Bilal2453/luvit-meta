---@meta _

---
---Represents a text channel in a Discord guild, where guild members and webhooks can send and receive messages.
---
---*Instances of this class should not be constructed by users.*
---
---@class GuildTextChannel: GuildChannel, TextChannel
---@field topic string|nil # The channel's topic. This should be between 1 and 1024 characters.
---@field nsfw boolean # Whether this channel is marked as NSFW (not safe for work).
---@field rateLimit number # Slowmode rate limit per guild member.
---@field isNews boolean # Whether this channel is a news channel of type 5.
---@field members FilteredIterable # A filtered iterable of guild members that have permission to read this channel. If you want to check whether a specific member has permission to read this channel, it would be better to get the member object elsewhere and use `Member:hasPermission` rather than check whether the member exists here.
---@overload fun(): GuildTextChannel
local GuildTextChannel = {}

---
---Creates a webhook for this channel. The name must be between 2 and 32 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return Webhook|nil
---@return string error_msg
function GuildTextChannel:createWebhook(name) end

---
---Returns a newly constructed cache of all webhook objects for the channel. The cache and its objects are not automatically updated via gateway events. You must call this method again to get the updated objects.
---
---*This method always makes an HTTP request.*
---
---@return Cache|nil
---@return string error_msg
function GuildTextChannel:getWebhooks() end

---
---Bulk deletes multiple messages, from 2 to 100, from the channel. Messages over 2 weeks old cannot be deleted and will return an error.
---
---*This method always makes an HTTP request.*
---
---@param messages Message-ID-Resolvables
---@return boolean|nil
---@return string error_msg
function GuildTextChannel:bulkDelete(messages) end

---
---Sets the channel's topic. This must be between 1 and 1024 characters. Pass `nil` to remove the topic.
---
---*This method always makes an HTTP request.*
---
---@param topic string
---@return boolean|nil
---@return string error_msg
function GuildTextChannel:setTopic(topic) end

---
---Sets the channel's slowmode rate limit in seconds. This must be between 0 and 120. Passing 0 or `nil` will clear the limit.
---
---*This method always makes an HTTP request.*
---
---@param limit number
---@return boolean|nil
---@return string error_msg
function GuildTextChannel:setRateLimit(limit) end

---
---Enables the NSFW setting for the channel. NSFW channels are hidden from users until the user explicitly requests to view them.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function GuildTextChannel:enableNSFW() end

---
---Follow this News channel and publish announcements to `targetId`. Returns a 403 HTTP error if `GuildTextChannel.isNews` is false.
---
---*This method always makes an HTTP request.*
---
---@param targetId Channel-ID-Resolvable
---@return string|nil
---@return string error_msg
function GuildTextChannel:follow(targetId) end

---
---Disables the NSFW setting for the channel. NSFW channels are hidden from users until the user explicitly requests to view them.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function GuildTextChannel:disableNSFW() end

