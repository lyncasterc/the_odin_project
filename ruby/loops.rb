# frozen_string_literal: true

# loop loop
# nope

# while loop
i = 0
while i <= 10
  puts "i is #{i}"
  i += 1
end

# until loop
# opposite of while loop, runs as long as condition is false

a = 0
until a = 10
  puts "a is #{a}"
  a += 1
end
# run this code until this condition is true

# ranges and for loops, pretty much python

(1..5) # inclusive, 1, 2, 3, 4, 5
(1...5) # exlsuvive 1,2,3,4

(1..5).each do |i|
  puts "#{i} zombies approaching"
end
