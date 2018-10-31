#require 'colorize-master/gemfile'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display
  
  attr_accessor :cursor
  
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end
  
  def render
    puts "   1    2    3    4    5    6    7    8  "
    puts "  ----------------------------------------"
    @board.grid.each_with_index do |row, i|
      print i + 1
      row.each_with_index do |piece, j|
        
        # print "| 😁 " if cursor.cursor_pos == [i, j]
          
        if piece.is_a?(NullPiece) && cursor.cursor_pos != [i, j]
          print "|    "  
        elsif piece.is_a?(Piece) && cursor.cursor_pos != [i, j]
          print "| ♖  "
        else 
          print "| 😁 "
        end
      end
      print "|\n"
      puts "  ----------------------------------------"
      
    end
    
  end
  
  def display_loop
    render
    5.times do
      cursor.cursor_pos
      cursor.get_input
      render
    end
  end 
  
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.populate
  display = Display.new(board)
  display.display_loop
end 