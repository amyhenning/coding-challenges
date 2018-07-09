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

    if distance == 1 # If distance = 1, do simple image blur (Image blur #1)
      ones.each do |row, pixel_index|
        row_below = row + 1
        row_above = row - 1
        pixel_left = pixel_index - 1
        pixel_right = pixel_index + 1
        # UP
        unless @nested_array[row_above][pixel_index] == nil
          if row_above >= 0
            @nested_array[row_above][pixel_index] = 1 # transform the pixels above the original 1
          end
        end
        # DOWN
        unless row_below >= @nested_array.length
            @nested_array[row_below][pixel_index] = 1 # transform the pixel directly below the original 1
        end
        # LEFT
        unless pixel_index == 0
          if pixel_left >= 0
            @nested_array[row][pixel_left] = 1 # transform the pixel to the left, with conditions
          end
        end
        # RIGHT
        unless @nested_array[row][pixel_right] == nil
          @nested_array[row][pixel_right] = 1 # transform the pixel to the right of the original 1
        end
      end
    else # if distance != 1, do more complex manhattan blur
  # Identify the "coordinate" pairs up to the value distance for both x and y
      coordinate_values = []
      distance.times do |x|
        x += 1
        distance.times do |y|
          y += 1
          coordinate_values.push([x, y])
        end
      end
      puts coordinate_values.inspect

      filtered_coordinates = []
      coordinate_values.each do |coordinate|
        x, y = coordinate
        if x + y <= distance
          filtered_coordinates.push(coordinate)
        end
      end
      puts filtered_coordinates.inspect

      ones.each do |row, pixel_index|
        filtered_coordinates.each do |x, y|
          row_below = row + y
          row_above = row - y
          pixel_left = pixel_index - x
          pixel_right = pixel_index + x
          upper_limit = row - distance
          lower_limit = row + distance
          left_limit = pixel_index - distance
          right_limit = pixel_index + distance
          puts "right limit is #{right_limit}"
          # UP
          unless @nested_array[upper_limit][pixel_index] == nil
            if upper_limit >= 0
              @nested_array[upper_limit][pixel_index] = 1 # transform the pixel "distance" spaces above the original 1
            end
          end
          unless @nested_array[row_above][pixel_index] == nil
            if row_above >= 0
              @nested_array[row_above][pixel_index] = 1 # transform the pixels above the original 1
            end
          end
          # DOWN
          unless row_below >= @nested_array.length
            @nested_array[row_below][pixel_index] = 1 # transform the pixels directly below the original 1
          end
          unless lower_limit >= @nested_array.length
            @nested_array[lower_limit][pixel_index] = 1 # transform the pixel "distance" spaces below the original 1
          end
          # RIGHT
          unless @nested_array[row][right_limit] == nil
            if right_limit < @nested_array[row].length
              @nested_array[row][right_limit] = 1 # transform the pixel "distance" spaces to the right of the original 1
            end
          end
          unless @nested_array[row][pixel_right] == nil
            if pixel_right < @nested_array[row].length
              @nested_array[row][pixel_right] = 1 # transform the pixels to the right of the original 1
            end
          end
          # UPPER RIGHT
          unless @nested_array[row_above][pixel_right] == nil
            if row_above >=0
              @nested_array[row_above][pixel_right] = 1 # transform the pixels on the upper right of the original 1
            end
          end
          # LOWER RIGHT
          unless row_below >= @nested_array.length
            if pixel_right < @nested_array[row_below].length
              @nested_array[row_below][pixel_right] = 1 # transform the pixels on the lower right of the original 1
            end
          end
          # LEFT
          unless @nested_array[row][left_limit] == nil
            if left_limit >= 0
              @nested_array[row][left_limit] = 1 # transform the pixel "distance" spaces to the left of the original 1, with conditions
            end
          end          
          unless pixel_index == 0
            if pixel_left >= 0
              @nested_array[row][pixel_left] = 1 # transform the pixels to the left, with conditions
            end
          end
          # UPPER LEFT
          unless @nested_array[row_above][pixel_left] == nil 
            if pixel_left >= 0 && row_above >= 0
              @nested_array[row_above][pixel_left] = 1 # transform the pixels on the upper left of the original 1
            end
          end
          # LOWER LEFT
          unless row_below >= @nested_array.length 
            if pixel_left >= 0
              @nested_array[row_below][pixel_left] = 1 # transform the pixels on the lower left of the original 1
            end
          end
        end
      end
    end
  return self.output_image
  end
end

image = Image.new([
  [1, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0]
])
image.output_image
puts "---"
image.blur(4).inspect
