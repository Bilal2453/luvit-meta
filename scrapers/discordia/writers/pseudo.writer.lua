local utils = require('useful') -- defines string methods

local concat = table.concat
local initDir = utils.initDir

local pseudo_classes = utils.initDir('./writers/pseudo', 'class')
local pseudo_types = initDir('./writers/pseudo', 'type')

local template = '--- %s\n---@alias %s %s\n\n'

return function (open)
  for name, alias in pairs(pseudo_types) do
    local w, save = open()
    w('---@meta _\n\n')

    for _, t in ipairs(alias) do
      w(template, t[2]:newlineToBr(), t[1], concat(t[3], '|'))
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
