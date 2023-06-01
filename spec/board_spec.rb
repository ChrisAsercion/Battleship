require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  describe 'initialize' do
    it 'exists' do
      board = Board.new
      expect(board).to be_a(Board)
      expect(board.cells).to be_a(Hash)
    end
    
    it "checks if coordinate is on the board" do
      board = Board.new
      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D1")).to eq(true)
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
    end
  
    it 'checks if coordinates match ship length' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end
  end
  describe 'placement' do
    it 'checks if coordinates are consecutive' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(true)#we thought this should be true because the input of the user shouldn't matter if they are still consecutive.
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end

    it 'checks if coordinates are diagonal' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    it 'can place a ship' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3) 
      board.place(cruiser, ["A1", "A2", "A3"]) 
      cell_1 = board.cell_group["A1"]
      cell_2 = board.cell_group["A2"]
      cell_3 = board.cell_group["A3"]  
      expect(cell_1.empty?).to eq(false)
      expect(cell_2.ship).to be_a(Ship)
      expect(cell_3.empty?).to eq(false)
      expect(cell_1.ship).to eq(cell_2.ship)
      expect(cell_2.ship).to eq(cell_3.ship)
      # submarine = Ship.new("Submarine", 2)
      # cell_4 = board.cell_group["A4"]
      # board.place(submarine, ["B1", "B2"]) 
      # expect(cell_4.ship).assert_not_equal(cell_1.ship)
    end

    it 'can check if they are overlapping' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      submarine = Ship.new("Submarine", 2) 
      expect(board.place(submarine, ["A1", "B1"])).to eq(false)
    end
  end
  describe 'render' do
    it 'can render the board' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      example_board = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
      example_board2 = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
      expect(board.render).to eq(example_board)
      board.place(cruiser, ["A1", "A2", "A3"])
      expect(board.render(true)).to eq(example_board2)
      
    end
    it 'can render vertically' do
      board = Board.new
      submarine = Ship.new("Submarine", 2) 
      board.place(submarine, ["A1", "B1"])
      example_board3 = "  1 2 3 4 \nA S . . . \nB S . . . \nC . . . . \nD . . . . \n"
      expect((board.render(true))).to eq(example_board3)
    end
  end
end