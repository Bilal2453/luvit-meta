return function(_, builder)
  builder:nodiscard{
    'from%w*',
    'to%w*',
    'all',
    'has',
    'union',
    'intersection',
    'difference',
    'complement',
    'copy',
  }

  -- hide `__tostring` and `__eq`, no reason for the user to call them directly.
  builder:protected{
    '__%w*',
  }
end
