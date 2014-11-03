class Die
  FACES = %w[ 9 T J Q K A ]
  attr_reader :top_face

  def initialize
    roll
  end

  def roll
    @top_face = FACES[ rand(0..5) ]
  end

end

class Hand
  attr_accessor :die

  def initialize
    @die = make_die

  end

  def make_die
    var_names = ["d1", "d2", "d3", "d4", "d5"]
    var_names.collect do |var|
      var = Die.new
    end
  end

end
