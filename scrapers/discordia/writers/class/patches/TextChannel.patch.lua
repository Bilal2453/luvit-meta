
return function (_, builder)
  builder:paramtype{
    {'send', 1, 'discordia.aliases.Channel.send'},
  }

  builder:nodiscard('get%w+')
end
