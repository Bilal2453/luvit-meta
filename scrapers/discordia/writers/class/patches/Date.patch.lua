
---@param class Class
return function(class, builder)
  builder:paramtype{
    {'toDiscordTimestamp', 1, 'discordia.enums.timestampStyle_value'},
  }

  -- all methods are no discard for this class
  for _, method in ipairs(class.methods) do
    method.nodiscard = true
  end
  for _, method in ipairs(class.statics) do
    method.nodiscard = true
  end
end
