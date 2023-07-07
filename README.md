# Overview
A project to improve foundational ruby skills, and working with files.

# Problem
In order to create the classic game "hangman" there are several things to consider:
1. What word will be used
2. The number of guesses left (for this implementation an actual figure won't be drawn)
3. The letters already guessed
4. Displaying the word, and correctly guessed letters (ex: j _ _ _)
5. *Saving the state of a game to come back to it later*\*

<small><small>\*Saving the state isn't necessary for hangman itself, but for this implementation this is something that will be done</small></small>

## Solving the problem
My initial thought for this is that there only needs to be one class, the `Game` itself. Since this is a single player game, it isn't necessary for a player class. 

### `Game`
Looking at the subproblems above, we need to know what word will be used for the game, the number of guesses left, the letters already guessed, and the state of the guessed word. These should all be instance variables, and should be updated through methods of the class. A factory method will be necessary to initialize the state of the game in a certain way to avoid repetition. It shoud look something like this:
```
class Game
  starting state (initial values for a new game object)
    - word to guess: random word 
    - number of guesses left: 12 
    - letters guessed: []
    - word state: '_' for each letter in random word
  
  factory method
    get a random word
    create the game
```

The main problem that should be addressed before coding is how to check if the user's guess is correct or not. Other than that, the rest of the code is mainly smaller problems that rely more on utilizing Ruby's built in methods for each object efficiently to solve this problem. The following pseudocode provides a general solution for how the game will run, rather, this will be the 'game loop'
```
until number of guesses left is 0
  get user guess
    update letters guessed
  is user guess in word?
    yes: indicate correct guess, update word state (ex: _ _ _ _ becomes h _ h _), check for win
    no: indicate incorrect guess
  update guesses left
  display word
  check if user wants to save game
```

# Acknowledgements
[The Odin Project](https://www.theodinproject.com/lessons/ruby-hangman)
