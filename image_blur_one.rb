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
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image