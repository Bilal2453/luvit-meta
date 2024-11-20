---@meta _

---
---Represents an invitation to a Discord guild channel. Invites can be used to join a guild, though they are not always permanent.
---
---*Instances of this class should not be constructed by users.*
---
---@class Invite: Container
---@field code string # The invite's code which can be used to identify the invite.
---@field guildId string # The Snowflake ID of the guild to which this invite belongs.
---@field guildName string # The name of the guild to which this invite belongs.
---@field channelId string # The Snowflake ID of the channel to which this belongs.
---@field channelName string # The name of the channel to which this invite belongs.
---@field channelType number # The type of the channel to which this invite belongs. Use the `channelType` enumeration for a human-readable representation.
---@field guildIcon string|nil # The hash for the guild's custom icon, if one is set.
---@field guildBanner string|nil # The hash for the guild's custom banner, if one is set.
---@field guildSplash string|nil # The hash for the guild's custom splash, if one is set.
---@field guildIconURL string|nil # The URL that can be used to view the guild's icon, if one is set.
---@field guildBannerURL string|nil # The URL that can be used to view the guild's banner, if one is set.
---@field guildSplashURL string|nil # The URL that can be used to view the guild's splash, if one is set.
---@field guildDescription string|nil # The guild's custom description, if one is set.
---@field guildVerificationLevel number|nil # The guild's verification level, if available.
---@field inviter User|nil # The object of the user that created the invite. This will not exist if the invite is a guild widget or a vanity invite.
---@field uses number|nil # How many times this invite has been used. This will not exist if the invite is accessed via `Client:getInvite`.
---@field maxUses number|nil # The maximum amount of times this invite can be used. This will not exist if the invite is accessed via `Client:getInvite`.
---@field maxAge number|nil # How long, in seconds, this invite lasts before it expires. This will not exist if the invite is accessed via `Client:getInvite`.
---@field temporary boolean|nil # Whether the invite grants temporary membership. This will not exist if the invite is accessed via `Client:getInvite`.
---@field createdAt string|nil # The date and time at which the invite was created, represented as an ISO 8601 string plus microseconds when available. This will not exist if the invite is accessed via `Client:getInvite`.
---@field revoked boolean|nil # Whether the invite has been revoked. This will not exist if the invite is accessed via `Client:getInvite`.
---@field approximatePresenceCount number|nil # The approximate count of online members.
---@field approximateMemberCount number|nil # The approximate count of all members.
---@overload fun(): Invite
local Invite = {}

---
---Returns `Invite.code`
---
---@return string
function Invite:__hash() end

---
---Permanently deletes the invite. This cannot be undone!
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Invite:delete() end
