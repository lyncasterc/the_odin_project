# frozen_string_literal: true

def substrings(str, arr)
  str_hash = Hash.new(0)
  str = str.downcase

  arr.each do |word|
    if str.include?(word)
      str_hash[word] += str.scan(word).length
    else
      next
    end
  end
  str_hash
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

print substrings("Howdy partner, sit down! How's it going?", dictionary)
