# require colorize to display a colorful output in the command line
require 'colorize'

$blue = ' 1 '.on_blue
$light_red = ' 2 '.on_light_red
$green = ' 3 '.on_green
$yellow = ' 4 '.on_yellow
$cyan = ' 5 '.on_cyan
$magenta = ' 6 '.on_magenta

$red = "\u{2b24}".red
$white = "\u{2b24}".white
$clear = "\u{25cc}".white


# MastermindCode class will store a selection of 6 colors and store the master_code
class MastermindCode
  attr_reader :choices, :master_code, :hints

  def initialize
    @choices = [$blue, $light_red, $green, $yellow, $cyan, $magenta]
    @hints = [$red, $white, $clear]
    @master_code = []
  end

  def store_master_code(code)
    code.each { |e| @master_code.push(e) }
  end

  def compare(code)
    if code == @master_code
      true
    end
  end

  def display(code)
    puts code.map { |e| @choices[e - 1] }.join
  end

  # hints[0] (red) correct value/postion, hints[1] (white) correct value/incorrect position, hints[2] (clear) incorrect value/position
  def hint(guess)
    hint = guess.map.with_index do |x, i|
      if x == @master_code[i]
        @hints[0]
      elsif @master_code.include?(x)
        @hints[1]
      else
        @hints[2]
      end
    end
    puts hint.shuffle.join(' ')
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
    @winner = false
  end

  # play_game will get the Player's code for 12 rounds
  def play_game
    until @rounds > 11 || @winner == true
      # gets the guess
      @player.player_guess
      # compares the guess
      @code_to_break.compare(@player.player_guess_code) ? @winner = true : false
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

  # the following methods will give instruction and other feedback for the user
  def instruction
    puts instruction = <<~HEREDOC
      Mastermind is a game played by one player against a computer. The
      game will be played in 12 rounds. You will have to guess the code the
      computer sets.

      The choices are #{$blue}, #{$light_red}, #{$green}, #{$yellow}, #{$cyan}, #{$magenta}.
      The Master code will be comprised of four non-repeating colors. Hints will be given based
      on your guess. Start by selecting a number associated with your color choice.

      Hints will be displayed below your guess.

      #{$red} means you have chosen the correct color and postion.
      #{$white} means you have chosen the correct color but incorrect position.
      #{$clear} means you have the incorrect color and postion.

      Hints are in no specific order.
    HEREDOC
  end

  def prompt
  end

  def result
  end
end

game = Game.new
# game.mastermind_code
# game.play_game"\u{25cc}".white
game.instruction
