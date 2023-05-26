class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @damaged = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(piece)
    @ship = piece
  end

  def fired_upon?
    if @damaged == false
      false
    else
      true
    end
  end

  def fire_upon
    @ship.hit
    @damaged = true
  end
end