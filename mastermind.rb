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

# Mastermind class keeps track of the rounds and checks the player pattern to the user pattern
class Mastermind
  attr_reader :rounds, :master_code, :player_code

  def initialize
    @rounds = 0
    @master_code = false
    @player_code = nil
  end

  def player_input
    @player_code = gets.chomp.split('')
    @player_code = @player_code.map(&:to_i)
  end
end

# Computer class initalizes with a random number
class Computer
  attr_reader :pattern

  def initialize
    @pattern = nil
  end

  def make_pattern
    @pattern = (1..6).to_a.shuffle.take(4)
  end
end

# Code class stores and creates the code_pattern to break
class Code
  attr_reader :choices, :mastermind_pattern

  def initialize
    @choices = [' 1 '.on_blue, ' 2 '.on_light_red, ' 3 '.on_green, ' 4 '.on_yellow, ' 5 '.on_cyan, ' 6 '.on_magenta]
    @mastermind_pattern = []
  end

  def create_mastermind_pattern(a)
    a.each { |e| @mastermind_pattern.push(@choices[e - 1]) }
  end
end

my_code = Code.new
my_computer = Computer.new.make_pattern
my_code.create_mastermind_pattern(my_computer)
puts my_code.code_pattern.join
game = Mastermind.new
game.player_input
