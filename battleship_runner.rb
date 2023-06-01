require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'



puts "Welcome to...... BATTLESHIP"
puts "              |    |    |                 
             )_)  )_)  )_)              
            )___))___))___)\            
           )____)____)_____)\\
         _____|____|____|____\\\__
---------\                   /---------
  ^^^^^ ^^^^^^^^^^^^^^^^^^^^^
    ^^^^      ^^^^     ^^^    ^^
         ^^^^      ^^^"
puts "Enter p to play. \nEnter q to quit."
answer = gets.chomp.downcase
game = Game.new

if answer == "p"
game.computer_start
else
  puts "Good bye"
end
