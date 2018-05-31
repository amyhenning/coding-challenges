class Card
	attr_accessor :rank, :suit

	def initialize(rank, suit)
		@rank = rank
		@suit = suit
	end

	def output_card
		return "#{self.rank} of #{self.suit}"
	end

	def self.random_card
		Card.new(rand(10), :spades)
	end
end

class Deck
	def initialize
		ranks = %w{ace two three four five six seven eight nine ten jack queen king}
		suits = %i{spades hearts diamonds clubs}
		@cards = ranks.flat_map {|rank| suits.map {|suit| Card.new(rank, suit)}}
	end

	def shuffle
		@cards.shuffle!
	end

	def output
		@cards.each do |card|
			puts card.output_card
		end
	end

	def count
		puts @cards.count
	end

	def deal
		puts "You got the #{@cards.shift.output_card}"
	end
end

deck = Deck.new
deck.shuffle
deck.output
puts "---"
deck.deal
puts "---"
deck.count







class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def output_card
    return "#{self.rank} of #{self.suit}"
  end

  def self.random_card
    Card.new(rand(10), :spades)
  end
end

class Deck
  def initialize
    ranks = %w{ace two three four five six seven eight nine ten jack queen king}
    suits = %i{spades hearts diamonds clubs}
    @cards = ranks.flat_map {|rank| suits.map {|suit| Card.new(rank, suit)}}
  end

  def shuffle
    shuffle!(@cards)
  end
  
  def shuffle!(cards)
    unshuffled_deck = [Card.new('ace', :spades), Card.new('two', :spades), Card.new('three', :spades)]
    shuffled_deck = []
    
    [3,2,4,5,10,20,42,13,51].each do |num|
      shuffled_deck << unshuffled_deck[num]
    end
  end

  def output
    @cards.each do |card|
      puts card.output_card
    end
  end

  def count
    puts @cards.count
  end

  def deal
    puts "You got the #{@cards.shift.output_card}"
  end
end


deck = Deck.new
deck.shuffle
deck.output
puts "---"
deck.deal
puts "---"
deck.count

class Dealer  
  def deal!(player)
  end
end
