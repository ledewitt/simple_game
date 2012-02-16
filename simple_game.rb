#### MY NOTES ####

# Objects -
# WHISKEY_BOTTLE, BUCKET, FROG, CHAIN

# Locations -
# House with a LIVING_ROOM and an ATTIC
# GARDEN

#### METHODS ####

def look(location)
  #if location then print description
  p location[0]
end

def interpret(command,location)
  if command == 'look'
    look(location)
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

# Define the games Objects, and Locations

objects = ['WISKEY_BOTTLE', 'BUCKET', 'FROG', 'CHAIN']

LIVING_ROOM = ['You are in the LIVING_ROOM of a wizards house.  There is a wizard snoring loudly on the couch.', 'WEST door garden', 'Upstairs stairway ATTIC', objects[0]]

GARDEN = ['You are in a beautiful GARDEN. There is a WELL in front of you', 'EAST door LIVING_ROOM']

ATTIC = ['ATTIC', 'You are in the ATTIC of the WIZARDS house.  There is a giant welding TORCH in the corner', 'Downstairs stairway LIVING_ROOM']

map = [LIVING_ROOM, GARDEN, ATTIC]

object_locations = ['WHISKEY_BOTTLE LIVING_ROOM', 'BUCKET LIVING_ROOM', 'CHAIN GARDEN', 'FROG GARDEN']

location = map[0]

#describe_location(location)

start(location)

# p location[0]
# 
# p objects[0]
# 
# p map[0]
# 
