require './lib/game'



puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit."
answer = gets.chomp.downcase

if answer == "p"
  game
else
  puts "Good bye"
end
