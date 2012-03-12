############################
### Initialize the World ###
############################

class World
  
  def initialize
    @map = [ ]
    @location = [ ]
    open("world.dat") do |f|
      @numb_locations = f.gets.to_i
      p @numb_locations
      @numb_locations.times do |loc|
        4.times do
          @location << f.gets.strip
        end
      @map << @location
      @location = [ ]
      end
    end
  end
  
  attr_reader :map
  def map
    @map
  end
  
end

world = World.new()

puts world.map

p world.map
