require_relative('random_word')

class Game
  def initialize(word, guesses_left, guessed_letters, game_state)
    @word = word
    @guesses_left = guesses_left
    @guessed_letters = guessed_letters
    @game_state = game_state
  end

  def self.create_game
    word = random_word
    guesses_left = 12
    guessed_letters = []
    game_state = Array.new(word.length) { '_' }
    new(word, guesses_left, guessed_letters, game_state)
  end
end
