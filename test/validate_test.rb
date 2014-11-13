gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/validate'

class ValidateTest < Minitest::Test
  def test_that_it_checks_guess_against_answer
    right_answer1 = %w(r r r r)
    guess1        = %w(r r r r)

    guess2 = 'rrrr'
    really_guess2 = guess2.chars
    judge = Validate.new(right_answer1)
    judge2 = Validate.new(right_answer1)

    assert judge.correct?(guess1)
    assert judge2.correct?(really_guess2)
  end

  def test_that_it_says_how_many_colors_are_right
    right_answer1  = %w(r g r r)
    new_guess1     = %w(r r g b)

    right_answer2  = %w(r b y g)
    new_guess2     = %w(g y b r)

    right_answer3  = %w(r g y r)
    new_guess3     = %w(b b b b)

    judge1 = Validate.new(right_answer1)
    judge2 = Validate.new(right_answer2)
    judge3 = Validate.new(right_answer3)
    assert_equal 3, judge1.number_correct(new_guess1)
    assert_equal 4, judge2.number_correct(new_guess2)
    assert_equal 0, judge3.number_correct(new_guess3)
  end

  def test_that_it_says_how_many_colors_are_in_the_right_position
    right_answer1   = %w(r r r r)
    new_guess1      = %w(r r g b)

    right_answer2   = %w(r r r r)
    new_guess2      = %w(r r r b)

    right_answer3   = %w(b r r r)
    new_guess3      = %w(r b b b)

    judge1 = Validate.new(right_answer1)
    judge2 = Validate.new(right_answer2)
    judge3 = Validate.new(right_answer3)

    assert_equal 2, judge1.position_check(new_guess1)
    assert_equal 3, judge2.position_check(new_guess2)
    assert_equal 0, judge3.position_check(new_guess3)
  end

  def test_that_user_can_only_input_4_colors
    right_answer1   = %w(r r r r)

    guess1          = %w(r r g)
    guess2          = %w(r r g)
    guess3          = %w(r r g b)

    judge1 = Validate.new(right_answer1)
    judge2 = Validate.new(right_answer1)
    judge3 = Validate.new(right_answer1)

    refute judge1.size?(guess1)
    refute judge2.size?(guess2)
    assert judge3.size?(guess3)
  end

  def test_it_only_accepts_valid_letters
    right_answer1   = %w(r r r r)

    guess1          = ('rrrq')
    guess2          = ('rrr1')
    guess3          = ('rrrr')

    judge1 = Validate.new(right_answer1)
    judge2 = Validate.new(right_answer1)
    judge3 = Validate.new(right_answer1)

    refute judge1.letters?(guess1)
    refute judge2.letters?(guess2)
    assert judge3.letters?(guess3)
  end
end
