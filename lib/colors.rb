class Colors
  attr_reader :answer  # => nil
  def initialize
    @answer = []       # => []
  end

  def secret_answer
    4.times do               # => 4
      answer << shuffle.pop  # => ["y"], ["y", "g"], ["y", "g", "r"], ["y", "g", "r", "b"]
    end                      # => 4
    answer                   # => ["y", "g", "r", "b"]
  end

  def answer_options
    ["r","g","b","y"]  # => ["r", "g", "b", "y"], ["r", "g", "b", "y"], ["r", "g", "b", "y"], ["r", "g", "b", "y"]
  end

  def shuffle
    answer_options.shuffle  # => ["b", "r", "g", "y"], ["r", "y", "b", "g"], ["b", "g", "y", "r"], ["r", "y", "g", "b"]
  end

end

color = Colors.new   # => #<Colors:0x007f97339678b0 @answer=[]>
color.secret_answer  # => ["y", "g", "r", "b"]
