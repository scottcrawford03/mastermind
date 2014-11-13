gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game_prompts'

class GamePromptsTest < Minitest::Test



  def test_that_it_prints_an_intro
    player = GamePrompts.new
    assert_equal "\e[0;32;49mWelcome to MASTERMIND\n\e[0m\e[0;94;49mWould you like to (p)lay, read the (i)nstructions, or (q)uit?\e[0m", player.intro_message
  end

  def test_that_it_shows_play
    player = GamePrompts.new
    assert_equal "begin the game.", player.play

  end

  def test_that_it_shows_instructions
    player = GamePrompts.new
    assert_equal "A secret combination of colors has been chosen at random.\n\nYour job is to guess the correct sequence in 10 tries or less.\n\nIf you manage to win, you'll join the elite as a mastermind.\n\nIf you lose, the shambolic state of your life will be confirmed.\n\nGood luck!...you'll need it.\n\nPress (p) to play." , player.instructions
  end

  def test_that_quit_brings_up_farewell_message
    player = GamePrompts.new
    assert_equal "\e[0;31;49mYour father was right about you, you are a quitter.\e[0m", player.quit

  end

  def test_that_any_other_key_brings_invalid_message
    player = GamePrompts.new
    assert_equal "\e[0;31;49mYour argument is invalid. Try again.\e[0m", player.invalid
  end

  def test_that_any_other_key_brings_winning_message
    player = GamePrompts.new
    assert_equal "WINNER! You guessed the sequence 'RRRR' with 3 guesses in 3 minutes and 3 seconds. \n(p)lay again or (q)uit?", player.winner(['r','r','r','r'], 3, 3, 3)
  end

  def test_that_it_prints_guess_count
    player = GamePrompts.new
    assert_equal "You have taken\e[0;31;49m 1\e[0m guess.", player.guess_count(1)
    assert_equal "You have taken \e[0;31;49m 2\e[0m guesses.", player.guess_count(2)


  end

  def test_that_it_prints_after_message_feedback
    player = GamePrompts.new
    assert_equal "Your guess \e[0;35;49m'RRRR'\e[0m has \e[0;35;49m2\e[0m correct colors with \e[0;35;49m2\e[0m in the correct position.", player.after_guess('rrrr', 2, 2)
  end

end
