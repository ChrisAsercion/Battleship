require './lib/ship'
require './lib/cell'



class Board

attr_reader :cell_group

  def initialize
    @game_board = self.cells
  end

  def cells
    range = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    @cell_group = {}
    range.each do |element|
      @cell_group[element] = Cell.new(element)
    end
    @cell_group
  end
  #changed VAR name to cell_group to not confuse with game_board
  #removed @ to keep VAR contained to cells method


  # checks if cell is outside range of @game_board
  def valid_coordinate?(cell)
    @game_board.has_key?(cell)
  end

  def valid_placement?(ship, cells)
    length = ship.length == cells.length ? true : false
    consecutive = consecutive_coordinates(ship, cells)
    overlap = is_overlapping?(cells)
    length && consecutive && overlap 
  end

  # Seperate cells array into row & col arrays
  def consecutive_coordinates(ship, cells)
    column = []
    row = []
    cells.each do |cell|
      row.push((cell[0]).ord)
      column.push((cell[1]).to_i)
    end
    
    # test if row & col arrays contain all same elements
    row_same = row.each_cons(2).all? { |a, b| a == b}
    col_same = column.each_cons(2).all? { |a, b| a == b}

    # test if row & col arrays contain sequential elements
    row_seq = row.sort.each_cons(2).all? { |x, y| y == x + 1 }
    col_seq = column.sort.each_cons(2).all? { |x, y| y == x + 1 }
    
    # check if row is same then col needs to count up OR
    # if col is same then row needs to count up NOT both
    if (row_same && col_seq) || (col_same && row_seq)
      true
    else
      false
    end
  end

  def place(ship, cells)
    if is_overlapping?(cells)
      cells.each do |cell|
        old_cell = @cell_group[cell]
        old_cell.place_ship(ship) 
      end
    else
      false
    end
    
  end

  def is_overlapping?(cells)
    cells.all? do |cell|
      @cell_group[cell].empty?
    end
  end

  def render(show = false)
    if show == false
      "  1 2 3 4 \n" +
      "A #{@cell_group["A1"].render} #{@cell_group["A2"].render} #{@cell_group["A3"].render} #{@cell_group["A4"].render} \n" +
      "B #{@cell_group["B1"].render} #{@cell_group["B2"].render} #{@cell_group["B3"].render} #{@cell_group["B4"].render} \n" +
      "C #{@cell_group["C1"].render} #{@cell_group["C2"].render} #{@cell_group["C3"].render} #{@cell_group["C4"].render} \n" +
      "D #{@cell_group["D1"].render} #{@cell_group["D2"].render} #{@cell_group["D3"].render} #{@cell_group["D4"].render} \n"
    else
      "  1 2 3 4 \n" +
    "A #{@cell_group["A1"].render(true)} #{@cell_group["A2"].render(true)} #{@cell_group["A3"].render(true)} #{@cell_group["A4"].render(true)} \n" +
    "B #{@cell_group["B1"].render(true)} #{@cell_group["B2"].render(true)} #{@cell_group["B3"].render(true)} #{@cell_group["B4"].render(true)} \n" +
    "C #{@cell_group["C1"].render(true)} #{@cell_group["C2"].render(true)} #{@cell_group["C3"].render(true)} #{@cell_group["C4"].render(true)} \n" +
    "D #{@cell_group["D1"].render(true)} #{@cell_group["D2"].render(true)} #{@cell_group["D3"].render(true)} #{@cell_group["D4"].render(true)} \n"
    end
  end
end

