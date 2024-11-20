---@meta _

---
---Represents a sticker object.
---
---*Instances of this class should not be constructed by users.*
---
---@class Sticker: Snowflake
---@field name string # The name of the sticker.
---@field description string # The description of the sticker.
---@field tags string # The tags of the sticker.
---@field type number # The sticker format type.
---@field guild Guild # The guild in which the sticker exists.
---@field url string # The URL that can be used to view a full version of the sticker.
---@overload fun(): Sticker
local Sticker = {}

---
---Sets the stickers's name. The name must be between 2 and 30 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return boolean|nil
---@return string error_msg
function Sticker:setName(name) end

---
---Sets the stickers's description. The description must be between 2 and 30 characters in length.
---
---*This method always makes an HTTP request.*
---
---@param description string
---@return boolean|nil
---@return string error_msg
function Sticker:setDescription(description) end

---
---Sets the stickers's tags. The tags can only be up to 200 characters long.
---
---*This method always makes an HTTP request.*
---
---@param tags string
---@return boolean|nil
---@return string error_msg
function Sticker:setTags(tags) end

---
---Permanently deletes the sticker. This cannot be undone!
---
---*This method always makes an HTTP request.*
---
---@return boolean|nil
---@return string error_msg
function Sticker:delete() end
