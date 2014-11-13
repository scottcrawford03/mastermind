require_relative '../lib/colors'
require_relative '../lib/game_prompts'
require_relative "../lib/validate"
require_relative '../lib/table'



class Game
  attr_reader :input,
              :output,
              :messages,
              :answer,
              :judge,
              :command,
              :guess_count,
              :table,
              :start_time

  def initialize(input, output, messages)
    @answer      = Colors.new.secret_answer
    @judge       = Validate.new(@answer)
    @start_time  = Time.now
    @table       = Table.new
    @input       = input
    @output      = output
    @messages    = messages
    @command     = ""
    @guess_count = 0
    @old_guess   = []
  end

  def play
    output.puts messages.game_start
    output.puts table.show
    until win? || lose?
      output.print messages.guess_prompt
      @command = input.gets.chomp.downcase
      guess_counter
      turn_evaluation
    end
  end


private

  def turn_evaluation
    turn_visuals
    case
    when quit?
      abort(messages.quit)
    when win? then you_win
    when !valid_size? || !valid_letters? then invalid
    when lose? then you_lose
    else validator
      output.puts messages.after_guess(command, number_correct, position_right)
      output.puts messages.guess_count(guess_count)
    end
  end

  def invalid
    output.puts messages.guess_again
    @guess_count -= 1
  end

  def you_lose
    output.puts messages.lose
  end

  def turn_validate
    output.puts messages.after_guess(command, number_correct, position_right)
    output.puts messages.guess_count(guess_count)
  end

  def you_win
   output.puts messages.winner(answer, guess_count, minutes, seconds)
  end

  def turn_visuals
    output.puts messages.mastermind_logo
    table_update
    output.puts table.show
  end

  def guess_counter
    @guess_count += 1
  end

  def table_update
    table.update(guess_count, command, number_correct, position_right, answer) if valid_size? && valid_letters?
  end

  def seconds
    total_time % 60
  end

  def minutes
    total_time / 60
  end


  def total_time
    (end_time - @start_time).to_i
  end

  def end_time
    Time.now
  end

  def win?
    judge.correct?(parsed_guess)
  end

  def valid_size?
    judge.size?(command)
    # command.length == 4
  end

  def valid_letters?
    judge.letters?(command)
  end

  def lose?
    @guess_count >= 10
  end

  def quit?
    command == "q" || command == "quit"
  end

  def validator
    number_correct
    position_right
  end

  def parsed_guess
    @command.chars
  end

  def number_correct
    judge.number_correct(parsed_guess)
  end

  def position_right
    judge.position_check(parsed_guess)
  end

  def save_guess
    @old_guess << @command
  end

end
