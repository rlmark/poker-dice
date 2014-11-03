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
    @die = [1,2,3,4,5]
  end
end
