---@meta _

---
---Wrapper for a bitfield that is more specifically used to represent Discord permissions. See the `permission` enumeration for acceptable permission values.
---
---@class Permissions
---@field value number # The raw decimal value that represents the permissions value.
---@overload fun(value?: number): Permissions
local Permissions = {}

---
---Returns a Permissions object with all of the defined permissions.
---
---@param ... Permission-Resolvables
---@return Permissions
function Permissions.fromMany(...) end

---
---Returns a Permissions object with all permissions.
---
---@return Permissions
function Permissions.all() end

---
---Defines the behavior of the `tostring` function. Returns a readable list of permissions stored for convenience of introspection.
---
---*This method only operates on data in memory.*
---
---@return string
function Permissions:__tostring() end

---
---Defines the behavior of the `==` operator. Allows permissions to be directly compared according to their value.
---
---*This method only operates on data in memory.*
---
---@return boolean
function Permissions:__eq() end

---
---Enables a specific permission or permissions. See the `permission` enumeration for acceptable permission values.
---
---*This method only operates on data in memory.*
---
---@param ... Permission-Resolvables
---@return nil
function Permissions:enable(...) end

---
---Disables a specific permission or permissions. See the `permission` enumeration for acceptable permission values.
---
---*This method only operates on data in memory.*
---
---@param ... Permission-Resolvables
---@return nil
function Permissions:disable(...) end

---
---Returns whether this set has a specific permission or permissions. See the `permission` enumeration for acceptable permission values.
---
---*This method only operates on data in memory.*
---
---@param ... Permission-Resolvables
---@return boolean
function Permissions:has(...) end

---
---Enables all permissions values.
---
---*This method only operates on data in memory.*
---
---@return nil
function Permissions:enableAll() end

---
---Disables all permissions values.
---
---*This method only operates on data in memory.*
---
---@return nil
function Permissions:disableAll() end

---
---Returns the hexadecimal string that represents the permissions value.
---
---*This method only operates on data in memory.*
---
---@return string
function Permissions:toHex() end

---
---Returns a table that represents the permissions value, where the keys are the permission names and the values are `true` or `false`.
---
---*This method only operates on data in memory.*
---
---@return table
function Permissions:toTable() end

---
---Returns an array of the names of the permissions that this object represents.
---
---*This method only operates on data in memory.*
---
---@return table
function Permissions:toArray() end

---
---Returns a new Permissions object that contains the permissions that are in either `self` or `other` (bitwise OR).
---
---*This method only operates on data in memory.*
---
---@param other Permissions
---@return Permissions
function Permissions:union(other) end

---
---Returns a new Permissions object that contains the permissions that are in both `self` and `other` (bitwise AND).
---
---*This method only operates on data in memory.*
---
---@param other Permissions
---@return Permissions
function Permissions:intersection(other) end

---
---Returns a new Permissions object that contains the permissions that are not in `self` or `other` (bitwise XOR).
---
---*This method only operates on data in memory.*
---
---@param other Permissions
---@return Permissions
function Permissions:difference(other) end

---
---Returns a new Permissions object that contains the permissions that are not in `self`, but are in `other` (or the set of all permissions if omitted).
---
---*This method only operates on data in memory.*
---
---@param other Permissions
---@return Permissions
function Permissions:complement(other) end

---
---Returns a new copy of the original permissions object.
---
---*This method only operates on data in memory.*
---
---@return Permissions
function Permissions:copy() end

