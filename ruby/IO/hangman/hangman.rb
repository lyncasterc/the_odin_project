class HangMan

  def initialize
    @word = nil
  end

  public
  def main

    choice = get_menu_choice

    

    case choice
      when "1"

        @word = random_word

        current_game_state = {

          :word => @word,

          :turns_left => 5,

          :guessed_letters => [],

          :available_letters => ('a'..'z').to_a,
        }

      when "2"
        currrent_game_state = load_saved_game
      else
        exit
    end



    # menu
  
    

  end

  private
  def random_word
    words = File.readlines("dictionary.txt").select{|word| word.length >= 5 && word.length <= 12}.sample.chomp.downcase
  end

  def save_game(game_state)
    require "yaml"

    File.open("hangman_save.yaml", "w") do |file|
      file.write YAML::dump(game_state)
    end
  end

  def load_saved_game
    require "yaml"
    game_state = nil

    File.open("hangman_save.yaml", "r") do |file|
      game_state = YAML::load(file.read)
    end

    return game_state
  end

  def get_menu_choice
    
    if @word.nil?
      puts "1. Play game\n2. Load saved game\n3. Quit"
      print "Enter choice: "
      choice = gets.chomp.to_i
      unless (1..3).include?(choice)
        puts "Invalid input"
        puts "1. Play game\n2. Load saved game\n3. Quit"
        print "Enter choice: "
        choice = gets.chomp.to_i  
      end
      return choice
    else
      puts "1. New game\n2. Save game\n 3. Quit"
      print "Enter choice: "
      choice = gets.chomp.to_i
      unless (1..3).include?(choice)
        puts "Invalid input"
        puts "1. Play game\n2. Load saved game\n3. Quit"
        print "Enter choice: "
        choice = gets.chomp.to_i  
      end
      return choice
    end
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