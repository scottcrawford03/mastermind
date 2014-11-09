gem 'minitest', '~> 5.2'            # => true
require 'minitest/autorun'          # => true
require 'minitest/pride'            # => true
require_relative '../lib/validate'
  # => true

class ValidateTest < Minitest::Test

  def test_that_it_checks_guess_against_answer
    answer = Color.new
    correct_answer = answer.secret_answer
    new_guess = Guess.new(correct_answer.join(','))
    judge = Validate.new
    assert judge.correct?
  end

  def test_that_it_says_how_many_colors_are_right
    skip
    assert_equal 3, player.guess('rrgb')
  end

  def test_that_it_says_how_many_colors_are_in_the_right_position
    skip
    assert_equal 2, player.guess('rrgb')

  end


end

# >> Run options: --seed 47596
# >>
# >> # Running:
# >>
# >> [41m[37mE[0m[41m[37mE[0m[41m[37mE[0m
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.002210s, 1357.4661 runs/s, 0.0000 assertions/s.
# >>
# >>   1) Error:
# >> ValidateTest#test_that_it_says_how_many_colors_are_right:
# >> NameError: undefined local variable or method `player' for #<ValidateTest:0x007fca559795b0>
# >>     /Users/scottcrawford/Turing/mastermind/test/validate_test.rb:16:in `test_that_it_says_how_many_colors_are_right'
# >>
# >>
# >>   2) Error:
# >> ValidateTest#test_that_it_says_how_many_colors_are_in_the_right_position:
# >> NameError: undefined local variable or method `player' for #<ValidateTest:0x007fca55978e80>
# >>     /Users/scottcrawford/Turing/mastermind/test/validate_test.rb:20:in `test_that_it_says_how_many_colors_are_in_the_right_position'
# >>
# >>
# >>   3) Error:
# >> ValidateTest#test_that_it_checks_guess_against_answer:
# >> NameError: uninitialized constant ValidateTest::Color
# >>     /Users/scottcrawford/Turing/mastermind/test/validate_test.rb:9:in `test_that_it_checks_guess_against_answer'
# >>
# >> 3 runs, 0 assertions, 0 failures, 3 errors, 0 skips
