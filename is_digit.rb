def is_digit(x)
	# check if x contains only letters
	if x.count("a-zA-Z") > 0 || /[[:punct:]]/.match(x) != nil
		false
	else
		no_dashes = x.gsub("-", " ")
		no_surrounding_spaces = no_dashes.strip
		if no_surrounding_spaces.include?(" ")
			false
		else
			true
		end
	end
end

puts is_digit("3") # should be true
puts is_digit("35") # shoud be true
puts is_digit("  35  ") # shoud be true
puts is_digit("  3  ") # should be true
puts is_digit("-3.23") # should be true
puts is_digit("3-4") # should be false
puts is_digit("  3   5") # should be false
puts is_digit("3 5") # should be false
puts is_digit("zero") # should be false
puts is_digit("-4 -54") # should be false
puts is_digit("02934098230498230598")
puts is_digit("123!")