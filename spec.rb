require_relative 'poker-dice'

describe Hand do

  let(:hand) { Hand.new }

  describe ".new" do
    it "returns new instance" do
      expect(hand).to be_a Hand
    end

    it "has five objects" do
      expect(hand.die.count).to equal(5)
    end

    it "contains at least one Die object" do
      expect(hand.die.first.class).to equal(Die)
    end
  end

end
