gem 'minitest', '~> 5.2'         # => true
require 'minitest/autorun'       # => true
require 'minitest/pride'         # => true
require_relative '../lib/guess'  # ~> TypeError: no implicit conversion of Array into String

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

# >> Run options: --seed 57433
# >>
# >> # Running:
# >>
# >>
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.001781s, 0.0000 runs/s, 0.0000 assertions/s.
# >>
# >> 0 runs, 0 assertions, 0 failures, 0 errors, 0 skips

# ~> TypeError
# ~> no implicit conversion of Array into String
# ~>
# ~> /Users/scottcrawford/Turing/mastermind/lib/guess.rb:20:in `user_guess'
# ~> /Users/scottcrawford/Turing/mastermind/lib/guess.rb:45:in `<top (required)>'
# ~> /Users/scottcrawford/Turing/mastermind/test/guess_test.rb:4:in `require_relative'
# ~> /Users/scottcrawford/Turing/mastermind/test/guess_test.rb:4:in `<main>'
