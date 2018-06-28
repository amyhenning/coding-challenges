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

  def blur(distance)
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
    puts ones
  # Identify the "coordinate" pairs up to the value distance for both x and y
    coordinate_values = []
    x = 0
    y = 0
    distance.times do |x|
      x += 1
      distance.times do |y|
        y += 1
        coordinate_values.push([x, y])
      end
    end
    puts coordinate_values.inspect

    ones.each do |row, pixel_index|
  		coordinate_values.each do |coordinates|
		  	x, y = coordinates
		      down = row - y.abs
		    	up = row + y.abs
		    	left = pixel_index - x.abs
		    	right = pixel_index + x.abs

        # If the pixel with a value 1 is on the far right edge of the row 
        # (i.e. the last item in the row array), transform just the 
        # pixels above, below, and to the left of it. If the pixel is in the first or last row,
        # just transform the 0 below or above the 1, respectively.
        if @nested_array[row].length - 1 == pixel_index
        	# change just the pixels above, below, and upper left and lower left
			    # change column immediately above the original 1
			    @nested_array[up][pixel_index] = 1
			    # Change the column immediately below the original 1
			    @nested_array[down][pixel_index] = 1
			    # Change the lower left side
			    @nested_array[down][left] = 1

        # If the row is the bottom row (i.e. the last nested array in the original array), 
        # only transform the 0s above and to the right and left of the 1. However, if the 1 is the
        # first item in the nested array (i.e. all the way on the left hand side of the row), don't
        # transform its value minus 1 (i.e. index -1) because that will change the last 
        # pixel of the row.
        elsif row == @nested_array.length - 1
        	# change just the pixels directly above, the upper right, and the upper left
			    # Change the upper right side 
			    @nested_array[up][right] = 1
			    # change column immediately above the original 1
			    @nested_array[up][pixel_index] = 1
			    # Change the upper left side
			    @nested_array[up][left] = 1

       	# If the pixel is the first one (i.e. all the way on the left), transform the 0s above,
        # below, and to the right of it. 
        elsif pixel_index == 0
        	# change just the pixels directly below, the lower right, and lower left
					# Change the column immediately below the original 1
			    @nested_array[down][pixel_index] = 1
			    # Change the lower right side
			    @nested_array[down][right]
				  # Change the lower left side
			    @nested_array[down][left] = 1

        # If the pixel is in the top row, only transform the pixels immediately to the left, right,
        # and below it as there is no row above it.
        elsif row == 0
					# change just the pixels immediately below, the lower right, and the lower left         	
					# Change the lower right side
			    @nested_array[down][right]

			    # Change the lower left side
			    @nested_array[down][left] = 1
			    # Change the column immediately below the original 1
			    @nested_array[down][pixel_index] = 1

        # Otherwise transform all of the surrounding pixels.
        else
        # transform everything!
	        # Change the upper right side 
			    @nested_array[up][right] = 1
			    # Change the lower right side
			    @nested_array[down][right]
			    # change column immediately above the original 1
			    @nested_array[up][pixel_index] = 1
			    # Change the upper left side
			    @nested_array[up][left] = 1
			    # Change the column immediately below the original 1
			    @nested_array[down][pixel_index] = 1
			    # Change the lower left side
			    @nested_array[down][left] = 1
      	end
	    end
  	end
  	return self.output_image
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0]
])
image.output_image
puts "---"
image.blur(3).inspect
puts "end of original image"



		    # # Change the upper right side 
		    # @nested_array[up][right] = 1

		    # # Change the lower right side
		    # @nested_array[down][right]

		    # # change column immediately above the original 1
		    # @nested_array[up][pixel_index] = 1

		    # # Change the upper left side
		    # @nested_array[up][left] = 1

		    # # Change the column immediately below the original 1
		    # @nested_array[down][pixel_index] = 1

		    # # Change the lower left side
		    # @nested_array[down][left] = 1
