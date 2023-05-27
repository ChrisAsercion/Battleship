require './lib/ship'
require './lib/cell'


class Board
def initialize
  @game_board = self.cells
  @valid_submarine = [['A1', 'A2'], ['A2', 'A3'], ['A3', 'A4'], ['B1', 'B2'], ['B2', 'B3'], ['B3', 'B4'], ['C1', 'C2'], ['C2', 'C3'], ['C3', 'C4'], ['D1', 'D2'], ['D2', 'D3'], ['D3', 'D4'], ['A1', 'B1'], ['A2', 'B2'], ['A3', 'B3'], ['A4', 'B4'], ['B1', 'C1'], ['B2', 'C2'], ['B3', 'C3'], ['B4', 'C4'], ['C1', 'D1'], ['C2', 'D2'], ['C3', 'D3'], ['C4', 'D4']]
  @valid_cruiser = [['A1', 'A2', 'A3'], ['A2', 'A3', 'A4'], ['B1', 'B2', 'B3'], ['B2', 'B3', 'B4'], ['C1', 'C2', 'C3'], ['C2', 'C3', 'C4'], ['D1', 'D2', 'D3'], ['D2', 'D3', 'D4'], ['A1', 'B1', 'C1'], ['B1', 'C1', 'D1'], ['A2', 'B2', 'C2'], ['B2', 'C2', 'D2'], ['A3', 'B3', 'C3'], ['B3', 'C3', 'D3'], ['A4', 'B4', 'C4'], ['B4', 'C4', 'D4']]
end

def cells
  range = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  require 'pry'; binding.pry
  @player_board = {}
  range.each do |element|
    @player_board[element] = Cell.new(element)
  end
  @player_board
end

def valid_coordinate?(cell)
  @game_board.has_key?(cell)
end

def valid_placement?(ship, cells)
  if ship.length == cells.length && valid_coordinate?(cells) &&
    true
  else
    false
  end
end


end

range = ["A1", "A2", "A3"]
arr = []
output = range.each do |item|
  item.split << item
  
end
p output

def consecutive_coordinates(ship, coordinates)
  @valid_cruiser.include?(coordinates) || @valid_submarine.include?(coordinates)
end

