class Player
  def initialize(player)
    @player = player
  end

  public
  def play(position)
    if @player == "player_1"

      if position == "top left"
        place_x_o(5,"X")
        $player_1_tl = true

      elsif position == "top middle"
        place_x_o(9,"X")
        $player_1_tm = true

      elsif position == "top right"
        place_x_o(13,"X")
        $player_1_tr = true

      elsif position == "middle left"
        place_x_o(35,"X")
        $player_1_ml = true


      elsif position == "middle middle"
        place_x_o(39,"X")
        $player_1_mm = true


      elsif position == "middle right"
        place_x_o(43,"X")
        $player_1_mr = true


      elsif position == "bottom left"
        place_x_o(63,"X")
        $player_1_bl = true


      elsif position == "bottom middle"
        place_x_o(67,"X")
        $player_1_bm = true
        

      elsif position == "bottom right"
        place_x_o(71,"X")
        $player_1_br = true

      end

      elsif @player == "player_2"
        if position == "top left"
          place_x_o(5,"O")
          $player_2_tl = true
  
        elsif position == "top middle"
          place_x_o(9,"O")
          $player_2_tm = true
  
        elsif position == "top right"
          place_x_o(13,"O")
          $player_2_tr = true
  
        elsif position == "middle left"
          place_x_o(35,"O")
          $player_2_ml = true
  
  
        elsif position == "middle middle"
          place_x_o(39,"O")
          $player_2_mm = true
  
  
        elsif position == "middle right"
          place_x_o(43,"O")
          $player_2_mr = true
  
  
        elsif position == "bottom left"
          place_x_o(63,"O")
          $player_2_bl = true
  
  
        elsif position == "bottom middle"
          place_x_o(67,"O")
          $player_2_bm = true
          
  
        elsif position == "bottom right"
          place_x_o(71,"O")
          $player_2_br = true
  
        end

    end


  end

  private

  # places x or o at index
  def place_x_o(index,x_or_o)
    $board = $board.split('')
    $board.slice!(index)
    $board.insert(index, x_or_o)
    $board = $board.join('')
  end

end


