class HighScore

  def write_to_csv
    CSV.open(to_file= 'high_scores_csv.csv', "w") do |csv|
      csv << ["Name", "Sequence", "Guesses", "Time"]
    end
  end

  def add_player_scores(name, guess, guess_count, time)
    CSV.open(to_file= 'high_scores_csv.csv', "a") do |csv|
      csv << [name, guess, guess_count, time]
    end
  end

end
