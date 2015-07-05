require 'card'

class Deck

  def self.set_deck
    cards = []
    Card.suits.each do |suit|
     Card.values.each do |value|
       cards << Card.new(suit, value)
     end
   end
   cards
  end
  attr_accessor :cards
  def initialize(cards = Deck.set_deck)
    @cards = cards
  end

  def take_cards(n)
    raise "can't take that many cards" if n > cards.length
    cards.shift(n)
  end

  def return(cards)
    self.cards.concat(cards)
  end

  def shuffle
    self.cards.shuffle
  end

end
