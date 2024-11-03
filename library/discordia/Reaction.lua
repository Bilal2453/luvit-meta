---@meta _

---
---Represents an emoji that has been used to react to a Discord text message. Both standard and custom emojis can be used.
---
---*Instances of this class should not be constructed by users.*
---
---@class Reaction: Container
---@field emojiId string|nil # The ID of the emoji used in this reaction if it is a custom emoji.
---@field emojiName string # The name of the emoji used in this reaction. This will be the raw string for a standard emoji.
---@field emojiHash string # The discord hash for the emoji used in this reaction. This will be the raw string for a standard emoji.
---@field emojiURL string|nil # string The URL that can be used to view a full version of the emoji used in this reaction if it is a custom emoji.
---@field me boolean # Whether the current user has used this reaction.
---@field count number # The total number of users that have used this reaction.
---@field message Message # The message on which this reaction exists.
---@overload fun(): Reaction
local Reaction = {}

---
---Returns `Reaction.emojiId or Reaction.emojiName`
---
---@return string
function Reaction:__hash() end

---
---Returns a newly constructed cache of all users that have used this reaction in its parent message. The cache is not automatically updated via gateway events, but the internally referenced user objects may be updated. You must call this method again to guarantee that the objects are update to date.
---
---*This method always makes an HTTP request.*
---
---@param limit? number
---@return SecondaryCache|nil
---@return string error_msg
function Reaction:getUsers(limit) end

---
---Returns a newly constructed cache of all users that have used this reaction before the specified id in its parent message. The cache is not automatically updated via gateway events, but the internally referenced user objects may be updated. You must call this method again to guarantee that the objects are update to date.
---
---*This method always makes an HTTP request.*
---
---@param id User-ID-Resolvable
---@param limit? number
---@return SecondaryCache|nil
---@return string error_msg
function Reaction:getUsersBefore(id, limit) end

---
---Returns a newly constructed cache of all users that have used this reaction after the specified id in its parent message. The cache is not automatically updated via gateway events, but the internally referenced user objects may be updated. You must call this method again to guarantee that the objects are update to date.
---
---*This method always makes an HTTP request.*
---
---@param id User-ID-Resolvable
---@param limit? number
---@return SecondaryCache|nil
---@return string error_msg
function Reaction:getUsersAfter(id, limit) end

---
---Equivalent to `Reaction.message:removeReaction(Reaction)`
---
---*This method always makes an HTTP request.*
---
---@param id? User-ID-Resolvable
---@return boolean|nil
---@return string error_msg
function Reaction:delete(id) end

