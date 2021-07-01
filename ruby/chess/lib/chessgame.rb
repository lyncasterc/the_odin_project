require_relative './king'
require_relative './rook'
require_relative './pawn'
require_relative './bishop'
require_relative './queen'
require_relative './queen'
require_relative './knight'
require_relative './gamepiece'
require_relative './board'
require_relative './node'

class ChessGame
  attr_accessor :chess_board, :game_state
  @@BOARD_RANK = ('a'..'h').to_a
  @@BOARD_FILE = ('1'..'8').to_a

  def initialize
    @chess_board = nil
    @game_state = {
      moves: 0,
      current_turn: 'player 1'
    }
  end

  def play_game
    puts "CHESS"
    puts "Enter 1 to start a new game or 2 to load a saved game"

    input = gets.chomp.to_i
    unless (1..2).include?(input)
      puts "Oops!"
      puts "Enter 1 to start a new game or 2 to load a saved game"
      input = gets.chomp.to_i
    end

    set_board if input == 1
    load_game if input == 2
  



  end

  def display
    gray_space = '|#'
    white_space = '|_'

    if !@chess_board.nil?
      7.step(0,-1) do |y|
        print "#{y + 1} "
        8.times do |x|
          node = chess_board.find_node([x,y])
  
          if !node.piece.nil?
            print '|' + node.piece.unicode
          elsif node.coor[1] % 2 == 0 
            if node.coor[0] % 2 == 0
              print gray_space
            else
              print white_space
            end
          elsif node.coor[1] % 2 != 0
            if node.coor[0] % 2 != 0
              print gray_space
            else
              print white_space
            end  
          end
  
        end
        puts "|"
      end
      puts '   a b c d e f g h'
    end
  end

  def move(piece_pos, new_pos)
    piece = chess_board.find_node(convert_coor(start)).piece
    space = chess_board.find_node(convert_coor(new_pos))


  end

  # private
  def convert_coor(chess_coor)
    coor = []
    chess_coor = chess_coor.split('')
    coor.push(@@BOARD_RANK.find_index(chess_coor[0]))
    coor.push(@@BOARD_FILE.find_index(chess_coor[1]))

    coor
  end
  
  def set_board
    @chess_board = Board.new
    @chess_board.board.each do |node|

      if node.coor == [0,0]
        node.piece = Rook.new([0,0], 'white')
      elsif node.coor == [1,0]
        node.piece = Knight.new([1,0], 'white')
      elsif node.coor == [2,0]
        node.piece = Bishop.new([2,0], 'white')
      elsif node.coor == [3,0]
        node.piece = Queen.new([3,0], 'white')
      elsif node.coor == [4,0]
        node.piece = King.new([4,0], 'white')
      elsif node.coor == [5,0]
        node.piece = Bishop.new([5,0], 'white')
      elsif node.coor == [6,0]
        node.piece = Knight.new([6,0], 'white')
      elsif node.coor == [7,0]
        node.piece = Rook.new([7,0], 'white')
      elsif node.coor[1] == 1
        node.piece = Pawn.new(node.coor, 'white')
        
      elsif node.coor[1] == 6
        node.piece = Pawn.new(node.coor, 'black')
      elsif node.coor == [0,7]
        node.piece = Rook.new([0,7], 'black')
      elsif node.coor == [1,7]
        node.piece = Knight.new([1,7], 'black')
      elsif node.coor == [2,7]
        node.piece = Bishop.new([2,7], 'black')
      elsif node.coor == [3,7]
        node.piece = Queen.new([3,7], 'black')
      elsif node.coor == [4,7]
        node.piece = King.new([4,7], 'black')
      elsif node.coor == [5,7]
        node.piece = Bishop.new([5,7], 'black')
      elsif node.coor == [6,7]
        node.piece = Knight.new([6,7], 'black')
      elsif node.coor == [7,7]
        node.piece = Rook.new([7,7], 'black')
      end
    end
  end

  def save_game
    require "yaml"

    File.open("lib/chessgame_save.yaml", "w") do |file|
      file.write YAML::dump(@game_state)
      file.write YAML::dump(@chess_board)
    end
  end

  def load_game
    require "yaml"
    f = File.open("lib/chessgame_save.yaml")
    objects = YAML::load_stream(f)
    f.close
    
    @game_state = objects[0]
    @chess_board = objects[1]
  end
end

c = ChessGame.new
c.set_board
# c.display
# c.load_game
# c.display

# node = c.chess_board.find_node([3,3])
# node.piece = Rook.new(node.coor, 'black')
# c.display
# c.save_game






