require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'



puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit."
answer = gets.chomp.downcase
game = Game.new


if answer == "p"
game.computer_start

else
  puts "Good bye"
end
