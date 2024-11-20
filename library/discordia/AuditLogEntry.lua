---@meta _

---
---Represents an entry made into a guild's audit log.
---
---*Instances of this class should not be constructed by users.*
---
---@class AuditLogEntry: Snowflake
---@field changes table|nil # A table of audit log change objects. The key represents the property of the changed target and the value contains a table of `new` and possibly `old`, representing the property's new and old value.
---@field options table|nil # A table of optional audit log information.
---@field actionType number # The action type. Use the `actionType `enumeration for a human-readable representation.
---@field targetId string|nil # The Snowflake ID of the affected entity. Will be `nil` for certain targets.
---@field userId string # The Snowflake ID of the user who commited the action.
---@field reason string|nil # The reason provided by the user for the change.
---@field guild Guild # The guild in which this audit log entry was found.
---@overload fun(): AuditLogEntry
local AuditLogEntry = {}

---
---Returns two tables of the target's properties before the change, and after the change.
---
---*This method only operates on data in memory.*
---
---@return table
---@return table
function AuditLogEntry:getBeforeAfter() end

---
---Gets the target object of the affected entity. The returned object can be: [[Guild]], [[GuildChannel]], [[User]], [[Member]], [[Role]], [[Webhook]], [[Emoji]], nil
---
---*This method may make an HTTP request.*
---
---@return any|nil
---@return string error_msg
function AuditLogEntry:getTarget() end

---
---Gets the user who performed the changes.
---
---*This method may make an HTTP request.*
---
---@return User|nil
---@return string error_msg
function AuditLogEntry:getUser() end

---
---Gets the member object of the user who performed the changes.
---
---*This method may make an HTTP request.*
---
---@return Member|nil
---@return string
function AuditLogEntry:getMember() end
