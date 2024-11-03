---@meta _

---
---Represents a Discord group channel. Essentially a private channel that may have more than one and up to ten recipients. This class should only be relevant to user-accounts; bots cannot normally join group channels.
---
---*Instances of this class should not be constructed by users.*
---
---@class GroupChannel: TextChannel
---@field recipients SecondaryCache # A secondary cache of users that are present in the channel.
---@field name string # The name of the channel.
---@field ownerId string # The Snowflake ID of the user that owns (created) the channel.
---@field owner User|nil # Equivalent to `GroupChannel.recipients:get(GroupChannel.ownerId)`.
---@field icon string|nil # The hash for the channel's custom icon, if one is set.
---@field iconURL string|nil # The URL that can be used to view the channel's icon, if one is set.
---@overload fun(): GroupChannel
local GroupChannel = {}

---
---Sets the channel's name. This must be between 1 and 100 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return boolean|nil
---@return string error_msg
function GroupChannel:setName(name) end

---
---Sets the channel's icon. To remove the icon, pass `nil`.
---
---*This method always makes an HTTP request.*
---
---@param icon Base64-Resolvable
---@return boolean|nil
---@return string error_msg
function GroupChannel:setIcon(icon) end

---
---Adds a user to the channel.
---
---*This method always makes an HTTP request.*
---
---@param id User-ID-Resolvable
---@return boolean|nil
---@return string error_msg
function GroupChannel:addRecipient(id) end

---
---Removes a user from the channel.
---
---*This method always makes an HTTP request.*
---
---@param id User-ID-Resolvable
---@return boolean|nil
---@return string error_msg
function GroupChannel:removeRecipient(id) end

---
---Removes the client's user from the channel. If no users remain, the channel is destroyed.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function GroupChannel:leave() end

