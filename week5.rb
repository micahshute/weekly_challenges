## Take the solution from last week (if done, if not ask me for last week's prompt)
## and modify it to allow a dog to belong to a human and for a human to have many dogs.

# You may refactor dog readers and writers into attr_accessor/reader/writer if you wish

## Allow `dogs` to be OPTIONALLY initialized by a user of your Human class. If it is not 
## included as an argument, it should default to an empty array.

## Allow `owner` to be an OPTIONAL initializer to your Dog class. Owner should default to nil.

## Make a custom `owner=` in your Dog class that only lets `owner` be set if it is currently nil
## Make sure the outcome of this `owner=` method is reflected in your Human @dogs array!

## Add a method to Human called wash_dog which lowers the dogs and the human's happiness by 10 UNLESS that human is  the owner. 
## If the washing is done by the owner, it should lower the owners happiness by 3 and the dog's happines by 5.
## Think how you could simulate if it is "done by" the owner. Be creative!

## Modify your `walk` method to increase the dog and owner happiness by 10. If the dog does not 
## have an owner, its happiness should be raised by 5.


## NOTE: This challenge is meant to allow creativity and not have one specific solution. Really any way for the 
## tests below to pass is ok. The point of this challenge is to observe inter-object relationship troubleshooting
## methods to make sure they understand the complexities


## Split this between weeks 5 and 6

class Human

    attr_accessor :name
    attr_reader :age, :happiness, :dogs

    def initialize(name, age, dogs = [])
        @name, @age, @happiness, @dogs = name, age, 0, dogs
    end

    def relax
        puts "#{self.name} is relaxing"
        @happiness += 10
    end


    def wash_dog(dog)
        dog.owner == self ? @happiness -= 3 : @happiness -= 10
        dog.get_bath(self)
    end

    def interact_with_dog(happiness_change, dog)
        @happiness += happiness_change if dog.is_a? Dog
    end

end



class Dog

    attr_accessor :name
    attr_reader :breed, :owner, :happiness

    def initialize(name, breed, owner = nil)
        @name, @breed, @happiness, self.owner = name, breed, 0, owner
    end

    def walk
        puts "#{self.name} is walking"
        self.owner.nil? ? @happiness += 5 : (@happiness += 10; self.owner.interact_with_dog(10, self))
    end

    def owner=(owner)
        @owner ||= owner
        if @owner.respond_to?("dogs") && !@owner.dogs.include?(self)
            @owner.dogs << self
        end
    end

    def get_bath(human)
        if human.is_a?(Human) && human == self.owner
            @happiness -= 5
        elsif human.is_a?(Human)
            @happiness -= 10
        else
            puts "Bite fake human"
        end
    end
end

micah = Human.new("micah", 29)
cricket = Dog.new("cricket", "golden retriever", micah)
griffin = Dog.new("griffin", "carolina dog")

micah.relax
micah.relax
cricket.walk
griffin.walk
griffin.walk
micah.wash_dog(cricket)
micah.wash_dog(griffin)

puts micah.happiness # expect 17 
puts cricket.happiness #expect 5
puts griffin.happiness #expect 0

griffin.owner = micah
griffin.owner = cricket
puts griffin.owner.name # expect "Micah"
puts micah.dogs.map(&:name).to_s # Expect ["Cricket", "Griffin"]