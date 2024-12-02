
return function(_, builder)
  builder:paramtype{
    {'toDiscordTimestamp', 1, 'discordia.enums.timestampStyle_value'},
  }

  builder:nodiscard{
    'to%w+',
    'from%w+',
    'parse%w+',
  }

  -- define arithmetics metamethods
  -- for some reason, addition only accept Time, while subtraction accept both Time and Date
  builder:operator{
    {'add', 'Date', 'Time'},
    {'sub', 'Date', 'Time|Date'},
  }
end
