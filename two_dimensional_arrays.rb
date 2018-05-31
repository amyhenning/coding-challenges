# exercise 1

#values = Array[[10, 20, 30], [40, 50, 60]]

# loop over each row array
#values.each do |x|
	# Loop over each cell in the row
#	x.each do |cell|
#		puts cell
#	end

	# End of row
#	puts "---"
#end

# exercise 2

# values = []

# create 1st row
#subarray = []
#subarray.push(1)
#subarray.push(2)
#subarray.push(3)

# add first row
#values.push(subarray)

# create second row
#subarray = []
#subarray.push(10)
#subarray.push(20)
#subarray.push(30)

#add second row
#values.push(subarray)

#puts "Third element in first row is: " << String(values[0][2])

#values[1][1] = 500

#values.each do |x|
#	x.each do |y|
#		puts y
#	end
#	puts "--"
#end

# puts values.inspect

# here is a jagged array (or an irregular 2d array)
values = [["A", "B", "C"], ["D", "E", "F"], ["G", "H"]]

# loop over indexes
values.each_index do |i|
	#get subarray and loop over its indexes also
	subarray = values[i]
	subarray.each_index do |x|
		#display the cell
		puts String(i) << " " << String(x) << "... " << values[i][x]
	end
end

gems = [["ruby", 10], ["sapphire", 20]]
p gems
gems.flatten!
p gems


array = [1, 2, 3, 4]
puts array.values