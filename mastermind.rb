require 'colorize'
# Game will be played between a Player and a Computer
# Computer will randomly select a color pattern
# Colors will be associated with numbers 1-6, with White and Red reserved for feedback
# Player will have twelve rounds to guess pattern
# If the Player guesses the code correctly the game ends with the Player winning
# If the Player cannot guess the code correctly, in twelve rounds, the Player loses

# puts "\u{2bc1}".white #correct color, wrong position, uses unicode
# puts "\u{2bc1}".red #correct color and position, uses unicode

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

class Player

end

class Mastermind

end

class Computer

end

# Code class stores and creates the code_pattern to break
class Code
  attr_reader :choices, :code_pattern

  def initialize
    @choices = [' 1 '.on_blue, ' 2 '.on_light_red, ' 3 '.on_green, ' 4 '.on_yellow, ' 5 '.on_cyan, ' 6 '.on_magenta]
    @code_pattern = []
  end

  def create_code(a, b, c, d)
    @code_pattern.push(@choices[a - 1], @choices[b - 1], @choices[c - 1], @choices[d - 1])
  end
end

my_code = Code.new
my_code.create_code(1, 2, 3, 4)

puts my_code.code_pattern.join()