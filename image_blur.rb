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
		ones.each do |i, x|
			if x < (@nested_array[i].length - 1)
				@nested_array[i+1][x] = 1
				@nested_array[i-1][x] = 1
				@nested_array[i][x+1] = 1
				@nested_array[i][x-1] = 1
			else
				@nested_array[i+1][x] = 1
				@nested_array[i-1][x] = 1
				@nested_array[i][x-1] = 1
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