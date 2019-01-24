# My solution to the Codewars Find the Nexus of the Codewars Universe Challenge

# Complete the method that takes a hash/object/directory/association list of users, and find the nexus: the user whose rank is the closest is equal to his honor. Return the rank of this user. For each user, the key is the rank and the value is the honor.

# If nobody has an exact rank/honor match, return the rank of the user who comes closest. If there are several users who come closest, return the one with the lowest rank (numeric value). The hash will not necessarily contain consecutive rank numbers; return the best match from the ranks provided.

def nexus users
  ranked_users = users.sort.to_h
  differences = []
  ranked_users.each do |rank, honor|
    nexus_calculation = (rank - honor).abs
    differences.push(nexus_calculation)
  end
  user_position = differences.index(differences.min)
  ranked_users.keys[user_position]
end
