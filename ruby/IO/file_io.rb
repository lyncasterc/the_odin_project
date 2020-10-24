
#opening file in write mode
  #opening file in w mode erases content of file. Open in a to append to existing file.
text = File.open("text.txt", "w+")
#writing to file
text.puts "Stiven"
text.close


#reading from a file
#opening in read mode
input_file = File.open("text.txt", "r")
# reading content into name
name = input_file.read
puts name
input_file.close

#readline - reads a single - will return end of file error if continuously called until end of file. 
  #can be used with while loop to prevent error
sample = File.open("sample.txt","r")
while !sample.eof?
  line = sample.readline
  puts line
end

#readlines - gets all lines in file
File.open("sample.txt").readlines.each do |line|
  puts line
end

sample.close
#readline is more efficient because it doesn't read entire file into memory - better to use when extracting something from each line

#combining file io with serialization

require 'json'

me = {
  :name => "Stiven",
  :age => 24
}

File.open("sample.txt", "a+") do |file|
  file.write me.to_json
end

