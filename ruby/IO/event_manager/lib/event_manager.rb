puts "EventManager Initialized"

file_name = "event_attendees.csv"


#reading and printing CSV file

  # contents = File.read("file_name")
  # puts contents


#reading file line by line

#lines is an array of all the lines in file
lines = File.readlines(file_name)

lines.each_with_index do |line, i|
  #displaying name from each line
  # in the csv file, all the field info is seperated by a comma, so we use split the line along all the commas to get each part into array
    #the name is index[2]

  #skipping the headers  
  if i != 0
    columns = line.split(',')
    name = columns[2]
    # puts name
  end
  
end

# Instead of the code above, Ruby comes with tools to handle parsing CSV

require "csv"
require "google/apis/civicinfo_v2"

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new

civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw' 



def clean_zipcode(zipcode)
  if zipcode.nil?
    zipcode = "00000"
  elsif zipcode.length < 5
    #str.rjust(int, pad) - if string length is greater than int, str justified right and pad is prepended until str is at the length
    zipcode = zipcode.rjust(5, "0")
  elsif zipcode.length > 5
    zipcode = zipcode.pop()
  end
  return zipcode
end

#you can access column values by their headers
  #convert the headers into symbols for cleaner syntax
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])

  begin
    legislators = civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    )
    legislators = legislators.officials
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end

  legislator_names = legislators.map do |legislator|
    legislator.name
  end
  
  puts "#{name}, #{zipcode} #{legislator_names}"
  
end



