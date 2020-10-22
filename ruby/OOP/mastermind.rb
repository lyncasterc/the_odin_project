class Player
  def initialize(human_or_computer)
    @human_or_computer = human_or_computer
  end
end

class CodeMaker < Player
  attr_reader :human_or_computer

  def initialize(human_or_computer)
    super(human_or_computer)
  end

  public
  # if human, input a code - if computer, generate random code
  def make_code
    code = nil

    if @human_or_computer == "computer"
      code_choices = ["0","1","2","3","4","5","6","7","8","9"]
      code = code_choices.sample(4)

    elsif @human_or_computer == "human"
      print "Enter 4 digit number from 0-9 with no duplicates: "
      code = gets.chomp.split('')

      # checks for duplicate digits
      while code.uniq != code
        puts "ERROR! Make sure your code has no duplicate digits."
        print "Enter 4 digit number from 0-9 with no duplicates: "
        code = gets.chomp.split('')
      end
    end
    return code
  end

  def rate_guess(code, guess)
    correct = 0
    incorrect = 0
    
    code.each_with_index do |code_value, code_index|
      dup_indexes = []
      if guess.include?(code_value)
        guess.each_with_index do |guess_value, guess_index|
          if guess_value == code_value
            dup_indexes.push(guess_index)
            next
          else
            next
          end
        end
        if dup_indexes.include?(code_index)
          correct +=1
        else
          incorrect+=1
        end
      else
        next
      end
    end
  
    return [correct,incorrect]
  end
end

class CodeBreaker < Player
  def initialize(human_or_computer)
    super(human_or_computer)
  end

  def make_guess()
    guess = nil

    if @human_or_computer == "computer"
      code_choices = ["0","1","2","3","4","5","6","7","8","9"]

      guess = code_choices.sample(4)
      
      
    elsif @human_or_computer == "human"
      print "Type in a 4 digit guess: "
      guess = gets.chomp.split('')

      unless guess.length == 4
        print "Guess needs to be 4 digits long. Try again: "
        guess = gets.chomp.split('')
      end
      
    end

    return guess
  end
end


def start_game
  $prev_guesses = []
  $turn_count = 0

  print "What do you want to play as?\n1. CodeBreaker \n2. CodeMaker\nEnter choice: "
  choice = gets.chomp.to_i
  while !(1..2).include?(choice)
    puts "ERROR! Enter 1 for CodeBreaker or 2 for CodeMaker: "
    choice = gets.chomp.to_i
  end

  if choice == 1
    human_player = CodeBreaker.new("human")
    computer = CodeMaker.new("computer")

    puts "Thinking of a code..."
    sleep(2)
    code = computer.make_code
    puts "I have a code!\n\n"

    while $turn_count <= 12
      $turn_count += 1
      puts "TURN: #{$turn_count}"

      guess = human_player.make_guess
      $prev_guesses.push(guess.join(''))
      $prev_guesses.each{|prev_guess| puts "\n\t\t #{prev_guess}"}
      guess_rate = computer.rate_guess(code, guess)

      print "\n"

      puts "# of correct digits in correct position: #{guess_rate[0]}
      \n# of correct digits in wrong position: #{guess_rate[1]}"

      if guess_rate[0] == 4
        puts "#{code.join}\nYou guessed the code correctly! "
        break
      elsif $turn_count == 12 && guess_rate[0] != 4
        puts "You lose! The code was #{code.join('')}"
        break
      end
    end


  elsif choice == 2
    human_player = CodeMaker.new("human")
    computer = CodeBreaker.new("computer")

    code = human_player.make_code
    $turn_count +=  1
    guess = computer.make_guess
    guess_rate = human_player.rate_guess(code, guess)


    while $turn_count <= 12

      if guess_rate[0] == 4
        puts guess
        puts "Computer wins!"
        break
      elsif $turn_count == 12 && guess_rate[0] != 4
        puts "Computer loses!"
        break
      else
        $turn_count += 1
        guess = computer.make_guess
      end
      
    end

  end


end

start_game









