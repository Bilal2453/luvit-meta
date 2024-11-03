---@meta _

---
---Defines the base methods and properties for all Discord channel types.
---
---*This is an abstract base class. Direct instances should never exist.*
---
---@class Channel: Snowflake
---@field type number # The channel type. See the `channelType` enumeration for a human-readable representation.
---@field mentionString string # A string that, when included in a message content, may resolve as a link to a channel in the official Discord client.
---@overload fun(): Channel
local Channel = {}

