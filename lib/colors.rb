class Colors
  attr_reader :answer
  def initialize
    @answer = %w(r r r r)
  end

  def secret_answer
    @answer = []
    4.times do
      answer << shuffle.pop
    end
    answer
  end

  def answer_options
    %w(r g b y)
  end

  def shuffle
    answer_options.shuffle
  end
end
