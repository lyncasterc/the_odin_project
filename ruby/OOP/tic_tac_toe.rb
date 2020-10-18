



empty_board = "\n
            
__|__|__   
__|__|__
  |  |
  \n\n"

empty_board = empty_board.split('')
empty_board.slice!(16)
empty_board.insert(16, "X")
empty_board = empty_board.join('')


empty_board = empty_board.split('')
empty_board.slice!(19)
empty_board.insert(19, "O")
empty_board = empty_board.join('')



# empty_board.insert()

print empty_board
