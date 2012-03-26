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
    @location = world.locations.find { |l| l.name == "LIVING ROOM" }
    @inventory = ["BELLY LINT"]
  end
  
  def look
    puts @location.description
    # puts @location.objects[0]
    # puts Array(@location.objects).map { |o| "There is a #{o}." }.join("  ")
    # puts @location.objects.split(/,\s*/).map { |o| "There is a #{o}." }.join("  ")
    @location.objects.each { |x| puts "There is a #{x} here."}
    @location.exits.each { |x| puts "From here there is a #{x}."}
    # p @location.objects.class
  end
  
  def pickup(object)
    @location.objects.each do |obj_in_room|
      if obj_in_room == object.upcase
        @inventory << object.upcase
        @location.objects.delete(obj_in_room)
      end
    end
  end
  
  def walk(direction)
    # Change Bob's location on the world object
    p @location.exits.each
    
    case @location.name
    when 'LIVING ROOM'
      if direction == 'upstairs'
        @location = location.find { |l| l.name == "ATTIC" }
        # @location = world.locations.find { |l| l.name == "ATTIC"}
      end
      if direction == 'west'
        @location = locations.find { |l| l.name == "GARDEN"}
      end
    when 'ATTIC'
      
    when 'GARDEN'
      
    else
      puts 'You can not walk that way'
    end
    
  end
  
  def inventory
    # Inventory still need to create the array for inventory
    puts @inventory
  end
  
  def dunk
    # Only if you have a chained bucket and are in the garden location
    puts "You can't dunk here your not MJ"
  end
  
  def weld
    # Only if you have the chain and bucket and are in the attic
    puts "Only if you have a torch"
  end
  
  def splash
    # Only if you have a full bucket and are in the living room
    puts "I wouldn't if I were you"
  end
end

class Location # Set up what I need for a location
  attr_accessor :name, :description, :objects, :exits
  
  def initialize(name, description, objects, exits)
    @name        = name
    @description = description
    @objects     = objects.split(/,\s*/)
    @exits       = exits.split(/,\s*/)
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
    
    # raise "name, description and object are required" unless name and description and objects
                                                             
    @locations << Location.new(name, description, objects, exits)
  end
end                                                             

def interpret(command, bob)
  words = command.split(" ")
  case words.first
  when 'quit', 'exit'
    exit
  when 'look'
    bob.look
  when 'pickup', 'get'
    bob.pickup(words.last)
  when 'walk', 'run'
    bob.walk(words.last)
  when 'inventory'
    bob.inventory
  when 'dunk'
    bob.dunk
  when 'weld'
    bob.weld
  when 'splash'
    bob.splash
  else
    puts 'I do not recognize that command'
  end
end

def start
    puts "Would you like to play a game?"
    world = World.new
    bob = Player.new(world)
    bob.look
    while command = gets.strip
      interpret(command, bob)
    end
end

start