#include? - checking if particular element exists in array

nums = [1,4,6,8]

nums.include?(4) #true

#any - same as python, checking if any element in array passes expression

puts nums.any?{|num| num>3} #true

#all - checks if all elements pass expression

puts nums.all?{|num| num%2==0} #false

# none - negation of all, checks if none the elements pass condition

names = ['bob','bo','dilly','billy']

puts names.none?{|name| name.length>10} #true - none of the names are greater than 10 char