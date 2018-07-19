class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end
end

def print_values(list_node)
	if list_node
		print "#{list_node.value} --> "
		print_values(list_node.next_node)
	else
		print "nil\n"
		return
	end
end

class Stack
	attr_reader :top_node

	def initialize
		# New instances of the Stack class have a top_node with a default value of nil
		@top_node = nil
	end

	def push(value)
		# make a new instance of a node using value and pointing at the top_node. This allows adding more nodes and remembering them all.
		@top_node = LinkedListNode.new(value, @top_node)
	end

	def pop
		# Check if the stack is empty; if it is, return an error message
		if @top_node == nil
			puts "stack is empty"
		# If the stack isn't empty, the value to return is the value of the current top_node
		else
			value = @top_node.value
			# reset the @top_node to be the node that the current @top_node points to
			@top_node = @top_node.next_node
			return value
		end
	end
end

def reverse_list(list)
	# Initialize a new instance of the Stack class to hold the orders as we reverse them
	reversed_order = Stack.new
	# While list is valid, push the value of list onto the reversed_order stack
	while list
		reversed_order.push(list.value)
		# reset the list variable to be the next node (i.e. the node that the current list points at)
		list = list.next_node
	end
	# set the reverse_list method to return a single node, which can then be passed to the print_values method
	list_node = reversed_order.top_node
	return list_node
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

revlist = reverse_list(node3)
print_values(revlist)

node4 = LinkedListNode.new(37)
node5 = LinkedListNode.new(99, node4)
node6 = LinkedListNode.new(12, node5)
node7 = LinkedListNode.new(48, node6)
node8 = LinkedListNode.new(63, node7)
node9 = LinkedListNode.new(15, node8)
node10 = LinkedListNode.new(87, node9)


print_values(node10)

revlist2 = reverse_list(node10)
print_values(revlist2)

# Creates a new Stack object
stack = Stack.new

# Pushes (adds) the number 1 to the empty stack
stack.push(1)
puts stack.inspect

# Pushes the number 2 to the TOP of the stack
stack.push(2)
puts stack.inspect

# Pops (removes) the TOP number from the stack (2)
puts stack.pop

# Pops the remaining number from the stack (1)
puts stack.pop

# Tries to pop the TOP number from the stack,
# but it is empty so it returns nil
puts stack.pop
