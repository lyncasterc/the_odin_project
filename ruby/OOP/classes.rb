# frozen_string_literal: true

class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end

  def description
    puts "#{@name} was created by #{@creator}"
  end
end

python = Language.new('Python', 'Guido van Rossum')
ruby = Language.new('Ruby', 'Yukihiro Matsumoto')
javascript = Language.new('JavaScript', 'Brendan Eich')

# python.description

# def initialize is like def__init__ in python
# initializes the class, takes instance variables

# $variable - global variable
# @variable - instance variable
# @@variable - class variable

# @@people_count is a class variable keeping track of the number of instances of Person.
# it is incremented inside initiliaze because when a new instance is created, the code inside the initialize function will run first

class Person
  @@people_count = 0

  def initialize(name, age, profession)
    @name = name
    @age = age
    @profession = profession
    @@people_count += 1
  end

  # class method
  def self.number_of_people
    @@people_count
  end
end

matz = Person.new('Yukihiro', 23, 'Programmer')
puts Person.number_of_people # 1
