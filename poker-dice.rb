class Die
  FACES = %w[ 9 T J Q K A ]
  attr_reader :top_face

  def initialize
    roll
  end

  def self.make_dice
    var_names = [ "d1", "d2", "d3", "d4", "d5" ]
    var_names.collect do |var|
      var = Die.new
    end
  end

  def roll
    @top_face = FACES[ rand(0..5) ]
  end
end

class LoadedDie
  attr_reader :top_face

  def initialize( top_face )
    @top_face = top_face
  end
end


class Hand
  attr_accessor :dice

  def initialize( dice )
    @dice = dice
    @master_hash = count_hash
  end

  # def make_dice
  #   var_names = ["d1", "d2", "d3", "d4", "d5"]
  #   var_names.collect do |var|
  #     var = Die.new
  #   end
  # end

  def display_hand
    string = ""
    @dice.each { |dice| string << "#{dice.top_face} " }
    string.strip
  end

  def count_hash
    master_hash = { "9" => 0, "T" => 0, "J" => 0, "Q" => 0, "K" => 0, "A" => 0 }

    @dice.each do |die|
      master_hash[die.top_face] += 1
    end
    return master_hash
  end

  def rank
    case
    when @master_hash.values.include?(5) ; 'five of a kind'
    end
      
  end

end
