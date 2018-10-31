require_relative 'board.rb'
require 'singleton'

class Piece
  attr_accessor :pos
  def initialize(color, pos)
    @color = color 
    @pos = pos 
  end
  
  def moves 
    @moves = []
  end 
  
end

class King < Piece
  
  def initialize(color, pos)
    @color = super(color)
    @pos = super(pos)
  end 

end 

class Queen < Piece
  
  def initialize(color, pos)
    @color = super(color)
    @pos = super(pos)
  end 
end 

class Rook < Piece
  def initialize(color, pos)
     super(color, pos)
     super(pos)
  end 
end 

class Bishop < Piece
  def initialize(color, pos)
     super(color, pos)
  end 
end 

class Knight < Piece
  def initialize(color, pos)
     super(color, pos)
  end
end 

class Pawn < Piece
  def initialize(color, pos)
     super(color, pos)
  end 
end 

module SlidingPiece
  
  def slide_up
    
    while pos[0] < 7
      @moves << [pos[0] + 1, pos[1]]
      pos[0] += 1
      
    end 
    
  end
  
  def slide_down
    
  end 
  
  def slide_right
    
  end 
  
  def slide_left
    
  end 
  
  def slide_diag_down_right
    
    
  end 
  
  def slide_diag_down_left
    
    
  
  end 
  
  def slide_diag_up_right
    
    
  end 
  
  def slide_diag_up_left
    
    

  end 
    
end 


module SteppingPiece 

  def step_up
    pos[0] -= 1
  end
  
  def step_down
    pos[0] += 1
  end 
  
  def step_right
    pos[1] += 1
  end 
  
  def step_left
    pos[1] -= 1
  end 
  
  def step_diag_down_right
    pos[0] += 1
    pos[1] += 1
  end 
  
  def step_diag_down_left
    pos[0] += 1
    pos[1] -= 1
  
  end 
  
  def step_diag_up_right
    pos[0] -= 1
    pos[1] += 1
  end 
  
  def step_diag_up_left
    pos[0] -= 1
    pos[1] -= 1

  end 
  
  
end 

class NullPiece < Piece 
  include Singleton
  def initialize
    
  end 
end 
