local utils = require('useful')

local patches = utils.initDir('./writers/class/patches', 'patch')
local insert = table.insert

---@type Scanners
local scanners = {}

-- easier interface to patch the class
local builder = {
  ---@type Class
  class = nil
}

function builder.index(tbl, ...)
  local prev = tbl
  for _, key in pairs{...} do
    if not prev[key] then
      prev[key] = {}
    end
    prev = prev[key]
  end
  return prev
end

function builder:findMethod(name)
  for _, method in ipairs(self.class.methods or {}) do
    if method.name == name then
      return method
    end
  end
  for _, method in ipairs(self.class.statics or {}) do
    if method.name == name then
      return method
    end
  end
end

---@return (Method|Static)[]
function builder:findMethods(name)
  local rtn = {}
  for _, method in ipairs(self.class.methods or {}) do
    if method.name:match(name) then
      insert(rtn, method)
    end
  end
  for _, method in ipairs(self.class.statics or {}) do
    if method.name:match(name) then
      insert(rtn, method)
    end
  end
  return rtn
end

function builder:nodiscard(name)
  if type(name) == 'table' then
    for _, v in ipairs(name) do
      self:nodiscard(v)
    end
    return
  end
  local methods = self:findMethods(name)
  assert(#methods > 0)
  for _, method in pairs(methods) do
    method.nodiscard = true
  end
end

function builder:paramtype(method_name, no, new_type)
  if type(method_name) == 'table' then
    for _, v in ipairs(method_name) do
      self:paramtype(unpack(v))
    end
    return
  end
  local method = self:findMethod(method_name)
  assert(method, 'method #' .. method_name .. ' does not exists')
  local param = builder.index(method, 'parameters', no)
  param[2] = new_type
end

function builder:returntype(method_name, new_type, no)
  if type(method_name) == 'table' then
    for _, v in ipairs(method_name) do
      self:returntype(unpack(v))
    end
    return
  end
  no = no or 1
  local method = self:findMethod(method_name)
  assert(method, 'method #' .. method_name .. ' does not exists')
  method.returns[no] = new_type
end

function builder:inittype(new_type)
  builder.index(self.class, 'parameters', 1)[2] = new_type
end

---@param method Method
function builder:newmethod(method)
  assert(self:findMethod(method.name) == nil, 'A method with the name ' .. method.name .. ' is already defined')
  method.class = self.class
  self.class.methods[#self.class.methods+1] = method
end

---@return Method|Static
function builder:copymethod(method_name)
  local method = assert(self:findMethod(method_name))
  local new_method = {}
  for i, v in pairs(method) do
    new_method[i] = v
  end
  return new_method
end

function builder:property(name, typ, desc)
  if type(name) == 'table' then
    for _, v in ipairs(name) do
      self:property(unpack(v))
    end
    return
  end
  for _, prop in ipairs(self.class.properties) do
    if prop.name:match(name) then
      prop.type = typ or prop.type
      prop.desc = desc or prop.desc
    end
  end
end

function builder.init(class)
  local new_helper = {}
  for k, v in pairs(builder) do
    new_helper[k] = v
  end
  new_helper.class = class
  return new_helper
end

function scanners.patchClass(_, _, class)
  if patches[class.name] then
    patches[class.name](class, builder.init(class))
  end
end

return {
  writers = {},
  scanners = scanners,
}
