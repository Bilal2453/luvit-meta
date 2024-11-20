---@meta _

---
---Represents a handle used to send webhook messages to a guild text channel in a one-way fashion. This class defines methods and properties for managing the webhook, not for sending messages.
---
---*Instances of this class should not be constructed by users.*
---
---@class Webhook: Snowflake
---@field guildId string # The ID of the guild in which this webhook exists.
---@field channelId string # The ID of the channel in which this webhook exists.
---@field user User|nil # The user that created this webhook.
---@field token string # The token that can be used to access this webhook.
---@field name string # The name of the webhook. This should be between 2 and 32 characters in length.
---@field type number # The type of the webhook. See the `webhookType` enum for a human-readable representation.
---@field avatar string|nil # The hash for the webhook's custom avatar, if one is set.
---@field avatarURL string # Equivalent to the result of calling `Webhook:getAvatarURL()`.
---@field defaultAvatar number # The default avatar for the webhook. See the `defaultAvatar` enumeration for a human-readable representation. This should always be `defaultAvatar.blurple`.
---@field defaultAvatarURL string # Equivalent to the result of calling `Webhook:getDefaultAvatarURL()`.
---@overload fun(): Webhook
local Webhook = {}

---
---Returns a URL that can be used to view the webhooks's full avatar. If provided, the size must be a power of 2 while the extension must be a valid image format. If the webhook does not have a custom avatar, the default URL is returned.
---
---*This method only operates on data in memory.*
---
---@param size? number
---@param ext? string
---@return string
function Webhook:getAvatarURL(size, ext) end

---
---Returns a URL that can be used to view the webhooks's default avatar.
---
---*This method only operates on data in memory.*
---
---@param size? number
---@return string
function Webhook:getDefaultAvatarURL(size) end

---
---Sets the webhook's name. This must be between 2 and 32 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return boolean|nil
---@return string error_msg
function Webhook:setName(name) end

---
---Sets the webhook's avatar. If `nil` is passed, the avatar is removed.
---
---*This method always makes an HTTP request.*
---
---@param avatar Base64-Resolvable
---@return boolean|nil
---@return string error_msg
function Webhook:setAvatar(avatar) end

---
---Permanently deletes the webhook. This cannot be undone!
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Webhook:delete() end
