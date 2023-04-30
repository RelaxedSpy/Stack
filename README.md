# Stack
The Stack module provides a simple implementation of a stack data structure based on a table structure. It allows users to create a new stack, push elements onto the top of the stack, pop elements off the top of the stack, peek at the top element without removing it, clear the entire stack, check if the stack is empty, get the size of the stack, and iterate over the elements of the stack.

## Usage
To use the Stack module, you must first require it in your Lua code:
```lua
local Stack = require("Stack")
```
#### Creating a new Stack
To create a new empty Stack, call the `Stack.new()` function:
```lua
local myStack = Stack.new()
```
#### Pushing elements onto the Stack
To add one or more elements to the top of the Stack, call the `Stack:push(...)` function with the element(s) you want to add:
```lua
myStack:push(10)
myStack:push(20, 30, 40)
```
#### Popping elements off the Stack
To remove and return the top element from the Stack, call the `Stack:pop()` function:
```lua
local topElement = myStack:pop() -- 40
```
#### Peeking at the top element
To return the top element from the Stack without removing it, call the `Stack:peek()` function:
```lua
local topElement = myStack:peek() -- 30
```
#### Clearing the Stack
```lua
myStack:clear()
```
#### Checking if the Stack is empty

To check if the Stack is empty, call the `Stack:is_empty()` function:
```
local isEmpty = myStack:is_empty() -- true
```
#### Getting the size of the Stack

To get the number of elements in the Stack, call the `Stack:size()` function:

lua

```
local size = myStack:size() -- 0
```

#### Iterating over the elements of the Stack

To iterate over the elements of the Stack, call the `Stack:iterator()` function, which returns an iterator function:
```
for element in myStack:iterator() do
  print(element)
end
```

#### Converting the Stack to a string

To convert the Stack to a string, call the `tostring()` function on the Stack object:
```
local stackString = tostring(myStack)
print(stackString) -- Stack []
```
### Implementation details

The Stack module uses a table structure to implement the stack. The `data` field is a table that stores the elements in the stack, and the `count` field is a number that represents the number of elements in the stack. 
The Stack module uses metatables to implement the functions, which allows the user to call the functions on the Stack object directly, without having to pass the object as an argument.
The `__index` field in the metatable is set to `Stack`, which allows the functions to access other functions in the Stack module.
### Conclusion
The Stack module provides a simple and efficient implementation of a stack data structure.
