---@meta _

---
---Defines the base methods and/or properties for classes that represent a user's current presence information. Note that any method or property that exists for the User class is also available in the UserPresence class and its subclasses.
---
---*This is an abstract base class. Direct instances should never exist.*
---
---@class UserPresence: Container
---@field status string # The user's overall status (online, dnd, idle, offline).
---@field webStatus string # The user's web status (online, dnd, idle, offline).
---@field mobileStatus string # The user's mobile status (online, dnd, idle, offline).
---@field desktopStatus string # The user's desktop status (online, dnd, idle, offline).
---@field user User # The user that this presence represents.
---@field activity Activity|nil # The Activity that this presence represents.
---@overload fun(): UserPresence
local UserPresence = {}

---
---Returns `UserPresence.user.id`
---
---@return string
function UserPresence:__hash() end
