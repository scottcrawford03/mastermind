require_relative '../lib/colors'

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
    number_correct = 0
    new_answer = @answer
    new_answer.each do |letter|
      if guess.include?(letter)
        guess.delete_at(guess.index(letter))
        number_correct += 1
      end
    end
    number_correct
  end

  def correct?(user_guess)
    user_guess == @answer
  end

  def letters?(guess)
    valid_letters = %w(r g b y)
    guess.chars.all? { |letter| valid_letters.include?(letter) }
  end

  def size?(guess)
    guess.length == 4
  end
end
