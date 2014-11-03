require_relative 'poker-dice'

describe Hand do

  let(:hand) { Hand.new }

  describe ".new" do
    it "returns new instance" do
      expect(hand).to be_a Hand
    end

    it "has five objects" do
      expect(hand.dice.count).to equal(5)
    end

    it "contains at least one Dice object" do
      expect(hand.dice.first.class).to equal(Die)
    end

    it "has access to die's top_face" do
      expect(hand.dice.last.top_face).to match(/9|T|J|Q|K|A/)
    end
  end

  describe ".display_hand" do
    it "returns current hand" do
      expect(hand.display_hand.length).to equal(10)
    end
  end
end
