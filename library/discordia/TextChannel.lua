---@meta _

---
---Defines the base methods and properties for all Discord text channels.
---
---*This is an abstract base class. Direct instances should never exist.*
---
---@class TextChannel: Channel
---@field messages WeakCache # An iterable weak cache of all messages that are visible to the client. Messages that are not referenced elsewhere are eventually garbage collected. To access a message that may exist but is not cached, use `TextChannel:getMessage`.
---@overload fun(): TextChannel
local TextChannel = {}

---
---Gets a message object by ID. If the object is already cached, then the cached object will be returned; otherwise, an HTTP request is made.
---
---*This method may make an HTTP request.*
---
---@param id Message-ID-Resolvable
---@return Message|nil
---@return string error_msg
function TextChannel:getMessage(id) end
---@return nil, string error_msg
function TextChannel:getMessage(id) end

---
---Returns the first message found in the channel, if any exist. This is not a cache shortcut; an HTTP request is made each time this method is called.
---
---*This method always makes an HTTP request.*
---
---@return Message|nil
---@return string error_msg
function TextChannel:getFirstMessage() end

---
---Returns the last message found in the channel, if any exist. This is not a cache shortcut; an HTTP request is made each time this method is called.
---
---*This method always makes an HTTP request.*
---
---@return Message|nil
---@return string error_msg
function TextChannel:getLastMessage() end

---
---Returns a newly constructed cache of between 1 and 100 (default = 50) message objects found in the channel. While the cache will never automatically gain or lose objects, the objects that it contains may be updated by gateway events.
---
---*This method always makes an HTTP request.*
---
---@param limit? number
---@return SecondaryCache|nil
---@return string error_msg
function TextChannel:getMessages(limit) end

---
---Returns a newly constructed cache of between 1 and 100 (default = 50) message objects found in the channel after a specific id. While the cache will never automatically gain or lose objects, the objects that it contains may be updated by gateway events.
---
---*This method always makes an HTTP request.*
---
---@param id Message-ID-Resolvable
---@param limit? number
---@return SecondaryCache|nil
---@return string error_msg
function TextChannel:getMessagesAfter(id, limit) end

---
---Returns a newly constructed cache of between 1 and 100 (default = 50) message objects found in the channel before a specific id. While the cache will never automatically gain or lose objects, the objects that it contains may be updated by gateway events.
---
---*This method always makes an HTTP request.*
---
---@param id Message-ID-Resolvable
---@param limit? number
---@return SecondaryCache|nil
---@return string error_msg
function TextChannel:getMessagesBefore(id, limit) end

---
---Returns a newly constructed cache of between 1 and 100 (default = 50) message objects found in the channel around a specific point. While the cache will never automatically gain or lose objects, the objects that it contains may be updated by gateway events.
---
---*This method always makes an HTTP request.*
---
---@param id Message-ID-Resolvable
---@param limit? number
---@return SecondaryCache|nil
---@return string error_msg
function TextChannel:getMessagesAround(id, limit) end

---
---Returns a newly constructed cache of up to 50 messages that are pinned in the channel. While the cache will never automatically gain or lose objects, the objects that it contains may be updated by gateway events.
---
---*This method always makes an HTTP request.*
---
---@return SecondaryCache|nil
---@return string error_msg
function TextChannel:getPinnedMessages() end

---
---Indicates in the channel that the client's user "is typing".
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function TextChannel:broadcastTyping() end

---
---Sends a message to the channel. If `content` is a string, then this is simply sent as the message content. If it is a table, more advanced formatting is allowed. See [[managing messages]] for more information.
---
---*This method always makes an HTTP request.*
---
---@param content string|table
---@return Message|nil
---@return string error_msg
function TextChannel:send(content) end

---
---Sends a message to the channel with content formatted with `...` via `string.format`
---
---*This method always makes an HTTP request.*
---
---@param content string
---@param ... any
---@return Message|nil
---@return string error_msg
function TextChannel:sendf(content, ...) end

