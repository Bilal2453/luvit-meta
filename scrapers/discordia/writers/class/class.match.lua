-- Taken from https://github.com/SinisterRectus/Discordia
-- and modified to output the types we need

--[[
The MIT License (MIT)

Copyright (c) 2016-2023 SinisterRectus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

--[=[
@c ClassName [x base_1 x base_2 ... x base_n]
@t tag
@mt methodTag (applies to all class methods)
@p parameterName type
@op optionalParameterName type
@d description+
]=]

--[=[
@m methodName
@t tag
@p parameterName type
@op optionalParameterName type
@r return
@d description+
]=]

--[=[
@p propertyName type description+
]=]

local utils = require('useful')

local insert, concat = table.insert, table.concat
local writeFunction = utils.writeFunction

local function match(s, pattern) -- only useful for one capture
  return assert(s:match(pattern), s)
end

local function gmatch(s, pattern, hash) -- only useful for one capture
  local tbl = {}
  if hash then
    for k in s:gmatch(pattern) do
      tbl[k] = true
    end
  else
    for v in s:gmatch(pattern) do
      insert(tbl, v)
    end
  end
  return tbl
end

local function matchType(s)
  return s:match('^@(%S+)')
end

local function matchComments(s)
  return s:gmatch('--%[=%[%s*(.-)%s*%]=%]')
end

local function matchClassName(s)
  return match(s, '@c (%S+)')
end

local function matchMethodName(s)
  return match(s, '@m (%S+)')
end

local function matchDescription(s)
  return match(s, '@d (.+)'):gsub('%s+', ' ')
end

local function matchParents(s)
  return gmatch(s, 'x (%S+)')
end

local function matchReturns(s)
  return gmatch(s, '@r (%S+)')
end

local function matchTags(s)
  return gmatch(s, '@t (%S+)', true)
end

local function matchMethodTags(s)
  return gmatch(s, '@mt (%S+)', true)
end

local function matchProperty(s)
  local a, b, c = s:match('@p (%S+) (%S+) (.+)')
  return {
    name = assert(a, s),
    type = assert(b, s),
    desc = assert(c, s):gsub('%s+', ' '),
  }
end

local function matchParameters(s)
  local ret = {}
  for optional, paramName, paramType in s:gmatch('@(o?)p (%S+) (%S+)') do
    insert(ret, {paramName, paramType, optional == 'o'})
  end
  return ret
end

local function matchMethod(s)
  return {
    name = matchMethodName(s),
    desc = matchDescription(s),
    parameters = matchParameters(s),
    returns = matchReturns(s),
    tags = matchTags(s),
  }
end

local function checkTags(tbl, check)
  for i, v in ipairs(check) do
    if tbl[v] then
      for j, w in ipairs(check) do
        if i ~= j and tbl[w] then
          return error(string.format('mutually exclusive tags encountered: %s and %s', v, w), 1)
        end
      end
    end
  end
end

----

---@type Scanners
local scanners = {}

---@return Class, function
local function newClass(docs, dir)

  local class = {
    methods = {},
    statics = {},
    properties = {},
    filePath = dir,
  }

  local function init(s)
    class.name = matchClassName(s)
    class.parents = matchParents(s)
    class.desc = matchDescription(s)
    class.parameters = matchParameters(s)
    class.tags = matchTags(s)
    class.methodTags = matchMethodTags(s)
    class.operators = {}
    assert(not docs[class.name], 'duplicate class: ' .. class.name)
    docs[class.name] = class
  end

  return class, init

end

--- Given the code, start matching for comments
--- to parsing the documentation and initialize classes
---@return Class
function scanners.scanClass(docs, d, f)
  local class, initClass = newClass(docs, f)
  for s in matchComments(d) do
    local t = matchType(s)
    if t == 'c' then
      initClass(s)
    elseif t == 'm' then
      local method = matchMethod(s)
      for k, v in pairs(class.methodTags) do
        method.tags[k] = v
      end
      method.class = class
      insert(method.tags.static and class.statics or class.methods, method)
    elseif t == 'p' then
      insert(class.properties, matchProperty(s))
    end
  end
  return class
end

--- Scan classes for methods that may return `nil, error`
--- and annotate those returns before starting to write
function scanners.scanErrors(_, _, class)
  for _, method in ipairs(class.methods) do
    if method.tags.http or method.tags['http?'] then
      if #method.returns == 1 then
        local rtn = method.returns[1]
        if rtn == 'nil' then
          table.insert(method.returns, 'string')
        elseif rtn:find('/nil') then
          method.returns[1] = rtn
          method.returns[2] = 'string'
        else
          method.returns[1] = rtn .. '/nil'
          method.returns[2] = 'string error_msg'
        end
      else
        -- there are currently no http methods that has multi returns
        return error('todo')
      end
    end
  end
end

----

---@type Writers
local writers = {}

-- write description
function writers.writeDesc(w, class)
  w('---\n---%s\n---\n', class.desc)
end

function writers.writeTags(w, class)
  -- write tags
  checkTags(class.tags, {'ui', 'abc'})
  if class.tags.abc then
    w('---%s\n---\n', '*This is an abstract base class. Direct instances should never exist.*')
  elseif not class.tags.ui then
    w('---%s\n---\n', '*Instances of this class should not be constructed by users.*')
  end
end

-- write class and inheritance
function writers.writeInherits(w, class)
  local parents = class.parents
  w('---@class %s', class.name)
  if next(parents) then
    w(': %s', concat(parents, ', '))
  end
end

-- write fields (properties)
function writers.writeProperties(w, class)
  local properties = class.properties
  for _, property in ipairs(properties) do
    w('\n')
    w('---@field %s %s', property.name:prepareField(), property.type:prepareType())
    if property.desc then
      w(' # %s', property.desc)
    end
  end
  w('\n')
end

--- write operator tags, those represent Lua meta-methods
function writers.writeOperators(w, class)
  if #class.operators < 1 then
    return
  end
  for _, operator in ipairs(class.operators) do
    local buf = {}
    for _, param in ipairs(operator.parameters) do
      insert(buf, param[2]:prepareType())
    end
    local params = #buf > 0 and ('(' .. concat(buf, ',') .. ')') or ''
    assert(operator.returns[1], 'expected at least 1 operator return')
    w('---@operator %s%s:%s\n', operator.name, params, operator.returns[1])
  end
end

-- write init call overload
function writers.writeOverload(w, class)
  local overload = 'fun(%s): %s'
  local params = class.parameters
  local params_buf = {}
  for _, param in ipairs(params) do
    insert(params_buf, ('%s%s: %s'):format(param[1], param[3] and '?' or '', param[2]))
  end
  if next(params_buf) then
    params_buf = concat(params_buf, ', ') --[[@diagnostic disable-line: cast-local-type]]
    overload = overload:format(params_buf, class.name)
  else
    overload = overload:format('', class.name)
  end
  w('---@overload %s\n', overload)
end

-- write the class table container signature
function writers.writeSignature(w, class)
  w('local %s = {}\n\n', class.name)
end

-- write class static methods
function writers.writeStatics(w, class)
  for _, static in ipairs(class.statics) do
    writeFunction(w, static, '.')
  end
end

-- write class methods
function writers.writeMethods(w, class)
  for _, method in ipairs(class.methods) do
    writeFunction(w, method, ':')
  end
end

return {
  writers = writers,
  scanners = scanners,
}
