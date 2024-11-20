---@meta _

---
---Abstract base class that defines the base methods and properties for a general purpose data structure with features that are better suited for an object-oriented environment. Note: All sub-classes should implement their own `__init` and `iter` methods and all stored objects should have a `__hash` method.
---
---*Instances of this class should not be constructed by users.*
---
---@class Iterable
---@overload fun(): Iterable
local Iterable = {}

---
---Defines the behavior of the `pairs` function. Returns an iterator that returns a `key, value` pair, where `key` is the result of calling `__hash` on the `value`.
---
---*This method only operates on data in memory.*
---
---@return function
function Iterable:__pairs() end

---
---Defines the behavior of the `#` operator. Returns the total number of objects stored in the iterable.
---
---*This method only operates on data in memory.*
---
---@return function
function Iterable:__len() end

---
---Returns an individual object by key, where the key should match the result of calling `__hash` on the contained objects. Operates with up to O(n) complexity.
---
---*This method only operates on data in memory.*
---
---@param k any
---@return any
function Iterable:get(k) end

---
---Returns the first object that satisfies a predicate.
---
---*This method only operates on data in memory.*
---
---@param fn function
---@return any
function Iterable:find(fn) end

---
---Returns an iterator that returns all objects that satisfy a predicate.
---
---*This method only operates on data in memory.*
---
---@param fn function
---@return function
function Iterable:findAll(fn) end

---
---Iterates through all objects and calls a function `fn` that takes the objects as an argument.
---
---*This method only operates on data in memory.*
---
---@param fn function
---@return nil
function Iterable:forEach(fn) end

---
---Returns a random object that is contained in the iterable.
---
---*This method only operates on data in memory.*
---
---@return any
function Iterable:random() end

---
---If a predicate is provided, this returns the number of objects in the iterable that satisfy the predicate; otherwise, the total number of objects.
---
---*This method only operates on data in memory.*
---
---@param fn? function
---@return number
function Iterable:count(fn) end

---
---Returns a sequentially-indexed table that contains references to all objects. If a `sortBy` string is provided, then the table is sorted by that particular property. If a predicate is provided, then only objects that satisfy it will be included.
---
---*This method only operates on data in memory.*
---
---@param sortBy? string
---@param fn? function
---@return table
function Iterable:toArray(sortBy, fn) end

---
---Similarly to an SQL query, this returns a sorted Lua table of rows where each row corresponds to each object in the iterable, and each value in the row is selected from the objects according to the keys provided.
---
---*This method only operates on data in memory.*
---
---@param ... string
---@return table
function Iterable:select(...) end

---
---This returns an iterator that, when called, returns the values from each encountered object, picked by the provided keys. If a key is a string, the objects are indexed with the string. If a key is a function, the function is called with the object passed as its first argument.
---
---*This method only operates on data in memory.*
---
---@param ... string|function
---@return function
function Iterable:pick(...) end
