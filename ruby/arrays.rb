# frozen_string_literal: true

numbers = [1, 2, 3, 4, 5]

# adding items to array
# push and << both add to end of array, return array with the new elements

numbers.push(6)
numbers << 7

# removing elements
# pop removes last item, returns element removed
numbers.pop
puts numbers # 1,2,3,4,5,6

# shift and unshift - remove or add to beginning of array
# unshit adds, shift removes
# pop and shift take int args - number of elements to remove
names = %w[stiven bob]
names.unshift('emilia')
puts names

numbers.pop(3) # removes three elements starting from the end
puts numbers # 1,2,3

# adding/subtracting arrays

nums_a = [1, 2, 3]
nums_b = [3, 4, 5]

puts nums_a + nums_b # [1,2,3,4,5]

# subtracting returns copy of first array with and elements that appear in second array removed

cars = %w[camry camaro mustang challenger tesla]
puts cars - %w[camry tesla] # camaro,mustang,challenger

# basic array methods
# .methods - long list of available methods
# [].empty? - true if empty
# [1,2,3].reverse -> [3,2,1]
# [1,2,3].include?('2') -> true
# [1,2,3].join('.') -> 1.2.3
# [].first - returns first element
# [].last - returns last element
# [].map iterates over array appylying code to each element and returns new array

puts numbers.map { |num| num * 2 } # [2,4,6]
# [].delete_at() - removing value at specified index

puts numbers.delete_at(1) # [6,2]
# [].delete - removes value passed in
# [].uniq - removes duplicates, returns new array unless you add ! at the end

locations = %w[nyc la ri spain nyc la]
# puts locations.uniq

locations.uniq!

puts locations

# .select - sort of like filtering or lc in python. returns array with elements that return true in expression
puts locations.select { |location| location.length > 3 } # spain

ages = [3, 7, 10, 4, 2, 20, 1, 40, 32, 56]
ages.sort!
puts ages

arr = [%w[test hello world], %w[example mem]]

# getting example from this array

puts arr.last.first # last array in arr, first element in last array

ages.each { |element| puts element * 4 }

# sample - picks random element from array

puts ages.sample

# clear - deletes al elements from array

ages.clear
puts ages # []
