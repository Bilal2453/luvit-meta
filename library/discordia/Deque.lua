---@meta _

---
---An implementation of a double-ended queue.
---
---@class Deque
---@overload fun(): Deque
local Deque = {}

---
---Returns the total number of values stored.
---
---*This method only operates on data in memory.*
---
---@return number
function Deque:getCount() end

---
---Adds a value of any type to the left side of the deque.
---
---*This method only operates on data in memory.*
---
---@param obj any
---@return nil
function Deque:pushLeft(obj) end

---
---Adds a value of any type to the right side of the deque.
---
---*This method only operates on data in memory.*
---
---@param obj any
---@return nil
function Deque:pushRight(obj) end

---
---Removes and returns a value from the left side of the deque.
---
---*This method only operates on data in memory.*
---
---@return any
function Deque:popLeft() end

---
---Removes and returns a value from the right side of the deque.
---
---*This method only operates on data in memory.*
---
---@return any
function Deque:popRight() end

---
---Returns the value at the left side of the deque without removing it.
---
---*This method only operates on data in memory.*
---
---@return any
function Deque:peekLeft() end

---
---Returns the value at the right side of the deque without removing it.
---
---*This method only operates on data in memory.*
---
---@return any
function Deque:peekRight() end

---
---Iterates over the deque from left to right.
---
---*This method only operates on data in memory.*
---
---@return function
function Deque:iter() end

