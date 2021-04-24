class Board
  attr_reader :board

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
  attr_accessor :current_pos, :children, :parent
  
  def initialize(position, parent = nil)
    @current_pos = position
    @parent = parent
    @children = []
  end

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

  def possible_moves(board, pos)
    moves = []

    board.each do |coor|
      if self.valid_move?(coor, pos)
        moves.push(coor)
      end
    end
    return moves
  end
  
  def trace_history(knight)
    history = [knight.current_pos]
    
    until knight.parent == nil
      knight = knight.parent
      history.unshift(knight.current_pos)
    end
    return history
  end

  
  def knight_moves(board, end_pos, start_pos = @current_pos)
    queue = [Knight.new(start_pos)]
    
    current = queue.shift

    until current.current_pos == end_pos
      current.possible_moves(board, current.current_pos).each do |move|
        current.children.push(Knight.new(move, current))
      end

      current.children.each do |child|
        queue.push(child)
      end

      current = queue.shift
    end
    
    trace_history(current)
  end
end

chess_board = Board.new.board

print chess_board

b_knight = Knight.new([0,0])

puts ""

print b_knight.knight_moves(chess_board, [1,2])
























