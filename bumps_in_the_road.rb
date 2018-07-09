def bump(x)
  road = x.split('')
  bumps = 0
  road.each do |thing|
    if thing == "n"
      bumps += 1
    end
  end
  if bumps <= 15
    return "Woohoo!"
  else
    return "Car Dead"
  end
  #puts bumps
  # puts road.inspect
end

puts bump("nn_n_nn___n_n__n_n_nnn___n_____nn__")