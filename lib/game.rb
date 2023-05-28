require './lib/ship'
require './lib/cell'
require './lib/board'



  
  def computer_start
    # Player and bot have their own boards
    bot_board = Board.new
    bot_cruiser = Ship.new("Cruiser", 3)
    bot_submarine = Ship.new("Submarine", 2)

    # Making ship placement static for now until we get it working
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
    puts board.render


    
    puts "Enter the squares for the Cruiser (3 spaces):"
    # All non-alphanumeric removed then char pairs put into array
    cruiser_location = gets.chomp.upcase.gsub(/[^0-9a-z]/i, '').scan(/../)
    valid_coordinate = cruiser_location.all? { |cell| board.valid_coordinate?(cell) }
    valid_placement = board.valid_placement?(cruiser, cruiser_location)

    if valid_coordinate && valid_placement
      board.place(cruiser, cruiser_location)
    else
      puts "Invalid Placement, please try again"
    end

    puts "Enter the squares for the Submarine (2 spaces):"
    submarine_location = gets.chomp.upcase.gsub(/[^0-9a-z]/i, '').scan(/../)
    valid_coordinate = submarine_location.all? { |cell| board.valid_coordinate?(cell) }
    valid_placement = board.valid_placement?(submarine, submarine_location)

    if valid_coordinate && valid_placement
      board.place(submarine, submarine_location)
    else
      puts "Invalid Placement, please try again"
    end


    
    puts board.render(true)
end


