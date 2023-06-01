class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
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
    @fired_upon
  end

  def fire_upon
    @ship.hit unless @ship == nil
    @fired_upon = true
  end

  def render(show = false)
    if  @fired_upon == true && empty?
      "M"
    elsif  @fired_upon == true && !empty?
      if @ship.sunk? == true
        "X"
      else
        "H"
      end
    elsif show == true && !empty? && @fired_upon == false
      "S"
    else  @fired_upon == false
      "."
    end
  end
end