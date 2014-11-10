# determine how many colors correct
# determine how many positions correct
# verify user guess with answer array
# track number of guesses - guess 1, guess 2, etc. && "you have X number of guess left"
require_relative '../lib/guess'   # => true
require_relative '../lib/colors'  # => true

class Validate


  def position_check
    difference = 0
    4.times do |index|
        difference += 1 if guess[index] == secret_answer[index]
      end
    difference
  end

  def number_correct
  compared_guess =  guess - secret_answer
  correct = 4 - compared_guess.size
  correct
  end



  def correct?
    case
    when guess == secret_answer
      "You win!"
    else
      puts after_guess
    end
  end
end
