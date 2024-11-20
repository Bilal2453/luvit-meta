---@meta _

---
---Represents a private Discord text channel used to track correspondences between the current user and one other recipient.
---
---*Instances of this class should not be constructed by users.*
---
---@class PrivateChannel: TextChannel
---@field name string # Equivalent to `PrivateChannel.recipient.username`.
---@field recipient User # The recipient of this channel's messages, other than the current user.
---@overload fun(): PrivateChannel
local PrivateChannel = {}

---
---Closes the channel. This does not delete the channel. To re-open the channel, use `User:getPrivateChannel`.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function PrivateChannel:close() end
