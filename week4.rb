# Write a class representing a dog
# Write another class representing a human

# A dog should have a name, breed, and happiness (initialize to 0).
# Name and breed should be accepted initilize arguments. Happiness should be set to 0 in the initilizer
# Write a custom reader/writer for name and just a reader for breed and happiness
### A dog should be able to walk (which prints out the name of the dog
### and "is walking" and also increases happiness by 10)

# A human should have a name, age and happiness (initialize to 0)
# Name and age should be accepted initilize arguments. Happiness should be set to 0 in the initilizer
# Use use attr_xxxxxx to get reader/writer for name, and attr_reader only for age and happiness
### A human should be able to relax, which prints out the name of the person and "is relaxing"
### and increases happiness by 10. 


class Human

    attr_accessor :name
    attr_reader :age, :happiness

    def initialize(name, age)
        @name, @age, @happiness = name, age, 0
    end

    def relax
        puts "#{self.name} is relaxing"
        @happiness += 10
    end

end

class Dog

    def initialize(name, breed)
        @name, @breed, @happiness = name, breed, 0
    end

    def walk
        puts "#{self.name} is walking"
        @happiness += 10
    end

    def name
        return @name
    end

    def name=(name)
        @name = name
    end

    def breed
        return @breed
    end

    def happiness
        return @happiness
    end
end

cricket = Dog.new("Cricket", "Golden Retriever")
micah = Human.new("Micah", 29)

puts cricket.happiness
puts micah.happiness
cricket.walk
micah.relax
puts cricket.happiness
puts micah.happiness


# def get_a_bath
#    puts "#{@name}! Come have a bath!"
#    @happiness -=5
# end






