require_relative './hangman/game'
require_relative './hangman/file_opener'

saved_games = saved_files
puts "Welcome to Hangman!\nYour task is to figure out the word in 12 guesses!"
game = nil
if saved_games.empty?
  game = Game.create_game
else
  puts "Would you like to: \n1. Start a new game \n2. Load a saved game"
  response = gets.chomp until %w[1 2].include?(response)

  if response == '1'
    game = Game.create_game
  else
    saved_games = saved_files
    puts 'Please choose a number from the following:'
    saved_games.each_with_index { |filename, index| puts "#{index + 1}) #{filename}" }
    puts "\n"
  end

  index = gets.chomp.to_i until (1..saved_games.length).include?(index)
  game = load_save(saved_games[index - 1])
end

game.start
