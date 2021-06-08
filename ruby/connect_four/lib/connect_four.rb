class ConnectFour 
  attr_reader :internal_board

  def initialize
    @internal_board = Array.new(42)
    @game_board = Array.new(7){Array.new(6,'O')}
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

# game = ConnectFour.new


