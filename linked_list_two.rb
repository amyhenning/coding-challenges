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


def reverse_list(list, previous=nil)
	# example linked list: 12 --> 99 ---> 37 --> nil
  while list != nil
  	# before changing anything, remember the next_node based on the current value of list
    old_next_node = list.next_node
    # set list's next_node to be previous (in the first loop, 12's next_node becomes nil)
    list.next_node = previous
    # previous then becomes list (in the first loop, previous becomes 12 --> nil)
    previous = list
    # reset list to become the old_next_node (in the first loop, it's 99 --> 37 --> nil)
    list = old_next_node
  end
  return previous
end

def is_infinite_loop?(list)
	# set tortoise and hare on the same starting node
	tortoise = list
	hare = list
	# while the list isn't empty
	while list
		# if hare's next_node is nil, there is no loop because it ends
		if hare.next_node == nil
			return 'No loop found'
		end
		# move hare forward 1 node
		hare = hare.next_node
		# if, after moving hare forward 1 node, its next_node is nil, 
		# there is no loop because it ends
		if hare.next_node == nil
			return 'No loop found'
		end
		# move hare forward one node (2 total) and move tortoise forward 1 node (1 total)
		hare = hare.next_node
		tortoise = tortoise.next_node
		# if hare and tortoise wind up on the same node after moving forward
		# at different speeds, there is a loop in the linked list
		if hare == tortoise
			return 'Loop found'
		end
	end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3

puts is_infinite_loop?(node3)

# print_values(node3)

# revlist = reverse_list(node3)
# print_values(revlist)

node4 = LinkedListNode.new(37)
node5 = LinkedListNode.new(99, node4)
node6 = LinkedListNode.new(12, node5)
node7 = LinkedListNode.new(48, node6)
node8 = LinkedListNode.new(63, node7)
node9 = LinkedListNode.new(15, node8)
node10 = LinkedListNode.new(87, node9)
puts is_infinite_loop?(node10)

print_values(node10)
puts "---"
revlist2 = reverse_list(node10)
print_values(revlist2)