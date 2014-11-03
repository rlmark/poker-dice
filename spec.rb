require_relative 'poker-dice'

describe Hand do

  let(:hand) { Hand.new(Die.make_dice) }

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
      expect(hand.display_hand.length).to equal(9)
    end
  end

  describe ".count_hash" do
    it "returns a hash of scores" do
      expect(hand.count_hash.class).to equal(Hash)
    end

    it "returns the count of each top_face for a loaded dice" do
      dice = 5.times.map{ LoadedDie.new('Q') }
      hand = Hand.new(dice)

      expect(hand.count_hash).to eq({"9" => 0, "T" => 0, "J" => 0, "Q" => 5, "K" => 0, "A" => 0})
    end
  end

  describe ".rank" do
    it "returns rank of hand" do
      dice = 5.times.map{ LoadedDie.new('Q') }
      hand = Hand.new(dice)

      expect(hand.rank).to equal('five of a kind')
    end

  end

end
