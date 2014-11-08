class Guess
  attr_reader   :guess           # => nil
  attr_accessor :guess_count     # => nil
                :previous_guess  # => :previous_guess

  def initialize
    @guess = []           # => []
    @guess_count = 0      # => 0
    @previous_guess = []  # => []
  end

  def user_guess(word)
    guess = []                                        # => [], []
    letters = word.split(//)                          # => ["r", "r", "r", "r"], ["r", "r", "r", "r"]
    case
    when letters.size >= 5
      guess_again
    else
      @guess_count += 1                               # => 1, 2
      guess << letters && @previous_guess << letters  # => [["r", "r", "r", "r"]], [["r", "r", "r", "r"], ["r", "r", "r", "r"]]
    end                                               # => [["r", "r", "r", "r"]], [["r", "r", "r", "r"], ["r", "r", "r", "r"]]
  end

  def guess_again
    "You may only guess 4 colors."
  end

  def guess_count
    case
    when @guess_count < 2
      "You have taken #{@guess_count} guess"     # => "You have taken 1 guess"
    else
      "You have taken #{@guess_count} guesses."  # => "You have taken 2 guesses."
    end                                          # => "You have taken 1 guess", "You have taken 2 guesses."
  end

  def last_guess
    last = @previous_guess.join('')  # => "rrrrrrrr"
    last[-4..-1]                     # => "rrrr"
  end

end

new_guess = Guess.new         # => #<Guess:0x007fc614235208 @guess=[], @guess_count=0, @previous_guess=[]>
new_guess.user_guess("rrrr")  # => [["r", "r", "r", "r"]]
new_guess.guess_count         # => "You have taken 1 guess"
new_guess.user_guess("rrrr")  # => [["r", "r", "r", "r"], ["r", "r", "r", "r"]]
new_guess.guess_count         # => "You have taken 2 guesses."
new_guess.last_guess          # => "rrrr"