def game
  $board = "\n
     |   |   
  ---|---|---  
     |   |   
  ---|---|---
     |   |   
  \n\n"
  
  choice_board= "\n
   1 | 2 | 3 
  ---|---|---  
   4 | 5 | 6 
  ---|---|---
   7 | 8 | 9 
  \n\n"


  $player_1_tl = false
  $player_1_tm = false
  $player_1_tr = false
  $player_1_ml = false
  $player_1_mm = false
  $player_1_mr = false
  $player_1_bl = false
  $player_1_bm = false
  $player_1_br = false

  $player_2_tl = false
  $player_2_tm = false
  $player_2_tr = false
  $player_2_ml = false
  $player_2_mm = false
  $player_2_mr = false
  $player_2_bl = false
  $player_2_bm = false
  $player_2_br = false
  
  win = false

  def check_if_win

    if ($player_1_tl && $player_1_tm && $player_1_tr) || ($player_1_ml && $player_1_mm && $player_1_mr) || ($player_1_bl && $player_1_bm && $player_1_br) || ($player_1_tl && $player_1_ml && $player_1_bl) || ($player_1_mm && $player_1_tm && $player_1_bm) || ($player_1_tr && $player_1_mr && $player_1_br) || ($player_1_tl && $player_1_mm && $player_1_br) || ($player_1_tr && $player_1_mm && $player_1_bl)
      return true

    elsif ($player_2_tl && $player_2_tm && $player_2_tr) || ($player_2_ml && $player_2_mm && $player_2_mr) || ($player_2_bl && $player_2_bm && $player_2_br) || ($player_2_tl && $player_2_ml && $player_2_bl) || ($player_2_mm && $player_2_tm && $player_2_bm) || ($player_2_tr && $player_2_mr && $player_2_br) || ($player_2_tl && $player_2_mm && $player_2_br) || ($player_2_tr && $player_2_mm && $player_2_bl)

      return true
    end

    return false
  end



  player_1 = Player.new("player_1")
  player_2 = Player.new("player_2")

  print choice_board


  while !win 

    puts "PLAYER 1"
    print "Enter a number to place X, or 0 to view the numbered board: "
    choice = gets.chomp.to_i

    unless (1..9).include?(choice)
      if choice == 0
        puts choice_board
        puts "PLAYER 1"
        print "Enter a number to place X, or 0 to view the numbered board: "
        choice = gets.chomp.to_i

      else
        puts choice_board
        print "Invalid choice. Enter number to place X: "
        choice = gets.chomp.to_i

      end 
    end
    
    if choice == 1
      player_1.play("top left")
      puts $board
      if check_if_win
        puts "PLAYER 1 WINS"
        win = true
        break
      end  
    

    elsif choice == 2
      player_1.play("top middle")
      puts $board
      if check_if_win
        puts "PLAYER 1 WINS"
        win = true
        break
      end

    elsif choice == 3
      player_1.play("top right")
      puts $board
      if check_if_win
        puts "PLAYER 1 WINS"
        win = true
        break
      end

    elsif choice == 4
      player_1.play("middle left")
      puts $board
      if check_if_win
        puts "PLAYER 1 WINS"
        win = true
        break
      end

    elsif choice == 5
      player_1.play("middle middle")
      puts $board
      if check_if_win
        puts "PLAYER 1 WINS"
        win = true
        break
      end

    elsif choice == 6
      player_1.play("middle right")
      puts $board
      if check_if_win
        puts "PLAYER 1 WINS"
        win = true
        break
      end

    elsif choice == 7
      player_1.play("bottom left")
      puts $board
      if check_if_win
        puts "PLAYER 1 WINS"
        win = true
        break
      end

    elsif choice == 8
      player_1.play("bottom middle")
      puts $board
      if check_if_win
        puts "PLAYER 1 WINS"
        win = true
        break
      end

    elsif choice == 9
      player_1.play("bottom right")
      puts $board
      if check_if_win
        puts "PLAYER 1 WINS"
        win = true
        break
      end
    end

    puts "PLAYER 2"
    print "Enter number to place O: "
    choice = gets.chomp.to_i

    unless (1..9).include?(choice)
      if choice == 0
        puts choice_board
        puts "PLAYER 2"
        print "Enter a number to place O, or 0 to view the numbered board: "
        choice = gets.chomp.to_i

      else
        puts choice_board
        print "Invalid choice. Enter number to place O: "
        choice = gets.chomp.to_i
      end
    end


    if choice == 1
      player_2.play("top left")
      puts $board
      if check_if_win
        puts "PLAYER 2 WINS"
        win = true
        break
      end

    elsif choice == 2
      player_2.play("top middle")
      puts $board
      if check_if_win
        puts "PLAYER 2 WINS"
        win = true
        break
      end

    elsif choice == 3
      player_2.play("top right")
      puts $board
      if check_if_win
        puts "PLAYER 2 WINS"
        win = true
        break
      end

    elsif choice == 4
      player_2.play("middle left")
      puts $board
      if check_if_win
        puts "PLAYER 2 WINS"
        win = true
        break
      end

    elsif choice == 5
      player_2.play("middle middle")
      puts $board
      if check_if_win
        puts "PLAYER 2 WINS"
        win = true
        break
      end

    elsif choice == 6
      player_2.play("middle right")
      puts $board
      if check_if_win
        puts "PLAYER 2 WINS"
        win = true
        break
      end

    elsif choice == 7
      player_2.play("bottom left")
      puts $board
      if check_if_win
        puts "PLAYER 2 WINS"
        win = true
        break
      end

    elsif choice == 8
      player_2.play("bottom middle")
      puts $board
      if check_if_win
        puts "PLAYER 2 WINS"
        win = true
        break
      end

    elsif choice == 9
      player_2.play("bottom right")
      puts $board
      if check_if_win
        puts "PLAYER 2 WINS"
        win = true
        break
      end
    end
  end
end
game
