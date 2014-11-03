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
  end

end
