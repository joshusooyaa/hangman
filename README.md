# Overview
A project to improve foundational ruby skills, and working with files.

# How to play
In the root directory, run 'ruby lib/hangman.rb\
On first loading the game, the game will automatically start a new game. The user then will have the option to guess, or save the state of their game by typing 'save'. If the user decides not to save, they then must guess what letter they think is in the word. If they guess correctly, it'll display the updated word. If not, it'll indicate an incorrect guess. After each round (or rather, guess), the player's number of guesses is reduced. The game ends when the player has guessed the word correctly, or when they run out of guesses.\
If the user starts the game with saved files, they will have the option to chose from their saved files, or to start a new game. If they choose to load, they will be given a list of file names showing the state of the game when it was saved. Example: 3) j__h.yaml  will display to indicate that their third save slot has that much accomplished. If they wish to load that, they can type in '3' and it will load that game from where they left off.

# Known issues
There are a few issues I know that exist. Firstly, if a user wins/loses a game, the previous save of that game doesn't get deleted. The only reason this is an issues is because a user could essentially get as many guesses as they want until they beat it by reloaded a past save. Kind of defeats the purpose of having number of guesses.

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
  get user guess -- or save
    update letters guessed
  is user guess in word?
    yes: indicate correct guess, update word state (ex: _ _ _ _ becomes h _ h _), display the word state
    no: indicate incorrect guess, redisplay the word state
  update guesses left
  check for a win
```

### `Hangman.rb`
With the game loop done, the last problem now becomes how to load a saved game. When starting the main .rb file we can choose to have the user pick if they want to start a new game, or load an existing one. Loading a new game is simple, as it involves creating a game object and then starting the game loop. However, if the user chooses to load a game several things need to happen.
1. First, we need to check if there even are saved games.
    * Backtracking slightly -- we should check for this before asking the user if they want to load a saved game. If there aren't any, why give them the option?
2. Load the names of the files associated with saved games
    * This will then be displayed to the user to choose from
    * These should be displayed with a number, making it easy for the user to pick what saved game they want to load
3. On picking a saved game, the yaml file should be opened properly, and a load method should be created in Game to create a new game object with the saved information.

```
if saved games?
  ask user if they want to start a new game or load a saved game
  if load save game?
    display to user their options
    call load method for a game with yaml file information
  if new game
    create new game
otherwise create new game
```

# Acknowledgements
[The Odin Project](https://www.theodinproject.com/lessons/ruby-hangman)
