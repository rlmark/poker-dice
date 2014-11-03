require './poker-dice.rb'

describe Hand do

  let(:hand) { Hand.new }

  describe ".new" do
    it "returns new instance" do
      expect(hand).to be_a Hand
    end
  end

end
