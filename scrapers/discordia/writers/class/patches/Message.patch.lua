
return function (_, builder)
  builder:paramtype{
    {'reply', 1, 'discordia.aliases.Channel.send'},
    {'setEmbed', 1, 'discordia.aliases.Embed'},
    {'update', 1, '{content?: string, embed?: discordia.aliases.Embed, embeds?: discordia.aliases.Embed[]}'},
  }

  builder:nodiscard{
    'hasFlag',
  }

  builder:property{
    {'type', 'discordia.enums.messageType_value'},
    {'embed', 'discordia.aliases.Embed'},
    {'embeds', 'discordia.aliases.Embed[]'},
    {'oldContent', '{[string]: string}'},
    {'attachment', 'discordia.aliases.Attachment'},
    {'attachments', 'discordia.aliases.Attachment[]'},
  }
end
