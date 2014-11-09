gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'

class GuessTest < Minitest::Test

  def test_that_user_can_only_input_4_colors
    guess = Guess.new("ggggg")
    guess1 = Guess.new("gg")
    guess2 =Guess.new("gggg")
    refute guess.valid_size?
    refute guess1.valid_size?
    assert guess2.valid_size?
  end

  def test_that_previous_guess_gets_stored
    new_guess = Guess.new("rrrr")
    new_guess.user_guess
    assert_equal "rrrr", new_guess.last_guess
  end

  def test_that_it_counts_the_number_guesses
    new_guess = Guess.new("rrrr")
    new_guess.user_guess
    new_guess.user_guess
    new_guess.user_guess
    assert_equal "You have taken 3 guesses.", new_guess.guess_count
  end

  def test_it_only_accepts_valid_letters
    new_guess = Guess.new("rxby")
    new_guess2 = Guess.new("rrrr")
    refute new_guess.valid_letters?
    assert new_guess2.valid_letters?
  end
end
