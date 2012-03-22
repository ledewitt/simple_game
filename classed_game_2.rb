# class Player # Need location and an inventory and a way to read
#   attr_accessor :location, :inventory
#   
#   def initialize( )
#     @location
#     @inventory = [ ]
#   end
# end
class Player
  def initialize(world)
    @location = world.locations.find { |l| l.name == "living room" }
  end
  
  def look
    puts @location.description
    puts @location.objects
    puts @location.exits
  end
end

class Location # Set up what I need for a location
  attr_accessor :name, :description, :objects, :exits
  
  def initialize(name, description, objects, exits)
    @name        = name
    @description = description
    @objects     = objects
    @exits       = exits
  end
end

class World

  def initialize # Need the locations populated and a player with locations
    
    @locations = [ ]
    open("world_2.dat") do |f|
      location = { }
      f.each do |line|
        if line =~ /\A([A-Z]+):\s*(.+)\Z/
          location[$1.downcase] = $2
        elsif line !~ /\S/
          add_location(location)
          location.clear
        end
      end
      add_location(location)
    end

  end
  
  attr_reader :locations
  
  private
  
  def add_location(location)
    return if location.empty?
    name = location['name']
    description = location['description']
    objects = location['objects']
    exits = location['exits']
    
    # p location # debugging code to be deleted later
    
    # raise "name, description and object are required" unless name and description and objects
                                                             
    @locations << Location.new(name, description, objects, exits)
  end
end                                                             

world = World.new
# puts world.locations.find { |l| l.name == "garden" }
# puts world.locations

bob = Player.new(world)
bob.look