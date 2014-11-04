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
    it "returns five of a kind" do
      dice = 5.times.map{ LoadedDie.new('Q') }
      hand = Hand.new(dice)

      expect(hand.rank).to eq('five of a kind')
    end

    def create_hand(array)
      dice = array.each.map { |face| LoadedDie.new(face) }
      Hand.new(dice)
    end

    it "returns a straight" do
      hand = create_hand(['9', 'T', 'Q', 'K', 'J'])
      expect(hand.rank).to eq('straight')
    end

    it "returns a full house" do
      hand = create_hand(['9', '9', 'Q', 'Q', 'Q'])
      expect(hand.rank).to eq('full house')
    end

    it "returns two pair" do
      hand = create_hand(['9', '9', 'Q', 'Q', 'K'])
      expect(hand.rank).to eq('two pair')
    end

    it "returns four of a kind" do
      hand = create_hand(['9', '9', '9', '9', 'K'])
      expect(hand.rank).to eq('four of a kind')
    end

    it "returns three of a kind" do
      hand = create_hand(['9', '9', '9', 'Q', 'K'])
      expect(hand.rank).to eq('three of a kind')
    end
  end

end
