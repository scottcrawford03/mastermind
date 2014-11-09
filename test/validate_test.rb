gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/validate'
require_relative '../lib/guess'

class ValidateTest < Minitest::Test

  def test_that_it_checks_guess_against_answer

    assert secret_answer == guess
  end

  def test_that_it_says_how_many_colors_are_right
    assert_equal 3, player.guess('rrgb')
  end

  def test_that_it_says_how_many_colors_are_in_the_right_position
    assert_equal 2, player.guess('rrgb')

  end


end
