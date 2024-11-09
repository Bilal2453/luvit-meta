---@meta _

---
---Represents an object that is used to allow or deny specific permissions for a role or member in a Discord guild channel.
---
---*Instances of this class should not be constructed by users.*
---
---@class PermissionOverwrite: Snowflake
---@field type string # The overwrite type; either "role" or "member".
---@field channel GuildChannel # The channel in which this overwrite exists.
---@field guild Guild # The guild in which this overwrite exists. Equivalent to `PermissionOverwrite.channel.guild`.
---@field allowedPermissions number # The number representing the total permissions allowed by this overwrite.
---@field deniedPermissions number # The number representing the total permissions denied by this overwrite.
---@overload fun(): PermissionOverwrite
local PermissionOverwrite = {}

---
---Deletes the permission overwrite. This can be undone by creating a new version of the same overwrite.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function PermissionOverwrite:delete() end

---
---Returns the object associated with this overwrite, either a role or member. This may make an HTTP request if the object is not cached.
---
---*This method may make an HTTP request.*
---
---@return Role|Member|nil
---@return string error_msg
function PermissionOverwrite:getObject() end

---
---Returns a permissions object that represents the permissions that this overwrite explicitly allows.
---
---*This method only operates on data in memory.*
---
---@return Permissions
function PermissionOverwrite:getAllowedPermissions() end

---
---Returns a permissions object that represents the permissions that this overwrite explicitly denies.
---
---*This method only operates on data in memory.*
---
---@return Permissions
function PermissionOverwrite:getDeniedPermissions() end

---
---Sets the permissions that this overwrite explicitly allows and denies. This method does NOT resolve conflicts. Please be sure to use the correct parameters.
---
---*This method always makes an HTTP request.*
---
---@param allowed Permissions-Resolvables
---@param denied Permissions-Resolvables
---@return boolean|nil
---@return string error_msg
function PermissionOverwrite:setPermissions(allowed, denied) end

---
---Sets the permissions that this overwrite explicitly allows.
---
---*This method always makes an HTTP request.*
---
---@param allowed Permissions-Resolvables
---@return boolean|nil
---@return string error_msg
function PermissionOverwrite:setAllowedPermissions(allowed) end

---
---Sets the permissions that this overwrite explicitly denies.
---
---*This method always makes an HTTP request.*
---
---@param denied Permissions-Resolvables
---@return boolean|nil
---@return string error_msg
function PermissionOverwrite:setDeniedPermissions(denied) end

---
---Allows individual permissions in this overwrite.
---
---*This method always makes an HTTP request.*
---
---@param ... Permission-Resolvables
---@return boolean|nil
---@return string error_msg
function PermissionOverwrite:allowPermissions(...) end

---
---Denies individual permissions in this overwrite.
---
---*This method always makes an HTTP request.*
---
---@param ... Permission-Resolvables
---@return boolean|nil
---@return string error_msg
function PermissionOverwrite:denyPermissions(...) end

---
---Clears individual permissions in this overwrite.
---
---*This method always makes an HTTP request.*
---
---@param ... Permission-Resolvables
---@return boolean|nil
---@return string error_msg
function PermissionOverwrite:clearPermissions(...) end

---
---Allows all permissions in this overwrite.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function PermissionOverwrite:allowAllPermissions() end

---
---Denies all permissions in this overwrite.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function PermissionOverwrite:denyAllPermissions() end

---
---Clears all permissions in this overwrite.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function PermissionOverwrite:clearAllPermissions() end

