---@meta _

---@alias discordia.aliases.Client.events
---|"ready" # Emitted after all shards and guilds are fully loaded.
---|"shardReady" # Emitted after a shard successfully connects to a Discord gateway and loads all corresponding guilds.
---|"shardResumed" # Emitted after the client successfully resumes a severed gateway connection.
---|"channelCreate" # Emitted when a guild channel is created, when a private channel is opened, or when a group channel is joined.
---|"channelUpdate" # Emitted when a channel property is updated, such as its name, topic, bitrate, etc.
---|"channelDelete" # Emitted when a guild channel is deleted, when a private channel is closed, or when a group channel is left.
---|"recipientAdd" # Emitted when a new recipient is added to a group channel. User-accounts only.
---|"recipientRemove" # Emitted when a new recipient is removed from a group channel. User-accounts only.
---|"guildAvailable" # Emitted when a guild becomes available. This can occur after a server outage or as guild data is streamed in after login.
---|"guildCreate" # Emitted when a guild is created from the perspective of the current user, usually after the client user joins a new one.
---|"guildUpdate" # Emitted when a guild property is updated such as its name, region, icon, etc.
---|"guildUnavailable" # Emitted when a guild becomes unavailable, potentially due to a server outage.  Unavailable guilds may lack significant data.
---|"guildDelete" # Emitted when a guild is deleted from the perspective of the current user, usually after the client leaves one.
---|"userBan" # Emitted when a user is banned from a guild.
---|"userUnban" # Emitted when a user is unbanned from a guild.
---|"emojisUpdate" # Emitted when a guild's custom emoji is updated.
---|"memberJoin" # Emitted when a new user joins a guild.
---|"memberLeave" # Emitted when a user leaves a guild.
---|"memberUpdate" # Emitted when a guild member property is updated, such as its roles or nickname. See [presenceUpdate](#presenceUpdate) for status changes.
---|"roleCreate" # Emitted when a guild role is created.
---|"roleUpdate" # Emitted when a guild role property is updated, such as its name, color, permissions, etc.
---|"roleDelete" # Emitted when a guild role is deleted.
---|"messageCreate" # Emitted when a text channel message is created.
---|"messageUpdate" # Emitted when the content of a text channel message is edited.
---|"messageUpdateUncached" # Emitted when the content of a text channel message is edited, but the message is not cached by the client.
---|"messageDelete" # Emitted when a text channel message is deleted. Bulk deletions will fire this for every message that is deleted.
---|"messageDeleteUncached" # Emitted when a text channel message is deleted, but the message is not cached by the client. Bulk deletions will fire this for every message that is deleted, but not cached.
---|"reactionAdd" # Emitted when an emoji reaction is added to message.
---|"reactionAddAny" # Emitted when an emoji reaction is added to message, whether the message is cached or not.
---|"reactionAddUncached" # Emitted when an emoji reaction is added to message, but the message is not cached by the client.
---|"reactionRemove" # Emitted when an emoji reaction is removed from a message.
---|"reactionRemoveAny" # Emitted when an emoji reaction is removed from a message, whether the message is cached or not.
---|"reactionRemoveUncached" # Emitted when an emoji reaction is removed from a message, but the message is not cached by the client.
---|"reactionRemoveAll" # Emitted when all emoji reactions are removed from a message.
---|"reactionRemoveAllAny" # Emitted when all emoji reactions are removed from a message, whether the message is cached or not.
---|"reactionRemoveAllUncached" # Emitted when all emoji reactions are removed from a message, but the message is not cached by the client.
---|"pinsUpdate" # Emitted when a message is pinned or unpinned in a channel.
---|"presenceUpdate" # Emitted when a guild member's status or user properties change. See [memberUpdate](#memberUpdate) for role and nickname changes.
---|"relationshipUpdate" # Emitted when a relationship's (friend, blocked user)  status or user properties change. User-accounts only.
---|"relationshipAdd" # Emitted when a relationship (friend, blocked user) is added. User-accounts only.
---|"relationshipRemove" # Emitted when a relationship (friend, blocked user) is removed. User-accounts only.
---|"typingStart" # Emitted when a user starts typing in a text channel.
---|"userUpdate" # Emitted when the client user updates itself.
---|"voiceConnect" # Emitted when a guild member connects to voice chat.
---|"voiceDisconnect" # Emitted when a guild member disconnects from voice chat.
---|"voiceUpdate" # Emitted when a guild member's mute/deaf status changes.
---|"voiceChannelJoin" # Emitted when a guild member joins a voice channel.
---|"voiceChannelLeave" # Emitted when a guild member leaves a voice channel.
---|"webhooksUpdate" # Emitted when a guild's text channel's webhooks have updated.
---|"debug" # Emitted to provide detailed information regarding specific library behavior.
---|"info" # Emitted to provide helpful information regarding general library behavior.
---|"warning" # Emitted when something went wrong, but your code will probably continue operating normally.
---|"error" # Emitted when something went wrong and your code may not continue operating normally.
---|"heartbeat" # Emitted when Discord responds with a heartbeat acknowledgement.
---|"raw" # Emitted for every Discord gateway event.
---|string # The event name.

