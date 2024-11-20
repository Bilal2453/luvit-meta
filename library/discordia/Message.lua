---@meta _

---
---Represents a text message sent in a Discord text channel. Messages can contain simple content strings, rich embeds, attachments, or reactions.
---
---*Instances of this class should not be constructed by users.*
---
---@class Message: Snowflake
---@field reactions Cache # An iterable cache of all reactions that exist for this message.
---@field mentionedUsers ArrayIterable # An iterable array of all users that are mentioned in this message.
---@field mentionedRoles ArrayIterable # An iterable array of known roles that are mentioned in this message, excluding the default everyone role. The message must be in a guild text channel and the roles must be cached in that channel's guild for them to appear here.
---@field mentionedEmojis ArrayIterable # An iterable array of all known emojis that are mentioned in this message. If the client does not have the emoji cached, then it will not appear here.
---@field mentionedChannels ArrayIterable # An iterable array of all known channels that are mentioned in this message. If the client does not have the channel cached, then it will not appear here.
---@field stickers ArrayIterable # An iterable array of all stickers that are sent in this message.
---@field sticker Sticker # The first sticker that is sent in this message.
---@field cleanContent string # The message content with all recognized mentions replaced by names and with @everyone and @here mentions escaped by a zero-width space (ZWSP).
---@field mentionsEveryone boolean # Whether this message mentions @everyone or @here.
---@field pinned boolean # Whether this message belongs to its channel's pinned messages.
---@field tts boolean # Whether this message is a text-to-speech message.
---@field nonce string|number|boolean|nil # Used by the official Discord client to detect the success of a sent message.
---@field editedTimestamp string|nil # The date and time at which the message was most recently edited, represented as an ISO 8601 string plus microseconds when available.
---@field oldContent {[string]: string} # Yields a table containing keys as timestamps and value as content of the message at that time.
---@field content string # The raw message content. This should be between 0 and 2000 characters in length.
---@field author User # The object of the user that created the message.
---@field channel TextChannel # The channel in which this message was sent.
---@field type discordia.enums.messageType_value # The message type. Use the `messageType` enumeration for a human-readable representation.
---@field embed discordia.aliases.Embed # A raw data table that represents the first rich embed that exists in this message. See the Discord documentation for more information.
---@field attachment discordia.aliases.Attachment # A raw data table that represents the first file attachment that exists in this message. See the Discord documentation for more information.
---@field embeds discordia.aliases.Embed[] # A raw data table that contains all embeds that exist for this message. If there are none, this table will not be present.
---@field attachments discordia.aliases.Attachment[] # A raw data table that contains all attachments that exist for this message. If there are none, this table will not be present.
---@field guild Guild|nil # The guild in which this message was sent. This will not exist if the message was not sent in a guild text channel. Equivalent to `Message.channel.guild`.
---@field member Member|nil # The member object of the message's author. This will not exist if the message is not sent in a guild text channel or if the member object is not cached. Equivalent to `Message.guild.members:get(Message.author.id)`.
---@field referencedMessage Message|nil # If available, the previous message that this current message references as seen in replies.
---@field link string # URL that can be used to jump-to the message in the Discord client.
---@field webhookId string|nil # The ID of the webhook that generated this message, if applicable.
---@overload fun(): Message
local Message = {}

---
---Sets the message's content. The message must be authored by the current user (ie: you cannot change the content of messages sent by other users). The content must be from 1 to 2000 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param content string
---@return boolean|nil
---@return string error_msg
function Message:setContent(content) end

---
---Sets the message's embed. The message must be authored by the current user. (ie: you cannot change the embed of messages sent by other users).
---
---*This method always makes an HTTP request.*
---
---@param embed discordia.aliases.Embed
---@return boolean|nil
---@return string error_msg
function Message:setEmbed(embed) end

---
---Hides all embeds for this message.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Message:hideEmbeds() end

---
---Shows all embeds for this message.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Message:showEmbeds() end

---
---Indicates whether the message has a particular flag set.
---
---*This method only operates on data in memory.*
---
---@param flag Message-Flag-Resolvable
---@return boolean
---@nodiscard
function Message:hasFlag(flag) end

---
---Sets multiple properties of the message at the same time using a table similar to the one supported by `TextChannel.send`, except only `content` and `embed(s)` are valid fields; `mention(s)`, `file(s)`, etc are not supported. The message must be authored by the current user. (ie: you cannot change the embed of messages sent by other users).
---
---*This method always makes an HTTP request.*
---
---@param data {content?: string, embed?: discordia.aliases.Embed, embeds?: discordia.aliases.Embed[]}
---@return boolean|nil
---@return string error_msg
function Message:update(data) end

---
---Pins the message in the channel.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Message:pin() end

---
---Unpins the message in the channel.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Message:unpin() end

---
---Adds a reaction to the message. Note that this does not return the new reaction object; wait for the `reactionAdd` event instead.
---
---*This method always makes an HTTP request.*
---
---@param emoji Emoji-Resolvable
---@return boolean|nil
---@return string error_msg
function Message:addReaction(emoji) end

---
---Removes a reaction from the message. Note that this does not return the old reaction object; wait for the `reactionRemove` event instead. If no user is indicated, then this will remove the current user's reaction.
---
---*This method always makes an HTTP request.*
---
---@param emoji Emoji-Resolvable
---@param id? User-ID-Resolvable
---@return boolean|nil
---@return string error_msg
function Message:removeReaction(emoji, id) end

---
---Removes all reactions from the message.
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Message:clearReactions() end

---
---Permanently deletes the message. This cannot be undone!
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Message:delete() end

---
---Equivalent to `Message.channel:send(content)`.
---
---*This method always makes an HTTP request.*
---
---@param content discordia.aliases.Channel.send
---@return Message|nil
---@return string error_msg
function Message:reply(content) end

---
---Publish this announcement message to all following channels. Returns the current Message object, for compatibility reasons.
---
---*This method always makes an HTTP request.*
---
---@return Message|nil
---@return string error_msg
function Message:crosspost() end
