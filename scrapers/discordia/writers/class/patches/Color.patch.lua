
return function(_, builder)
  builder:nodiscard{
    'to%w+',
    'from%w+',
    'copy',
  }

  -- define arithmetics metamethods
  builder:operator{
    {'add', 'Color', 'Color'},
    {'sub', 'Color', 'Color'},
    {'mul', 'Color', 'number'},
    {'div', 'Color', 'number'},
  }
end
