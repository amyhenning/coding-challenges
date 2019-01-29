# Solution for Codewars "simple transposition" challenge
# Simple transposition is a basic and simple cryptography technique. We make 2 rows and put first a letter in the Row 1, the second in the Row 2, third in Row 1 and so on until the end. Then we put the text from Row 2 next to the Row 1 text and thats it.

def simple_transposition(text)
  letters = text.split('')
  row_one = []
  row_two = []
  letters.each_index do |i|
    if i.odd?
      row_two.push(letters[i])
    elsif i.even?
      row_one.push(letters[i])
    end
  end
  return (row_one + row_two).join('')
end