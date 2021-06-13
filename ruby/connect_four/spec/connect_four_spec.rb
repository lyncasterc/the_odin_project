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

    it 'works when array length is 7' do

      game_col = ["O", "1", "1", "1", "1", "O", "O"]
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

    context 'when array elements are only 1 and 2 but does not have four in a row' do
      it 'returns false' do

      game_col = game_col = ["1", "1", "1", "2", "2", "2"]
      expect(game.four_in_a_row?(game_col)). to be false
      end

    end
  
  end


  describe '#vertical_win?' do
    subject(:game_vertical) { described_class.new }

    context 'when player has four in a row vertically' do
      it 'returns true' do

        game_board = game_vertical.instance_variable_get(:@game_board)
        game_board[0] = ["1", "1", "1", "1", "O", "O"]

        expect(game_vertical.vertical_win?).to be true
      end
    end


    context 'when player has four in a row vertically anywhere in the column' do
      it 'returns true' do

        game_board = game_vertical.instance_variable_get(:@game_board)
        game_board[0] = ["O", "2", "2", "2", "2", "O"]

        expect(game_vertical.vertical_win?).to be true

      end
    end

    context 'when player has four in a row vertically anywhere in the board' do
      it 'returns true' do

        game_board = game_vertical.instance_variable_get(:@game_board)
        game_board[6] = ["O", "O", "2", "2", "2", "2"]

        expect(game_vertical.vertical_win?).to be true

      end
    end

    context 'when there is no vertical four in a row' do
      it 'returns false' do

        game_board = game_vertical.instance_variable_get(:@game_board)
        game_board[0] = ["O", "O", "1", "2", "2", "2"]

        expect(game_vertical.vertical_win?).to be false

      end
    end
  end

  describe '#horizontal_win?' do
    subject(:game_horizontal) { described_class.new }

    context 'when player has four in a row horizontally' do
      it 'returns true' do

        game_board = game_horizontal.instance_variable_get(:@game_board)
        game_board[0][0] = "1"
        game_board[1][0] = "1"
        game_board[2][0] = "1"
        game_board[3][0] = "1"
        game_board[4][0] = "O"
        game_board[5][0] = "O"
        game_board[6][0] = "O"

        expect(game_horizontal.horizontal_win?).to be true

      end
    end

    it 'works anywhere within the row' do

      game_board = game_horizontal.instance_variable_get(:@game_board)
      game_board[0][0] = "1"
      game_board[1][0] = "1"
      game_board[2][0] = "2"
      game_board[3][0] = "2"
      game_board[4][0] = "2"
      game_board[5][0] = "2"
      game_board[6][0] = "O"

      expect(game_horizontal.horizontal_win?).to be true

    end

    it 'works anywhere on the board' do
      
      game_board = game_horizontal.instance_variable_get(:@game_board)
      game_board[0][3] = "1"
      game_board[1][3] = "1"
      game_board[2][3] = "2"
      game_board[3][3] = "2"
      game_board[4][3] = "2"
      game_board[5][3] = "2"
      game_board[6][3] = "O"

      expect(game_horizontal.horizontal_win?).to be true
    end

    context 'when row is full and there is a horizontal four in a row' do
      it 'returns true' do

      game_board = game_horizontal.instance_variable_get(:@game_board)
      game_board[0][5] = "1"
      game_board[1][5] = "1"
      game_board[2][5] = "1"
      game_board[3][5] = "2"
      game_board[4][5] = "2"
      game_board[5][5] = "2"
      game_board[6][5] = "2"

      expect(game_horizontal.horizontal_win?).to be true

      end
    end

    context 'when there is no horizontal four in a row ' do
      it 'returns false' do

        game_board = game_horizontal.instance_variable_get(:@game_board)
        game_board[0][0] = "1"
        game_board[1][0] = "1"
        game_board[2][0] = "1"
        game_board[3][0] = "O"
        game_board[4][0] = "O"
        game_board[5][0] = "O"
        game_board[6][0] = "O"

        expect(game_horizontal.horizontal_win?).to be false
      end 
    end

    context 'when row is full and there is no horizontal four in a row ' do
      it 'returns false' do

        game_board = game_horizontal.instance_variable_get(:@game_board)
        game_board[0][0] = "1"
        game_board[1][0] = "1"
        game_board[2][0] = "1"
        game_board[3][0] = "2"
        game_board[4][0] = "2"
        game_board[5][0] = "2"
        game_board[6][0] = "1"

        expect(game_horizontal.horizontal_win?).to be false
      end 
    end
  end

  describe '#diagonal_win?' do
    subject(:game_diagonal) { described_class.new }

    context 'when there is an ascending diagonal four in a row' do
      it 'returns true' do
        game_board = game_diagonal.instance_variable_get(:@game_board)

        game_board[0][3] = "1"
        game_board[1][2] = "1"
        game_board[2][1] = "1"
        game_board[3][0] = "1"

        expect(game_diagonal.diagonal_win?).to be true
      end
    end

    context 'when there is an descending diagonal four in a row' do
      it 'returns true' do
        game_board = game_diagonal.instance_variable_get(:@game_board)

        game_board[3][5] = "1"
        game_board[2][4] = "1"
        game_board[1][3] = "1"
        game_board[0][2] = "1"

        expect(game_diagonal.diagonal_win?).to be true
      end
    end

    context 'when there is an ascending diagonal four in a row anywhere' do
      it 'returns true' do
        game_board = game_diagonal.instance_variable_get(:@game_board)

        game_board[6][2] = "2"
        game_board[5][3] = "2"
        game_board[4][4] = "2"
        game_board[3][5] = "2"

        expect(game_diagonal.diagonal_win?).to be true
      end
    end

    context 'when there is an descending diagonal four in a row anywhere' do
      it 'returns true' do
        game_board = game_diagonal.instance_variable_get(:@game_board)

        game_board[6][3] = "2"
        game_board[5][2] = "2"
        game_board[4][1] = "2"
        game_board[3][0] = "2"

        expect(game_diagonal.diagonal_win?).to be true
      end
    end

    context 'when there is no ascending diagonal four in a row' do
      it 'returns false' do
        game_board = game_diagonal.instance_variable_get(:@game_board)

        game_board[0][3] = "1"
        game_board[1][2] = "2"
        game_board[2][1] = "1"
        game_board[3][0] = "1"

        expect(game_diagonal.diagonal_win?).to be false
      end
    end

    context 'when there is no descending diagonal four in a row' do
      it 'returns false' do
        game_board = game_diagonal.instance_variable_get(:@game_board)

        game_board[6][3] = "2"
        game_board[5][2] = "2"
        game_board[4][1] = "2"
        game_board[3][0] = "1"

        expect(game_diagonal.diagonal_win?).to be false
      end
    end
  end

  describe '#game_over?' do
    subject(:game_over) { described_class.new }

    context 'when board has vertical four in a row' do
      before do
        allow(game_over).to receive(:vertical_win?).and_return(true)
      end

      it 'returns true' do
        expect(game_over.game_over?).to be true
      end
    end

    context 'when board has horizontal four in a row' do
      before do
        allow(game_over).to receive(:horizontal_win?).and_return(true)
      end

      it 'returns true' do
        expect(game_over.game_over?).to be true
      end
    end
    
    context 'when board has diagonal four in a row' do
      before do
        allow(game_over).to receive(:diagonal_win?).and_return(true)
      end

      it 'returns true' do
        expect(game_over.game_over?).to be true
      end
    end
  end

  




end