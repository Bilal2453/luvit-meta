---@meta _

---
---Represents a Discord guild (or server). Guilds are a collection of members, channels, and roles that represents one community.
---
---*Instances of this class should not be constructed by users.*
---
---@class Guild: Snowflake
---@field shardId number # The ID of the shard on which this guild is served. If only one shard is in operation, then this will always be 0.
---@field name string # The guild's name. This should be between 2 and 100 characters in length.
---@field icon string|nil # The hash for the guild's custom icon, if one is set.
---@field iconURL string|nil # The URL that can be used to view the guild's icon, if one is set.
---@field splash string|nil # The hash for the guild's custom splash image, if one is set. Only partnered guilds may have this.
---@field splashURL string|nil # The URL that can be used to view the guild's custom splash image, if one is set. Only partnered guilds may have this.
---@field banner string|nil # The hash for the guild's custom banner, if one is set.
---@field bannerURL string|nil # The URL that can be used to view the guild's banner, if one is set.
---@field large boolean # Whether the guild has an arbitrarily large amount of members. Guilds that are "large" will not initialize with all members cached.
---@field lazy boolean # Whether the guild follows rules for the lazy-loading of client data.
---@field region string # The voice region that is used for all voice connections in the guild.
---@field vanityCode string|nil # The guild's vanity invite URL code, if one exists.
---@field description string|nil # The guild's custom description, if one exists.
---@field maxMembers number|nil # The guild's maximum member count, if available.
---@field maxPresences number|nil # The guild's maximum presence count, if available.
---@field mfaLevel number # The guild's multi-factor (or two-factor) verification level setting. A value of 0 indicates that MFA is not required; a value of 1 indicates that MFA is required for administrative actions.
---@field joinedAt string # The date and time at which the current user joined the guild, represented as an ISO 8601 string plus microseconds when available.
---@field afkTimeout number # The guild's voice AFK timeout in seconds.
---@field unavailable boolean # Whether the guild is unavailable. If the guild is unavailable, then no property is guaranteed to exist except for this one and the guild's ID.
---@field totalMemberCount number # The total number of members that belong to this guild. This should always be greater than or equal to the total number of cached members.
---@field verificationLevel number # The guild's verification level setting. See the `verificationLevel` enumeration for a human-readable representation.
---@field notificationSetting number # The guild's default notification setting. See the `notficationSetting` enumeration for a human-readable representation.
---@field explicitContentSetting number # The guild's explicit content level setting. See the `explicitContentLevel` enumeration for a human-readable representation.
---@field premiumTier number # The guild's premium tier (server boost level). See the `premiumTier` enumeration for a human-readable representation.
---@field premiumSubscriptionCount number # The number of boosts the guild currently has. This may be greater than the number of users who are boosting the guild.
---@field features table # Raw table of VIP features that are enabled for the guild.
---@field me Member|nil # Equivalent to `Guild.members:get(Guild.client.user.id)`.
---@field owner Member|nil # Equivalent to `Guild.members:get(Guild.ownerId)`.
---@field ownerId string # The Snowflake ID of the guild member that owns the guild.
---@field afkChannelId string|nil # The Snowflake ID of the channel that is used for AFK members, if one is set.
---@field afkChannel GuildVoiceChannel|nil # Equivalent to `Guild.voiceChannels:get(Guild.afkChannelId)`.
---@field systemChannelId string|nil # The channel id where Discord's join messages will be displayed.
---@field systemChannel GuildTextChannel|nil # The channel where Discord's join messages will be displayed.
---@field defaultRole Role # Equivalent to `Guild.roles:get(Guild.id)`.
---@field connection VoiceConnection|nil # The VoiceConnection for this guild if one exists.
---@field roles Cache # An iterable cache of all roles that exist in this guild. This includes the default everyone role.
---@field emojis Cache # An iterable cache of all emojis that exist in this guild. Note that standard unicode emojis are not found here; only custom emojis.
---@field stickers Cache # An iterable cache of all stickers that exist in this guild.
---@field members Cache # An iterable cache of all members that exist in this guild and have been already loaded. If the `cacheAllMembers` client option (and the `syncGuilds` option for user-accounts) is enabled on start-up, then all members will be cached. Otherwise, offline members may not be cached. To access a member that may exist, but is not cached, use `Guild:getMember`.
---@field textChannels Cache # An iterable cache of all text channels that exist in this guild.
---@field voiceChannels Cache # An iterable cache of all voice channels that exist in this guild.
---@field categories Cache # An iterable cache of all channel categories that exist in this guild.
---@overload fun(): Guild
local Guild = {}

---
---Asynchronously loads all members for this guild. You do not need to call this if the `cacheAllMembers` client option (and the `syncGuilds` option for user-accounts) is enabled on start-up.
---
---*This method always makes a WebSocket request.*
---
---@return boolean
function Guild:requestMembers() end

