---@param class Class
return function(class, builder)
  builder:paramtype{
    {'log', 1, 'discordia.enums.logLevel_value'},
  }
  class.parameters[1][2] = 'discordia.enums.logLevel_value'
end
