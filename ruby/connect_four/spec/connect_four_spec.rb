require './lib/connect_four'

describe ConnectFour do

  describe '#make_move' do
    subject(:game_move) { described_class.new }

    context 'when player one chooses a column' do
      it 'places the correct player piece of the bottom of the column' do
        game_board = game_move.instance_variable_get(:@game_board)
        player_1 = 1
        col = 2

        expect{ game_move.make_move(player_1, col) }.to change { game_board[col - 1][0] }.from("O").to("1")
      end
    end

    context 'when player one and then player 2 make a move in the same column' do
      it 'places player 2 piece on top of player 1' do
        game_board = game_move.instance_variable_get(:@game_board)

        player_1 = 1
        player_2 = 2
        col = 2 

        game_move.make_move(player_1,col)

        expect { game_move.make_move(player_2,col) }.to change { game_board[col - 1][0..1] }.from(["1","O"]).to(["1","2"])
      end
    end
  end

  describe '#four_in_a_row?' do
    subject(:game) { described_class.new }

    context 'when passed an array with 4 consecutive elements equal to 1 or 2' do
      it 'returns true ' do
        game_col = ["1", "1", "1", "1", "O", "O"]
        expect(game.four_in_a_row?(game_col)).to be true
      end
    end

    it 'works when array length is 4' do

      game_col = ["1", "1", "1", "1"]
      expect(game.four_in_a_row?(game_col)).to be true
    end

    it 'works when array length is 5' do

      game_col = ["O","1", "1", "1", "1"]
      expect(game.four_in_a_row?(game_col)).to be true
    end

    it 'works when array length is 6' do

      game_col = ["O", "1", "1", "1", "1", "O"]
      expect(game.four_in_a_row?(game_col)).to be true
    end

    it 'returns false when array length is less than 4' do

      game_col = ["O", "1", "1"]
      expect(game.four_in_a_row?(game_col)).to be false
    end

    it 'returns false when there are not four in a row' do
      game_col = ["O", "O", "O","O","O"]
      expect(game.four_in_a_row?(game_col)).to be false
    end
  end


  describe '#vertical_win?' do
    subject(:game_vertical) { described_class.new }

    context 'when player has 4 in a row vertically' do
      it 'returns true' do

        game_board = game_vertical.instance_variable_get(:@game_board)
        game_board[0] = ["1", "1", "1", "1", "O", "O"]

        expect(game_vertical.vertical_win?).to be true
      end
    end


    context 'when player has 4 in a row vertically anywhere in the column' do
      it 'returns true' do

        game_board = game_vertical.instance_variable_get(:@game_board)
        game_board[0] = ["O", "2", "2", "2", "2", "O"]

        expect(game_vertical.vertical_win?).to be true

      end
    end

    context 'when player has 4 in a row vertically anywhere in the board' do
      it 'returns true' do

        game_board = game_vertical.instance_variable_get(:@game_board)
        game_board[6] = ["O", "O", "2", "2", "2", "2"]

        expect(game_vertical.vertical_win?).to be true

      end
    end
  end

  # describe '#game_over?' do
  #   subject(:game_over) { described_class.new }

  #   before do
  #     allow(game_over).to receive(:vertical_win?).and_return(true)
  #   end

  #   context 'when a player has 4 in a row' do

  #     xit 'returns true' do
  #       result = game_over.game_over?
  #       expect(result).to be true
  #     end

  #   end
    

  # end



end