---
---Asynchronously loads certain data and enables the receiving of certain events for this guild. You do not need to call this if the `syncGuilds` client option is enabled on start-up. Note: This is only for user accounts. Bot accounts never need to sync guilds!
---
---*This method always makes a WebSocket request.*
---
---@return boolean
function Guild:sync() end

---
---Gets a member object by ID. If the object is already cached, then the cached object will be returned; otherwise, an HTTP request is made.
---
---*This method may make an HTTP request.*
---
---@param id User-ID-Resolvable
---@return Member|nil
---@return string error_msg
---@nodiscard
function Guild:getMember(id) end

---
---Gets a role object by ID.
---
---*This method only operates on data in memory.*
---
---@param id Role-ID-Resolvable
---@return Role
---@nodiscard
function Guild:getRole(id) end

---
---Gets a emoji object by ID.
---
---*This method only operates on data in memory.*
---
---@param id Emoji-ID-Resolvable
---@return Emoji
---@nodiscard
function Guild:getEmoji(id) end

---
---Gets a sticker object by ID.
---
---*This method only operates on data in memory.*
---
---@param id Sticker-ID-Resolvable
---@return Sticker
---@nodiscard
function Guild:getSticker(id) end

---
---Gets a text, voice, or category channel object by ID.
---
---*This method only operates on data in memory.*
---
---@param id Channel-ID-Resolvable
---@return GuildChannelUnion
---@nodiscard
function Guild:getChannel(id) end

---
---Creates a new text channel in this guild. The name must be between 2 and 100 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return GuildTextChannel|nil
---@return string error_msg
function Guild:createTextChannel(name) end

---
---Creates a new voice channel in this guild. The name must be between 2 and 100 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return GuildVoiceChannel|nil
---@return string error_msg
function Guild:createVoiceChannel(name) end

---
---Creates a channel category in this guild. The name must be between 2 and 100 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return GuildCategoryChannel|nil
---@return string error_msg
function Guild:createCategory(name) end

---
---Creates a new role in this guild. The name must be between 1 and 100 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return Role|nil
---@return string error_msg
function Guild:createRole(name) end

---
---Creates a new emoji in this guild. The name must be between 2 and 32 characters in length. The image must not be over 256kb, any higher will return a 400 Bad Request
---
---*This method always makes an HTTP request.*
---
---@param name string
---@param image Base64-Resolvable
---@return Emoji|nil
---@return string error_msg
function Guild:createEmoji(name, image) end

---
---Creates a new sticker in this guild. The name must be between 2 and 30 characters. The description must be between 2 and 100 characters, and the tags must be between 2 and 200 characters. The file must be a PNG, APNG, or LOTTIE file, and must be under 500kb and 320x320 pixels.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@param description string
---@param tags string
---@param file Base64-Resolvable
---@return Sticker|nil
---@return string error_msg
function Guild:createSticker(name, description, tags, file) end

---
---Sets the guilds name. This must be between 2 and 100 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return boolean|nil
---@return string error_msg
function Guild:setName(name) end

---
---Sets the guild's voice region (eg: `us-east`). See `listVoiceRegions` for a list of acceptable regions.
---
---*This method always makes an HTTP request.*
---
---@param region string
---@return boolean|nil
---@return string error_msg
function Guild:setRegion(region) end

---
---Sets the guild's verification level setting. See the `verificationLevel` enumeration for acceptable values.
---
---*This method always makes an HTTP request.*
---
---@param verification_level number
---@return boolean|nil
---@return string error_msg
function Guild:setVerificationLevel(verification_level) end

---
---Sets the guild's default notification setting. See the `notficationSetting` enumeration for acceptable values.
---
---*This method always makes an HTTP request.*
---
---@param default_message_notifications number
---@return boolean|nil
---@return string error_msg
function Guild:setNotificationSetting(default_message_notifications) end

---
---Sets the guild's explicit content level setting. See the `explicitContentLevel` enumeration for acceptable values.
---
---*This method always makes an HTTP request.*
---
---@param explicit_content_filter number
---@return boolean|nil
---@return string error_msg
function Guild:setExplicitContentSetting(explicit_content_filter) end

---
---Sets the guild's AFK timeout in seconds.
---
---*This method always makes an HTTP request.*
---
---@param afk_timeout number
---@return number|nil
---@return string error_msg
function Guild:setAFKTimeout(afk_timeout) end

---
---Sets the guild's AFK channel.
---
---*This method always makes an HTTP request.*
---
---@param id Channel-ID-Resolvable
---@return boolean|nil
---@return string error_msg
function Guild:setAFKChannel(id) end

