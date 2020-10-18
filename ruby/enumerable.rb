# frozen_string_literal: true

# built in methods for arrays/hashes

# select -  filtering, retuns new array with elements that return true for expression passed in
friends = %w[Sharon Leo Leila Brian Arun]

# friends array w/o brian
invited = friends.reject { |friend| friend == 'Brian' }

# each - iterates and performs task to each element

friends.each { |friend| puts "Hello #{friend}" }

# for code that is longer than a line:

friends.each do |friend|
  puts "Hello #{friend}" if friend != 'Brian'
end

# with each, you can iterate through keys and values of a hash
couples = {
  'stiven' => 'emilia',
  'lewis' => 'katie',
  'trump' => 'putin'

}

# with each, you can't actually change anything in array being called
couples.each { |k, v| puts "#{k} is with #{v}" }

# map
# returns new array with names uppercased
# if you want original array to me changed, add ! to upcase
puts friends.map(&:upcase)
puts friends
friends.map!(&:upcase)
puts friends

# reduce - reduces array or hash to single output

nums = [5, 6, 7, 8]

puts nums.reduce { |sum, number| sum + number }
# iteration 0: sum=5+6 (11)
# iteration 1: sum=11+7 (18)
# iteration 2: sum=18+8 (26)

votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.each_with_object(Hash.new(0)) do |tally, option|
  option[tally] += 1
end
