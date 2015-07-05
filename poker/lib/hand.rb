require 'deck'

class Hand

  attr_accessor :cards

  def initialize(cards = [Card.new(:hearts, :king),
        Card.new(:spades, :jack),
        Card.new(:clubs, :five),
        Card.new(:diamonds, :three),
        Card.new(:clubs, :nine)])
    @cards = cards
  end

  def royal_flush
    suit = cards[0].suit
    if cards.all? {|card| card.suit == suit}
    if cards.each d
  end

  def
end
