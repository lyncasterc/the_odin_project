#public methods can be called from outside the class, 

#private methods can only be called from other code inside object

class Dog
    def initialize(name, breed)
        @name = name
        @breed = breed
    end

    public
    def bark
        puts "Woof!"
    end

    private
    def id
        @id_number = 12345
    end

end