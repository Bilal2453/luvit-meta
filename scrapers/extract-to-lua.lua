--[[
  Parse the metadata and convert it into a Lua table
  to be parsed by other projects.

  This assumes a Luvit environment.

  Eventually, this should work with all definitions
  but as of now the goal is to get it working with uv.lua.
  
  Making it work with the rest requires parsing *everything*
  at once to be able to understand cross-file definitions,
  such as aliases, inheritance, etc.
  Also requires making sure of style consistency in the definitions;
  the defacto style that should be used everywhere is the one
  used in uv.lua.

  The output structure looks like this:



]]

local fs = require 'fs'
local re = require 're'
local compile = re.compile

local DEF_PATH = '../library/uv.lua'
local DEF_STRING = assert(fs.readFileSync(DEF_PATH))

---@type string[]
local definitions_raw = {}
for m in DEF_STRING:gmatch '%-%-%-.-\n\n' do
  definitions_raw[#definitions_raw+1] = m
end

local definitions = {}
for _, block in ipairs(definitions_raw) do
  local tags = {}
  local description = {}
  local metatag = {}

  for def in block:gmatch '%-%-%-(.-)\n' do

    local tag_name, value = def:match('%s*@(%S+)%s*(.*)')
    if not tag_name then
      description[#description+1] = def
      goto skip
    end

    tags[#tags+1] = {
      name = tag_name,
      value = value,
    }

    ::skip::
  end
  break
end

