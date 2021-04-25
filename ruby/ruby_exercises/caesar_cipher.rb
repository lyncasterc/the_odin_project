# frozen_string_literal: true

def caesar_cipher(string, shift)
  alphabet = ('a'..'z').to_a

  caesar_string = []

  string.split('').each do |char|
    # checking if it's punctuation
    if alphabet.index(char.downcase).nil? && char != ' '
      caesar_string.push(char)

    # checking if char is uppercase
    elsif char == char.upcase && char != ' '
  
      caesar_string.push(alphabet[(alphabet.index(char.downcase) + shift) % alphabet.length].upcase)


    # checking if char is lowercase
    elsif char == char.downcase && char != ' '

      caesar_string.push(alphabet[(alphabet.index(char) + shift) % alphabet.length])

    # checking if char is a space
    elsif char == ' '
      caesar_string.push(char)
    
    end
  end

  caesar_string = caesar_string.join('')

  return caesar_string
end





# puts caesar_cipher('Hello world, i feel like a million bucks!', 3)
puts caesar_cipher('Hello bob', 100)
