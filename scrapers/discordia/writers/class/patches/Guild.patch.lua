return function(_, builder)
  builder:paramtype{
    {'setSystemChannel', 1, 'Channel-ID-Resolvable'}, -- TODO: PR a typo fix upstream
  }

  builder:returntype{
    {'getChannel', 'GuildChannelUnion'},
  }

  builder:nodiscard{
    'getMember',
    'getRole',
    'getEmoji',
    'getSticker',
    'getChannel',
  }

end
