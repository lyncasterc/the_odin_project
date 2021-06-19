require_relative './node'

class Board
  attr_reader :board

  def initialize
    @board = create_board
  end

  def find_node(pos)
    @board.find {|node| node.coor == pos} 
  end

  def off_board?(pos)
    x1 = pos[0]
    y1 = pos[1]
    return false if x1 > 7 || x1 < 0 || y1 > 7 || y1 < 0
    true
  end

  def is_linear?(start_pos, end_pos)
    x1 = start_pos[0]
    y1 = start_pos[1]
    x2 = end_pos[0]
    y2 = end_pos[1]

    return false if x2 != x1 && y2 != y1 
    true
  end

  private
  def create_board
    a = Array.new(8){|i| i}
    board = []

    a.each do |x|
      a.each do |y|
        board.push(Node.new(coor = [x,y]))
      end
    end
    return board
  end
end
