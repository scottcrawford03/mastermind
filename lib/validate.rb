# determine how many colors correct
# determine how many positions correct
# verify user guess with answer array
# track number of guesses - guess 1, guess 2, etc. && "you have X number of guess left"
require_relative '../lib/guess'
require_relative '../lib/colors'


class Validate
  attr_reader :answer_check,
              :guess

  def initialize(answer)
    @answer_check = answer
  end

  def position_check(guess)
    difference = 0
    4.times do |index|
        difference += 1 if guess[index] == @answer_check[index]
      end
    difference
  end

  def number_correct(guess)
  number_correct = 0
  new_answer = @answer_check
  guess.each do |letter|
    if new_answer.include?(letter)
      new_answer.delete_at(new_answer.index(letter))
       number_correct += 1
    end
  end
  number_correct
  end

  def correct?(user_guess)
    user_guess == @answer
  end

end
