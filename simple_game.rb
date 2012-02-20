#### MY NOTES ####

# Objects -
# WHISKEY_BOTTLE, BUCKET, FROG, CHAIN

# Locations -
# House with a LIVING_ROOM and an ATTIC
# GARDEN

#### METHODS ####

# Need some type of way to look at a locaiton and see if an object is at this location.

def look(location)
  #if location then print description
  print location[0], "\n"
  location[1].each { |x| print "From here there is a #{x}\n" }
  if location[2]
    location[2].each { |x| print "There is a #{x} here.\n" }  
  end
end

def # direction(location)
  
end

def # get(location)
  
end

def interpret(command,location)
  if command == 'look'
    look(location)
  end
  if command == '' # direction
    
  end
  if command == '' # get an object
    
  end
end

def start(location)
  puts "Welcome to a very simple game!"
  
  while (command = gets.strip) != 'quit'
    interpret(command,location)
  end
end

# def describe_location(location) 
#   p location[1]
# end

# def describe_path(path)
#   p "There is a #{path[1]} going, #{path[0]} from here"
# end

#### MAIN BODY OF CODE ####

# Define the games Objects, Locations, and possible directions

living_room_objects = ['WHISKEY_BOTTLE', 'BUCKET']

living_room_directions = ['WEST door to the garden', 'UPSTAIRS stairway to the ATTIC']

living_room = ['You are in the LIVING_ROOM of a wizards house.  There is a wizard snoring loudly on the couch.', living_room_directions, living_room_objects]

garden_objects = ['WELL', 'FROG', 'CHAIN']

garden_directions = ['EAST door LIVING_ROOM']

garden = ['You are in a beautiful GARDEN.', garden_directions, garden_objects ]

attic_objects = ['giant welding TORCH in the corner']

attic_directions = ['DOWNSTAIRS stairway to LIVING_ROOM']

attic = ['You are in the ATTIC of the WIZARDS house.', attic_directions, attic_objects]

map = [living_room, garden, attic]

location = map[0]

#describe_location(location)

start(location)

# p location[0]
# 
# p objects[0]
# 
# p map[0]
# 
