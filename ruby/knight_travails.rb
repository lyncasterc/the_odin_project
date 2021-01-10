class Node
  attr_accessor :data, :children

  def initialize(data=nil, children=nil)
    @data = data
    @children = children
  end

  def to_s
    return @data.to_s
  end
end

class Tree
  
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def to_s
    return root.to_s
  end

  def get_children
    return root.children
  end

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
  def valid_move?(new_pos, pos = @current_pos)
    x1 = pos[0]
    y1 = pos[1]
    x2 = new_pos[0]
    y2 = new_pos[1]

    return false if x2 > 7 || x2 < 0 || y2 > 7 || y2 < 0

    if (x2 - x1).abs() == 2 && (y2 - y1).abs() == 1
      return true
    elsif (y2 - y1).abs() == 2 && (x2 - x1).abs() == 1
      return true
    else 
      return false
    end
  end

  def possible_moves(board, pos = @current_pos)
    moves = []

    board.each do |coor|
      if self.valid_move?(coor, pos)
        moves.push(coor)
      end
    end

    return moves
  end

  def possible_moves_tree(board, pos = @current_pos)
    queue = []
    visited_squares = []
    root = Node.new(data = pos)
    visited_squares.push(pos)
    tree = Tree.new(root)

    root.children = []
    moves = self.possible_moves(board, pos)

    moves.each do |move|
      root.children.push(Node.new(data = move))
      visited_squares.push(move) 
    end

    root.children.each do |child|
      queue.push(child)
    end

    while visited_squares.uniq.length < 64
      first = queue[0]
      first.children = []

      moves = self.possible_moves(board, first.data)

      moves.each do |move|
        first.children.push(Node.new(data = move))
        visited_squares.push(move) if !visited_squares.include?(move)
      end

      first.children.each do |child|
        queue.push(child)
      end

      queue.shift
    end

    return tree
  end
end

chess = Board.new
print chess.board

b_knight = Knight.new([1,3])

puts ""
puts ""

root = b_knight.possible_moves_tree(chess.board)
print root 













