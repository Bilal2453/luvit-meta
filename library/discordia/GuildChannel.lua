---@meta _

---
---Defines the base methods and properties for all Discord guild channels.
---
---*This is an abstract base class. Direct instances should never exist.*
---
---@class GuildChannel: Channel
---@field permissionOverwrites Cache # An iterable cache of all overwrites that exist in this channel. To access an overwrite that may exist, but is not cached, use `GuildChannel:getPermissionOverwriteFor`.
---@field name string # The name of the channel. This should be between 2 and 100 characters in length.
---@field position number # The position of the channel, where 0 is the highest.
---@field guild Guild # The guild in which this channel exists.
---@field category GuildCategoryChannel|nil # The parent channel category that may contain this channel.
---@field public private boolean # Whether the "everyone" role has permission to view this channel. In the Discord channel, private text channels are indicated with a lock icon and private voice channels are not visible.
---@overload fun(): GuildChannel
local GuildChannel = {}

---
---Sets the channel's name. This must be between 2 and 100 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return boolean|nil
---@return string error_msg
function GuildChannel:setName(name) end

---
---Sets the channel's parent category.
---
---*This method always makes an HTTP request.*
---
---@param id Channel-ID-Resolvable
---@return boolean|nil
---@return string error_msg
function GuildChannel:setCategory(id) end

---
---Moves a channel up its list. The parameter `n` indicates how many spaces the channel should be moved, clamped to the highest position, with a default of 1 if it is omitted. This will also normalize the positions of all channels.
---
---*This method always makes an HTTP request.*
---
---@param n number
---@return boolean|nil
---@return string error_msg
function GuildChannel:moveUp(n) end

---
---Moves a channel down its list. The parameter `n` indicates how many spaces the channel should be moved, clamped to the lowest position, with a default of 1 if it is omitted. This will also normalize the positions of all channels.
---
---*This method always makes an HTTP request.*
---
---@param n number
---@return boolean|nil
---@return string error_msg
function GuildChannel:moveDown(n) end

---
---Creates an invite to the channel. Optional payload fields are: max_age: number time in seconds until expiration, default = 86400 (24 hours), max_uses: number total number of uses allowed, default = 0 (unlimited), temporary: boolean whether the invite grants temporary membership, default = false, unique: boolean whether a unique code should be guaranteed, default = false
---
---*This method always makes an HTTP request.*
---
---@param payload? table
---@return Invite|nil
---@return string error_msg
function GuildChannel:createInvite(payload) end

---
---Returns a newly constructed cache of all invite objects for the channel. The cache and its objects are not automatically updated via gateway events. You must call this method again to get the updated objects.
---
---*This method always makes an HTTP request.*
---
---@return Cache|nil
---@return string error_msg
function GuildChannel:getInvites() end

---
---Returns a permission overwrite object corresponding to the provided member or role object. If a cached overwrite is not found, an empty overwrite with zero-permissions is returned instead. Therefore, this can be used to create a new overwrite when one does not exist. Note that the member or role must exist in the same guild as the channel does.
---
---*This method only operates on data in memory.*
---
---@param obj Role|Member
---@return PermissionOverwrite
function GuildChannel:getPermissionOverwriteFor(obj) end

---
---Permanently deletes the channel. This cannot be undone!
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function GuildChannel:delete() end

