require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  xit 'can start a game' do
    game.computer_start
  end

  it 'can randomly generate sub position' do
    new_game = Game.new
    bot_board = Board.new
    bot_submarine = Ship.new("Submarine", 2)
    new_game.computer_randomizer_sub(bot_board, bot_submarine)
    expect(bot_submarine.empty?).to be(false)
  end
end

