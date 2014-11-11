require "game_prompts"
require "game"

class CLI
  attr_reader :input,
              :output,
              :messages,
              :command

  def initialize(input, output)
    @input = input
    @output = output
    @messages = GamePrompts.new
    @command = ""
  end

  def call
      output.puts @messages.mastermind_logo
      output.puts @messages.intro_message
    until quit?
      output.puts @messages.player_input
      @command = input.gets.strip.downcase
      welcome_options
    end
  end
end

private


  def welcome_options
    case
      when play?
        game = Game.new(input, output, messages)
        game.play
      when instructions?
        output.puts @messages.instructions
      when quit?
        output.puts @messages.quit
      else
        output.puts @messages.invalid
      end
    end

  def play?
    command == "p" || command == "play"
  end

  def instructions?
    command == "i" || command == "instructions"
  end

  def quit?
    command == "q" || command == "quit"
  end
