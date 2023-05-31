require './lib/ship'
require './lib/cell'
require './lib/board'


class Game
  
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

  def computer_randomizer_cruiser(bot_board, bot_cruiser)
    valid_cruiser = [['A1', 'A2', 'A3'], ['A2', 'A3', 'A4'], ['B1', 'B2', 'B3'], ['B2', 'B3', 'B4'], ['C1', 'C2', 'C3'], ['C2', 'C3', 'C4'], ['D1', 'D2', 'D3'], ['D2', 'D3', 'D4'], ['A1', 'B1', 'C1'], ['B1', 'C1', 'D1'], ['A2', 'B2', 'C2'], ['B2', 'C2', 'D2'], ['A3', 'B3', 'C3'], ['B3', 'C3', 'D3'], ['A4', 'B4', 'C4'], ['B4', 'C4', 'D4']]
    @cruiser_selection = valid_cruiser.sample
    bot_board.place(bot_cruiser, @cruiser_selection)
  end

  def computer_randomizer_sub(bot_board, bot_submarine)
    valid_submarine = [['A1', 'A2'], ['A2', 'A3'], ['A3', 'A4'], ['B1', 'B2'], ['B2', 'B3'], ['B3', 'B4'], ['C1', 'C2'], ['C2', 'C3'], ['C3', 'C4'], ['D1', 'D2'], ['D2', 'D3'], ['D3', 'D4'], ['A1', 'B1'], ['A2', 'B2'], ['A3', 'B3'], ['A4', 'B4'], ['B1', 'C1'], ['B2', 'C2'], ['B3', 'C3'], ['B4', 'C4'], ['C1', 'D1'], ['C2', 'D2'], ['C3', 'D3'], ['C4', 'D4']]
    acceptable_array =[]
    @cruiser_selection.each do |coord|
      results = valid_submarine.keep_if {|element| element == "A1" || "A2"}
      require 'pry'; binding.pry
      acceptable_array << results
    end

    require 'pry'; binding.pry
    acceptable_array
    # valid_submarine.filter
    #   != @cruiser_selection.each do |coord|
    #     coord.
    #   end
        
    
    @cruiser_selection
    bot_selection = valid_submarine.sample
    bot_board.place(bot_submarine, bot_selection)
  end

  def computer_placement(bot_board, bot_submarine, bot_cruiser)
    
    #look for the array without overlap 
    bot_board.cell_group.values.each do |cell| 
      #require 'pry'; binding.pry
      #cell.ship = 0
      #require 'pry'; binding.pry
      computer_randomizer_cruiser(bot_board, bot_cruiser)
      until  cell.ship.name != nil &&  cell.ship.name.find("Submarine") #&& bot_board.cell_group[cell].ship.name.include?("Cruiser")
      #where both ships are not overlap iterate
      #computer_randomizer_cruiser(bot_board, bot_cruiser)
      computer_randomizer_sub(bot_board, bot_submarine)
      end
    end
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
end


# bot_selection = [] 
# require 'pry'; binding.pry
# until bot_board.valid_placement?(bot_submarine, bot_selection)  
#   bot_selection.push(bot_board.cell_group.keys.sample, bot_board.cell_group.keys.sample)
#   bot_selection.clear
# end
# bot_board.place(bot_submarine, bot_selection)

