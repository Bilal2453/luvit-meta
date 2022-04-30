name = 'Luvit'
words = {
  'uv.%w+',
  'use%-luvit',
  'coro-%w*',
  'luvit',
}

configs = {
  {
    key    = 'Lua.runtime.version',
    action = 'set',
    value  = 'LuaJIT',
  },
  {
    key    = 'Lua.completion.requireSeparator',
    action = 'set',
    value  = '/',
  },
  {
    key    = 'Lua.runtime.path',
    action = 'add',
    value  = 'deps/?/init.lua',
  },
  {
    key    = 'Lua.runtime.path',
    action = 'add',
    value  = 'deps/?.lua',
  },
  {
    key    = 'Lua.workspace.library',
    action = 'add',
    value  = '../deps',
  },
  {
    key    = 'Lua.workspace.library',
    action = 'add',
    value  = '../libs',
  },
  {
    key    = 'Lua.runtime.builtin',
    action = 'prop',
    prop   = 'basic',
    value  = 'disable',
  },
  {
    key    = 'Lua.runtime.builtin',
    action = 'prop',
    prop   = 'package',
    value  = 'disable',
  },
  {
    key    = 'Lua.runtime.builtin',
    action = 'prop',
    prop   = 'string',
    value  = 'disable',
  },
  {
    key    = 'Lua.runtime.builtin',
    action = 'prop',
    prop   = 'table',
    value  = 'disable',
  },
}

-- TODO: do we need this?
GLOBALS = {
  'p',
  'args',
}

for _, name in ipairs(GLOBALS) do
  configs[#configs+1] = {
    key    = 'Lua.diagnostics.globals',
    action = 'add',
    value  = name,
  }
end
