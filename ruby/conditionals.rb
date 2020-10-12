# similar to python
# only falsy vals are nil and false.
room_tidy = true

if room_tidy == false
  puts "CLEAN YOUR ROOM!"
end


# one line conditionls

puts "NASTY BOY" if room_tidy != true

if room_tidy then puts "Finally, ya nasty" end

# a.eql?(b) - checks if type and value is equal
#a.equal?(b) - checks if both values are exact same object in memory

# spaceship operator
  # 5 <=> 10 returns -1, value on left smaller
  # 10 <=> 10 returns 0, values equal
  # 10 <=> 5 returns 1, value on left greater


# logical operator
  # &&, ||, !

# case statements - similar to switch statements

grade = 'F'

did_i_pass = case grade
when 'A' 
  puts "Yer a wizard harry"
when 'D'
  puts "Well...ok"
else 
  puts "Dumbass"
end

# unless statements
  #opposite to if-statements, only runs if expression false

age = 18

unless age < 17 
  puts "Get a job"
end
# unless the age is less than 17, print this statement


# conditional/ternary operator

response = age < 17 ? "You're a baby" : "You're ancient"

puts response