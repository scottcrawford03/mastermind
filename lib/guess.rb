class Guess
  attr_reader   :guess
  attr_accessor :guess_count
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
      @guess_count += 1
      guess << letters && @previous_guess << letters
    end
  end

  def guess_again
    "You may only guess 4 colors."
  end

  def guess_count
    case
    when @guess_count < 2
      "You have taken #{@guess_count} guess"
    else
      "You have taken #{@guess_count} guesses."
    end
  end

  def last_guess
    last = @previous_guess.join('')
    last[-4..-1]
  end

end

new_guess = Guess.new
new_guess.user_guess("rrrr")
new_guess.guess_count
new_guess.user_guess("rrrr")
new_guess.guess_count
new_guess.last_guess
