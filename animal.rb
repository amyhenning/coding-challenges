# Superclass
class Animal
	def eat
		puts "nom nom nom"
	end
end

# Dog, cat, and duck are subclasses underneath the animal superclass
class Dog < Animal
	def bark
		puts "woof"
	end
end

class Cat < Animal
	def meow
		puts "meow"
	end
end

class Duck < Animal
	def quack
		puts "quack"
	end
end

class GoldenRetriever < Dog
	def fetch
		puts "i got it, now i bring it back"
	end
end

class Poodle < Dog
	def show_off
		puts "i'm fancy"
	end
end

# This would be an odd case. Ruby does not allow for multiple inheritance.
class DuckBilledPlatypus

end

animal = Animal.new
dog 	 = Dog.new
cat 	 = Cat.new
duck 	 = Duck.new
gr 		 = GoldenRetriever.new
p 		 = Poodle.new

puts animal.is_a?(Poodle)
puts dog.is_a?(GoldenRetriever)
puts gr.is_a?(GoldenRetriever)