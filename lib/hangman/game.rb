require_relative('random_word')

class Game
  def initialize(word, game_state, guesses_left = 12, guessed_letters = [])
    @word = word
    @game_state = game_state
    @guesses_left = guesses_left
    @guessed_letters = guessed_letters
  end

  def self.create_game
    word = random_word
    game_state = Array.new(word.length) { '_' }
    new(word, game_state)
  end

  def start
    puts "Welcome to Hangman!\nYour task is to figure out the word in 12 guesses!"
    puts "Your word to guess is: #{@game_state.join(' ')}"
    puts 'Good luck!'
    game_loop
  end

  private

  def game_loop
    until @guesses_left.zero?
      guess = user_guess
      @guessed_letters.append(guess)
      update_game_state(guess)
      @guesses_left -= 1
      break if win?

      display_guesses_left
      # check if user wants to save game
    end
  end

  def user_guess
    puts "Guessed Letters: #{@guessed_letters.join(', ')}" unless @guessed_letters.empty?
    loop do
      puts 'Please choose an unpicked letter:'
      guess = gets.chomp.downcase
      return guess unless @guessed_letters.include?(guess) || !('a'..'z').to_a.include?(guess)
    end
  end

  def update_game_state(guess)
    puts "\n"
    if @word.include?(guess)
      puts 'Correct!'
      find_indicies(guess).each { |index| @game_state[index] = @word[index] }
    else
      puts 'Incorrect!'
    end
    puts "#{@game_state.join(' ')}\n\n"
  end

  def find_indicies(guess)
    @word.each_with_index.map { |letter, index| index if letter == guess }.compact
  end

  def win?
    won = @game_state.include?('_') ? false : true
    puts "You won in #{12 - @guesses_left} guesses!" if won
    won
  end

  def display_guesses_left
    if @guesses_left.zero?
      puts "You ran out of guesses!\nThe word was #{@word.join('')}.\nBetter luck next time!"
    else
      puts "Guesses left: #{@guesses_left}\n\n"
    end
  end
end
