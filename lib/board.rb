require './lib/ship'
require './lib/cell'


class Board
def initialize
  @game_board = self.cells
end

def cells
  range = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

  @player_board = {}
  range.each do |element|
    @player_board[element] = Cell.new(element)
  end
  @player_board
end

def valid_coordinate?(cell)

  @game_board.has_key?(cell)
end

end

