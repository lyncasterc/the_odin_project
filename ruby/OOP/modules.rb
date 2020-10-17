# Modules are toolboxes that contain methods that we can use. Just like in python when you have import certain libraries to have access to certain functions
# sort of like classes w/o instances and subclasses

# to pull in modules, you use 'require'

# creating our own module
module Circle
    PI = 3.141592653589793

    def Circle.area(radius)
        return PI * radius**2
    end

    def Circle.circumference(radius)
        return 2 * PI * radius
    end

    
end

require 'date'

puts Date.today