# require './lib/ship'
# require './lib/cell'
require './lib/board'

RSpec.describe Board do
  describe 'initialize' do
    it 'exists' do
      board = Board.new
      expect(board).to be_a(Board)
      expect(board.cells).to be_a(Hash)
    end
    
    it "checks for valid coordinates" do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D1")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
    end

  end


  
end