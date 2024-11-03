---@meta _

---
---Represents a connection to a Discord voice server.
---
---*Instances of this class should not be constructed by users.*
---
---@class VoiceConnection
---@field channel GuildVoiceChannel|nil # The corresponding GuildVoiceChannel for this connection, if one exists.
---@overload fun(): VoiceConnection
local VoiceConnection = {}

---
---Returns the bitrate of the interal Opus encoder in bits per second (bps).
---
---*This method only operates on data in memory.*
---
---@return nil
function VoiceConnection:getBitrate() end

---
---Sets the bitrate of the interal Opus encoder in bits per second (bps). This should be between 8000 and 128000, inclusive.
---
---*This method only operates on data in memory.*
---
---@param bitrate number
---@return nil
function VoiceConnection:setBitrate(bitrate) end

---
---Returns the complexity of the interal Opus encoder.
---
---*This method only operates on data in memory.*
---
---@return number
function VoiceConnection:getComplexity() end

---
---Sets the complexity of the interal Opus encoder. This should be between 0 and 10, inclusive.
---
---*This method only operates on data in memory.*
---
---@param complexity number
---@return nil
function VoiceConnection:setComplexity(complexity) end

---
---Plays PCM data over the established connection. If a duration (in milliseconds) is provided, the audio stream will automatically stop after that time has elapsed; otherwise, it will play until the source is exhausted. The returned number is the time elapsed while streaming and the returned string is a message detailing the reason why the stream stopped. For more information about acceptable sources, see the [[voice]] page.
---
---*This method only operates on data in memory.*
---
---@param source string|function|table|userdata
---@param duration? number
---@return number
---@return string
function VoiceConnection:playPCM(source, duration) end

---
---Plays audio over the established connection using an FFmpeg process, assuming FFmpeg is properly configured. If a duration (in milliseconds) is provided, the audio stream will automatically stop after that time has elapsed; otherwise, it will play until the source is exhausted. The returned number is the time elapsed while streaming and the returned string is a message detailing the reason why the stream stopped. For more information about using FFmpeg, see the [[voice]] page.
---
---*This method only operates on data in memory.*
---
---@param path string
---@param duration? number
---@return number
---@return string
function VoiceConnection:playFFmpeg(path, duration) end

---
---Temporarily pauses the audio stream for this connection, if one is active. Like most Discordia methods, this must be called inside of a coroutine, as it will yield until the stream is actually paused, usually on the next tick.
---
---*This method only operates on data in memory.*
---
---@return nil
function VoiceConnection:pauseStream() end

---
---Resumes the audio stream for this connection, if one is active and paused. Like most Discordia methods, this must be called inside of a coroutine, as it will yield until the stream is actually resumed, usually on the next tick.
---
---*This method only operates on data in memory.*
---
---@return nil
function VoiceConnection:resumeStream() end

---
---Irreversibly stops the audio stream for this connection, if one is active. Like most Discordia methods, this must be called inside of a coroutine, as it will yield until the stream is actually stopped, usually on the next tick.
---
---*This method only operates on data in memory.*
---
---@return nil
function VoiceConnection:stopStream() end

---
---Stops the audio stream for this connection, if one is active, disconnects from the voice server, and leaves the corresponding voice channel. Like most Discordia methods, this must be called inside of a coroutine.
---
---*This method always makes a WebSocket request.*
---
---@return boolean
function VoiceConnection:close() end

