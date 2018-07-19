class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def reverse_list(list, previous=nil)
  current_head = list.next_node
  list.next_node = previous
  if current_head
    reverse_list(current_head, list)
  else
    list
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
print_values(node3)
puts "-------"
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
puts "---"
revlist2 = reverse_list(node10)

print_values(revlist2)