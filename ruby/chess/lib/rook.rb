require_relative './gamepiece'

class Rook < GamePiece
  def initialize(pos = nil, color = nil)
    super(pos, color)
  end

  def valid_move?(new_pos, board)
    x1 = pos[0]
    y1 = pos[1]
    x2 = new_pos[0]
    y2 = new_pos[1]
    
    return false if x2 > 7 || x2 < 0 || y2 > 7 || y2 < 0
  end
end
