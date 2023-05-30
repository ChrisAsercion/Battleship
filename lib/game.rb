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
    puts "
    
    =============COMPUTER BOARD============="
    puts @bot_board.render
    puts "==============PLAYER BOARD=============="
    puts @board.render(true)
  end
  
  def player_shot
    shot_placed = false
    until shot_placed
      puts "Enter the coordinate for your shot:"
      #require "pry" ; binding.pry
      shot_location = gets.chomp.upcase.gsub(/[^0-9a-z]/i, '')
        if @bot_board.valid_coordinate?(shot_location)
          shot_placed = true
          @bot_board.cell_group[shot_location].fire_upon
          result = @bot_board.cell_group[shot_location].render
            if result == "H"
              result = "hit"
            elsif result == "M"
              result = "miss"
            else result == "X"
              result = "final blow, you sunk an enemy vessel"
            end
        else
          puts "Invalid coordinates, please try again"
        end
      puts "Your shot on #{shot_location} was a #{result}."
      # puts @bot_board.render
      #if coord is valid then
      # get firedupon cell and see if there is a ship there
      # if ship then fire_upon
      #show_boards
      computer_shot
    end
  end

  def computer_shot
    possible_shots = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    shot = possible_shots.sample
    @board.cell_group[shot].fire_upon
    possible_shots.delete(shot)
    show_boards
    player_shot
  end
  
  #@board.cell_group[].fired_upon? == false
    
  #   if @board.cell_group[range.sample].fired_upon? == false
  #     @board.cell_group[range.sample].fire_upon
  #   else
  # end  

  def shoot
    possible_shots = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    shot_index = rand(0..(possible_shots.length - 1))
    shot = possible_shots[shot_index]
    @board.cell_group[shot].fire_upon
    possible_shots.delete_at(shot_index)
    return shot
    show_boards
    player_shot
  end
  
end

