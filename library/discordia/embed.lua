---@meta _

---@alias discordia.aliases.embed_type
---|>"rich" # generic embed rendered from embed attributes
---|"image" # image embed
---|"video" # video embed
---|"gifv" # animated gif image embed rendered as a video embed
---|"article" # article embed
---|"link" # link embed
---|"poll_result" # poll result embed

---@class discordia.aliases.embed_media: table
---@field url	string # source url of media (only supports http(s) and attachments)
---@field proxy_url? string # a proxied url of the media
---@field height? integer # height of media
---@field width? integer # width of media

---@class discordia.aliases.embed_thumbnail: discordia.aliases.embed_media
---@class discordia.aliases.embed_video: discordia.aliases.embed_media
---@class discordia.aliases.embed_image: discordia.aliases.embed_media

---@class discordia.aliases.embed_provider: table
---@field name? string # name of provider
---@field url? string # url of provider

---@class discordia.aliases.embed_author: table
---@field name string # name of author
---@field url? string # url of author (only supports http(s))
---@field icon_url? string # url of author icon (only supports http(s) and attachments)
---@field proxy_icon_url? string # a proxied url of author icon

---@class discordia.aliases.embed_footer: table
---@field text string # footer text
---@field icon_url? string # url of footer icon (only supports http(s) and attachments)
---@field proxy_icon_url? string # a proxied url of footer icon

---@class discordia.aliases.embed_field: table
---@field name string # name of the field
---@field value string # value of the field
---@field inline? boolean # whether or not this field should display inline

---@class Embed: table
---@field title? string # title of embed
---@field type? discordia.aliases.embed_type # type of embed (always "rich" for webhook embeds)
---@field description? string # description of embed
---@field url? string # url of embed
---@field timestamp? string # timestamp of embed content
---@field color? integer # color code of the embed
---@field footer? discordia.aliases.embed_footer # footer information
---@field image? discordia.aliases.embed_image # image information
---@field thumbnail? discordia.aliases.embed_thumbnail # thumbnail information
---@field video? discordia.aliases.embed_video # video information
---@field provider? discordia.aliases.embed_provider # provider information
---@field author? discordia.aliases.embed_author # author information
---@field fields? discordia.aliases.embed_field[] # array of embed field objects fields information, max of 25
