---@alias MethodTags {mem: boolean, ws?: boolean, ["http?"]?: boolean, http?: boolean}
---@alias ClassTags {ui?: boolean, abc?: boolean}
---@alias Parameter {[1]: string, [2]: string, [3]: boolean}

---@class Property
---@field name string
---@field desc string
---@field type string

---@class Method
---@field name string
---@field desc string
---@field parameters Parameter[]
---@field returns string[]
---@field class table
---@field tags MethodTags
---@field nodiscard boolean?
---@field deprecated boolean|string?

---@class Static: Method

---@class Class
---@field name string
---@field tags ClassTags
---@field parameters Parameter[]
---@field methods Method[]
---@field statics Static[]
---@field properties Property[]
---@field parents string[]
---@field methodTags MethodTags
---@field desc string
---@field filePath string

---@alias Writer fun(str: string, ...: any)|table
---@alias Writers {[string]: fun(w: Writer, class: Class, ...: any): (any), scanDir: fun(string): Class[]}
---@alias Scanners {[string]: fun(docs: Class[], contents: string, class: Class): any}

-- TODO: Currently iterables do not suggest the type of
-- the elements they iterate, because when typing things like Cache<Guild>
-- the Language Server freaks out and stops realizing it is a Cache

local fs = require('fs')
local utils = require('useful') -- defines string methods
local join = require('pathjoin').pathJoin

local insert, concat = table.insert, table.concat
local exists, mkdir = fs.existsSync, fs.mkdirSync

local RES_DIR = './resources'
local INC_DIR_NAME = 'libs'
local OUT_DIR_NAME = 'docs'
_G.INC_DIR = join(RES_DIR, INC_DIR_NAME)
_G.OUT_DIR = join(RES_DIR, OUT_DIR_NAME)
-- flip this to true if you don't want method overloads
-- when `nil` values may be returned for errors
_G.WITHOUT_ERROR_HANDLING = false
-- currently doing errors as returns
-- instead of overloads because of LSP problems
_G.ERRORS_AS_RETURNS = true

do
  local dirs = {RES_DIR, OUT_DIR}
  for _, d in ipairs(dirs) do
    if not exists(d) then
      assert(mkdir(d))
    end
  end
  if not exists(INC_DIR) then
    print("Please copy Discordia's libs folder into " .. INC_DIR)
    print('https://github.com/sinisterRectus/discordia/blob/master/libs')
    os.exit(1)
  end
end

---Create a new Writer buffer, a writer is a higher level interface for a file.
---Returns a buffer object, which consists of an array of strings that are concatenated on save.
---Calling the buffer object directly inserts a new entry into the array.
---@return Writer
---@return fun(path: string): boolean, string? # Writes the buffer into `OUT_DIR .. path`.
local function openBuf()
  local buf = setmetatable({}, {
    __call = function(self, str, ...)
      if select('#', ...) > 0 then
        str = str:format(...)
      end
      insert(self, str)
    end,
  })

  local function close(path)
    return fs.writeFileSync(join(OUT_DIR, path), concat(buf))
  end

  return buf, close
end


-- load the writers and start initializing them
-- Note that the order in which writers are loaded *does* matter, `class.writer.lua` is expected to load first.
-- initDir does not provide a direct way to define the order, so instead we sort writers alphabetically.
-- One way to explicitly define the order would be to prefix all writers with a number such as `1- `.
local writers = utils.initDir('./writers', 'writer')
local names = {}
for name in pairs(writers) do
  insert(names, name)
end
table.sort(names)
for _, name in ipairs(names) do
  writers[name](openBuf)
end
