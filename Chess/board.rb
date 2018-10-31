require_relative 'pieces.rb'
require_relative 'display.rb'

class Board
  attr_accessor :grid
  
  def initialize(grid = Array.new(8) {Array.new(8)})
    @grid = grid
    #@grid.populate_board
  end
  
  def valid_pos?(pos)
    row, col = pos
    return false if row < 0 || row > 7 || col < 0 || col > 7
    true
  end
  
  def move_piece(start_pos, end_pos)
      row, col = start_pos
      row2, col2 = end_pos
      location = @grid[row][col]
      if location.is_a?(NullPiece)
        raise "No Piece at that position."
      elsif !@grid[row2][col2].is_a?(NullPiece)
        raise "Can't Move to that position."
      end
    
      piece_obj = @grid[row][col]
      @grid[row2][col2] = piece_obj
      @grid[row][col] = NullPiece.instance
      
  end 
  
  def populate
    (0..7).each do |row|
      (0..7).each do |col|
        if row < 2 || row > 5
          @grid[row][col] = Piece.new
        else
          @grid[row][col] = NullPiece.instance
        end
      end
    end
    # row = 0
    # col = 0
    # while row < 8
    #   if row == 0 || row == 1 || row == 6 || row == 7
    #     @grid[row][col] = Piece.new
    #     col += 1
    #     if col == 8
    #       col = 0
    #       row += 1 
    #     end 
    #   else 
    #     @grid[row][col] = NullPiece.new
    #     col += 1
    #   end 
    # 
    # end
  end 

end 