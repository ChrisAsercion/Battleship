require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  xit 'can start a game' do
    game.computer_start
  end
  describe '#computer placement'
    xit 'can randomly generate a sub position' do
      new_game = Game.new
      bot_board = Board.new
      bot_submarine = Ship.new("Submarine", 2)
      new_game.computer_randomizer_sub(bot_board, bot_submarine)
      bot_board.cell_group.any? do |board|
        expect(board.empty?).to be(false)
      end
    end

    xit 'can randomly generate a cruiser position' do
      new_game = Game.new
      bot_board = Board.new
      bot_cruiser = Ship.new("Cruiser", 3)
      new_game.computer_randomizer_cruiser(bot_board, bot_cruiser)
      require 'pry'; binding.pry
      bot_board.cell_group.any? do |board|
        expect(board.empty?).to be(false)
      end
    end

    it 'can randomly generate 2 ship position' do
      new_game = Game.new
      bot_board = Board.new
      bot_cruiser = Ship.new("Cruiser", 3)
      bot_submarine = Ship.new("Submarine", 2)
      new_game.computer_randomizer_cruiser(bot_board, bot_cruiser)
      new_game.computer_randomizer_sub(bot_board, bot_submarine)
      bot_board.cell_group.any? do |board|
        expect(board.empty?).to be(false)
      end
    end
end

