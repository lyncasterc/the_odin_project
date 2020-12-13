class Node

end

class Board
  attr_accessor :board

  def initialize
    @board = self.create_board
  end

  private
  def create_board
    a = Array.new(8){|i| i}
    board = []

    a.each do |x|
      a.each do |y|
        board.push([x,y])
      end
    end

    return board
  end
end

class Knight
  attr_reader :current_pos

  def initialize(position)
    @current_pos = position
  end

  public
  def valid_move?(move)
    x1 = @current_pos[0]
    y1 = @current_pos[1]
    x2 = move[0]
    y2 = move[1]

    return false if x2 > 7 || x2 < 0 || y2 > 7 || y2 < 0

    if (x2 - x1).abs() == 2 && (y2 - y1).abs() == 1
      return true
    elsif (y2 - y1).abs() == 2 && (x2 - x1).abs() == 1
      return true
    else 
      return false
    end
  end

  def possible_moves(board)
    moves = []

    board.each do |coor|
      if self.valid_move?(coor)
        moves.push(coor)
      end
    end

    return moves
  end
end

chess = Board.new
print chess.board
b_knight = Knight.new([2,1])
puts ""
puts ""
print b_knight.possible_moves(chess.board)


