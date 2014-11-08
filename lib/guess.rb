class Guess
  attr_reader :guess
              :guess_count
              :previous_guess
  def initialize
    @guess = []
    @guess_count = 0
    @previous_guess = []
  end

  def user_guess(word)
    guess = []
    letters = word.split(//)
    case
    when letters.size >= 5
      guess_again
    else
      guess << letters && previous_guess << letters
    end
  end

  def guess_again
    "You may only guess 4 colors."
  end

  def previous_guess
    @previous_guess
  end

end

new_guess = Guess.new
new_guess.user_guess("rggg")
new_guess.previous_guess
new_guess.user_guess("rrrr")
new_guess.previous_guess
