gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/colors'

class ColorsTest < Minitest::Test


  def test_that_it_has_4_color_options
    colors = Colors.new
    assert_equal 4, colors.answer_options.count
  end

  def test_that_it_can_only_be_r_g_b_y
    colors = Colors.new

    assert_equal "r", colors.answer_options[0]
    assert_equal "g", colors.answer_options[1]
    assert_equal "b", colors.answer_options[2]
    assert_equal "y", colors.answer_options[3]

    alphabet = 'a'.upto('z').to_a
    new_alphabet = alphabet.to_s.gsub(/[rgby]/, '')

    refute colors.answer_options.include?(new_alphabet)
  end

  def test_that_it_can_shuffle_the_answer
    colors = Colors.new
    assert colors.respond_to?(:shuffle)
  end



end
