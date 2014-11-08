gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'

class GuessTest < Minitest::Test

  def test_that_user_array_starts_empty
    new_guess = Guess.new
    assert new_guess.guess.empty?
  end

  def test_that_user_can_only_input_4_colors
    guess = Guess.new
    assert_equal "You may only guess 4 colors.", guess.user_guess("rgbyy")
  end

  def test_that_after_guess_array_is_empty_again
    new_guess = Guess.new
    assert new_guess.guess.empty?
    new_guess.user_guess("rgby")
    assert_equal 0, new_guess.guess.length
  end

  def test_that_previous_guess_gets_stored
    new_guess = Guess.new
    new_guess.user_guess("rrrr")
    assert_equal "rrrr", new_guess.last_guess
  end

  def test_that_it_counts_the_number_guesses
    new_guess = Guess.new
    new_guess.user_guess("rrrr")
    new_guess.user_guess("rrrr")
    new_guess.user_guess("rrrr")
    assert_equal "You have taken 3 guesses.", new_guess.guess_count
  end
end
