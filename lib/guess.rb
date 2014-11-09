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
    if !valid_letters?(letters) || !valid_size?(letters)
      guess_again
    else
      @guess_count += 1
      guess << letters && @previous_guess << letters
    end
  end

  def guess_again
    "The guess must only be 4 colors and either r, g, b, or y."
  end

  def valid_size?(letters)
    letters.size == 4
  end

  def valid_letters?(letters)
    valid_letters = ['r', 'g', 'b', 'y']
    letters.all? { |letter| valid_letters.include?(letter) }
  end

  def guess_count
    if @guess_count < 2
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
