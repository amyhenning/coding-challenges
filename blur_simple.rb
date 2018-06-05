class Image
	def initialize(array)
		@array = array
		@copy = Marshal.load(Marshal.dump(array))
	end

def copy
	return @copy.inspect
end

#	def blur
#		if @array.include? 1
#			before = @array.index(1) - 1
#			after = @array.index(1) + 1
#			@array[before] = 1
#			@array[after] = 1
#		end
#		puts @array.inspect
#	end
#end

	def blur
		ones = []
		@nested_array.each_with_index do |i, row_index|
			@nested_array[i].each_with_index do |x, pixel_index|
				if x == 1
					ones << {row_index => index}
				end
			end
		end
		puts ones
	end
end

image = Image.new([[0, 0, 0], [0, 1, 0]])
#image.blur

image.blur