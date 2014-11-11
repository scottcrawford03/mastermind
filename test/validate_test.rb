gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/validate'

class ValidateTest < Minitest::Test

  def test_that_it_checks_guess_against_answer
    right_answer = ['r','r','r','r']
    guess = ['r','r','r','r']
    judge = Validate.new(right_answer)
    assert judge.correct?(guess)
  end

  def test_that_it_says_how_many_colors_are_right
    right_answer1  = ['r','g','r','r']
    new_guess1     = ['r','r','g','b']

    right_answer2  = ['r','b','y','g']
    new_guess2     = ['g','y','b','r']

    right_answer3  = ['r','g','y','r']
    new_guess3     = ['b','b','b','b']

    judge1 = Validate.new(right_answer1)
    judge2 = Validate.new(right_answer2)
    judge3 = Validate.new(right_answer3)
    assert_equal 3, judge1.number_correct(new_guess1)
    assert_equal 4, judge2.number_correct(new_guess2)
    assert_equal 0, judge3.number_correct(new_guess3)
  end

  def test_that_it_says_how_many_colors_are_in_the_right_position
    right_answer1   = ['r','r','r','r']
    new_guess1      = ['r','r','g','b']

    right_answer2   = ['r','r','r','r']
    new_guess2      = ['r','r','g','b']

    right_answer3   = ['r','r','r','r']
    new_guess3      = ['r','r','g','b']

    judge = Validate.new(right_answer1)
    assert_equal 2, judge.position_check(new_guess1)
  end


end
