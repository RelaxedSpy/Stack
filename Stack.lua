-- Stack implementation based on a table structure.
-- @module Stack
local Stack = {}

-- Creates a new empty stack.
-- @function new
-- @treturn table A new Stack instance.
function Stack.new()
	return setmetatable({ data = {}, count = 0 }, { __index = Stack })
end

-- Adds one or more elements to the stack.
-- @function push
-- @tparam any ... The elements to push onto the stack.
function Stack:push(...)
	local numArgs = select("#", ...)
	if numArgs == 0 then
		error("Expected at least one argument", 2)
	end

	for i = 1, numArgs do
		local value = select(i, ...)
		self.count = self.count + 1
		self.data[self.count] = value
	end
end

-- Removes the last element from the stack.
-- @function pop
-- @treturn any|nil The last element on the stack, or nil if the stack is empty.
function Stack:pop()
	-- If the stack is empty, return nil
	if self.count == 0 then
		return nil
	end

	-- Otherwise, remove the top item from the stack and return it
	local item = self.data[self.count]
	self.data[self.count] = nil
	self.count = self.count - 1
	return item
end

-- Returns the last element on the stack without removing it.
-- @function peek
-- @treturn any|nil The last element on the stack, or nil if the stack is empty.
function Stack:peek()
	-- If the stack is empty, return nil
	if self.count == 0 then
		return nil
	end

	-- Otherwise, return the top item on the stack without removing it
	return self.data[self.count]
end

-- Removes all elements from the stack.
-- @function clear
function Stack:clear()
	self.data = {}
	self.count = 0
end

-- Returns true if the stack is empty.
-- @function is_empty
-- @treturn boolean True if the stack is empty, false otherwise.
function Stack:is_empty()
	return self.count == 0
end

-- Returns the size of the stack.
-- @function size
-- @treturn number The size of the stack.
function Stack:size()
	return self.count
end

-- Returns an iterator function that can be used to iterate over the elements of the stack.
-- @function iterator
-- @treturn function An iterator function.
function Stack:iterator()
	local index = self.count
	if index == 0 then
		return function() end
	end
	return function()
		if index > 0 then
			local value = self.data[index]
			index = index - 1
			return value
		end
	end
end

-- Returns a string representation of the stack.
-- @function __tostring
-- @treturn string A string representation of the stack.
function Stack:__tostring()
	local items = {}
	for i = self.count, 1, -1 do
		table.insert(items, tostring(self.data[i]))
	end
	return "Stack [" .. table.concat(items, ", ") .. "]"
end

return Stack
