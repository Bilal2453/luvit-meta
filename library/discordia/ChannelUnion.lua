---@meta _

--- A fake type that represents the Channel classes you will be dealing with.
---@alias ChannelUnion GuildTextChannel|GuildVoiceChannel|PrivateChannel|GroupChannel|GuildCategoryChannel

--- A fake type that represents the Channel classes a guild can have.
---@alias GuildChannelUnion GuildTextChannel|GuildVoiceChannel|GuildCategoryChannel

--- A fake type that represents the Channel classes that can contain messages.
---@alias TextChannelUnion GuildTextChannel|PrivateChannel|GroupChannel
