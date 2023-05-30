require './lib/ship'
require './lib/cell'
require './lib/board'




class Game
attr_reader :bot_board,
            :bot_cruiser,
            :bot_submarine,
            :board,
            :cruiser,
            :submarine

  def initialize
    @bot_board = Board.new
    @bot_cruiser = Ship.new("Cruiser", 3)
    @bot_submarine = Ship.new("Submarine", 2)
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)

  end

  def computer_start
    # Player and bot have their own boards
    @bot_board = Board.new
    @bot_cruiser = Ship.new("Cruiser", 3)
    @bot_submarine = Ship.new("Submarine", 2)
  
    # Making ship placement static for now until we get it working
    @bot_board.place(@bot_submarine, ["C2", "D2"])
    @bot_board.place(@bot_cruiser, ["A1", "A2", "A3"])
    
    puts "I have laid out my ships on the grid."
    player_start
  end

  def player_start
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @board.render
  
  
    
    cruiser_placed = false
    until cruiser_placed
    puts "Enter the squares for the Cruiser (3 spaces):"
    # All non-alphanumeric removed then char pairs put into array
    cruiser_location = gets.chomp.upcase.gsub(/[^0-9a-z]/i, '').scan(/../)
    valid_coordinate = cruiser_location.all? { |cell| @board.valid_coordinate?(cell) }
    valid_placement = @board.valid_placement?(@cruiser, cruiser_location)
  
      if valid_coordinate && valid_placement
        @board.place(@cruiser, cruiser_location)
        cruiser_placed = true
      else
        puts "Invalid Placement, please try again"
      end
    end
  
    submarine_placed = false
    until submarine_placed
      puts "Enter the squares for the Submarine (2 spaces):"
      submarine_location = gets.chomp.upcase.gsub(/[^0-9a-z]/i, '').scan(/../)
      valid_coordinate = submarine_location.all? { |cell| @board.valid_coordinate?(cell) }
      valid_placement = @board.valid_placement?(@submarine, submarine_location)
  
      if valid_coordinate && valid_placement
        place = board.place(@submarine, submarine_location)
        if place
          submarine_placed = true
        else
          puts "Ships cannot overlap each other, please try again"
        end
      else
        puts "Invalid coordinates, please try again"
      end
    end
    puts @board.render(true)
    show_boards
    player_shot
  end
  
  def show_boards
    puts "=============COMPUTER BOARD============="
    puts @bot_board.render
    puts "==============PLAYER BOARD=============="
    puts @board.render(true)
  end
  
  def player_shot
    shot_placed = false
    until shot_placed
      puts "Enter the coordinate for your shot:"
      shot_location = gets.chomp.upcase.gsub(/[^0-9a-z]/i, '')
      current_shot = @bot_board.cell_group[shot_location]
      
      if @bot_board.valid_coordinate?(shot_location) &&
        !current_shot.fired_upon
        shot_placed = true
        current_shot.fire_upon
        result = current_shot.render == "M" ? "Miss" : "Hit!"
        puts "Your shot on #{shot_location} was a #{result}."
      elsif @bot_board.valid_coordinate?(shot_location) &&
        current_shot.fired_upon
        puts "Please don't waste ammo!"
        puts "you already fired at this location - #{shot_location}"
      else
        puts "Invalid coordinates, please try again"
      end
    end

    if (result == "Hit!") && current_shot.ship.sunk?
      puts "You sank my #{current_shot.ship.name}"
    end
    
    if bot_cruiser.sunk? && bot_submarine.sunk?
      player_win = true
      puts "That was my last ship...  You Won!!!"
    end

    puts @bot_board.render
    dummy_bot_turn unless player_win

  end



  def dummy_bot_turn
    player_shot
  end









end

