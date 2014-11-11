# determine how many colors correct
# determine how many positions correct
# verify user guess with answer array
# track number of guesses - guess 1, guess 2, etc. && "you have X number of guess left"
require_relative '../lib/guess'
require_relative '../lib/colors'
require "pry"

class Validate
  attr_reader :answer,
              :guess

  def initialize(answer)
    @answer = answer
  end

  def position_check(guess)
    difference = 0
    4.times do |index|
        difference += 1 if guess[index] == @answer[index]
      end
    difference
  end

  def number_correct(guess)
  # answer= rrrr
  # guess = rrgg
  number_correct = 0
  guess.each { |letter| number_correct += 1 if answer.include?(letter) }
  number_correct
  end



  def correct?(user_guess)
    user_guess == @answer
  end
end
