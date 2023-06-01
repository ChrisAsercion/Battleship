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
loop do
  puts "Enter p to play. \nEnter q to quit."
  answer = gets.chomp.downcase
  if answer == "p"
    game = Game.new
    game.computer_start
    break
  elsif answer == "q"
    puts "Good bye...for now"
    break
  elsif 
    puts "That's not an answer"
  end
end
