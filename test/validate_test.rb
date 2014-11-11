gem 'minitest', '~> 5.2'            # => true
require 'minitest/autorun'          # => true
require 'minitest/pride'            # => true
require_relative '../lib/validate'  # => true

class ValidateTest < Minitest::Test

  def test_that_it_checks_guess_against_answer
    right_answer1 = ['r','r','r','r']           # => ["r", "r", "r", "r"]
    guess1        = ['r','r','r','r']           # => ["r", "r", "r", "r"]

    guess2 = "rrrr"                       # => "rrrr"
    really_guess2 = guess2.chars          # => ["r", "r", "r", "r"]
    judge = Validate.new(right_answer1)   # => #<Validate:0x007fa4750833d0 @answer=["r", "r", "r", "r"]>
    judge2 = Validate.new(right_answer1)  # => #<Validate:0x007fa475082db8 @answer=["r", "r", "r", "r"]>

    assert judge.correct?(guess1)          # => true
    assert judge2.correct?(really_guess2)  # => true
  end

  def test_that_it_says_how_many_colors_are_right
    right_answer1  = ['r','g','r','r']             # => ["r", "g", "r", "r"]
    new_guess1     = ['r','r','g','b']             # => ["r", "r", "g", "b"]

    right_answer2  = ['r','b','y','g']  # => ["r", "b", "y", "g"]
    new_guess2     = ['g','y','b','r']  # => ["g", "y", "b", "r"]

    right_answer3  = ['r','g','y','r']  # => ["r", "g", "y", "r"]
    new_guess3     = ['b','b','b','b']  # => ["b", "b", "b", "b"]

    judge1 = Validate.new(right_answer1)               # => #<Validate:0x007fa475081198 @answer=["r", "g", "r", "r"]>
    judge2 = Validate.new(right_answer2)               # => #<Validate:0x007fa475080f18 @answer=["r", "b", "y", "g"]>
    judge3 = Validate.new(right_answer3)               # => #<Validate:0x007fa475080c98 @answer=["r", "g", "y", "r"]>
    assert_equal 3, judge1.number_correct(new_guess1)
    assert_equal 4, judge2.number_correct(new_guess2)
    assert_equal 0, judge3.number_correct(new_guess3)
  end

  def test_that_it_says_how_many_colors_are_in_the_right_position
    right_answer1   = ['r','r','r','r']                            # => ["r", "r", "r", "r"]
    new_guess1      = ['r','r','g','b']                            # => ["r", "r", "g", "b"]

    right_answer2   = ['r','r','r','r']  # => ["r", "r", "r", "r"]
    new_guess2      = ['r','r','g','b']  # => ["r", "r", "g", "b"]

    right_answer3   = ['r','r','r','r']  # => ["r", "r", "r", "r"]
    new_guess3      = ['r','r','g','b']  # => ["r", "r", "g", "b"]

    judge = Validate.new(right_answer1)               # => #<Validate:0x007fa4750887b8 @answer=["r", "r", "r", "r"]>
    assert_equal 2, judge.position_check(new_guess1)  # => true
  end


end

# >> Run options: --seed 63181
# >>
# >> # Running:
# >>
# >> [38;5;154m.[0m[38;5;154m.[0m[41m[37mF[0m
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.001311s, 2288.3295 runs/s, 3051.1060 assertions/s.
# >>
# >>   1) Failure:
# >> ValidateTest#test_that_it_says_how_many_colors_are_right [/Users/scottcrawford/Turing/mastermind/test/validate_test.rb:34]:
# >> Expected: 3
# >>   Actual: 4
# >>
# >> 3 runs, 4 assertions, 1 failures, 0 errors, 0 skips
