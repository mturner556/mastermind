require 'colorize'
# Game will be played between a Player and a Computer
# Computer will randomly select a color pattern
# Colors will be associated with numbers 1-6, with White and Black reserved for feedback
# Player will have twelve rounds to guess pattern
# If the Player guesses the code correctly the game ends with the Player winning
# If the Player cannot guess the code correctly, in twelve rounds, the Player loses

puts " 1 ".on_blue #1
puts " 2 ".on_red #2
puts " 3 ".on_green #3
puts ' 4 '.on_yellow #4
puts ' 5 '.on_cyan #5
puts ' 6 '.on_magenta #6

puts '  '.on_white #correct color, wrong position
puts '  '.on_black #correct color and position

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

  puts "\u{2bc1}".red