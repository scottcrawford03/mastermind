class Colors
  attr_reader :answer
  def initialize
    @answer = []
  end

  def secret_answer
    4.times do
      answer << shuffle.pop
    end
    answer
  end

  def answer_options
    ["r","g","b","y"]
  end

  def shuffle
    answer_options.shuffle
  end

end

color = Colors.new
color.secret_answer
