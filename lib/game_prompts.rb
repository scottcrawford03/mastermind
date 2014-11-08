# welcome the user
# p for play, i for instructions, q for quit
# q for quit at any time
# ask if they want to play again - y for yes, n for no

class GamePrompts

  def intro_message
    "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def welcome(letter)
    case letter
    when "p" || "P"
      play
    when "i" || "I"
      instructions
    when "q" || "Q"
      quit
    else
      invalid
    end
  end

  def play
    "begin the game."
end

  def instructions
    "A secret combination of colors has been chosen at random.\n\nYour job is to guess the correct sequence in 10 tries or less.\n\nIf you manage to win, you'll join the elite as a mastermind.\n\nIf you lose, the shambolic state of your life will be confirmed.\n\nGood luck!...you'll need it."
  end

  def quit
    "Your father was right about you, you are a quitter."
  end

  def invalid
    "Your argument is invalid. Try again."
  end
end

game = GamePrompts.new
game.welcome("I")
