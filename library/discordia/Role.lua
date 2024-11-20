---@meta _

---
---Represents a Discord guild role, which is used to assign priority, permissions, and a color to guild members.
---
---*Instances of this class should not be constructed by users.*
---
---@class Role: Snowflake
---@field hoisted boolean # Whether members with this role should be shown separated from other members in the guild member list.
---@field mentionable boolean # Whether this role can be mentioned in a text channel message.
---@field managed boolean # Whether this role is managed by some integration or bot inclusion.
---@field name string # The name of the role. This should be between 1 and 100 characters in length.
---@field position number # The position of the role, where 0 is the lowest.
---@field color number # Represents the display color of the role as a decimal value.
---@field permissions number # Represents the total permissions of the role as a decimal value.
---@field mentionString string # A string that, when included in a message content, may resolve as a role notification in the official Discord client.
---@field guild Guild # The guild in which this role exists.
---@field members FilteredIterable # A filtered iterable of guild members that have this role. If you want to check whether a specific member has this role, it would be better to get the member object elsewhere and use `Member:hasRole` rather than check whether the member exists here.
---@field emojis FilteredIterable # A filtered iterable of guild emojis that have this role. If you want to check whether a specific emoji has this role, it would be better to get the emoji object elsewhere and use `Emoji:hasRole` rather than check whether the emoji exists here.
---@overload fun(): Role
local Role = {}

---
---Permanently deletes the role. This cannot be undone!
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Role:delete() end

---
---Moves a role down its list. The parameter `n` indicates how many spaces the role should be moved, clamped to the lowest position, with a default of 1 if it is omitted. This will also normalize the positions of all roles. Note that the default everyone role cannot be moved.
---
---*This method always makes an HTTP request.*
---
---@param n number
---@return boolean|nil
---@return string error_msg
function Role:moveDown(n) end

---
---Moves a role up its list. The parameter `n` indicates how many spaces the role should be moved, clamped to the highest position, with a default of 1 if it is omitted. This will also normalize the positions of all roles. Note that the default everyone role cannot be moved.
---
---*This method always makes an HTTP request.*
---
---@param n number
---@return boolean|nil
---@return string error_msg
function Role:moveUp(n) end

---
---Sets the role's name. The name must be between 1 and 100 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return boolean|nil
---@return string error_msg
function Role:setName(name) end

---
---Sets the role's display color.
---
---*This method always makes an HTTP request.*
---
---@param color Color-Resolvable
---@return boolean|nil
---@return string error_msg
function Role:setColor(color) end

---
---Sets the permissions that this role explicitly allows.
---
---*This method always makes an HTTP request.*
---
---@param permissions Permissions-Resolvable
---@return boolean|nil
---@return string error_msg
function Role:setPermissions(permissions) end

---
---Causes members with this role to display above unhoisted roles in the member list.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Role:hoist() end

---
---Causes member with this role to display amongst other unhoisted members.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Role:unhoist() end

---
---Allows anyone to mention this role in text messages.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Role:enableMentioning() end

---
---Disallows anyone to mention this role in text messages.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Role:disableMentioning() end

---
---Enables individual permissions for this role. This does not necessarily fully allow the permissions.
---
---*This method always makes an HTTP request.*
---
---@param ... Permission-Resolvables
---@return boolean|nil
---@return string error_msg
function Role:enablePermissions(...) end

---
---Disables individual permissions for this role. This does not necessarily fully disallow the permissions.
---
---*This method always makes an HTTP request.*
---
---@param ... Permission-Resolvables
---@return boolean|nil
---@return string error_msg
function Role:disablePermissions(...) end

---
---Enables all permissions for this role. This does not necessarily fully allow the permissions.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Role:enableAllPermissions() end

---
---Disables all permissions for this role. This does not necessarily fully disallow the permissions.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Role:disableAllPermissions() end

---
---Returns a color object that represents the role's display color.
---
---*This method only operates on data in memory.*
---
---@return Color
function Role:getColor() end

---
---Returns a permissions object that represents the permissions that this role has enabled.
---
---*This method only operates on data in memory.*
---
---@return Permissions
function Role:getPermissions() end
