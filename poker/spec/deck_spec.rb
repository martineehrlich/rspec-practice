require 'deck'
require 'rspec'

describe Deck do
  let(:cards) do
    cards = [Card.new(:hearts, :king),
             Card.new(:spades, :jack),
             Card.new(:clubs, :five)]

  end
  let(:deck) {Deck.new(cards)}

  describe "::set_deck" do
    context "when creating a deck" do
      test_deck = Deck.new
      it "contains an array length of 52" do
        expect(test_deck.cards.count) == 52
      end

      it "contains card objects as elements" do
        expect(test_deck.cards.all?{|el| el.is_a?(Card)})
      end
    end
  end

  describe "#take_cards" do
    cards3 = [Card.new(:hearts, :king),
             Card.new(:spades, :jack)]
    it "removes requested amount of cards from top of deck" do
      expect(deck.take_cards(2)).to eq(cards3)
    end

    it "won't allow taking more then deck size" do
      expect{deck.take_cards(4)}.to raise_error("can't take that many cards")
    end
  end

  let(:cards2) {Card.new(:diamonds, :seven)}

  describe "#return" do
    it "returns card to the bottom of the deck" do
      expect(deck.return([cards2])).to eq(cards.concat([cards2]))
    end
  end

  describe "shuffle" do
    it "shuffles the deck" do
      expect(cards.shuffle).to_not eq(cards)
    end
  end


end
