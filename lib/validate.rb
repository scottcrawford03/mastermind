# determine how many colors correct
# determine how many positions correct
# verify user guess with answer array
# track number of guesses - guess 1, guess 2, etc. && "you have X number of guess left"
require_relative '../lib/guess'
require_relative '../lib/colors'

class Validate
  attr_reader :answer,
              :guess

  def initialize(guess, answer)
    @guess = guess
    @answer = answer
  end

  def position_check
    difference = 0
    4.times do |index|
        difference += 1 if @guess.player_guess[index] == @answer[index]
      end
    difference
  end

  def number_correct
  compared_guess =  @guess.player_guess - @answer
  correct = 4 - compared_guess.size
  correct
  end



  def correct?
    @guess == @answer
  end
end
