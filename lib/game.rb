require_relative '../lib/colors'
require_relative '../lib/game_prompts'
require "validate"
require 'pry'



class Game
  attr_reader :input,
              :output,
              :messages,
              :answer,
              :judge,
              :command

  def initialize(input, output, messages)
    @input       = input
    @output      = output
    @messages    = messages
    @answer      = Colors.new.secret_answer
    @judge       = Validate.new(@answer)
    @command     = ""
    @guess_count = 0
    @start_time  = Time.now
  end

  def play
    until win? || quit?
      output.puts messages.guess_prompt
      @command = gets.chomp.downcase
      turn_evaluation
    end
  end


private

  def turn_evaluation
    case
    when quit?
      abort(messages.quit)
    when win?
      output.puts messages.winner(seconds, minutes)
    when !valid_size? || !valid_letters?
      output.puts messages.guess_again
    when lose?
      # output.puts messages.lose
    else validator
      @guess_count += 1
      output.puts messages.guess_count(@guess_count)
      output.puts messages.after_guess(number_correct, position_right)
    end
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
    judge.correct?(@command)
  end

  def valid_size?
    command.length == 4
  end

  def valid_letters?
    valid_letters = ['r', 'g', 'b', 'y']
    command.chars.all? { |letter| valid_letters.include?(letter) }
  end

  def lose?
    @guess_count = 10
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




end