---
---Sets the guild's join message channel.
---
---*This method always makes an HTTP request.*
---
---@param id Channel-ID-Resolvable
---@return boolean|nil
---@return string error_msg
function Guild:setSystemChannel(id) end

---
---Transfers ownership of the guild to another user. Only the current guild owner can do this.
---
---*This method always makes an HTTP request.*
---
---@param id User-ID-Resolvable
---@return boolean|nil
---@return string error_msg
function Guild:setOwner(id) end

---
---Sets the guild's icon. To remove the icon, pass `nil`.
---
---*This method always makes an HTTP request.*
---
---@param icon Base64-Resolvable
---@return boolean|nil
---@return string error_msg
function Guild:setIcon(icon) end

---
---Sets the guild's banner. To remove the banner, pass `nil`.
---
---*This method always makes an HTTP request.*
---
---@param banner Base64-Resolvable
---@return boolean|nil
---@return string error_msg
function Guild:setBanner(banner) end

---
---Sets the guild's splash. To remove the splash, pass `nil`.
---
---*This method always makes an HTTP request.*
---
---@param splash Base64-Resolvable
---@return boolean|nil
---@return string error_msg
function Guild:setSplash(splash) end

---
---Returns the number of members that would be pruned from the guild if a prune were to be executed.
---
---*This method always makes an HTTP request.*
---
---@param days? number
---@return number|nil
---@return string error_msg
---@nodiscard
function Guild:getPruneCount(days) end

---
---Prunes (removes) inactive, roleless members from the guild who have not been online in the last provided days. If the `count` boolean is provided, the number of pruned members is returned; otherwise, `0` is returned.
---
---*This method always makes an HTTP request.*
---
---@param days? number
---@param count? boolean
---@return number|nil
---@return string error_msg
function Guild:pruneMembers(days, count) end

---
---Returns a newly constructed cache of all ban objects for the guild. The cache and its objects are not automatically updated via gateway events. You must call this method again to get the updated objects.
---
---*This method always makes an HTTP request.*
---
---@return Cache|nil
---@return string error_msg
---@nodiscard
function Guild:getBans() end

---
---This will return a Ban object for a giver user if that user is banned from the guild; otherwise, `nil` is returned.
---
---*This method always makes an HTTP request.*
---
---@param id User-ID-Resolvable
---@return Ban|nil
---@return string error_msg
---@nodiscard
function Guild:getBan(id) end

---
---Returns a newly constructed cache of all invite objects for the guild. The cache and its objects are not automatically updated via gateway events. You must call this method again to get the updated objects.
---
---*This method always makes an HTTP request.*
---
---@return Cache|nil
---@return string error_msg
---@nodiscard
function Guild:getInvites() end

---
---Returns a newly constructed cache of audit log entry objects for the guild. The cache and its objects are not automatically updated via gateway events. You must call this method again to get the updated objects. If included, the query parameters include: query.limit: number, query.user: UserId Resolvable query.before: EntryId Resolvable, query.type: ActionType Resolvable
---
---*This method always makes an HTTP request.*
---
---@param query? table
---@return Cache|nil
---@return string error_msg
---@nodiscard
function Guild:getAuditLogs(query) end

---
---Returns a newly constructed cache of all webhook objects for the guild. The cache and its objects are not automatically updated via gateway events. You must call this method again to get the updated objects.
---
---*This method always makes an HTTP request.*
---
---@return Cache|nil
---@return string error_msg
---@nodiscard
function Guild:getWebhooks() end

---
---Returns a raw data table that contains a list of available voice regions for this guild, as provided by Discord, with no additional parsing.
---
---*This method always makes an HTTP request.*
---
---@return table|nil
---@return string error_msg
function Guild:listVoiceRegions() end

---
---Removes the current user from the guild.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Guild:leave() end

---
---Permanently deletes the guild. The current user must owner the server. This cannot be undone!
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Guild:delete() end

---
---Kicks a user/member from the guild with an optional reason.
---
---*This method always makes an HTTP request.*
---
---@param id User-ID-Resolvable
---@param reason? string
---@return boolean|nil
---@return string error_msg
function Guild:kickUser(id, reason) end

---
---Bans a user/member from the guild with an optional reason. The `days` parameter is the number of days to consider when purging messages, up to 7.
---
---*This method always makes an HTTP request.*
---
---@param id User-ID-Resolvable
---@param reason? string
---@param days? number
---@return boolean|nil
---@return string error_msg
function Guild:banUser(id, reason, days) end

---
---Unbans a user/member from the guild with an optional reason.
---
---*This method always makes an HTTP request.*
---
---@param id User-ID-Resolvable
---@param reason? string
---@return boolean|nil
---@return string error_msg
function Guild:unbanUser(id, reason) end

