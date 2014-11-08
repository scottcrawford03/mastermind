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
    guess = []                                       # => []
    letters = word.split(//)                         # => ["r", "r", "r", "r"]
    case
    when letters.size >= 5
      guess_again
    else
      @guess_count += 1                              # => 1
      guess << letters && @previous_guess << letters  # ~> NameError: undefined local variable or method `previous_guess' for #<Guess:0x007fed41871488>
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
    @previous_guess.join('')
  end

end

new_guess = Guess.new         # => #<Guess:0x007fed41871488 @guess=[], @guess_count=0, @previous_guess=[]>
new_guess.user_guess("rrrr")
new_guess.guess_count
new_guess.user_guess("rrrr")
new_guess.guess_count
new_guess.last_guess

# ~> NameError
# ~> undefined local variable or method `previous_guess' for #<Guess:0x007fed41871488>
# ~>
# ~> /Users/scottcrawford/Turing/mastermind/lib/guess.rb:20:in `user_guess'
# ~> /Users/scottcrawford/Turing/mastermind/lib/guess.rb:44:in `<main>'
