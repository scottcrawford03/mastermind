gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/validate'

class ValidateTest < Minitest::Test

  def test_that_it_checks_guess_against_answer
    right_answer = Colors.new.secret_answer
    new_guess = Guess.new(right_answer.join(''))
    judge = Validate.new(new_guess.player_guess, right_answer)
    assert judge.correct?
  end

  def test_that_it_says_how_many_colors_are_right
    right_answer = Colors.new
    new_guess = Guess.new('rrrg')
    judge = Validate.new(new_guess, right_answer.answer)
    assert_equal 3, judge.number_correct
  end

  def test_that_it_says_how_many_colors_are_in_the_right_position
    right_answer = Colors.new
    new_guess = Guess.new('rrgg')
    judge = Validate.new(new_guess, right_answer.answer)
    assert_equal 2, judge.position_check
  end


end
