gem 'minitest', '~> 5.2'          # => true
require 'minitest/autorun'        # => true
require 'minitest/pride'          # => true
require_relative '../lib/colors'  # => true

class ColorsTest < Minitest::Test

  def test_that_it_makes_answer_array
    colors = Colors.new                # => #<Colors:0x007fe38304b780 @answer=[]>
    assert_equal [], colors.answer     # => true
  end

  def test_that_it_has_4_color_options
    colors = Colors.new                          # => #<Colors:0x007fe383042ef0 @answer=[]>
    assert_equal 4, colors.answer_options.count  # => true
  end

  def test_that_it_can_only_be_r_g_b_y
    colors = Colors.new                 # => #<Colors:0x007fe3830419d8 @answer=[]>

    assert_equal "r", colors.answer_options[0]  # => true
    assert_equal "g", colors.answer_options[1]  # => true
    assert_equal "b", colors.answer_options[2]  # => true
    assert_equal "y", colors.answer_options[3]  # => true

    alphabet = 'a'.upto('z').to_a                    # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    new_alphabet = alphabet.to_s.gsub(/[rgby]/, '')  # => "[\"a\", \"\", \"c\", \"d\", \"e\", \"f\", \"\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"\", \"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"\", \"z\"]"

    refute colors.answer_options.include?(new_alphabet)  # => false
  end

  def test_that_it_can_shuffle_the_answer
    colors = Colors.new                    # => #<Colors:0x007fe383048558 @answer=[]>
    assert colors.respond_to?(:shuffle)    # => true
  end



end

# >> Run options: --seed 59922
# >>
# >> # Running:
# >>
# >> [38;5;154m.[0m[38;5;154m.[0m[38;5;148m.[0m[38;5;184m.[0m
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.002091s, 1912.9603 runs/s, 3825.9206 assertions/s.
# >>
# >> 4 runs, 8 assertions, 0 failures, 0 errors, 0 skips
