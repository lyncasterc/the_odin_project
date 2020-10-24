# serialization is turning data structures like arrays or hashes (dictionaries) into a long string to save them into a file or send it somewhere else or vice-versa
  #there are several ways to do it including YAML and JSON

  

require 'json'

me = {
  :name => "Stiven",
  :age => 24
}

#converting object into JSON
my_json = me.to_json 
puts my_json

#converting JSON back to ruby
JSON.parse(my_json)
puts my_json