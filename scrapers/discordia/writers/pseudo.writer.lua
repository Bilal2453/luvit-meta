local utils = require('useful') -- defines string methods

local concat = table.concat
local initDir = utils.initDir

local pseudo_classes = utils.initDir('./writers/pseudo', 'class')
local pseudo_types = initDir('./writers/pseudo', 'type')

local template = '--- %s\n---@alias %s %s\n\n'

-- used to define types (classes and aliases) that are not directly defined by Discordia
-- but we will need to define, such as extensions, client options, enums, etc.
return function (open)
  for name, alias in pairs(pseudo_types) do
    local w, save = open()
    w('---@meta _\n\n') -- no pseudo types are allowed to be required directly

    for _, t in ipairs(alias) do
      w(
        template,
        t[2]
          :trim()
          :brToNewline(),
        t[1],
        concat(t[3], '|')
          :gsub('[\n\t]*', '')
          :gsub('  +', ' ')
          :gsub('{ *', '{')
          :gsub(' *}', '}')
        )
    end
    save(name .. '.lua')
  end

  for name, class in pairs(pseudo_classes) do
    local w, save = open()
    w('---@meta _\n\n')
    class(w)
    save(name .. '.lua')
  end
end
