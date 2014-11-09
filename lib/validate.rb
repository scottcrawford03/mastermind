# determine how many colors correct
# determine how many positions correct
# verify user guess with answer array
# track number of guesses - guess 1, guess 2, etc. && "you have X number of guess left"
require_relative '../lib/guess'   # => true
require_relative '../lib/colors'  # => true

class Validate


  def position_check
    user_guess.zip(secret_answer).map { |user, answer| user == answer }

  end

  def number_correct
  compared_guess =  user_guess - secret_answer
  correct = 4 - compared_guess.size
  correct
  end

  def after_guess
    "You have #{number_correct} correct colors and #{position_check} in the right position."
  end


  def correct?
    require 'pry'
    binding.pry
    case
    when guess == secret_answer
      "You win!"
    else
      puts after_guess
    end
  end
end
