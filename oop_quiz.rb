class Dog
	attr_accessor :name, :breed

	def initialize(name, breed)
		@name = name
		@breed = breed
	end

	def greet
		puts "My name is #{@name}! I am a #{@breed}!"
	end

	def love
		puts "My name is #{@name} and I love you!"
	end

	def fetch
		puts "I can bring back the toy!"
	end

	def tongue_out_tuesday
		puts "I sleep with my tongue poking out."
	end

	def boop
		puts "Boop my cute little #{breed} nose!"
	end
end

dog = Dog.new("Ernie", "terrier mix")
dog.greet
dog.love
dog.fetch
dog.tongue_out_tuesday
dog.boop