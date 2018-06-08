class Image
	def initialize(nested_array)
		@nested_array = nested_array
	end

	def output_image
		@nested_array.each_index do |row|
			@nested_array[row].each do |pixel|
				print pixel
			end
			puts
		end
	end

	def blur
		# Create hash to store row / pixel_index pairs when there is a 1
		ones = Hash.new

		# Iterate over the nested array's rows, and within each row, iterate over the pixels. If 
		# a pixel's value is 1, store it and its row index in the hash "ones"
		@nested_array.each_index do |row|
			@nested_array[row].each_with_index do |pixel, pixel_index|
				if pixel == 1
					ones[row] = pixel_index
				end
			end
		end

		# Iterate over the hash that stores the locations (row index and pixel index) of 1s 
		# from the original nested_array.
		ones.each do |row, pixel_index|
			# If the pixel with a value 1 is on the far right edge of the row 
			# (i.e. the last item in the row array), transform just the 
			# pixels above, below, and to the left of it. If the pixel is in the first or last row,
			# just transform the 0 below and above the 1, respectively.
			if @nested_array[row].length - 1 == pixel_index
				unless row == @nested_array.length - 1
					@nested_array[row+1][pixel_index] = 1
				end
				@nested_array[row][pixel_index-1] = 1
				unless row == 0
					@nested_array[row-1][pixel_index] = 1
				end

			# If the row is the bottom row (i.e. the last nested array in the original array), 
			# only transform the 0s above and to the right and left of the 1. However, if the 1 is the
			# first item in the nested array (i.e. all the way on the left hand side of the row), don't
			# transform its value minus 1 (i.e. index -1) because that will change the last 
			# pixel of the row.
			elsif row == @nested_array.length - 1
				@nested_array[row-1][pixel_index] = 1
				@nested_array[row][pixel_index+1] = 1
				unless pixel_index == 0
					@nested_array[row][pixel_index-1] = 1
				end

			# If the pixel is the first one (i.e. all the way on the left), transform the 0s above,
			# below, and to the right of it. 
			elsif pixel_index == 0
				@nested_array[row+1][pixel_index] = 1
				@nested_array[row-1][pixel_index] = 1
				@nested_array[row][pixel_index+1] = 1

			# If the pixel is in the top row, only transform the pixels immediately to the left, right,
			# and below it as there is no row above it.
			elsif row == 0
				@nested_array[row+1][pixel_index] = 1
				@nested_array[row][pixel_index+1] = 1
				@nested_array[row][pixel_index-1] = 1

			# Otherwise transform all of the surrounding pixels.
			else
				@nested_array[row+1][pixel_index] = 1
				@nested_array[row-1][pixel_index] = 1
				@nested_array[row][pixel_index+1] = 1
				@nested_array[row][pixel_index-1] = 1
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

image_four = Image.new ([
  [0, 0, 0, 1],
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

puts "start image four"
image_four.output_image
puts "---"

image_four.blur
puts "end of image four"

image_five = Image.new ([
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0]
])

puts "start image five"
image_five.output_image
puts "---"

image_five.blur
puts "end of image five"
