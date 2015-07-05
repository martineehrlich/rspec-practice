require 'rspec'
require 'hand'

describe Hand do
  let(:cards)  do
     [Card.new(:hearts, :king),
           Card.new(:spades, :jack),
           Card.new(:clubs, :five),
           Card.new(:diamonds, :three),
           Card.new(:clubs, :nine)]
         end

  let(:deck) {double("deck", take_cards: cards)}

  let(:hand) {Hand.new(deck.take_cards)}

  describe "#initialize" do
    test_hand = Hand.new
    it "takes in 5 cards" do
      expect(test_hand.cards.length).to eq(5)
    end
  end

  describe "#royal_flush" do
    let(:royal_flush) do
            [Card.new(:spades, :ten),
             Card.new(:spades, :jack),
             Card.new(:spades, :queen),
             Card.new(:spades, :king),
             Card.new(:spades, :ace)]
           end
    it "returns 8 if royal flush" do
      expect(royal_flush(royal_flush)).to eq(10)
    end
  end

  describe "#straight_flush" do
    let(:straight_flush) do
            [Card.new(:spades, :five),
             Card.new(:spades, :six),
             Card.new(:spades, :seven),
             Card.new(:spades, :eight),
             Card.new(:spades, :nine)]
           end
    it "returns 7 if straight flush" do
      expect(straight_flush(straight_flush)).to eq(9)
    end
  end

  describe "#four_kind" do
    let(:four_kind) do
            [Card.new(:spades, :jack),
             Card.new(:hearts, :jack),
             Card.new(:clubs, :jack),
             Card.new(:diamonds, :jack),
             Card.new(:clubs, :nine)]
           end
    it "returns 6 if four of a kind" do
      expect(straight_flush(four_kind)).to eq(8)
    end
  end

  describe "#full_house" do
    let(:full_house) do
            [Card.new(:spades, :five),
             Card.new(:spades, :five),
             Card.new(:spades, :jack),
             Card.new(:spades, :jack),
             Card.new(:spades, :jack)]
           end
    it "returns 7 if fullhouse" do
      expect(full_house(full_house)).to eq(7)
    end
  end

  describe "#flush" do
    let(:flush) do
            [Card.new(:spades, :five),
             Card.new(:spades, :seven),
             Card.new(:spades, :jack),
             Card.new(:spades, :ten),
             Card.new(:spades, :nine)]
           end
    it "returns 6 if flush" do
      expect(flush(flush)).to eq(6)
    end
  end

  describe "#straight" do
    let(:straight) do
            [Card.new(:spades, :king),
             Card.new(:hearts, :queen),
             Card.new(:clubs, :jack),
             Card.new(:diamonds, :ten),
             Card.new(:clubs, :nine)]
           end
    it "returns 5 if straight" do
      expect(straight(straight)).to eq(5)
    end
  end

  describe "#three_kind" do
    let(:three_kind) do
            [Card.new(:spades, :jack),
             Card.new(:hearts, :jack),
             Card.new(:clubs, :jack),
             Card.new(:diamonds, :three),
             Card.new(:clubs, :nine)]
           end
    it "returns 4 if three of a kind" do
      expect(three_kind(three_kind)).to eq(4)
    end
  end

  describe "#two_pair" do
    let(:two_pair) do
            [Card.new(:spades, :jack),
             Card.new(:hearts, :jack),
             Card.new(:clubs, :five),
             Card.new(:diamonds, :three),
             Card.new(:clubs, :five)]
           end
    it "returns 3 if two pair" do
      expect(two_pair(two_pair)).to eq(3)
    end
  end

  describe "#pair" do
    let(:two_kind) do
            [Card.new(:spades, :jack),
             Card.new(:hearts, :jack),
             Card.new(:clubs, :five),
             Card.new(:diamonds, :three),
             Card.new(:clubs, :five)]
           end
    it "returns 2 if  pair" do
      expect(pair(two_kind)).to eq(2)
    end
  end

  describe "#highcard" do
    let(:highcard)  do
            [Card.new(:hearts, :king),
             Card.new(:spades, :jack),
             Card.new(:clubs, :five),
             Card.new(:diamonds, :three),
             Card.new(:clubs, :nine)]
           end
    it "returns 1 if high card" do
      expect(highcard(highcard)).to eq(1)
    end
  end

  describe "#winninghand" do
    let(:flush) do
            [Card.new(:spades, :five),
             Card.new(:spades, :seven),
             Card.new(:spades, :jack),
             Card.new(:spades, :ten),
             Card.new(:spades, :nine)]
           end
     let(:two_kind) do
             [Card.new(:spades, :jack),
              Card.new(:hearts, :jack),
              Card.new(:clubs, :five),
              Card.new(:diamonds, :three),
              Card.new(:clubs, :five)]
            end

    it "returns the winning hand" do
      expect(two_kind.winninghand(flush)).to eq(flush)
    end

    describe "#highcard_winner" do
      let(:highcard)  do
              [Card.new(:hearts, :king),
               Card.new(:spades, :jack),
               Card.new(:clubs, :five),
               Card.new(:diamonds, :three),
               Card.new(:clubs, :nine)]
             end
     let(:highcard2)  do
             [Card.new(:hearts, :two),
              Card.new(:spades, :jack),
              Card.new(:clubs, :five),
              Card.new(:diamonds, :three),
              Card.new(:clubs, :nine)]
            end
      it "returns the winning hand" do
        expect(highcard2.winninghand(highcard)).to eq(highcard)
      end

    end
  end


end
