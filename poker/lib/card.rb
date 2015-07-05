class Card

  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  NUMBER_VALUE = {
    :ace   => [1,14],
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13
  }

  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
    raise "invalid suit or value" unless SUIT_STRINGS.has_key?(suit) && VALUE_STRINGS.has_key?(value)
  end

  def self.suits
    SUIT_STRINGS.keys
  end

  def self.values
    VALUE_STRINGS.keys
  end


  def to_s
    "#{VALUE_STRINGS[value]} of #{suit}"
  end

  def number_value
    NUMBER_VALUE[value]
  end

  def <=>(other_card)
    self.value <=> other_card.value
  end

  def ==(other_card)
    self.suit == other_card.suit
  end



end
