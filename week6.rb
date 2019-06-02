# See Week 5 (continuation)


# distance = rate * time
# time in hrs, rate in mph
# position in miles

class Vehicle

    attr_reader :position

    def initialize
        @position = 0
    end

    def drive(time, speed)
        @position += (time * speed)
    end

end

class Motorcycle < Vehicle

    def drive(time, speed)
        if time > 2 
            time = 2
        end
        super(time, speed)
    end
end

class Car < Vehicle

end


class GolfCart < Vehicle

    def drive(time)
        super(time, 5)
    end

end



gc = GolfCart.new
m = Motorcycle.new
c = Car.new
gc.drive(1)
m.drive(10, 60)
c.drive(10, 60)
puts gc.position
puts m.position
puts c.position