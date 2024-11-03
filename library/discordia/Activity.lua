---@meta _

---
---Represents a Discord user's presence data, either an application or streaming presence or a rich presence. Most if not all properties may be nil.
---
---*Instances of this class should not be constructed by users.*
---
---@class Activity
---@field start number|nil # The Unix timestamp for when this Rich Presence activity was started.
---@field stop number|nil # The Unix timestamp for when this Rich Presence activity was stopped.
---@field name string|nil # The name of the activity in which the user is currently engaged.
---@field type number|nil # The user's activity type. See the `activityType` enumeration for a human-readable representation.
---@field url string|nil # The URL for a user's streaming activity.
---@field applicationId string|nil # The application id controlling this Rich Presence activity.
---@field state string|nil # string for the Rich Presence state section.
---@field details string|nil # string for the Rich Presence details section.
---@field textSmall string|nil # string for the Rich Presence small image text.
---@field textLarge string|nil # string for the Rich Presence large image text.
---@field imageSmall string|nil # URL for the Rich Presence small image.
---@field imageLarge string|nil # URL for the Rich Presence large image.
---@field partyId string|nil # Party id for this Rich Presence.
---@field partySize number|nil # Size of the Rich Presence party.
---@field partyMax number|nil # Max size for the Rich Presence party.
---@field emojiId string|nil # The ID of the emoji used in this presence if one is set and if it is a custom emoji.
---@field emojiName string|nil # The name of the emoji used in this presence if one is set and if it has a custom emoji. This will be the raw string for a standard emoji.
---@field emojiHash string|nil # The discord hash for the emoji used in this presence if one is set. This will be the raw string for a standard emoji.
---@field emojiURL string|nil # string The URL that can be used to view a full version of the emoji used in this activity if one is set and if it is a custom emoji.
---@overload fun(): Activity
local Activity = {}

---
---Returns `Activity.parent:__hash()`
---
---@return string
function Activity:__hash() end

