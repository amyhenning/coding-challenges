def find_missing_number(sequence)
  strings = sequence.split(" ")
  
  if strings.empty? == true
    return 0
  else
    strings.each do |s|
      s.to_i
        if s.to_i == 0
          return 1
      end
    end
  end
  
  numbers = strings.map { |s| s.to_i }
  if numbers.include?(1) == false
    return 1
  elsif numbers.each_cons(2).all? { |x, y| y == x + 1 } == true
    return 0
  else
    return (numbers.min .. numbers.max).reduce(0, &:+) - numbers.reduce(0, &:+)
  end
end