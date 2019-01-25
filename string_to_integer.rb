def str_to_int(str)
	number_table = {}
	(('0'..'9').zip(0..9)).each { |x| number_table[x[0]] = x[1] }
	str.split('').collect {|l| number_table[l]}.inject{|n, d| n * 10 + d}
end


puts str_to_int("23")
puts str_to_int("23234324234")