---
---The main point of entry into a Discordia application. All data relevant to Discord is accessible through a client instance or its child objects after a connection to Discord is established with the `run` method. In other words, client data should not be expected and most client methods should not be called until after the `ready` event is received. Base emitter methods may be called at any time. See [[client options]].
---
---@class Client: Emitter
---@field shardCount number|nil # The number of shards that this client is managing.
---@field totalShardCount number|nil # The total number of shards that the current user is on.
---@field user User|nil # User object representing the current user.
---@field owner User|nil # User object representing the current user's owner.
---@field verified boolean|nil # Whether the current user's owner's account is verified.
---@field mfaEnabled boolean|nil # Whether the current user's owner's account has multi-factor (or two-factor) authentication enabled. This is equivalent to `verified`
---@field email string|nil # The current user's owner's account's email address (user-accounts only).
---@field guilds Cache # An iterable cache of all guilds that are visible to the client. Note that the guilds present here correspond to which shards the client is managing. If all shards are managed by one client, then all guilds will be present.
---@field users Cache # An iterable cache of all users that are visible to the client. To access a user that may exist but is not cached, use `Client:getUser`.
---@field privateChannels Cache # An iterable cache of all private channels that are visible to the client. The channel must exist and must be open for it to be cached here. To access a private channel that may exist but is not cached, `User:getPrivateChannel`.
---@field groupChannels Cache # An iterable cache of all group channels that are visible to the client. Only user-accounts should have these.
---@field relationships Cache # An iterable cache of all relationships that are visible to the client. Only user-accounts should have these.
---@field emit fun(self: self, name: discordia.aliases.Client.events, ...: any) # Emits the named event and a variable number of arguments to pass to the event callbacks.<br><br>*This method only operates on data in memory.*
---@field on fun(self: self, name: discordia.aliases.Client.events, fn: async function): function # Subscribes a callback to be called every time the named event is emitted. Callbacks registered with this method will automatically be wrapped as a new coroutine when they are called. Returns the original callback for convenience.
---@field once fun(self: self, name: discordia.aliases.Client.events, fn: async function): function # Subscribes a callback to be called only the first time this event is emitted. Callbacks registered with this method will automatically be wrapped as a new coroutine when they are called. Returns the original callback for convenience.
---@field onSync fun(self: self, name: discordia.aliases.Client.events, fn: function): function # Subscribes a callback to be called every time the named event is emitted. Callbacks registered with this method are not automatically wrapped as a coroutine. Returns the original callback for convenience.
---@field onceSync fun(self: self, name: discordia.aliases.Client.events, fn: function): function # Subscribes a callback to be called only the first time this event is emitted. Callbacks registered with this method are not automatically wrapped as a coroutine. Returns the original callback for convenience.
---@field on fun(self: self, name: "ready", fn: async fun():(any)): function # Emitted after all shards and guilds are fully loaded.
---@field once fun(self: self, name: "ready", fn: async fun():(any)): function # Emitted after all shards and guilds are fully loaded.
---@field onSync fun(self: self, name: "ready", fn: fun():(any)): function # Emitted after all shards and guilds are fully loaded.
---@field onceSync fun(self: self, name: "ready", fn: fun():(any)): function # Emitted after all shards and guilds are fully loaded.
---@field on fun(self: self, name: "shardReady", fn: async fun(shardId: string):(any)): function # Emitted after a shard successfully connects to a Discord gateway and loads all corresponding guilds.
---@field once fun(self: self, name: "shardReady", fn: async fun(shardId: string):(any)): function # Emitted after a shard successfully connects to a Discord gateway and loads all corresponding guilds.
---@field onSync fun(self: self, name: "shardReady", fn: fun(shardId: string):(any)): function # Emitted after a shard successfully connects to a Discord gateway and loads all corresponding guilds.
---@field onceSync fun(self: self, name: "shardReady", fn: fun(shardId: string):(any)): function # Emitted after a shard successfully connects to a Discord gateway and loads all corresponding guilds.
---@field on fun(self: self, name: "shardResumed", fn: async fun(shardId: string):(any)): function # Emitted after the client successfully resumes a severed gateway connection.
---@field once fun(self: self, name: "shardResumed", fn: async fun(shardId: string):(any)): function # Emitted after the client successfully resumes a severed gateway connection.
---@field onSync fun(self: self, name: "shardResumed", fn: fun(shardId: string):(any)): function # Emitted after the client successfully resumes a severed gateway connection.
---@field onceSync fun(self: self, name: "shardResumed", fn: fun(shardId: string):(any)): function # Emitted after the client successfully resumes a severed gateway connection.
---@field on fun(self: self, name: "channelCreate", fn: async fun(channel: ChannelUnion):(any)): function # Emitted when a guild channel is created, when a private channel is opened, or when a group channel is joined.
---@field once fun(self: self, name: "channelCreate", fn: async fun(channel: ChannelUnion):(any)): function # Emitted when a guild channel is created, when a private channel is opened, or when a group channel is joined.
---@field onSync fun(self: self, name: "channelCreate", fn: fun(channel: ChannelUnion):(any)): function # Emitted when a guild channel is created, when a private channel is opened, or when a group channel is joined.
---@field onceSync fun(self: self, name: "channelCreate", fn: fun(channel: ChannelUnion):(any)): function # Emitted when a guild channel is created, when a private channel is opened, or when a group channel is joined.
---@field on fun(self: self, name: "channelUpdate", fn: async fun(channel: ChannelUnion):(any)): function # Emitted when a channel property is updated, such as its name, topic, bitrate, etc.
---@field once fun(self: self, name: "channelUpdate", fn: async fun(channel: ChannelUnion):(any)): function # Emitted when a channel property is updated, such as its name, topic, bitrate, etc.
---@field onSync fun(self: self, name: "channelUpdate", fn: fun(channel: ChannelUnion):(any)): function # Emitted when a channel property is updated, such as its name, topic, bitrate, etc.
---@field onceSync fun(self: self, name: "channelUpdate", fn: fun(channel: ChannelUnion):(any)): function # Emitted when a channel property is updated, such as its name, topic, bitrate, etc.
---@field on fun(self: self, name: "channelDelete", fn: async fun(channel: ChannelUnion):(any)): function # Emitted when a guild channel is deleted, when a private channel is closed, or when a group channel is left.
---@field once fun(self: self, name: "channelDelete", fn: async fun(channel: ChannelUnion):(any)): function # Emitted when a guild channel is deleted, when a private channel is closed, or when a group channel is left.
---@field onSync fun(self: self, name: "channelDelete", fn: fun(channel: ChannelUnion):(any)): function # Emitted when a guild channel is deleted, when a private channel is closed, or when a group channel is left.
---@field onceSync fun(self: self, name: "channelDelete", fn: fun(channel: ChannelUnion):(any)): function # Emitted when a guild channel is deleted, when a private channel is closed, or when a group channel is left.
---@field on fun(self: self, name: "recipientAdd", fn: async fun(channel: GroupChannel, user: User):(any)): function # Emitted when a new recipient is added to a group channel. User-accounts only.
---@field once fun(self: self, name: "recipientAdd", fn: async fun(channel: GroupChannel, user: User):(any)): function # Emitted when a new recipient is added to a group channel. User-accounts only.
---@field onSync fun(self: self, name: "recipientAdd", fn: fun(channel: GroupChannel, user: User):(any)): function # Emitted when a new recipient is added to a group channel. User-accounts only.
---@field onceSync fun(self: self, name: "recipientAdd", fn: fun(channel: GroupChannel, user: User):(any)): function # Emitted when a new recipient is added to a group channel. User-accounts only.
---@field on fun(self: self, name: "recipientRemove", fn: async fun(channel: GroupChannel, user: User):(any)): function # Emitted when a new recipient is removed from a group channel. User-accounts only.
---@field once fun(self: self, name: "recipientRemove", fn: async fun(channel: GroupChannel, user: User):(any)): function # Emitted when a new recipient is removed from a group channel. User-accounts only.
---@field onSync fun(self: self, name: "recipientRemove", fn: fun(channel: GroupChannel, user: User):(any)): function # Emitted when a new recipient is removed from a group channel. User-accounts only.
---@field onceSync fun(self: self, name: "recipientRemove", fn: fun(channel: GroupChannel, user: User):(any)): function # Emitted when a new recipient is removed from a group channel. User-accounts only.
---@field on fun(self: self, name: "guildAvailable", fn: async fun(guild: Guild):(any)): function # Emitted when a guild becomes available. This can occur after a server outage or as guild data is streamed in after login.
---@field once fun(self: self, name: "guildAvailable", fn: async fun(guild: Guild):(any)): function # Emitted when a guild becomes available. This can occur after a server outage or as guild data is streamed in after login.
---@field onSync fun(self: self, name: "guildAvailable", fn: fun(guild: Guild):(any)): function # Emitted when a guild becomes available. This can occur after a server outage or as guild data is streamed in after login.
---@field onceSync fun(self: self, name: "guildAvailable", fn: fun(guild: Guild):(any)): function # Emitted when a guild becomes available. This can occur after a server outage or as guild data is streamed in after login.
---@field on fun(self: self, name: "guildCreate", fn: async fun(guild: Guild):(any)): function # Emitted when a guild is created from the perspective of the current user, usually after the client user joins a new one.
---@field once fun(self: self, name: "guildCreate", fn: async fun(guild: Guild):(any)): function # Emitted when a guild is created from the perspective of the current user, usually after the client user joins a new one.
---@field onSync fun(self: self, name: "guildCreate", fn: fun(guild: Guild):(any)): function # Emitted when a guild is created from the perspective of the current user, usually after the client user joins a new one.
---@field onceSync fun(self: self, name: "guildCreate", fn: fun(guild: Guild):(any)): function # Emitted when a guild is created from the perspective of the current user, usually after the client user joins a new one.
---@field on fun(self: self, name: "guildUpdate", fn: async fun(guild: Guild):(any)): function # Emitted when a guild property is updated such as its name, region, icon, etc.
---@field once fun(self: self, name: "guildUpdate", fn: async fun(guild: Guild):(any)): function # Emitted when a guild property is updated such as its name, region, icon, etc.
---@field onSync fun(self: self, name: "guildUpdate", fn: fun(guild: Guild):(any)): function # Emitted when a guild property is updated such as its name, region, icon, etc.
---@field onceSync fun(self: self, name: "guildUpdate", fn: fun(guild: Guild):(any)): function # Emitted when a guild property is updated such as its name, region, icon, etc.
---@field on fun(self: self, name: "guildUnavailable", fn: async fun(guild: Guild):(any)): function # Emitted when a guild becomes unavailable, potentially due to a server outage.  Unavailable guilds may lack significant data.
---@field once fun(self: self, name: "guildUnavailable", fn: async fun(guild: Guild):(any)): function # Emitted when a guild becomes unavailable, potentially due to a server outage.  Unavailable guilds may lack significant data.
---@field onSync fun(self: self, name: "guildUnavailable", fn: fun(guild: Guild):(any)): function # Emitted when a guild becomes unavailable, potentially due to a server outage.  Unavailable guilds may lack significant data.
---@field onceSync fun(self: self, name: "guildUnavailable", fn: fun(guild: Guild):(any)): function # Emitted when a guild becomes unavailable, potentially due to a server outage.  Unavailable guilds may lack significant data.
---@field on fun(self: self, name: "guildDelete", fn: async fun(guild: Guild):(any)): function # Emitted when a guild is deleted from the perspective of the current user, usually after the client leaves one.
---@field once fun(self: self, name: "guildDelete", fn: async fun(guild: Guild):(any)): function # Emitted when a guild is deleted from the perspective of the current user, usually after the client leaves one.
---@field onSync fun(self: self, name: "guildDelete", fn: fun(guild: Guild):(any)): function # Emitted when a guild is deleted from the perspective of the current user, usually after the client leaves one.
---@field onceSync fun(self: self, name: "guildDelete", fn: fun(guild: Guild):(any)): function # Emitted when a guild is deleted from the perspective of the current user, usually after the client leaves one.
---@field on fun(self: self, name: "userBan", fn: async fun(user: User, guild: Guild):(any)): function # Emitted when a user is banned from a guild.
---@field once fun(self: self, name: "userBan", fn: async fun(user: User, guild: Guild):(any)): function # Emitted when a user is banned from a guild.
---@field onSync fun(self: self, name: "userBan", fn: fun(user: User, guild: Guild):(any)): function # Emitted when a user is banned from a guild.
---@field onceSync fun(self: self, name: "userBan", fn: fun(user: User, guild: Guild):(any)): function # Emitted when a user is banned from a guild.
---@field on fun(self: self, name: "userUnban", fn: async fun(user: User, guild: Guild):(any)): function # Emitted when a user is unbanned from a guild.
---@field once fun(self: self, name: "userUnban", fn: async fun(user: User, guild: Guild):(any)): function # Emitted when a user is unbanned from a guild.
---@field onSync fun(self: self, name: "userUnban", fn: fun(user: User, guild: Guild):(any)): function # Emitted when a user is unbanned from a guild.
---@field onceSync fun(self: self, name: "userUnban", fn: fun(user: User, guild: Guild):(any)): function # Emitted when a user is unbanned from a guild.
---@field on fun(self: self, name: "emojisUpdate", fn: async fun(guild: Guild):(any)): function # Emitted when a guild's custom emoji is updated.
---@field once fun(self: self, name: "emojisUpdate", fn: async fun(guild: Guild):(any)): function # Emitted when a guild's custom emoji is updated.
---@field onSync fun(self: self, name: "emojisUpdate", fn: fun(guild: Guild):(any)): function # Emitted when a guild's custom emoji is updated.
---@field onceSync fun(self: self, name: "emojisUpdate", fn: fun(guild: Guild):(any)): function # Emitted when a guild's custom emoji is updated.
---@field on fun(self: self, name: "memberJoin", fn: async fun(member: Member):(any)): function # Emitted when a new user joins a guild.
---@field once fun(self: self, name: "memberJoin", fn: async fun(member: Member):(any)): function # Emitted when a new user joins a guild.
---@field onSync fun(self: self, name: "memberJoin", fn: fun(member: Member):(any)): function # Emitted when a new user joins a guild.
---@field onceSync fun(self: self, name: "memberJoin", fn: fun(member: Member):(any)): function # Emitted when a new user joins a guild.
---@field on fun(self: self, name: "memberLeave", fn: async fun(member: Member):(any)): function # Emitted when a user leaves a guild.
---@field once fun(self: self, name: "memberLeave", fn: async fun(member: Member):(any)): function # Emitted when a user leaves a guild.
---@field onSync fun(self: self, name: "memberLeave", fn: fun(member: Member):(any)): function # Emitted when a user leaves a guild.
---@field onceSync fun(self: self, name: "memberLeave", fn: fun(member: Member):(any)): function # Emitted when a user leaves a guild.
---@field on fun(self: self, name: "memberUpdate", fn: async fun(member: Member):(any)): function # Emitted when a guild member property is updated, such as its roles or nickname. See [presenceUpdate](#presenceUpdate) for status changes.
---@field once fun(self: self, name: "memberUpdate", fn: async fun(member: Member):(any)): function # Emitted when a guild member property is updated, such as its roles or nickname. See [presenceUpdate](#presenceUpdate) for status changes.
---@field onSync fun(self: self, name: "memberUpdate", fn: fun(member: Member):(any)): function # Emitted when a guild member property is updated, such as its roles or nickname. See [presenceUpdate](#presenceUpdate) for status changes.
---@field onceSync fun(self: self, name: "memberUpdate", fn: fun(member: Member):(any)): function # Emitted when a guild member property is updated, such as its roles or nickname. See [presenceUpdate](#presenceUpdate) for status changes.
---@field on fun(self: self, name: "roleCreate", fn: async fun(role: Role):(any)): function # Emitted when a guild role is created.
---@field once fun(self: self, name: "roleCreate", fn: async fun(role: Role):(any)): function # Emitted when a guild role is created.
---@field onSync fun(self: self, name: "roleCreate", fn: fun(role: Role):(any)): function # Emitted when a guild role is created.
---@field onceSync fun(self: self, name: "roleCreate", fn: fun(role: Role):(any)): function # Emitted when a guild role is created.
---@field on fun(self: self, name: "roleUpdate", fn: async fun(role: Role):(any)): function # Emitted when a guild role property is updated, such as its name, color, permissions, etc.
---@field once fun(self: self, name: "roleUpdate", fn: async fun(role: Role):(any)): function # Emitted when a guild role property is updated, such as its name, color, permissions, etc.
---@field onSync fun(self: self, name: "roleUpdate", fn: fun(role: Role):(any)): function # Emitted when a guild role property is updated, such as its name, color, permissions, etc.
---@field onceSync fun(self: self, name: "roleUpdate", fn: fun(role: Role):(any)): function # Emitted when a guild role property is updated, such as its name, color, permissions, etc.
---@field on fun(self: self, name: "roleDelete", fn: async fun(role: Role):(any)): function # Emitted when a guild role is deleted.
---@field once fun(self: self, name: "roleDelete", fn: async fun(role: Role):(any)): function # Emitted when a guild role is deleted.
---@field onSync fun(self: self, name: "roleDelete", fn: fun(role: Role):(any)): function # Emitted when a guild role is deleted.
---@field onceSync fun(self: self, name: "roleDelete", fn: fun(role: Role):(any)): function # Emitted when a guild role is deleted.
---@field on fun(self: self, name: "messageCreate", fn: async fun(message: Message):(any)): function # Emitted when a text channel message is created.
---@field once fun(self: self, name: "messageCreate", fn: async fun(message: Message):(any)): function # Emitted when a text channel message is created.
---@field onSync fun(self: self, name: "messageCreate", fn: fun(message: Message):(any)): function # Emitted when a text channel message is created.
---@field onceSync fun(self: self, name: "messageCreate", fn: fun(message: Message):(any)): function # Emitted when a text channel message is created.
---@field on fun(self: self, name: "messageUpdate", fn: async fun(message: Message):(any)): function # Emitted when the content of a text channel message is edited.
---@field once fun(self: self, name: "messageUpdate", fn: async fun(message: Message):(any)): function # Emitted when the content of a text channel message is edited.
---@field onSync fun(self: self, name: "messageUpdate", fn: fun(message: Message):(any)): function # Emitted when the content of a text channel message is edited.
---@field onceSync fun(self: self, name: "messageUpdate", fn: fun(message: Message):(any)): function # Emitted when the content of a text channel message is edited.
---@field on fun(self: self, name: "messageUpdateUncached", fn: async fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when the content of a text channel message is edited, but the message is not cached by the client.
---@field once fun(self: self, name: "messageUpdateUncached", fn: async fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when the content of a text channel message is edited, but the message is not cached by the client.
---@field onSync fun(self: self, name: "messageUpdateUncached", fn: fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when the content of a text channel message is edited, but the message is not cached by the client.
---@field onceSync fun(self: self, name: "messageUpdateUncached", fn: fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when the content of a text channel message is edited, but the message is not cached by the client.
---@field on fun(self: self, name: "messageDelete", fn: async fun(message: Message):(any)): function # Emitted when a text channel message is deleted. Bulk deletions will fire this for every message that is deleted.
---@field once fun(self: self, name: "messageDelete", fn: async fun(message: Message):(any)): function # Emitted when a text channel message is deleted. Bulk deletions will fire this for every message that is deleted.
---@field onSync fun(self: self, name: "messageDelete", fn: fun(message: Message):(any)): function # Emitted when a text channel message is deleted. Bulk deletions will fire this for every message that is deleted.
---@field onceSync fun(self: self, name: "messageDelete", fn: fun(message: Message):(any)): function # Emitted when a text channel message is deleted. Bulk deletions will fire this for every message that is deleted.
---@field on fun(self: self, name: "messageDeleteUncached", fn: async fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when a text channel message is deleted, but the message is not cached by the client. Bulk deletions will fire this for every message that is deleted, but not cached.
---@field once fun(self: self, name: "messageDeleteUncached", fn: async fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when a text channel message is deleted, but the message is not cached by the client. Bulk deletions will fire this for every message that is deleted, but not cached.
---@field onSync fun(self: self, name: "messageDeleteUncached", fn: fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when a text channel message is deleted, but the message is not cached by the client. Bulk deletions will fire this for every message that is deleted, but not cached.
---@field onceSync fun(self: self, name: "messageDeleteUncached", fn: fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when a text channel message is deleted, but the message is not cached by the client. Bulk deletions will fire this for every message that is deleted, but not cached.
---@field on fun(self: self, name: "reactionAdd", fn: async fun(reaction: Reaction, userId: string):(any)): function # Emitted when an emoji reaction is added to message.
---@field once fun(self: self, name: "reactionAdd", fn: async fun(reaction: Reaction, userId: string):(any)): function # Emitted when an emoji reaction is added to message.
---@field onSync fun(self: self, name: "reactionAdd", fn: fun(reaction: Reaction, userId: string):(any)): function # Emitted when an emoji reaction is added to message.
---@field onceSync fun(self: self, name: "reactionAdd", fn: fun(reaction: Reaction, userId: string):(any)): function # Emitted when an emoji reaction is added to message.
---@field on fun(self: self, name: "reactionAddAny", fn: async fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is added to message, whether the message is cached or not.
---@field once fun(self: self, name: "reactionAddAny", fn: async fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is added to message, whether the message is cached or not.
---@field onSync fun(self: self, name: "reactionAddAny", fn: fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is added to message, whether the message is cached or not.
---@field onceSync fun(self: self, name: "reactionAddAny", fn: fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is added to message, whether the message is cached or not.
---@field on fun(self: self, name: "reactionAddUncached", fn: async fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is added to message, but the message is not cached by the client.
---@field once fun(self: self, name: "reactionAddUncached", fn: async fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is added to message, but the message is not cached by the client.
---@field onSync fun(self: self, name: "reactionAddUncached", fn: fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is added to message, but the message is not cached by the client.
---@field onceSync fun(self: self, name: "reactionAddUncached", fn: fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is added to message, but the message is not cached by the client.
---@field on fun(self: self, name: "reactionRemove", fn: async fun(reaction: Reaction, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message.
---@field once fun(self: self, name: "reactionRemove", fn: async fun(reaction: Reaction, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message.
---@field onSync fun(self: self, name: "reactionRemove", fn: fun(reaction: Reaction, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message.
---@field onceSync fun(self: self, name: "reactionRemove", fn: fun(reaction: Reaction, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message.
---@field on fun(self: self, name: "reactionRemoveAny", fn: async fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message, whether the message is cached or not.
---@field once fun(self: self, name: "reactionRemoveAny", fn: async fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message, whether the message is cached or not.
---@field onSync fun(self: self, name: "reactionRemoveAny", fn: fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message, whether the message is cached or not.
---@field onceSync fun(self: self, name: "reactionRemoveAny", fn: fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message, whether the message is cached or not.
---@field on fun(self: self, name: "reactionRemoveUncached", fn: async fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message, but the message is not cached by the client.
---@field once fun(self: self, name: "reactionRemoveUncached", fn: async fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message, but the message is not cached by the client.
---@field onSync fun(self: self, name: "reactionRemoveUncached", fn: fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message, but the message is not cached by the client.
---@field onceSync fun(self: self, name: "reactionRemoveUncached", fn: fun(channel: TextChannelUnion, messageId: string, hash: string, userId: string):(any)): function # Emitted when an emoji reaction is removed from a message, but the message is not cached by the client.
---@field on fun(self: self, name: "reactionRemoveAll", fn: async fun(message: Message):(any)): function # Emitted when all emoji reactions are removed from a message.
---@field once fun(self: self, name: "reactionRemoveAll", fn: async fun(message: Message):(any)): function # Emitted when all emoji reactions are removed from a message.
---@field onSync fun(self: self, name: "reactionRemoveAll", fn: fun(message: Message):(any)): function # Emitted when all emoji reactions are removed from a message.
---@field onceSync fun(self: self, name: "reactionRemoveAll", fn: fun(message: Message):(any)): function # Emitted when all emoji reactions are removed from a message.
---@field on fun(self: self, name: "reactionRemoveAllAny", fn: async fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when all emoji reactions are removed from a message, whether the message is cached or not.
---@field once fun(self: self, name: "reactionRemoveAllAny", fn: async fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when all emoji reactions are removed from a message, whether the message is cached or not.
---@field onSync fun(self: self, name: "reactionRemoveAllAny", fn: fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when all emoji reactions are removed from a message, whether the message is cached or not.
---@field onceSync fun(self: self, name: "reactionRemoveAllAny", fn: fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when all emoji reactions are removed from a message, whether the message is cached or not.
---@field on fun(self: self, name: "reactionRemoveAllUncached", fn: async fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when all emoji reactions are removed from a message, but the message is not cached by the client.
---@field once fun(self: self, name: "reactionRemoveAllUncached", fn: async fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when all emoji reactions are removed from a message, but the message is not cached by the client.
---@field onSync fun(self: self, name: "reactionRemoveAllUncached", fn: fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when all emoji reactions are removed from a message, but the message is not cached by the client.
---@field onceSync fun(self: self, name: "reactionRemoveAllUncached", fn: fun(channel: TextChannelUnion, messageId: string):(any)): function # Emitted when all emoji reactions are removed from a message, but the message is not cached by the client.
---@field on fun(self: self, name: "pinsUpdate", fn: async fun(channel: TextChannelUnion):(any)): function # Emitted when a message is pinned or unpinned in a channel.
---@field once fun(self: self, name: "pinsUpdate", fn: async fun(channel: TextChannelUnion):(any)): function # Emitted when a message is pinned or unpinned in a channel.
---@field onSync fun(self: self, name: "pinsUpdate", fn: fun(channel: TextChannelUnion):(any)): function # Emitted when a message is pinned or unpinned in a channel.
---@field onceSync fun(self: self, name: "pinsUpdate", fn: fun(channel: TextChannelUnion):(any)): function # Emitted when a message is pinned or unpinned in a channel.
---@field on fun(self: self, name: "presenceUpdate", fn: async fun(member: Member):(any)): function # Emitted when a guild member's status or user properties change. See [memberUpdate](#memberUpdate) for role and nickname changes.
---@field once fun(self: self, name: "presenceUpdate", fn: async fun(member: Member):(any)): function # Emitted when a guild member's status or user properties change. See [memberUpdate](#memberUpdate) for role and nickname changes.
---@field onSync fun(self: self, name: "presenceUpdate", fn: fun(member: Member):(any)): function # Emitted when a guild member's status or user properties change. See [memberUpdate](#memberUpdate) for role and nickname changes.
---@field onceSync fun(self: self, name: "presenceUpdate", fn: fun(member: Member):(any)): function # Emitted when a guild member's status or user properties change. See [memberUpdate](#memberUpdate) for role and nickname changes.
---@field on fun(self: self, name: "relationshipUpdate", fn: async fun(relationship: Relationship):(any)): function # Emitted when a relationship's (friend, blocked user)  status or user properties change. User-accounts only.
---@field once fun(self: self, name: "relationshipUpdate", fn: async fun(relationship: Relationship):(any)): function # Emitted when a relationship's (friend, blocked user)  status or user properties change. User-accounts only.
---@field onSync fun(self: self, name: "relationshipUpdate", fn: fun(relationship: Relationship):(any)): function # Emitted when a relationship's (friend, blocked user)  status or user properties change. User-accounts only.
---@field onceSync fun(self: self, name: "relationshipUpdate", fn: fun(relationship: Relationship):(any)): function # Emitted when a relationship's (friend, blocked user)  status or user properties change. User-accounts only.
---@field on fun(self: self, name: "relationshipAdd", fn: async fun(relationship: Relationship):(any)): function # Emitted when a relationship (friend, blocked user) is added. User-accounts only.
---@field once fun(self: self, name: "relationshipAdd", fn: async fun(relationship: Relationship):(any)): function # Emitted when a relationship (friend, blocked user) is added. User-accounts only.
---@field onSync fun(self: self, name: "relationshipAdd", fn: fun(relationship: Relationship):(any)): function # Emitted when a relationship (friend, blocked user) is added. User-accounts only.
---@field onceSync fun(self: self, name: "relationshipAdd", fn: fun(relationship: Relationship):(any)): function # Emitted when a relationship (friend, blocked user) is added. User-accounts only.
---@field on fun(self: self, name: "relationshipRemove", fn: async fun(relationship: Relationship):(any)): function # Emitted when a relationship (friend, blocked user) is removed. User-accounts only.
---@field once fun(self: self, name: "relationshipRemove", fn: async fun(relationship: Relationship):(any)): function # Emitted when a relationship (friend, blocked user) is removed. User-accounts only.
---@field onSync fun(self: self, name: "relationshipRemove", fn: fun(relationship: Relationship):(any)): function # Emitted when a relationship (friend, blocked user) is removed. User-accounts only.
---@field onceSync fun(self: self, name: "relationshipRemove", fn: fun(relationship: Relationship):(any)): function # Emitted when a relationship (friend, blocked user) is removed. User-accounts only.
---@field on fun(self: self, name: "typingStart", fn: async fun(userId: string, channelId: string, timestamp: string):(any)): function # Emitted when a user starts typing in a text channel.
---@field once fun(self: self, name: "typingStart", fn: async fun(userId: string, channelId: string, timestamp: string):(any)): function # Emitted when a user starts typing in a text channel.
---@field onSync fun(self: self, name: "typingStart", fn: fun(userId: string, channelId: string, timestamp: string):(any)): function # Emitted when a user starts typing in a text channel.
---@field onceSync fun(self: self, name: "typingStart", fn: fun(userId: string, channelId: string, timestamp: string):(any)): function # Emitted when a user starts typing in a text channel.
---@field on fun(self: self, name: "userUpdate", fn: async fun(user: User):(any)): function # Emitted when the client user updates itself.
---@field once fun(self: self, name: "userUpdate", fn: async fun(user: User):(any)): function # Emitted when the client user updates itself.
---@field onSync fun(self: self, name: "userUpdate", fn: fun(user: User):(any)): function # Emitted when the client user updates itself.
---@field onceSync fun(self: self, name: "userUpdate", fn: fun(user: User):(any)): function # Emitted when the client user updates itself.
---@field on fun(self: self, name: "voiceConnect", fn: async fun(member: Member):(any)): function # Emitted when a guild member connects to voice chat.
---@field once fun(self: self, name: "voiceConnect", fn: async fun(member: Member):(any)): function # Emitted when a guild member connects to voice chat.
---@field onSync fun(self: self, name: "voiceConnect", fn: fun(member: Member):(any)): function # Emitted when a guild member connects to voice chat.
---@field onceSync fun(self: self, name: "voiceConnect", fn: fun(member: Member):(any)): function # Emitted when a guild member connects to voice chat.
---@field on fun(self: self, name: "voiceDisconnect", fn: async fun(member: Member):(any)): function # Emitted when a guild member disconnects from voice chat.
---@field once fun(self: self, name: "voiceDisconnect", fn: async fun(member: Member):(any)): function # Emitted when a guild member disconnects from voice chat.
---@field onSync fun(self: self, name: "voiceDisconnect", fn: fun(member: Member):(any)): function # Emitted when a guild member disconnects from voice chat.
---@field onceSync fun(self: self, name: "voiceDisconnect", fn: fun(member: Member):(any)): function # Emitted when a guild member disconnects from voice chat.
---@field on fun(self: self, name: "voiceUpdate", fn: async fun(member: Member):(any)): function # Emitted when a guild member's mute/deaf status changes.
---@field once fun(self: self, name: "voiceUpdate", fn: async fun(member: Member):(any)): function # Emitted when a guild member's mute/deaf status changes.
---@field onSync fun(self: self, name: "voiceUpdate", fn: fun(member: Member):(any)): function # Emitted when a guild member's mute/deaf status changes.
---@field onceSync fun(self: self, name: "voiceUpdate", fn: fun(member: Member):(any)): function # Emitted when a guild member's mute/deaf status changes.
---@field on fun(self: self, name: "voiceChannelJoin", fn: async fun(member: Member, channel: GuildVoiceChannel):(any)): function # Emitted when a guild member joins a voice channel.
---@field once fun(self: self, name: "voiceChannelJoin", fn: async fun(member: Member, channel: GuildVoiceChannel):(any)): function # Emitted when a guild member joins a voice channel.
---@field onSync fun(self: self, name: "voiceChannelJoin", fn: fun(member: Member, channel: GuildVoiceChannel):(any)): function # Emitted when a guild member joins a voice channel.
---@field onceSync fun(self: self, name: "voiceChannelJoin", fn: fun(member: Member, channel: GuildVoiceChannel):(any)): function # Emitted when a guild member joins a voice channel.
---@field on fun(self: self, name: "voiceChannelLeave", fn: async fun(member: Member, channel: GuildVoiceChannel):(any)): function # Emitted when a guild member leaves a voice channel.
---@field once fun(self: self, name: "voiceChannelLeave", fn: async fun(member: Member, channel: GuildVoiceChannel):(any)): function # Emitted when a guild member leaves a voice channel.
---@field onSync fun(self: self, name: "voiceChannelLeave", fn: fun(member: Member, channel: GuildVoiceChannel):(any)): function # Emitted when a guild member leaves a voice channel.
---@field onceSync fun(self: self, name: "voiceChannelLeave", fn: fun(member: Member, channel: GuildVoiceChannel):(any)): function # Emitted when a guild member leaves a voice channel.
---@field on fun(self: self, name: "webhooksUpdate", fn: async fun(channel: GuildTextChannel):(any)): function # Emitted when a guild's text channel's webhooks have updated.
---@field once fun(self: self, name: "webhooksUpdate", fn: async fun(channel: GuildTextChannel):(any)): function # Emitted when a guild's text channel's webhooks have updated.
---@field onSync fun(self: self, name: "webhooksUpdate", fn: fun(channel: GuildTextChannel):(any)): function # Emitted when a guild's text channel's webhooks have updated.
---@field onceSync fun(self: self, name: "webhooksUpdate", fn: fun(channel: GuildTextChannel):(any)): function # Emitted when a guild's text channel's webhooks have updated.
---@field on fun(self: self, name: "debug", fn: async fun(debug: string):(any)): function # Emitted to provide detailed information regarding specific library behavior.
---@field once fun(self: self, name: "debug", fn: async fun(debug: string):(any)): function # Emitted to provide detailed information regarding specific library behavior.
---@field onSync fun(self: self, name: "debug", fn: fun(debug: string):(any)): function # Emitted to provide detailed information regarding specific library behavior.
---@field onceSync fun(self: self, name: "debug", fn: fun(debug: string):(any)): function # Emitted to provide detailed information regarding specific library behavior.
---@field on fun(self: self, name: "info", fn: async fun(message: Message):(any)): function # Emitted to provide helpful information regarding general library behavior.
---@field once fun(self: self, name: "info", fn: async fun(message: Message):(any)): function # Emitted to provide helpful information regarding general library behavior.
---@field onSync fun(self: self, name: "info", fn: fun(message: Message):(any)): function # Emitted to provide helpful information regarding general library behavior.
---@field onceSync fun(self: self, name: "info", fn: fun(message: Message):(any)): function # Emitted to provide helpful information regarding general library behavior.
---@field on fun(self: self, name: "warning", fn: async fun(message: Message):(any)): function # Emitted when something went wrong, but your code will probably continue operating normally.
---@field once fun(self: self, name: "warning", fn: async fun(message: Message):(any)): function # Emitted when something went wrong, but your code will probably continue operating normally.
---@field onSync fun(self: self, name: "warning", fn: fun(message: Message):(any)): function # Emitted when something went wrong, but your code will probably continue operating normally.
---@field onceSync fun(self: self, name: "warning", fn: fun(message: Message):(any)): function # Emitted when something went wrong, but your code will probably continue operating normally.
---@field on fun(self: self, name: "error", fn: async fun(message: Message):(any)): function # Emitted when something went wrong and your code may not continue operating normally.
---@field once fun(self: self, name: "error", fn: async fun(message: Message):(any)): function # Emitted when something went wrong and your code may not continue operating normally.
---@field onSync fun(self: self, name: "error", fn: fun(message: Message):(any)): function # Emitted when something went wrong and your code may not continue operating normally.
---@field onceSync fun(self: self, name: "error", fn: fun(message: Message):(any)): function # Emitted when something went wrong and your code may not continue operating normally.
---@field on fun(self: self, name: "heartbeat", fn: async fun(shardId: string, latency: number):(any)): function # Emitted when Discord responds with a heartbeat acknowledgement.
---@field once fun(self: self, name: "heartbeat", fn: async fun(shardId: string, latency: number):(any)): function # Emitted when Discord responds with a heartbeat acknowledgement.
---@field onSync fun(self: self, name: "heartbeat", fn: fun(shardId: string, latency: number):(any)): function # Emitted when Discord responds with a heartbeat acknowledgement.
---@field onceSync fun(self: self, name: "heartbeat", fn: fun(shardId: string, latency: number):(any)): function # Emitted when Discord responds with a heartbeat acknowledgement.
---@field on fun(self: self, name: "raw", fn: async fun(string: string):(any)): function # Emitted for every Discord gateway event.
---@field once fun(self: self, name: "raw", fn: async fun(string: string):(any)): function # Emitted for every Discord gateway event.
---@field onSync fun(self: self, name: "raw", fn: fun(string: string):(any)): function # Emitted for every Discord gateway event.
---@field onceSync fun(self: self, name: "raw", fn: fun(string: string):(any)): function # Emitted for every Discord gateway event.
---@overload fun(options?: discordia.client_options): Client
local Client = {}

---
---Authenticates the current user via HTTPS and launches as many WSS gateway shards as are required or requested. By using coroutines that are automatically managed by Luvit libraries and a libuv event loop, multiple clients per process and multiple shards per client can operate concurrently. This should be the last method called after all other code and event handlers have been initialized. If a presence table is provided, it will act as if the user called `setStatus` and `setActivity` after `run`.
---
---*This method always makes a WebSocket request.*
---
---@param token string
---@param presence? {status?: discordia.enums.status_value, afk?: boolean, since?: integer, activities?: {name: string, type: discordia.enums.activityType_value, url?: string, state?: string}[], activity?: {name: string, type: discordia.enums.activityType_value, url?: string, state?: string}}
---@return nil
function Client:run(token, presence) end

---
---Disconnects all shards and effectively stops their loops. This does not empty any data that the client may have cached.
---
---*This method always makes a WebSocket request.*
---
---@return nil
function Client:stop() end

---
---Returns a number that represents the gateway intents enabled for this client.
---
---*This method only operates on data in memory.*
---
---@return number
---@nodiscard
function Client:getIntents() end

---
---Sets the gateway intents that this client will use. The new value will not be used internally until the client (re-)identifies.
---
---*This method only operates on data in memory.*
---
---@param intents number
function Client:setIntents(intents) end

---
---Enables individual gateway intents for this client. The new value will not be used internally until the client (re-)identifies.
---
---*This method only operates on data in memory.*
---
---@param ... Intents-Resolvable
function Client:enableIntents(...) end

---
---Disables individual gateway intents for this client. The new value will not be used internally until the client (re-)identifies.
---
---*This method only operates on data in memory.*
---
---@param ... Intents-Resolvable
function Client:disableIntents(...) end

---
---Enables all known gateway intents for this client. The new value will not be used internally until the client (re-)identifies.
---
---*This method only operates on data in memory.*
---
function Client:enableAllIntents() end

---
---Disables all gateway intents for this client. The new value will not be used internally until the client (re-)identifies.
---
---*This method only operates on data in memory.*
---
function Client:disableAllIntents() end

---
---Sets the client's username. This must be between 2 and 32 characters in length. This does not change the application name.
---
---*This method always makes an HTTP request.*
---
---@param username string
---@return boolean|nil
---@return string error_msg
function Client:setUsername(username) end

---
---Sets the client's avatar. To remove the avatar, pass an empty string or nil. This does not change the application image.
---
---*This method always makes an HTTP request.*
---
---@param avatar Base64-Resolvable
---@return boolean|nil
---@return string error_msg
function Client:setAvatar(avatar) end

---
---Creates a new guild. The name must be between 2 and 100 characters in length. This method may not work if the current user is in too many guilds. Note that this does not return the created guild object; wait for the corresponding `guildCreate` event if you need the object.
---
---*This method always makes an HTTP request.*
---
---@param name string
---@return boolean|nil
---@return string error_msg
function Client:createGuild(name) end

---
---Creates a new group channel. This method is only available for user accounts.
---
---*This method always makes an HTTP request.*
---
---@return GroupChannel|nil
---@return string error_msg
function Client:createGroupChannel() end

---
---Gets a webhook object by ID. This always makes an HTTP request to obtain a static object that is not cached and is not updated by gateway events.
---
---*This method always makes an HTTP request.*
---
---@param id string
---@return Webhook|nil
---@return string error_msg
---@nodiscard
function Client:getWebhook(id) end

---
---Gets an invite object by code. This always makes an HTTP request to obtain a static object that is not cached and is not updated by gateway events.
---
---*This method always makes an HTTP request.*
---
---@param code string
---@param counts? boolean
---@return Invite|nil
---@return string error_msg
---@nodiscard
function Client:getInvite(code, counts) end

---
---Gets a user object by ID. If the object is already cached, then the cached object will be returned; otherwise, an HTTP request is made. Under circumstances which should be rare, the user object may be an old version, not updated by gateway events.
---
---*This method may make an HTTP request.*
---
---@param id User-ID-Resolvable
---@return User|nil
---@return string error_msg
---@nodiscard
function Client:getUser(id) end

---
---Gets a guild object by ID. The current user must be in the guild and the client must be running the appropriate shard that serves this guild. This method never makes an HTTP request to obtain a guild.
---
---*This method only operates on data in memory.*
---
---@param id Guild-ID-Resolvable
---@return Guild
---@nodiscard
function Client:getGuild(id) end

---
---Gets a channel object by ID. For guild channels, the current user must be in the channel's guild and the client must be running the appropriate shard that serves the channel's guild. For private channels, the channel must have been previously opened and cached. If the channel is not cached, `User:getPrivateChannel` should be used instead.
---
---*This method only operates on data in memory.*
---
---@param id Channel-ID-Resolvable
---@return ChannelUnion
---@nodiscard
function Client:getChannel(id) end

---
---Gets a role object by ID. The current user must be in the role's guild and the client must be running the appropriate shard that serves the role's guild.
---
---*This method only operates on data in memory.*
---
---@param id Role-ID-Resolvable
---@return Role
---@nodiscard
function Client:getRole(id) end

---
---Gets an emoji object by ID. The current user must be in the emoji's guild and the client must be running the appropriate shard that serves the emoji's guild.
---
---*This method only operates on data in memory.*
---
---@param id Emoji-ID-Resolvable
---@return Emoji
---@nodiscard
function Client:getEmoji(id) end

---
---Gets a sticker object by ID. The current user must be in the sticker's guild and the client must be running the appropriate shard that serves the sticker's guild.
---
---*This method only operates on data in memory.*
---
---@param id Sticker-ID-Resolvable
---@return Sticker
---@nodiscard
function Client:getSticker(id) end

---
---Returns a raw data table that contains a list of voice regions as provided by Discord, with no formatting beyond what is provided by the Discord API.
---
---*This method always makes an HTTP request.*
---
---@return {id: string, name: string, optimal: boolean, deprecated: boolean, custom: boolean}[]
---@return string error_msg
---@nodiscard
function Client:listVoiceRegions() end

---
---Returns a raw data table that contains a list of connections as provided by Discord, with no formatting beyond what is provided by the Discord API. This is unrelated to voice connections.
---
---*This method always makes an HTTP request.*
---
---@return {id: string, name: string, type: "amazon-music"|"battlenet"|"bungie"|"domain"|"ebay"|"epicgames"|"facebook"|"github"|"instagram"|"leagueoflegends"|"paypal"|"playstation"|"reddit"|"riotgames"|"roblox"|"spotify"|"skype"|"steam"|"tiktok"|"twitch"|"twitter"|"xbox"|"youtube", revoked?: boolean, integrations?: {id: string, name: string, type: string, enabled: boolean, syncing?: boolean, role_id?: string, enable_emoticons?: boolean, expire_behavior?: 0|1, expire_grace_period?: integer, user?: table, account: {id: string, name: string}, synced_at?: string, subscriber_count?: integer, revoked?: boolean, application?: {id: string, name: string, icon?: string, description: string, bot?: table}, scopes?: string[]}[], verified: boolean, friend_sync: boolean, show_activity: boolean, two_way_link: boolean, visibility: integer}
---@return string error_msg
---@nodiscard
function Client:getConnections() end

---
---Returns a raw data table that contains information about the current OAuth2 application, with no formatting beyond what is provided by the Discord API.
---
---*This method always makes an HTTP request.*
---
---@return {id: string, name: string, icon?: string, description: string, rpc_origins?: string[], bot_public: boolean, bot_require_code_grant: boolean, bot?: table, terms_of_service_url?: string, privacy_policy_url?: string, owner?: table, verify_key: string, team?: {icon: string, id: string, members: table, name: string, owner_user_id: string}, guild_id?: string, guild?: table, primary_sku_id?: string, slug?: string, cover_image?: string, flags?: integer, approximate_guild_count?: integer, approximate_user_install_count?: integer, redirect_uris?: string[], interactions_endpoint_url?: string, role_connections_verification_url?: string, event_webhooks_url?: string, event_webhooks_status: 1|2|3, event_webhooks_types?: string[], tags?: string[], install_params?: {scopes: string[], permissions: string}, integration_types_config?: {GUILD_INSTALL?: {oauth2_install_params?: {scopes: string[], permissions: string}}, USER_INSTALL?: {oauth2_install_params?: {scopes: string[], permissions: string}}}, custom_install_url?: string}
---@return string error_msg
---@nodiscard
function Client:getApplicationInformation() end

---
---Sets the current user's status on all shards that are managed by this client. See the `status` enumeration for acceptable status values. Passing `nil` removes previously set status.
---
---*This method always makes a WebSocket request.*
---
---@param status string|nil
---@return nil
function Client:setStatus(status) end

---
---Sets the current user's activity on all shards that are managed by this client. If a string is passed, it is treated as the activity name. If a table is passed, it must have a `name` field and may optionally have a `url` or `type` field. Pass `nil` to remove the activity status. Passing `nil` removes previously set activities.
---
---*This method always makes a WebSocket request.*
---
---@param activity string|{name?: string, type?: discordia.enums.activityType_value, url?: string}
---@return nil
function Client:setActivity(activity) end

---
---Set the current user's AFK status on all shards that are managed by this client. This generally applies to user accounts and their push notifications. Passing `nil` removes AFK status.
---
---*This method always makes a WebSocket request.*
---
---@param afk boolean|nil
---@return nil
function Client:setAFK(afk) end

---
---Sets the current user's activity on all shards that are managed by this client. If a string is passed, it is treated as the activity name. If a table is passed, it must have a `name` field and may optionally have a `url` or `type` field. Pass `nil` to remove the activity status. Passing `nil` removes previously set activities.
---
---*This method always makes a WebSocket request.*
---
---@deprecated
---@param activity string|{name?: string, type?: discordia.enums.activityType_value, url?: string}
---@return nil
function Client:setGame(activity) end

