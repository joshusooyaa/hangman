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
    until @guesses_left == 0
      # get user guess
        # update letters guessed
      guess = user_guess
      @guessed_letters.append(guess)
      # check if user guess was correct
        # yes: 
          # indicate correct guess
          # update game state
          # check for win
            # yes:
              # indicate win
              # break
            # no:
              # continue
        # no: 
          # indicate incorrect guess
      # update guesses left
      # display word
      # check for win
      # check if user wants to save game
    end
  end

  def user_guess
    puts "Guessed Letters: #{@guessed_letters.join(', ')}" unless @guessed_letters.empty?
    loop do
      puts 'Please choose an unpicked letter.'
      guess = gets.chomp.downcase
      return guess unless @guessed_letters.include?(guess) || !('a'..'z').to_a.include?(guess)
    end
  end
end
