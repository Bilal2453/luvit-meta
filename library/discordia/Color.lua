---@meta _

---
---Wrapper for 24-bit colors packed as a decimal value. See the static constructors for more information.
---
---@class Color
---@field value number # The raw decimal value that represents the color value.
---@field r number # The value that represents the color's red-level.
---@field g number # The value that represents the color's green-level.
---@field b number # The value that represents the color's blue-level.
---@overload fun(value: number): Color
local Color = {}

---
---Constructs a new Color object from a hexadecimal string. The string may or may not be prefixed by `#`; all other characters are interpreted as a hex string.
---
---@param hex string
---@return Color
function Color.fromHex(hex) end

---
---Constructs a new Color object from RGB values. Values are allowed to overflow though one component will not overflow to the next component.
---
---@param r number
---@param g number
---@param b number
---@return Color
function Color.fromRGB(r, g, b) end

---
---Constructs a new Color object from HSV values. Hue is allowed to overflow while saturation and value are clamped to [0, 1].
---
---@param h number
---@param s number
---@param v number
---@return Color
function Color.fromHSV(h, s, v) end

---
---Constructs a new Color object from HSL values. Hue is allowed to overflow while saturation and lightness are clamped to [0, 1].
---
---@param h number
---@param s number
---@param l number
---@return Color
function Color.fromHSL(h, s, l) end

---
---Returns a 6-digit hexadecimal string that represents the color value.
---
---*This method only operates on data in memory.*
---
---@return string
function Color:toHex() end

---
---Returns the red, green, and blue values that are packed into the color value.
---
---*This method only operates on data in memory.*
---
---@return number
---@return number
---@return number
function Color:toRGB() end

---
---Returns the hue, saturation, and value that represents the color value.
---
---*This method only operates on data in memory.*
---
---@return number
---@return number
---@return number
function Color:toHSV() end

---
---Returns the hue, saturation, and lightness that represents the color value.
---
---*This method only operates on data in memory.*
---
---@return number
---@return number
---@return number
function Color:toHSL() end

---
---Sets the color's red-level.
---
---*This method only operates on data in memory.*
---
---@return nil
function Color:setRed() end

---
---Sets the color's green-level.
---
---*This method only operates on data in memory.*
---
---@return nil
function Color:setGreen() end

---
---Sets the color's blue-level.
---
---*This method only operates on data in memory.*
---
---@return nil
function Color:setBlue() end

---
---Returns a new copy of the original color object.
---
---*This method only operates on data in memory.*
---
---@return Color
function Color:copy() end
