---@meta

---@class luvit.json.null
---@field __tojson fun(): string|'null'

---@class luvit.json
---Set to `true` in the copy of the module table that uses LPeg support.
---@field using_lpeg boolean
---The module version in the format `dkjson X.Y`.
---@field original_version string
---@field null luvit.json.null
local json = {}

---@alias json_encode_state {indent?: boolean, keyorder?: string|integer, level?: integer|boolean, buffer?: table, bufferlen?: integer, tables?: table<table, boolean>, exception?: fun(reason: "reference cycle"|"custom encoder failed"|"unsupported type", value: any, state: json_encode_state, defaultmessage: string)}

---
---Create a string representing the object. Object can be a table, a string, a number, a boolean, nil, json.null or any object with a function __tojson in its metatable. A table can only use strings and numbers as keys and its values have to be valid objects as well. It raises an error for any invalid data types or reference cycles.
---
---state is an optional table with the following fields:
---
--- * `indent`
---     When `indent` (a boolean) is set, the created string will contain newlines and indentations. Otherwise it will be one long line.
--- * `keyorder`
---     `keyorder` is an array to specify the ordering of keys in the encoded output. If an object has keys which are not in this array they are written after the sorted keys.
--- * `level`
---     This is the initial level of indentation used when `indent` is set. For each level two spaces are added. When absent it is set to 0.
--- * `buffer`
---     `buffer` is an array to store the strings for the result so they can be concatenated at once. When it isn't given, the encode function will create it temporary and will return the concatenated result.
--- * `bufferlen`
---     When `bufferlen` is set, it has to be the index of the last element of buffer.
--- * `tables`
---     `tables` is a set to detect reference cycles. It is created temporary when absent. Every table that is currently processed is used as key, the value is true.
--- * `exception`
---     When `exception` is given, it will be called whenever the encoder cannot encode a given value.
---     The parameters are `reason`, `value`, `state` and `defaultmessage`. `reason` is either `"reference cycle"`, `"custom encoder failed"` or `"unsupported type"`. `value` is the original value that caused the exception, `state` is this state table, `defaultmessage` is the message of the error that would usually be raised.
---     You can either return `true` and add directly to the buffer or you can return the string directly. To keep raising an error return `nil` and the desired error message.
---     An example implementation for an exception function is given in `json.encodeexception`.
---
---When `state.buffer` was set, the return value will be `true` on success. Without `state.buffer` the return value will be a string.
---
---@param object table|string|number|nil|luvit.json.null
---@param state? json_encode_state
---@return string|true result
---@nodiscard
function json.encode(object, state) end
json.stringify = json.encode

---
---Decode `string` starting at position or at 1 if `position` was omitted.
---
---`null` is an optional value to be returned for null values. The default is `nil`, but you could set it to `json.null` or any other value.
---
---The return values are the object or `nil`, the position of the next character that doesn't belong to the object, and in case of errors an error message.
---
---Two metatables are created. Every array or object that is decoded gets a metatable with the `__jsontype` field set to either `array` or `object`. If you want to provide your own metatables use the syntax
---
---`json.decode (string, position, null, objectmeta, arraymeta)`
---
---To prevent the assigning of metatables pass nil:
---
---`json.decode (string, position, null, nil)`
---
---@param string string
---@param position? integer
---@param null? any
---@param objectmeta? table
---@param arraymeta? table
---@return table|nil result, integer position, string? err_msg
---@nodiscard
---
function json.decode(string, position, null, objectmeta, arraymeta) end
json.parse = json.decode

---
---Quote a UTF-8 string and escape critical characters using JSON escape sequences.
---This function is only necessary when you build your own __tojson functions.
---
---@param string string
---@return string escaped_string
---@nodiscard
function json.quotestring(string) end

---
---When `state.indent` is set, add a newline to `state.buffer` and spaces according to `state.level`.
---
---@param state json_encode_state
function json.addnewline(state) end

---
---This function can be used as value to the exception option. Instead of raising an error this function encodes the error message as a string. This can help to debug malformed input data.
---
---`x = json.encode(value, { exception = json.encodeexception })`
---
---@param reason string
---@param value any
---@param state json_encode_state
---@param defaultmessage string
function json.encodeexception(reason, value, state, defaultmessage) end

---
---*Note*: By default, Luvit has its configuration to always use LPeg.
---
---Require the LPeg module and return a copy of the module table where the decode function was replaced by a version that uses LPeg:
---
---`json = require "json".use_lpeg()`
---
---Without the configuration to always use LPeg the original module table is unchanged and still available by calls to
---
---`json = require "json"`
---
---@return luvit.json
---@nodiscard
function json.use_lpeg() end

return json
