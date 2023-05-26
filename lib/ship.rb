class Ship
  attr_reader :name, :length, :hit_counter

  def initialize(name, length)
    @name = name
    @length = length
    @hit_counter = 0
  end

  def sunk?
    @hit_counter >= @length ? true : false
  end
  
  def health
    @length - @hit_counter
  end

  def hit
    @hit_counter += 1
  end
end

#every time the hit action is called, the hit counter goes up
#this in turn effects the health method by lowering it incrementally
#the ship is initiated with no hits.