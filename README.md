# mastermind
Project: Mastermind from The Odin Project course.

For this project I will use the standard rules, which can be found here: https://en.wikipedia.org/wiki/Mastermind_(board_game). The game will be played in a series of twelve rounds. The Code Breaker and Code Setter will have 6 color choices to choose from. Feedback will be given in with 2 color (white and black). White will mean correct colors but incorrect position, and black will mean correct color and correct postion. The postion of the feedback colors will not corrolate with the postion of the guessed colors.

# Game will be played between a Player and a Computer
# Computer will randomly select a color pattern
# Colors will be associated with numbers 1-6, with White and Red reserved for feedback
# Player will have twelve rounds to guess pattern
# If the Player guesses the code correctly the game ends with the Player winning
# If the Player cannot guess the code correctly, in twelve rounds, the Player loses

# create a computer, player, mastermind, and code class
  # the mastermind class will hold the instance of the game, and methods that will correlate to the rules of the game.
  # the code class will hold the correct code pattern to guess

# the computer will create an instance of the code, using the code class

# the mastermind class will:
  # call the computer to create a pattern
  # get the user input for the pattern
  # check if the user pattern is correct
  # if the user pattern is correct, end the game
  # continue checking until 12 rounds are played
  # ask user to play again
  # use .join() method to print elements on oneline