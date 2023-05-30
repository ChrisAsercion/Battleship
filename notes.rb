ruby battleship_runner.rb
Welcome to BATTLESHIP
Enter p to play.
Enter q to quit.
p
I have laid out my ships on the grid.
You now need to lay out your two ships.
The Cruiser is three units long and the Submarine is two units long.
  1 2 3 4
A . . . .
B . . . .
C . . . .
D . . . .
Enter the squares for the Cruiser (3 spaces):
a1 a2 a3
Enter the squares for the Submarine (2 spaces):
c2 c3
  1 2 3 4
A S S S .
B . . . .
C . S S .
D . . . .
=============COMPUTER BOARD=============
  1 2 3 4
A . . . .
B . . . .
C . . . .
D . . . .
==============PLAYER BOARD==============
  1 2 3 4
A S S S .
B . . . .
C . S S .
D . . . .
Enter the coordinate for your shot:
a1

From: /Users/paulbennett/turing/1_mod/projects/Battleship/lib/game.rb:108 Game#player_shot:

     97: def player_shot
     98:   shot_placed = false
     99:   until shot_placed
    100:     puts "Enter the coordinate for your shot:"
    101:     #require "pry" ; binding.pry
    102:     shot_location = gets.chomp.upcase.gsub(/[^0-9a-z]/i, '')
    103:     if @bot_board.valid_coordinate?(shot_location)
    104:       shot_placed = true
    105:       @bot_board.cell_group[shot_location].fire_upon
    106:       result = @bot_board.cell_group[shot_location].render
    107:       announce = result == "M" ? "Miss" : "Hit!"
 => 108:       require "pry" ; binding.pry
    109:       puts "Your shot on #{shot_location} was a #{announce}."
    110:     else
    111:       puts "Invalid coordinates, please try again"
    112:     end
    113:   end
    114:   puts @bot_board.render
    115:
    116: end

[1] pry(#<Game>)> bot_board
=> #<Board:0x000000011f018e78
 @cell_group=
  {"A1"=>
    #<Cell:0x000000011e0f3c40
     @coordinate="A1",
     @damaged=true,
     @fired_upon=true,
     @ship=#<Ship:0x000000011e0f3650 @hit_counter=1, @length=3, @name="Cruiser">>,
   "A2"=>
    #<Cell:0x000000011e0f3bf0
     @coordinate="A2",
     @damaged=false,
     @fired_upon=false,
     @ship=#<Ship:0x000000011e0f3650 @hit_counter=1, @length=3, @name="Cruiser">>,
   "A3"=>
    #<Cell:0x000000011e0f3b50
     @coordinate="A3",
     @damaged=false,
     @fired_upon=false,
     @ship=#<Ship:0x000000011e0f3650 @hit_counter=1, @length=3, @name="Cruiser">>,
   "A4"=>#<Cell:0x000000011e0f3b28 @coordinate="A4", @damaged=false, @fired_upon=false, @ship=nil>,
   "B1"=>#<Cell:0x000000011e0f3ad8 @coordinate="B1", @damaged=false, @fired_upon=false, @ship=nil>,
   "B2"=>#<Cell:0x000000011e0f3a60 @coordinate="B2", @damaged=false, @fired_upon=false, @ship=nil>,
   "B3"=>#<Cell:0x000000011e0f39c0 @coordinate="B3", @damaged=false, @fired_upon=false, @ship=nil>,
   "B4"=>#<Cell:0x000000011e0f3998 @coordinate="B4", @damaged=false, @fired_upon=false, @ship=nil>,
   "C1"=>#<Cell:0x000000011e0f3948 @coordinate="C1", @damaged=false, @fired_upon=false, @ship=nil>,
   "C2"=>
    #<Cell:0x000000011e0f3920
     @coordinate="C2",
     @damaged=false,
     @fired_upon=false,
     @ship=#<Ship:0x000000011e0f3600 @hit_counter=0, @length=2, @name="Submarine">>,
   "C3"=>#<Cell:0x000000011e0f3880 @coordinate="C3", @damaged=false, @fired_upon=false, @ship=nil>,
   "C4"=>#<Cell:0x000000011e0f3808 @coordinate="C4", @damaged=false, @fired_upon=false, @ship=nil>,
   "D1"=>#<Cell:0x000000011e0f3790 @coordinate="D1", @damaged=false, @fired_upon=false, @ship=nil>,
   "D2"=>
    #<Cell:0x000000011e0f3718
     @coordinate="D2",
     @damaged=false,
     @fired_upon=false,
     @ship=#<Ship:0x000000011e0f3600 @hit_counter=0, @length=2, @name="Submarine">>,
   "D3"=>#<Cell:0x000000011e0f36f0 @coordinate="D3", @damaged=false, @fired_upon=false, @ship=nil>,
   "D4"=>#<Cell:0x000000011e0f36c8 @coordinate="D4", @damaged=false, @fired_upon=false, @ship=nil>},
 @game_board=
  {"A1"=>
    #<Cell:0x000000011e0f3c40
     @coordinate="A1",
     @damaged=true,
     @fired_upon=true,
     @ship=#<Ship:0x000000011e0f3650 @hit_counter=1, @length=3, @name="Cruiser">>,
   "A2"=>
    #<Cell:0x000000011e0f3bf0
     @coordinate="A2",
     @damaged=false,
     @fired_upon=false,
     @ship=#<Ship:0x000000011e0f3650 @hit_counter=1, @length=3, @name="Cruiser">>,
   "A3"=>
    #<Cell:0x000000011e0f3b50
     @coordinate="A3",
     @damaged=false,
     @fired_upon=false,
     @ship=#<Ship:0x000000011e0f3650 @hit_counter=1, @length=3, @name="Cruiser">>,
   "A4"=>#<Cell:0x000000011e0f3b28 @coordinate="A4", @damaged=false, @fired_upon=false, @ship=nil>,
   "B1"=>#<Cell:0x000000011e0f3ad8 @coordinate="B1", @damaged=false, @fired_upon=false, @ship=nil>,
   "B2"=>#<Cell:0x000000011e0f3a60 @coordinate="B2", @damaged=false, @fired_upon=false, @ship=nil>,
[2] pry(#<Game>)>
[3] pry(#<Game>)> exit
Your shot on A1 was a Hit!.
  1 2 3 4
A H . . .
B . . . .
C . . . .
D . . . .