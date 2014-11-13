class Colors
  attr_reader :answer
  def initialize
    @answer = ['r','r','r','r']
  end

  def secret_answer
    @answer = []
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
