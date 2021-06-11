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

  def four_in_a_row?(arr)

    return false if arr.length < 4

    i = 0

    until i + 3 > arr.length - 1 do

      if arr[i..(i+3)].all? {|x| x == "1"}
        return true

      elsif arr[i..(i+3)].all? {|x| x == "2"}
        return true

      else
        i += 1
      end

    end

    false
  end

  def vertical_win?

    @game_board.each do |col|
      return true if four_in_a_row?(col)
    end

    return false
  end


  def horizontal_win?

    i = 0
    game_board_row = []

    until i > 5 do

      @game_board.each do |col|
        game_board_row.push(col[i])
      end

      return true if four_in_a_row?(game_board_row)

      game_board_row.clear
      i += 1

    end
    false
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
# game.make_move(2,1)
# game.make_move(2,2)
# game.make_move(2,3)
# game.make_move(1,4)
# game.make_move(1,5)
# game.make_move(1,6)
# game.make_move(1,7)
game.display_board
# print game.horizontal_win?
# game.make_move(1,1)





