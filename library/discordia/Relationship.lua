---@meta _

---
---Represents a relationship between the current user and another Discord user. This is generally either a friend or a blocked user. This class should only be relevant to user-accounts; bots cannot normally have relationships.
---
---*Instances of this class should not be constructed by users.*
---
---@class Relationship: UserPresence
---@field name string # Equivalent to `Relationship.user.username`.
---@field type number # The relationship type. See the `relationshipType` enumeration for a human-readable representation.
---@overload fun(): Relationship
local Relationship = {}

