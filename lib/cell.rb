class Cell
  attr_reader :coordinate, :ship
  
  def initialize(coordinate)
    @coordinate = coordinate
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
end