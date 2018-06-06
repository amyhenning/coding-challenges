class Image
	def initialize(nested_array)
		@nested_array = nested_array
	end

	def output_image
		@nested_array.each_index do |i|
			@nested_array[i].each do |x|
				print x
			end
			puts " "
		end
	end

	def blur
		ones = Hash.new
		@nested_array.each_index do |i|
			@nested_array[i].each_with_index do |x, index|
				if x == 1
					ones[i] = index
				end
			end
		end
		ones.each do |i, index|
			if @nested_array[i].length - 1 == index
				@nested_array[i+1][index] = 1
				@nested_array[i-1][index] = 1
				@nested_array[i][index-1] = 1
			elsif i == @nested_array.length - 1
				@nested_array[i-1][index] = 1
				@nested_array[i][index+1] = 1
				unless index == 0
					@nested_array[i][index-1] = 1
				end
			elsif index == 0
				@nested_array[i+1][index] = 1
				@nested_array[i-1][index] = 1
				@nested_array[i][index+1] = 1
			elsif i == 0
				@nested_array[i+1][index] = 1
				@nested_array[i][index+1] = 1
				@nested_array[i][index-1] = 1
			else
				@nested_array[i+1][index] = 1
				@nested_array[i-1][index] = 1
				@nested_array[i][index+1] = 1
				@nested_array[i][index-1] = 1
			end
		end
		return self.output_image
	end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
puts "---"
image.blur
puts "end of original image"

image_two = Image.new ([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0]
])
puts "start image two"
image_two.output_image
puts "---"

image_two.blur
puts "end of image two"

image_three = Image.new ([
  [1, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0]
])

puts "start image three"
image_three.output_image
puts "---"

image_three.blur
puts "end of image three"
