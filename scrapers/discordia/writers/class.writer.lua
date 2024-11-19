local fs = require('fs')
local utils = require('useful')
local pathjoin = require('pathjoin')

local scanDir = fs.scandirSync
local pathJoin = pathjoin.pathJoin

local matchers = utils.initDir('./writers/class', 'match') --[[@type {[string]: {writers: Writers, scanners: Scanners}}]]
local classes, events, patches = matchers.class, matchers.event, matchers.patches

_G.DOCS = {}

local function scan(dir)
	for fileName, fileType in scanDir(dir) do
		local path = pathJoin(dir, fileName)
		if fileType == 'file' then
			coroutine.yield(path)
		else
			scan(path)
		end
	end
end

return function(open)
  for f in coroutine.wrap(scan), INC_DIR do
    local d = assert(fs.readFileSync(f))
    local c = classes.scanners.scanClass(DOCS, d, f)
    events.scanners.scanEmitters(DOCS, d, c)
    -- classes.scanners.scanErrors(DOCS, d, c)
  end

  for _, class in pairs(DOCS) do
    local w, save = open()

    w('---@meta _\n\n')

    if ERRORS_AS_RETURNS then
      classes.scanners.scanErrors(DOCS, '', class)
    end

    -- apply any necessary patches, if any
    patches.scanners.patchClass(DOCS, '', class)

    -- write aliases
    events.writers.writeEventAlias(w, class)

    -- write description
    classes.writers.writeDesc(w, class)
    -- write tags
    classes.writers.writeTags(w, class)
    -- write class and inheritance
    classes.writers.writeInherits(w, class)

    -- write fields (properties)
    classes.writers.writeProperties(w, class)
    -- write class events, if any
    events.writers.writeEventFields(w, class)

    -- write init call overload
    classes.writers.writeOverload(w, class)

    -- write the class table container signature
    classes.writers.writeSignature(w, class)

    -- write static functions
    classes.writers.writeStatics(w, class)
    -- write methods
    classes.writers.writeMethods(w, class)

    -- write results to the file
    save(class.name .. '.lua')
  end
end
