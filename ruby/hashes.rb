# aka, js objects, python dictionaries

my_hash = {
    "word" => "ahoy",
    "test score" => 94,
    "array" => [1,2,3],
    "empty has" => {}
}
# can take anything as keys or values, doesn't have to be string

#accessing keys
puts my_hash["word"] #ahoy
    #if key doesn't exist, returns  nil


#changing data

shoes = {
    "summer" => "sandals",
    "winter" => "boots"

}

shoes["fall"] = "sneakers" #adds a new key fall with a value of sneakers

shoes["summer"] = "chanclas" #changes existing summer key value to chanclas

shoes.delete("summer") #deletes key-value pair 

#methods

books = {
    "The Elegant Universe" => "Brian Greene",
    "The Holy Bible" => "random dudes"
}

#.keys - returns array of keys
# .values - returns values

puts books.keys

#merging two hashes
hash1 = { "a" => 100, "b" => 200 }
hash2 = { "b" => 254, "c" => 300 }
hash1.merge(hash2) #{ "a" => 100, "b" => 254, "c" => 300 }
    #key-values in hash2 will overide hash1 if keys are the same

#has_key? - check if hash contains certain key, returns bool

#.fetch - returns value of key passed in if it exists

#symbols as hash keys
    #symbols have better performance and look cleaner in hashes

cars = {
    :chevrolet => "Camaro",
    :ford => "Mustang",
    :dodge => "Charger"
}

#iterating through kets
cars.each_key{|key| puts key}

# with for loop, k is array of each key,value pair [k,v]
for k in cars
    puts k[0]
end

cars.each_value{|value| puts value}

for k in cars
    puts k[1]
end



family = {  uncles: ["bob", "joe", "steve"],
    sisters: ["jane", "jill", "beth"],
    brothers: ["frank","rob","david"],
    aunts: ["mary","sally","susan"]
}

#selecting only sisters and brothers into new array
arr = family.select{|k,v| k == :sisters || k == :brothers}.flatten



