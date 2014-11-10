class Guess
  attr_reader   :player_guess
  attr_accessor :guess_count
                :previous_guess

  def initialize(guess)
    @player_guess = guess.split('')
    @guess_count = 0
    @previous_guess = []
  end

  def user_guess
    if !valid_letters? || !valid_size?
      guess_again
    else
      @guess_count += 1
      @previous_guess << @player_guess
    end
  end

  def guess_again
    "The guess must only be 4 colors and either r, g, b, or y."
  end

  def valid_size?
    player_guess.size == 4
  end

  def valid_letters?
    valid_letters = ['r', 'g', 'b', 'y']
    player_guess.all? { |letter| valid_letters.include?(letter) }
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
