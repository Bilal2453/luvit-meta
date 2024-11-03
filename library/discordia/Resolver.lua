---@meta _

--- Due to Luvit/LuaJIT's lack of native 64-bit integers, integers are resolved as strings in Discordia. If you wish to input the purest type where ever an integer is accepted, usually a Discord Snowflake ID, use a Lua string.
---@alias Integer-Resolvable string|integer

--- - [User](https://github.com/SinisterRectus/Discordia/wiki/User) object via `User.id`
--- - [Member](https://github.com/SinisterRectus/Discordia/wiki/Member) object via `Member.user.id`<br>- [Message](https://github.com/SinisterRectus/Discordia/wiki/Message) object via `Message.author.id`<br>- [Guild](https://github.com/SinisterRectus/Discordia/wiki/Guild) object via `Guild.ownerId`<br>- Integer
---@alias User-ID-Resolvable User|Member|Message|Guild|Integer-Resolvable

--- - [Message](https://github.com/SinisterRectus/Discordia/wiki/Message) object via `Message.id`
--- - Integer
---@alias Message-ID-Resolvable Message|Integer-Resolvable

--- - [Channel](https://github.com/SinisterRectus/Discordia/wiki/Channel) object via `Channel.id`
--- - Integer
---@alias Channel-ID-Resolvable Channel|Integer-Resolvable

--- - [Role](https://github.com/SinisterRectus/Discordia/wiki/Role) object via `Role.id`
--- - Integer
---@alias Role-ID-Resolvable Role|Integer-Resolvable

--- - [Emoji](https://github.com/SinisterRectus/Discordia/wiki/Emoji) object via `Emoji.id`
--- - Integer
---@alias Emoji-ID-Resolvable Emoji|Integer-Resolvable

--- - [Sticker](https://github.com/SinisterRectus/Discordia/wiki/Sticker) object via `Sticker.id`
--- - Integer
---@alias Sticker-ID-Resolvable Sticker|Integer-Resolvable

--- - [Guild](https://github.com/SinisterRectus/Discordia/wiki/Guild) object via `Guild.id`
--- - Integer
---@alias Guild-ID-Resolvable Guild|Integer-Resolvable

--- - [AuditLogEntry](https://github.com/SinisterRectus/Discordia/wiki/AuditLogEntry) object via `Entry.id`
--- - Integer
---@alias Entry-ID-Resolvable AuditLogEntry|Integer-Resolvable

--- - [Iterable](https://github.com/SinisterRectus/Discordia/wiki/Iterable) of Message ID resolveables
--- - Lua table of Message ID resolveables
---@alias Message-IDs-Resolvable Iterable|(Message|Integer-Resolvable)[]

--- - [Iterable](https://github.com/SinisterRectus/Discordia/wiki/Iterable) of Role ID resolveables
--- - Lua table of Role ID resolveables
---@alias Role-IDs-Resolvable Iterable|(Role|Integer-Resolvable)[]

--- - [Emoji](https://github.com/SinisterRectus/Discordia/wiki/Emoji) object via `Emoji.hash`
--- - [Reaction](https://github.com/SinisterRectus/Discordia/wiki/Reaction) object via `Reaction.emojiHash`<br>- Lua string, where the string is a unicode emoji or of the form `"{Emoji.name}:{Emoji.id}"`
---@alias Emoji-Resolvable Emoji|Reaction|string

--- - [Sticker](https://github.com/SinisterRectus/Discordia/wiki/Sticker) object via `Sticker.hash`
--- - Lua string, TODO: what string exactly?
---@alias Sticker-Resolvable Sticker|string

--- - [Color](https://github.com/SinisterRectus/Discordia/wiki/Color) object via `Color.value`
--- - Lua number via `tonumber(obj)`
---@alias Color-Resolvable Color|number

--- - [Permissions](https://github.com/SinisterRectus/Discordia/wiki/Permissions) object via `Permissions.value`
--- - Lua number via `tonumber(obj)`
---@alias Permissions-Resolvable Permissions|integer

--- - Lua string equivalent to the name of a Discordia permissions enumeration
--- - Lua number equivalent to the value of a Discordia permissions enumeration
---@alias Permission-Resolvable discordia.enums.permission_key|discordia.enums.permission_value|string|integer

--- - Lua string equivalent to the name of a Discordia gateway intent enumeration
--- - Lua number equivalent to the value of a Discordia gateway intent enumeration
---@alias Intents-Resolvable discordia.enums.gatewayIntent_key|discordia.enums.gatewayIntent_value|string|integer

--- - Lua string equivalent to the name of a Discordia action type enumeration
--- - Lua number equivalent to the value of a Discordia action type enumeration
---@alias Action-Type-Resolvable discordia.enums.actionType_key|discordia.enums.actionType_value|string|integer

--- - Lua string representing the base64 string, prefixed by an appropriate `"data:.*;base64"` URI scheme
--- - Lua string representing a relative or absolute path to a local file, read via `fs.readFileSync`
---@alias Base64-Resolvable string

