require_relative '../lib/guess'
require_relative '../lib/colors'
require_relative '../lib/game_prompts'



class Game
  def initialize(input, output)
    @input = input
    @output = output
    # @answer = Colors.new.secret_answer
  end

  def play

  end
end

player = Game.new
player.welcome
