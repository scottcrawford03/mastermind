class CLI
  def initialize(input, output)
    @input = input
    @output = output
    @messages = GamePrompts.new
    @command = ""

  end

  def call
      output.puts @messages.intro_message
      until quit?
        welcome_options
        @command = input.gets.strip.downcase
  end
end

private
  attr_reader :input,
              :output,
              :messages,
              :command

  def welcome_options
    case
      when play?
        game = Game.new
        game.play
      when instructions?
        @player.instructions
      when quit?
        @player.quit
      else
        @player.invalid
      end
    end
  end

  def play?
    command == "p"
  end

  def instructions?
    command == "i"
  end

  def quit?
    command == "q" || "quit"
  end
