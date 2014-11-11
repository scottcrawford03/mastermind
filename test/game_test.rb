gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def test_that_validate_exists
    assert Validate.new("something")
  end

  def test_that_colors_exist
    assert Colors.new
  end

  def test_guess_count_starts_at_0
    game = Game.new("input","output","message")
    assert_equal 0, game.guess_count
  end

  def test_after_guess_count_goes_up
    game = Game.new("input","output","message")
    game.send(:guess_counter)
    game.send(:guess_counter)
    assert_equal 2, game.guess_count
  end

  def test_that_minutes_and_seconds_exist
    game = Game.new("input","output","message")
    assert game.send(:seconds)
    assert game.send(:minutes)
  end

end
