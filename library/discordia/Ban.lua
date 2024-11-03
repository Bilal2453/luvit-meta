---@meta _

---
---Represents a Discord guild ban. Essentially a combination of the banned user and a reason explaining the ban, if one was provided.
---
---*Instances of this class should not be constructed by users.*
---
---@class Ban: Container
---@field reason string|nil # The reason for the ban, if one was set. This should be from 1 to 512 characters in length.
---@field guild Guild # The guild in which this ban object exists.
---@field user User # The user that this ban object represents.
---@overload fun(): Ban
local Ban = {}

---
---Returns `Ban.user.id`
---
---@return string
function Ban:__hash() end

---
---Deletes the ban object, unbanning the corresponding user. Equivalent to `Ban.guild:unbanUser(Ban.user)`.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Ban:delete() end

