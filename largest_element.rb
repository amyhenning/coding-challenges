class Stack
  def initialize(items)
      @items = items
  end

  def push(item)
      @items.push(item)
  end

  def pop
      @items.empty? ? "None" : @items.pop
  end

  def peek
      @items.empty? ? "None" :  @items[-1]
  end
end

class MaxStack < Stack
  def initialize(items)
      @items = items
  end

  def push(item)
      @items.push(item)
  end

  def pop
      @items.empty? ? "None" : @items.pop
  end

  def peek
      @items.empty? ? "None" :  @items[-1]
  end

  def get_max
    sorted_st = @items.sort
    new_stack = Stack.new(sorted_st)
    new_stack.peek
  end
end

stack = MaxStack.new([1, 5, 9, 2, 78, 16])
puts stack.inspect
puts stack.peek

puts stack.get_max
puts stack.inspect