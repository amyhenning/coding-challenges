def reverse_word(str)
	letters = str.split('').to_a
	reversed_word = []
	while letters.length > 0
		last_letter = letters.last
		reversed_word.push(last_letter)
		letters.pop
	end
	return reversed_word.join.to_s
end


puts reverse_word('hello')