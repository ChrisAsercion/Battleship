class Ship
  attr_reader :name, :length, :health, :hit_counter

  def initialize(name, length)
    @name = name
    @length = length
    @hit_counter = 0
  end

  def sunk?
    if @life_points == 0
      true
    else
      false
    end
  end
  def health
    @life_points = @length - @hit_counter
  end

  def hit
    @hit_counter += 1
  end
end