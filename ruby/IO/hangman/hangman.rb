class HangMan

  def initialize
    @word = random_word
  end

  public
  def main

    current_game_state = {

      :word => @word,

      :turns_left => 5,

      :guessed_letters => [],

      :available_letters => ('a'..'z').to_a,

    }

    available_letters = current_game_state[:available_letters]


  end

  private
  def random_word
    words = File.readlines("dictionary.txt").select{|word| word.length >= 5 && word.length <= 12}.sample
  end

  def save_game(game_state)

  end
  
end



hangman = HangMan.new()
hangman.main





# def pick_random_line
#   File.readlines("data.txt").sample
# end

# " ------|
#   |     O
#   |   --|--
#   |    / \
#   | _________ "