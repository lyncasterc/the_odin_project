class ConnectFour 
  attr_reader :game_board
  def initialize
    @game_board = Array.new(7){Array.new(6,'O')}
  end

  public
  def make_move(player, col)
    index = col - 1

    @game_board[index].each_index do |i|
      if @game_board[index][i] == "O"

        if player == 1 then @game_board[index][i] = "1" else @game_board[index][i] = "2" end
        break

      end
    end
  end

  

  def vertical_win?
    @game_board.each do |col|
      first_slice = col[0..3].uniq
      second_slice = col[1..4].uniq
      third_slice = col[2..5].uniq

      if first_slice.all? {|x| x == "1" || x == "2"} || second_slice.all? {|x| x == "1" || x == "2"} || third_slice.all? {|x| x == "1" || x == "2"}
        return true
      end
    end

    return false
  end

  def horizontal_win?

  end
  def diagonal_win?

  end

  def game_over?
  end

  def display_board
    (0..5).each do |i|
      @game_board.each do |col|
        print col.reverse[i] + " "
      end
      puts ""
    end
  end
end

game = ConnectFour.new
print game.game_board.inspect





