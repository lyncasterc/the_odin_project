class ConnectFour 
  attr_reader :internal_board, :game_board
  def initialize
    @internal_board = Array.new(42)
    @game_board = Array.new(7){Array.new(6,'O')}
  end

  public
  def make_move(player, col)
    index = col - 1
    @game_board[index].reverse!

    @game_board[index].each_index do |i|
      if @game_board[index][i] == "O"

        if player == 1 then @game_board[index][i] = "1" else @game_board[index][i] = "2" end

        @game_board[index].reverse!

        break
      end
    end

  end

  def display_board
    (0..5).each do |i|
      @game_board.each do |col|
        print col[i] + " "
      end
      puts ""
    end
  end


end

game = ConnectFour.new
game.make_move(1,1)
game.display_board
puts game.game_board.inspect
# puts game.internal_board.inspect



