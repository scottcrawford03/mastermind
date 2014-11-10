require_relative '../lib/game_prompts'  # => true
class CLI
  attr_reader :input,                   # => :input
              :output,                  # => :output
              :messages,                # => :messages
              :command                  # => nil

  def initialize(input, output)
    @input = input               # => #<IO:<STDIN>>
    @output = output             # => #<IO:<STDOUT>>
    @messages = GamePrompts.new  # => #<GamePrompts:0x007ffda208d9f8>
    @command = ""                # => ""

  end

  def call
        output.puts @messages.intro_message
      until quit?
        output.puts @messages.player_input                            # => false
        @command = input.gets.strip.downcase  # ~> NoMethodError: undefined method `strip' for nil:NilClass
        welcome_options
      end

  end
end

private  # => Object


  def welcome_options
    case
      when play?
        output.puts "play"
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
    command == "q" || command == "quit"  # => false
  end


game = CLI.new($stdin, $stdout)  # => #<CLI:0x007ffda208dc00 @input=#<IO:<STDIN>>, @output=#<IO:<STDOUT>>, @messages=#<GamePrompts:0x007ffda208d9f8>, @command="">
game.call

# ~> NoMethodError
# ~> undefined method `strip' for nil:NilClass
# ~>
# ~> /Users/scottcrawford/Turing/mastermind/lib/cli.rb:18:in `call'
# ~> /Users/scottcrawford/Turing/mastermind/lib/cli.rb:56:in `<main>'
