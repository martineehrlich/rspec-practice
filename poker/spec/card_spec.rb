require 'card'
require 'rspec'

describe Card do
  let(:card) {Card.new(:spades, :king)}
  let(:card2) {Card.new(:hearts, :jack)}
  let(:card3) {Card.new(:clubs, :four)}
  let(:card4) {Card.new(:clubs, :four)}


  describe "#initialize" do
    it "won't create a card with wrong number of arguments" do
      expect{Card.new(:spades)}.to raise_error(ArgumentError)
    end

    it "won't create a card with an invalid suit or value" do
      expect{Card.new(:spade, :jack)}.to raise_error("invalid suit or value")
    end
  end

  describe "#suit" do
    it "returns card's suit" do
      expect(card.suit).to eq(:spades)
    end
  end

  describe "#value" do
    it "returns card's value" do
      expect(card.value).to eq(:king)
    end
  end

  describe "#to_s" do
    it "returns card string value" do
      expect(card.to_s).to eq("K of spades")
    end
  end

  describe "#number_value" do
    it "returns cards actual value" do
      expect(card.number_value).to eq(13)
    end
  end

  describe "#<=>()" do
    it "compare card's value to another" do
      expect(card.<=>(card2)).to eq(1)
    end

    it "compare card's value to another" do
      expect(card3.<=>(card4)).to eq(0)
    end

    it "compare card's value to another" do
      expect(card3.<=>(card2)).to eq(-1)
    end
  end

  describe "#==" do
    it "compare card's suit to another" do
      expect(card2.==(card)).to eq(false)
    end

    it "compare card's suit to another" do
      expect(card4.==(card3)).to eq(true)
    end

  end
end
