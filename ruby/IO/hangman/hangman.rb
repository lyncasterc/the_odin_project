class HangMan
  def initialize
    @word = nil
  end

  public
  def main

    full_hangman = ["\t\t------|","\t\t|     O","\t\t|   --|--","\t\t|    / \\","\t\t| ________"]
    word = nil
    guessed_letters = nil
    wrong_letters = nil
    alphabet = nil
    turns_left = nil
    word_dashes = nil
    guess = nil

    puts "\n"
    puts "\t\tHANGMAN\n\n"
    puts full_hangman
    puts "\n"
    
    choice = get_menu_choice

    case choice
      when 1 #start game

        @word = random_word

        current_game_state = {

          :word => @word,

          :turns_left => 5,

          :wrong_letters => [],

          :guessed_letters => [],

          :word_dashes => [],

          :alphabet => ('a'..'z').to_a,

        }

        word = current_game_state[:word]
        guessed_letters = current_game_state[:guessed_letters]
        wrong_letters = current_game_state[:wrong_letters]
        alphabet = current_game_state[:alphabet]
        turns_left = current_game_state[:turns_left]
        word_dashes = current_game_state[:word_dashes]
        guess = nil

        (1..word.length).each{word_dashes.push("_")}


      when 2 #load game
        current_game_state = load_saved_game
        @word = current_game_state[:word]

        word = current_game_state[:word]
        guessed_letters = current_game_state[:guessed_letters]
        wrong_letters = current_game_state[:wrong_letters]
        alphabet = current_game_state[:alphabet]
        turns_left = current_game_state[:turns_left]
        word_dashes = current_game_state[:word_dashes]
        guess = nil

      when 3 #quit
        exit
    end

    puts"\n\n"
    print "\t  #{word_dashes.join(" ")}"
    

    while turns_left >= 1
      puts"\n\n"
      print "Guess a letter! (or enter 1 for menu):  "
      guess = gets.chomp.downcase
      unless !guessed_letters.include?(guess) && (alphabet.include?(guess) || guess == "1")
        puts "Uh oh! Make sure you're entering a letter which hasn't been guessed yet, or 1 for the menu!"
        print "Try again: "
        guess = gets.chomp.downcase
      end

      if guess != "1"
        guessed_letters.push(guess)
      
      elsif guess == "1"
        choice = get_menu_choice
        
        case choice
          when 1 # new game

            @word = random_word

            current_game_state = {
    
              :word => @word,
    
              :turns_left => 5,
    
              :wrong_letters => [],
    
              :guessed_letters => [],
    
              :alphabet => ('a'..'z').to_a,
            }

            word = current_game_state[:word]
            guessed_letters = current_game_state[:guessed_letters]
            wrong_letters = current_game_state[:wrong_letters]
            alphabet = current_game_state[:alphabet]
            turns_left = current_game_state[:turns_left]
            word_dashes = []
            guess = nil
            word_dashes = []

            (1..word.length).each{word_dashes.push("_")}

            puts"\n\n"
            print "\t  #{word_dashes.join(" ")}"
            next

          when 2 #save game
            save_game(current_game_state)

          when 3 #resume game
            next

          when 4 #quit
            exit

        end
      end

      #correct guess
      if word.include?(guess)
        word.split('').each_with_index do |char, index|
          if guess == char
            word_dashes[index] = char
          end
        end

      #wrong guess
      else
        turns_left -= 1
        wrong_letters.push(guess)
      end

      display_hangman(turns_left)
      puts"\n\n"
      puts "\tWrong letters: #{wrong_letters.join('  ')}\n\n"
      print "\t  #{word_dashes.join(" ")}"

      if word_dashes.join('') == word
        puts "\n"
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
      puts "\t1. New game\n\t2. Save game\n\t3. Resume game\n\t4. Quit"
      print "\tEnter choice: "
      choice = gets.chomp.to_i
      unless (1..4).include?(choice)
        puts "\tInvalid input"
        puts "\t1. New game\n\t2. Save game\n\t3. Resume game\n\t4. Quit"
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
