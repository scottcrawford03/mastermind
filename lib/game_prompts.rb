# welcome the user
# p for play, i for instructions, q for quit
# q for quit at any time
# ask if they want to play again - y for yes, n for no

class GamePrompts
  attr_reader :intro_message                                                                                 # => nil

  def intro_message
    "Welcome to MASTERMIND\n" +
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def play
    "begin the game."
  end

  def player_input
    "Enter Choice: "
  end

  def instructions
    "A secret combination of colors has been chosen at random.\n\nYour job is to guess the correct sequence in 10 tries or less.\n\nIf you manage to win, you'll join the elite as a mastermind.\n\nIf you lose, the shambolic state of your life will be confirmed.\n\nGood luck!...you'll need it."
  end

  def quit
    "Your father was right about you, you are a quitter."
  end

  def invalid
    "Your argument is invalid. Try again."
    # welcome
  end

  def play_again
    # if they win the game or they run out of turns
    # it will bring up this prompt
    "Would you like to (p)lay again or (q)uit?"

  end


  def after_guess
    "You have #{number_correct} correct colors and #{position_check} in the right position."
  end

end

# player = GamePrompts.new
# player.welcome
