class GamePrompts
  attr_reader :intro_message                                                                                 # => nil

  def intro_message
    %x( say "so check me out")
    "Welcome to MASTERMIND\n"+
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def lose
    "Nice try you dummy." + play_again
  end

  def winner(answer, guess_count, minutes, seconds)
    "WINNER! You guessed the sequence '#{answer.join('').upcase}' with #{guess_count} guesses in #{minutes} minutes and #{seconds} seconds.\n(p)lay again or (q)uit?"
  end

  def game_start
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def mastermind_logo
  puts
%q{
                      _                      _           _
                     | |                    (_)         | |
  _ __ ___   __ _ ___| |_ ___ _ __ _ __ ___  _ _ __   __| |
 | '_ ` _ \ / _` / __| __/ _ \ '__| '_ ` _ \| | '_ \ / _` |
 | | | | | | (_| \__ \ ||  __/ |  | | | | | | | | | | (_| |
 |_| |_| |_|\__,_|___/\__\___|_|  |_| |_| |_|_|_| |_|\__,_|
 }

  end

  def play
    "begin the game."
  end

  def player_input
    "Enter Choice: "
  end

  def instructions
    "A secret combination of colors has been chosen at random.\n\nYour job is to guess the correct sequence in 10 tries or less.\n\nIf you manage to win, you'll join the elite as a mastermind.\n\nIf you lose, the shambolic state of your life will be confirmed.\n\nGood luck!...you'll need it.\n\nPress (p) to play."
  end

  def quit
    "Your father was right about you, you are a quitter."
  end

  def invalid
    "Your argument is invalid. Try again."
  end

  def guess_prompt
    "Take your guess: "
  end

  def guess_again
    "The guess must only be 4 colors and either r, g, b, or y."
  end

  def guess_count(guess_count)
    if guess_count == 1
      "You have taken #{guess_count} guess."
    else
      "You have taken #{guess_count} guesses."
    end
  end

  def after_guess(guess,number_correct, position_right)
    "Your guess '#{guess.upcase}' has #{number_correct} correct colors with #{position_right} in the correct position."
  end

  def play_again
    "(p)lay again or (q)uit?"
  end
end
