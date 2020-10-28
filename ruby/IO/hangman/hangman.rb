class HangMan
  def initialize
    @word = nil
  end

  public
  def main

    full_hangman = ["\t\t------|","\t\t|     O","\t\t|   --|--","\t\t|    / \\","\t\t| ________"]

    puts "\n"
    puts "\t\tHANGMAN\n\n"
    puts full_hangman
    puts "\n"
    
    choice = get_menu_choice

    case choice
      when 1

        @word = random_word

        current_game_state = {

          :word => @word,

          :turns_left => 5,

          :guessed_letters => [],

          :available_letters => ('a'..'z').to_a,
        }

      when 2
        current_game_state = load_saved_game
        @word = current_game_state[:word]

      when 3
        exit
    end

    word = current_game_state[:word]
    guessed_letters = current_game_state[:guessed_letters]
    turns_left = current_game_state[:turns_left]
    word_dashes = []
    guess = nil

    (1..word.length).each{word_dashes.push("_")}

    puts"\n\n"
    print "\t  #{word_dashes.join(" ")}"
    

    while turns_left >= 1
      puts"\n\n"
      print "Guess a letter! (or enter 1 for menu):  "
      guess = gets.chomp.downcase
      guessed_letters.push(guess)

      if word.include?(guess)
        word.split('').each_with_index do |char, index|
          if guess == char
            word_dashes[index] = char
          end
        end
      else
        turns_left -= 1
      end

      display_hangman(turns_left)
      puts"\n\n"
      puts "\tUsed letters: #{guessed_letters.join('  ')}\n\n"
      print "\t  #{word_dashes.join(" ")}"

      if word_dashes.join('') == word
        puts "You guessed the word!"
        break
      elsif turns_left == 0
        puts"\n\n"
        puts "You lose! The word was #{word}."
      end




      






    end

    

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
      puts "\t1. Play game\n\t2. Load saved game\n\t3. Quit"
      print "\tEnter choice: "
      choice = gets.chomp.to_i
      unless (1..3).include?(choice)
        puts "\tInvalid input"
        puts "\t1. Play game\n2. Load saved game\n3. Quit"
        print "\tEnter choice: "
        choice = gets.chomp.to_i  
      end
      return choice
    else
      puts "\t1. New game\n\t2. Save game\n\t3. Go back\n\t4. Quit"
      print "\tEnter choice: "
      choice = gets.chomp.to_i
      unless (1..3).include?(choice)
        puts "\tInvalid input"
        puts "\t1. New game\n\t2. Save game\n\t3. Go back\n\t4. Quit"
        print "\tEnter choice: "
        choice = gets.chomp.to_i  
      end
      return choice
    end
  end

  def display_hangman(turns)
    empty_hangman = ["\t\t------|","\t\t|      ","\t\t|        ","\t\t|       ","\t\t| ________"]
    four_hangman = ["\t\t------|","\t\t|     O","\t\t|        ","\t\t|        ","\t\t| ________"]
    three_hangman = ["\t\t------|","\t\t|     O","\t\t|   --   ","\t\t|        ","\t\t| ________"]
    two_hangman = ["\t\t------|","\t\t|     O","\t\t|   --|  ","\t\t|        ","\t\t| ________"]
    one_hangman = ["\t\t------|","\t\t|     O","\t\t|   --|--","\t\t|     /  ","\t\t| ________"]
    zero_hangman = ["\t\t------|","\t\t|     O","\t\t|   --|--","\t\t|    / \\","\t\t| ________"]

    case turns
      when 5
        puts empty_hangman
      
      when 4
        puts four_hangman

      when 3 
        puts three_hangman

      when 2
        puts two_hangman

      when 1
        puts one_hangman
        
      when 0 
        puts zero_hangman
    end

  end
  
end


hangman = HangMan.new()
hangman.main



