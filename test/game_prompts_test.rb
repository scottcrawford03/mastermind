gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game_prompts'

class GamePromptsTest < Minitest::Test



  def test_that_it_prints_an_intro
    player = GamePrompts.new
    assert_equal "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?", player.intro_message
  end

  def test_that_when_player_hits_p_it_starts_game
    player = GamePrompts.new
    assert_equal "begin the game.", player.welcome("p")

  end

  def test_that_when_player_hits_i_it_shows_instructions
    player = GamePrompts.new
    assert_equal "A secret combination of colors has been chosen at random.\n\nYour job is to guess the correct sequence in 10 tries or less.\n\nIf you manage to win, you'll join the elite as a mastermind.\n\nIf you lose, the shambolic state of your life will be confirmed.\n\nGood luck!...you'll need it." , player.welcome("i")
  end

  def test_that_when_player_hits_q_it_quits_and_says_farewell_message
    player = GamePrompts.new
    assert_equal "Your father was right about you, you are a quitter.", player.welcome("q")

  end

  def test_that_any_other_key_brings_invalid_message
    player = GamePrompts.new
    assert_equal "Your argument is invalid. Try again.", player.welcome("t")
  end

end
