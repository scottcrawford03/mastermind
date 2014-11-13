require 'terminal-table'

class Table
  attr_reader :table,
              :rows

  def initialize
  @rows = []
  @rows <<   ['Answer', '????', 'XX','XX']
  @table = create_table
  table_style

  end

  def table_style
    table.style = {:width => 40, :padding_left => 3, :border_x => "=", :border_i => "X"}
  end

  def show
    table
  end

  def hidden_answer(answer)
      @rows[0] = ['Answer', answer.join(''), 'XX','XX']
  end

  def update(guess_number, guess,number_correct, position, answer)
    if guess_number < 10
      @rows << [guess_number, guess, number_correct ,position]
    else
      hidden_answer(answer)
    end
    @table = create_table
    table_style
  end

  def create_table
    Terminal::Table.new :headings => ['Round', 'Guess', 'Color', 'Pos'],
                        :rows => rows
  end
end
