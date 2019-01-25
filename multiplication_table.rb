# Solution to Codewars Multiplication Table kata

# Your task, is to create NxN multiplication table, of size provided in parameter.

# for example, when given size is 3:
# 1 2 3
# 2 4 6
# 3 6 9
# for given example, the return value should be: [[1,2,3],[2,4,6],[3,6,9]]

def multiplication_table(size) 
  table = []
  size_array = ((1..size).to_a)
  n = 1
  while n <= size
  	new_array = []
  	size_array.each do |num|
  		new_array << (num * n)
  	end
  	table << new_array
  	n += 1
  end
  table.inspect
end

puts multiplication_table(3)
puts multiplication_table(5)