
---@param class Class
return function(class, builder)
  -- all methods are no discard for this class
  for _, method in ipairs(class.methods) do
    method.nodiscard = true
  end
  for _, method in ipairs(class.statics) do
    method.nodiscard = true
  end

  -- define arithmetics metamethods
  -- for some weird reason, addition only accept Time, while subtraction accept both Time and Date
  builder:operator{
    {'add', 'Time', 'Time'},
    {'sub', 'Time', 'Time'},
    {'mul', 'Time', 'number'},
    {'div', 'Time', 'number'},
  }
end
