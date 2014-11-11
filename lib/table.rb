require 'terminal-table'

class Table

  def initialize
  table = Terminal::Table.new do |t|
          t << ['One', 1]
          t << :separator
          t.add_row ['Two', "", ""]
          t.add_separator
          t.add_row ['Three', 3]
end


  end

  def show
    puts table
  end
