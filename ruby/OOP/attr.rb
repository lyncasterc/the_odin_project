#attr_reader and attr_writer are like getter and setter methods that Ruby automatically creates.

#instead of creating a getter method to get name, attr_reader automatically does it for you

#attr_accesor can and write attributes

class Person
    attr_reader :name
    attr_accessor :job

    def initialize(name,job)
        @name = name
        @job = job
    end

    # def name
    #     return @name
    # end
    # def job(new_job)
    #     @job = new_job
    # end
    
end


me = Person.new("Stiven","programmer")
puts me.name
me.job = "Senior software engineer"
puts me.job

