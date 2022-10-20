class House
    attr_accessor :id, :room, :area, :floor, :amountRooms, :street, :type, :liveUntil

    def initialize(id, apartment = 0, area = 0, floor = 0, amountRooms = 0, street = "", type = "", liveUntil = 0)
        @id = id
        if street == ""
            @apartment = rand(400)
            @area = rand(60..140)
            @floor = rand(1..20)
            @amountRooms = rand(3..5)
            @liveUntil = rand(2050..2070)
            @street = ["Pushkina", "Sadova", "Central"].sample
            @type = ["brick", "panel"].sample
       else
            @apartment = apartment 
            @area = area
            @floor = floor
            @amountRooms = amountRooms
            @street = street
            @type = type
            @liveUntil = liveUntil
       end
    end

    def toString
        return "House id: " + @id.to_s + 
        "\nApartment number: " + @apartment.to_s + 
        "\nArea of apartment: " + @area.to_s +
        "\nFloor: " + @floor.to_s + 
        "\nAmount of rooms: " + @amountRooms.to_s + 
        "\nStreet: " + @street.to_s + 
        "\nType of building: " + @type.to_s + 
        "\nAssigment period: " + @liveUntil.to_s + "\n\n"
    end

end

class HouseHandler
    def generateArray
        houses = []
        houses.push(House.new(0, 10, 60, 1, 3, "Pushkina", "brick", 2050))
        houses.push(House.new(1, 11, 60, 1, 3, "Pushkina", "brick", 2050))
        houses.push(House.new(2, 20, 80, 2, 4, "Sadova", "panel", 2060))
        houses.push(House.new(3, 23, 100, 2, 5, "Central", "brick", 2070))
        houses.push(House.new(4, 40, 70, 4, 3, "Central", "panel", 2055))
        houses.push(House.new(5, 45, 120, 4, 5, "Sadova", "brick", 2070))
        houses.push(House.new(6, 67, 90, 6, 4, "Sadova", "brick", 2060))
        houses.push(House.new(7, 89, 80, 8, 4, "Pushkina", "panel", 2065))
        houses.push(House.new(8, 92, 100, 9, 5, "Central", "panel", 2050))
        houses.push(House.new(9, 122, 60, 12, 3, "Pushkina", "brick", 2070))
        houses.push(House.new(10, 156, 140, 15, 5, "Sadova", "panel", 2055))
        return houses
    end

    def generateRandomArray
        houses = []
        for i in 0..10
            houses << House.new(i)
        end
        return houses
    end

    def findByAmountOfRooms(houses, rooms)
        result = []
        for house in houses
            if house.amountRooms == rooms
                result << house
            end
        end
        return result
    end

    def findByFloor(houses, low, high)
        result = []
        for house in houses
            if house.floor >= low && house.floor <= high 
                result << house
            end
        end
        return result
    end

    def findByArea(houses, area)
        result = []
        for house in houses
            if house.area >= area
                result << house
            end
        end
        return result
    end
end

houseHandler = HouseHandler.new 
randomHouses = houseHandler.generateRandomArray
houses = houseHandler.generateArray
housesByRoom = houseHandler.findByAmountOfRooms(houses, 4)
housesByFloor = houseHandler.findByFloor(houseHandler.findByAmountOfRooms(houses, 5), 4, 9)
housesByArea = houseHandler.findByArea(houses, 90)

puts "Random generated houses: \n\n"
for house in randomHouses
    puts house.toString
end
puts "\n---------------------\n\n"

puts "All houses with 4 rooms: \n"
for house in housesByRoom
    puts house.toString
end
puts "\n---------------------\n\n"
puts "All houses with 5 rooms and floor from 4 to 9: \n"
for house in housesByFloor
    puts house.toString
end
puts "\n---------------------\n\n"
puts "All houses with area not less then 90: \n"
for house in housesByArea
    puts house.toString
end

  