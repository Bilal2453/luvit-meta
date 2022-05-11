---@meta

---
---## Light operating system helper
---
---Also known as los. Its' a tiny helper to get os name in luvit.
---
---local los = require('los')
---@class luvit.los
local los = {}

---
---Returns the host operating system.
---
---@return 'win32'|'linux'|'darwin'|'bsd'|'posix'|'other' os
---@nodiscard
function los.type() end

return los
