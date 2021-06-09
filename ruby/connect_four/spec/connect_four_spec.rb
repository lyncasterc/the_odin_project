require './lib/connect_four'

describe ConnectFour do

  describe '#make_move' do
    subject(:game_move) { described_class.new }

    context 'when player one chooses a column' do
      it 'places the correct player piece of the bottom of the column' do
        game_board = game_move.instance_variable_get(:@game_board)
        player_1 = 1
        col = 2

        expect{ game_move.make_move(player_1, col) }.to change { game_board[col - 1][-1] }.from("O").to("1")
      end
    end

    context 'when player one and then player 2 make a move in the same column' do
      it 'places player 2 piece on top of player 1' do
        game_board = game_move.instance_variable_get(:@game_board)

        player_1 = 1
        player_2 = 2
        col = 2 

        game_move.make_move(player_1,col)

        expect { game_move.make_move(player_2,col) }.to change { game_board[col - 1][-2..-1] }.from(["O","1"]).to(["2","1"])
      end
    end

    
    
  end

end