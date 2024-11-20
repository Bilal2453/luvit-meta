---@meta _

---
---Represents a single user of Discord, either a human or a bot, outside of any specific guild's context.
---
---*Instances of this class should not be constructed by users.*
---
---@class User: Snowflake
---@field bot boolean # Whether this user is a bot.
---@field name string # Equivalent to `User.globalName or User.username`.
---@field username string # The name of the user. This should be between 2 and 32 characters in length.
---@field globalName string|nil # The global display name of the user. If set, this has priority over the a username in displays, but not over a guild nickname.
---@field discriminator number # The discriminator of the user. This is a string that is used to discriminate the user from other users with the same username. Note that this will be "0" for users with unique usernames.
---@field tag string # The user's username if unique or username and discriminator concatenated by an `#`.
---@field avatar string|nil # The hash for the user's custom avatar, if one is set.
---@field defaultAvatar number # The user's default avatar. See the `defaultAvatar` enumeration for a human-readable representation.
---@field avatarURL string # Equivalent to the result of calling `User:getAvatarURL()`.
---@field defaultAvatarURL string # Equivalent to the result of calling `User:getDefaultAvatarURL()`.
---@field mentionString string # A string that, when included in a message content, may resolve as user notification in the official Discord client.
---@field mutualGuilds FilteredIterable # A iterable cache of all guilds where this user shares a membership with the current user. The guild must be cached on the current client and the user's member object must be cached in that guild in order for it to appear here.
---@overload fun(): User
local User = {}

---
---Returns a URL that can be used to view the user's full avatar. If provided, the size must be a power of 2 while the extension must be a valid image format. If the user does not have a custom avatar, the default URL is returned.
---
---*This method only operates on data in memory.*
---
---@param size? number
---@param ext? string
---@return string
function User:getAvatarURL(size, ext) end

---
---Returns a URL that can be used to view the user's default avatar.
---
---*This method only operates on data in memory.*
---
---@param size? number
---@return string
function User:getDefaultAvatarURL(size) end

---
---Returns a private channel that can be used to communicate with the user. If the channel is not cached an HTTP request is made to open one.
---
---*This method always makes an HTTP request.*
---
---@return PrivateChannel|nil
---@return string error_msg
function User:getPrivateChannel() end

---
---Equivalent to `User:getPrivateChannel():send(content)`
---
---*This method always makes an HTTP request.*
---
---@param content string|table
---@return Message|nil
---@return string error_msg
function User:send(content) end

---
---Equivalent to `User:getPrivateChannel():sendf(content)`
---
---*This method always makes an HTTP request.*
---
---@param content string
---@return Message|nil
---@return string error_msg
function User:sendf(content) end
