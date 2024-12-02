return function(_, builder)
  builder:nodiscard{
    'get%w*',
    'peek%w*',
    'iter',
  }
end
