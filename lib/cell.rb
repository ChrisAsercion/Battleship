class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @damaged = false
    @ship = nil
    @fired_upon = false
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
    if @damaged == true
      true
    else
      false
    end
  end

  def fire_upon
    @ship.hit unless @ship == nil
    @damaged = true
    @fired_upon = true
  end

  def render(show = false)
    if show == true 
      "S"
    elsif @fired_upon == false
      "."
    elsif @fired_upon == true && @ship == nil
      "M"
    elsif @ship.sunk? == true
      "X"
    else @fired_upon == true && @ship != nil
      "H"
    end
  end
end