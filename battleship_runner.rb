require './lib/game'

puts "Welcome to BATTLESHIP"
puts "Enter p to play. \nEnter q to quit."
answer = gets.chomp.downcase

if answer == "p"
  game = Game.new
  game.game_start
else
  puts "Good bye"
end