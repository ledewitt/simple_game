############################
### Initialize the World ###
############################

class World
  
  def initialize
    @@map = [ ]
    open("world.dat") do |f|
      @@numb_locations = f.gets.to_i
      p @@numb_locations
      @@numb_locations.times do |loc|
        4.times do
          @@map << f.gets
        end
      end
    end
    @@map
  end
  
  
  
end

map = World.new()
p map