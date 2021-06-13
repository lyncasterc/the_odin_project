class ConnectFour 
  attr_reader :game_board

  def initialize
    @game_board = Array.new(7){Array.new(6,'O')}
  end

  def play_game
    moves = 0
    introduction
    sleep(5)
    display_board

    until moves > 40
      print "Enter your column choice: "
      col_choice = gets.chomp.to_i
      make_move(1, col_choice)
      moves += 1
      display_board

      if game_over?
        puts "You win!"
        break
      end

      puts "My turn! Let me think..."
      sleep(3)
      make_move(2, rand(1..7))
      moves += 1
      display_board

      if game_over?
        puts "I win!"
        break
      end

      if moves > 40 && !game_over?
        puts "It's a draw!"
        break
      end
    end
  end


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
    return false
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
    return false
  end

  def diagonal_win?
    diag_arr = []
    desc_diag_arr = []

    7.times do |i|
      x = i
      y = 0
      y2 = 5

      until x < 0 do

        diag_arr.push(@game_board[x][y])
        desc_diag_arr.push(@game_board[x][y2])

        x -= 1 
        y += 1
        y2 -= 1

        if x < 0
          return true if diag_arr.length >= 4 && four_in_a_row?(diag_arr)
          return true if desc_diag_arr.length >= 4 && four_in_a_row?(desc_diag_arr)
          diag_arr.clear 
          desc_diag_arr.clear 
        end
      end
    end

    1.step(5,1) do |i|
      x = 6
      y = i
      y2 = -i - 1

      until y > 5

        diag_arr.push(@game_board[x][y])
        desc_diag_arr.push(@game_board[x][y2])
        x -= 1
        y += 1
        y2 -= 1

        if y > 5
          return true if diag_arr.length >= 4 && four_in_a_row?(diag_arr)
          return true if desc_diag_arr.length >= 4 && four_in_a_row?(desc_diag_arr)
          diag_arr.clear 
          desc_diag_arr.clear 
        end
      end
    end

    return false
  end

  def game_over?
    return true if vertical_win? || horizontal_win? || diagonal_win?
    return false
  end

  private
  def display_board
    (0..5).each do |i|
      @game_board.each do |col|
        print col.reverse[i] + " "
      end
      puts ""
    end
    puts ""
  end

  def introduction
    puts <<~HEREDOC
    
      Let's play Connect Four! 

      You'll play as player 1, and I'll be player 2.

      Your game pieces will show up on the board as 1's. 

      To play, enter a number from 1-7 to choose one of the seven columns to place your piece at the bottom of one of them. 

      The first one of us to connect four pieces in a row vertically,  horizontally, or diagonally wins. Good luck!

    HEREDOC

  end
end






