class GamePiece
  attr_accessor :pos, :color
  def initialize(pos = nil, color = nil)
    @pos = pos
    @color = color
  end

  def valid_move?(new_pos, board)
  end

  def get_path(start_pos, end_pos, board)
  end

  def piece_in_path?(start_pos, end_pos, board)
    path = get_path(start_pos, end_pos, board)

    return false if path.length < 1
    return false if path.all? {|node| node.piece.nil?}
    true
  end
end