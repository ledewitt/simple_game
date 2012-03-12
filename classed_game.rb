############################
### Initialize the World ###
############################

class World
  
  def intialize
    @@map = [ ]
    open("world.dat") do |f|
      @@numb_locations = f.gets.to_i
      p @@numb_locations
      @@numb_locations.times do |loc|
        @@map[loc] << f.gets.times(3)
      end
    end
    @@map
  end
  
  
  
end

map = World.new()
puts map