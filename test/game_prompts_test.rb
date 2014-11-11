gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game_prompts'

class GamePromptsTest < Minitest::Test



  def test_that_it_prints_an_intro
    player = GamePrompts.new
    assert_equal "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?", player.intro_message
  end

  def test_that_it_shows_play
    player = GamePrompts.new
    assert_equal "begin the game.", player.play

  end

  def test_that_it_shows_instructions
    player = GamePrompts.new
    assert_equal "A secret combination of colors has been chosen at random.\n\nYour job is to guess the correct sequence in 10 tries or less.\n\nIf you manage to win, you'll join the elite as a mastermind.\n\nIf you lose, the shambolic state of your life will be confirmed.\n\nGood luck!...you'll need it." , player.instructions
  end

  def test_that_quit_brings_up_farewell_message
    player = GamePrompts.new
    assert_equal "Your father was right about you, you are a quitter.", player.quit

  end

  def test_that_any_other_key_brings_invalid_message
    player = GamePrompts.new
    assert_equal "Your argument is invalid. Try again.", player.invalid
  end

  def test_that_any_other_key_brings_winning_message
    player = GamePrompts.new
    assert_equal "WINNER! You guessed the sequence 'RRRR' with 3 guesses in 3 minutes and 3 seconds. (p)lay again or (q)uit?", player.winner(['r','r','r','r'], 3, 3, 3)
  end

  def test_that_it_prints_guess_count
    player = GamePrompts.new
    assert_equal "You have taken 1 guess.", player.guess_count(1)
    assert_equal "You have taken 2 guesses.", player.guess_count(2)


  end

  def test_that_it_prints_after_message_feedback
    player = GamePrompts.new
    assert_equal "You have 2 correct colors and 2 in the right position.", player.after_guess(2,2)
  end

end
