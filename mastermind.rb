# require colorize to display a colorful output in the command line
require 'colorize'

# MastermindCode class will store a selection of 6 colors and store the master_code
class MastermindCode
  attr_reader :choices, :master_code, :hints

  def initialize
    @choices = [' 1 '.on_blue, ' 2 '.on_light_red, ' 3 '.on_green, ' 4 '.on_yellow, ' 5 '.on_cyan, ' 6 '.on_magenta]
    @hints = ['u\(2bc1}'.on_red, '\u{2bc1}'.on_white]
    @master_code = []
  end

  def store_master_code(code)
    code.each { |e| @master_code.push(e) }
  end

  def compare(code)
    if code == @master_code
      puts 'You win!'
    else
      puts 'You lose!'
    end
  end

  def display(code)
    puts code.map { |e| @choices[e - 1] }.join
  end

  def hint(guess)
    puts guess.map.with_index { |x, i| x == @master_code[i] }.shuffle
  end
end

# Computer class generates a random pattern from 6 numbers that will correlate with the 6 color choices
class Computer
  attr_reader :comp_guess_code, :comp_master_code

  def make_master_code
    @comp_master_code = (1..6).to_a.shuffle.take(4)
  end
end

# Player class will take input for a pattern to check against the code_to_break
class Player
  attr_reader :player_guess_code, :player_master_code

  def player_guess
    @player_guess_code = gets.chomp.split('')
    @player_guess_code = @player_guess_code.map(&:to_i)
  end
end

# The Game class will keep track of the rounds, and compare the Player's guess with the Computer's master code
class Game
  attr_reader :rounds, :player, :computer, :code_to_break

  def initialize
    @rounds = 0
    @player = Player.new
    @computer = Computer.new
    @code_to_break = MastermindCode.new
  end

  # play_game will get the Player's code for 12 rounds
  def play_game
    while @rounds < 11
      # gets the guess
      @player.player_guess
      # compares the guess
      @code_to_break.compare(@player.player_guess_code)
      # displays the guess and hints
      @code_to_break.display(@player.player_guess_code)
      @code_to_break.hint(@player.player_guess_code)
      @rounds += 1
    end
  end

  def mastermind_code
    @code_to_break.store_master_code(@computer.make_master_code)
    puts @computer.comp_master_code.join
  end
end



mastermind = Game.new
mastermind.mastermind_code
mastermind.play_game

puts mastermind.player.player_guess_code.join
puts mastermind.rounds
