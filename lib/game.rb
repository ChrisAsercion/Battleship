require './lib/ship'
require './lib/cell'
require './lib/board'


def game
  
  def computer_start
    # Player and bot have their own boards
    bot_board = Board.new
    bot_cruiser = Ship.new("Cruiser", 3)
    bot_submarine = Ship.new("Submarine", 2)
    # Making ship placement static for now until we get it working
    # still needs validation
    bot_board.place(bot_submarine, ["C2", "D2"])
    bot_board.place(bot_cruiser, ["A1", "A2", "A3"])
    
    puts "I have laid out my ships on the grid."
    player_start
  end
  
  def player_start
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    

  end






  puts "game is starting"
end