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


end
