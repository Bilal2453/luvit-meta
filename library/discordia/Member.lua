---@meta _

---
---Represents a Discord guild member. Though one user may be a member in more than one guild, each presence is represented by a different member object associated with that guild. Note that any method or property that exists for the User class is also available in the Member class.
---
---*Instances of this class should not be constructed by users.*
---
---@class Member: UserPresence
---@field roles ArrayIterable # An iterable array of guild roles that the member has. This does not explicitly include the default everyone role. Object order is not guaranteed.
---@field name string # If the member has a nickname, then this will be equivalent to that nickname. Otherwise, this is equivalent to `Member.user.name`.
---@field nickname string|nil # The member's nickname, if one is set.
---@field joinedAt string|nil # The date and time at which the current member joined the guild, represented as an ISO 8601 string plus microseconds when available. Member objects generated via presence updates lack this property.
---@field premiumSince string|nil # The date and time at which the current member boosted the guild, represented as an ISO 8601 string plus microseconds when available.
---@field voiceChannel GuildVoiceChannel|nil # The voice channel to which this member is connected in the current guild.
---@field muted boolean # Whether the member is voice muted in its guild.
---@field deafened boolean # Whether the member is voice deafened in its guild.
---@field timedOut boolean # Whether the member is timed out in its guild.
---@field timedOutUntil string|nil # The raw communication_disabled_until member property. Note this may be provided even when the member's time out have expired.
---@field guild Guild # The guild in which this member exists.
---@field highestRole Role # The highest positioned role that the member has. If the member has no explicit roles, then this is equivalent to `Member.guild.defaultRole`.
---@overload fun(): Member
local Member = {}

---
---Returns a color object that represents the member's color as determined by its highest colored role. If the member has no colored roles, then the default color with a value of 0 is returned.
---
---*This method only operates on data in memory.*
---
---@return Color
function Member:getColor() end

---
---Checks whether the member has a specific permission. If `channel` is omitted, then only guild-level permissions are checked. This is a relatively expensive operation. If you need to check multiple permissions at once, use the `getPermissions` method and check the resulting object.
---
---*This method only operates on data in memory.*
---
---@param channel? GuildChannel
---@param perm Permissions-Resolvable
---@return boolean
function Member:hasPermission(channel, perm) end

---
---Returns a permissions object that represents the member's total permissions for the guild, or for a specific channel if one is provided. If you just need to check one permission, use the `hasPermission` method.
---
---*This method only operates on data in memory.*
---
---@param channel? GuildChannel
---@return Permissions
function Member:getPermissions(channel) end

---
---Adds a role to the member. If the member already has the role, then no action is taken. Note that the everyone role cannot be explicitly added.
---
---*This method may make an HTTP request.*
---
---@param id Role-ID-Resolvable
---@return boolean|nil
---@return string error_msg
function Member:addRole(id) end
---@return nil, string error_msg
function Member:addRole(id) end

---
---Removes a role from the member. If the member does not have the role, then no action is taken. Note that the everyone role cannot be removed.
---
---*This method may make an HTTP request.*
---
---@param id Role-ID-Resolvable
---@return boolean|nil
---@return string error_msg
function Member:removeRole(id) end
---@return nil, string error_msg
function Member:removeRole(id) end

---
---Checks whether the member has a specific role. This will return true for the guild's default role in addition to any explicitly assigned roles.
---
---*This method only operates on data in memory.*
---
---@param id Role-ID-Resolvable
---@return boolean
function Member:hasRole(id) end

---
---Sets the member's nickname. This must be between 1 and 32 characters in length. Pass `nil` to remove the nickname.
---
---*This method always makes an HTTP request.*
---
---@param nick string
---@return boolean|nil
---@return string error_msg
function Member:setNickname(nick) end

---
---Moves the member to a new voice channel, but only if the member has an active voice connection in the current guild. Due to complexities in voice state handling, the member's `voiceChannel` property will update asynchronously via WebSocket; not as a result of the HTTP request. Not supplying an ID will result in the member being disconnected from the channel.
---
---*This method always makes an HTTP request.*
---
---@param id Channel-ID-Resolvable
---@return boolean|nil
---@return string error_msg
function Member:setVoiceChannel(id) end

---
---Mutes the member in its guild.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Member:mute() end

---
---Unmutes the member in its guild.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Member:unmute() end

---
---Deafens the member in its guild.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Member:deafen() end

---
---Undeafens the member in its guild.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Member:undeafen() end

---
---Equivalent to `Member.guild:kickUser(Member.user, reason)`
---
---*This method always makes an HTTP request.*
---
---@param reason? string
---@return boolean|nil
---@return string error_msg
function Member:kick(reason) end

---
---Equivalent to `Member.guild:banUser(Member.user, reason, days)`
---
---*This method always makes an HTTP request.*
---
---@param reason? string
---@param days? number
---@return boolean|nil
---@return string error_msg
function Member:ban(reason, days) end

---
---Equivalent to `Member.guild:unbanUser(Member.user, reason)`
---
---*This method always makes an HTTP request.*
---
---@param reason? string
---@return boolean|nil
---@return string error_msg
function Member:unban(reason) end

---
---Sets a timeout for a guild member. `duration` is either `Time` object or a `number` of seconds representing how long the timeout lasts. To set an expiration date, use `timeoutUntil` instead.
---
---*This method always makes an HTTP request.*
---
---@param duration Time|number
---@return boolean|nil
---@return string error_msg
function Member:timeoutFor(duration) end

---
---Sets a timeout for a guild member. `date` is either `Date` object or a UNIX epoch in seconds at which the member's timeout ends. To set a duration, use `timeoutFor` instead.
---
---*This method always makes an HTTP request.*
---
---@param date Date|number
---@return boolean|nil
---@return string error_msg
function Member:timeoutUntil(date) end

---
---Removes the timeout of the member.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Member:removeTimeout() end

