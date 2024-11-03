---@meta _

---
---Represents a custom emoji object usable in message content and reactions. Standard unicode emojis do not have a class; they are just strings.
---
---*Instances of this class should not be constructed by users.*
---
---@class Emoji: Snowflake
---@field name string # The name of the emoji.
---@field guild Guild # The guild in which the emoji exists.
---@field mentionString string # A string that, when included in a message content, may resolve as an emoji image in the official Discord client.
---@field url string # The URL that can be used to view a full version of the emoji.
---@field managed boolean # Whether this emoji is managed by an integration such as Twitch or YouTube.
---@field requireColons boolean # Whether this emoji requires colons to be used in the official Discord client.
---@field hash string # String with the format `name:id`, used in HTTP requests. This is different from `Emoji:__hash`, which returns only the Snowflake ID.
---@field animated boolean # Whether this emoji is animated.
---@field roles ArrayIterable # An iterable array of roles that may be required to use this emoji, generally related to integration-managed emojis. Object order is not guaranteed.
---@overload fun(): Emoji
local Emoji = {}

---
---Sets the emoji's name. The name must be between 2 and 32 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return boolean|nil
---@return string error_msg
function Emoji:setName(name) end

---
---Sets the roles that can use the emoji.
---
---*This method always makes an HTTP request.*
---
---@param roles Role-ID-Resolvables
---@return boolean|nil
---@return string error_msg
function Emoji:setRoles(roles) end

---
---Permanently deletes the emoji. This cannot be undone!
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Emoji:delete() end

---
---Returns whether or not the provided role is allowed to use the emoji.
---
---*This method only operates on data in memory.*
---
---@param id Role-ID-Resolvable
---@return boolean
function Emoji:hasRole(id) end

