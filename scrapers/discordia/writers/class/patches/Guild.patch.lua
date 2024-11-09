return function(_, builder)
  builder:paramtype{
    {'setSystemChannel', 1, 'Channel-ID-Resolvable'}, -- TODO: typo fix at https://github.com/SinisterRectus/Discordia/pull/431
  }

  builder:returntype{
    {'getChannel', 'GuildChannelUnion'},
  }

  builder:nodiscard('get%w+')
end
