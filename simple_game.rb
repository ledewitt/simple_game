### QUESTIONS: For James ###

### Three hashes and tab doesn't automatically create      ###
### a text box for me.                                     ###

#### MY NOTES - Attempting to level up ####

### Will keep track of what I am doing in comments         ###
### NOTE: I know this is a poor implementation of coding   ###
###       just doing a funcitonal program with no objects  ###
###       as this exercise continues I will create a       ###
###       version using hashes and finally a version       ###
###       that is fully object oriented in an attempt      ###
###       to get my feet wet in Ruby programming.          ###

### Variable soup: Section                                 ###
### Setting up the game enviroment                         ###

### Each room is an array of size three where:             ###
### 0 index - descriptiong of the location                 ###
### 1 index - array of directions to move                  ###
### 2 index - array of objects in the room                 ###

### Second itereation of this design will turn these       ###
### into hashes, third iteration will use objects          ###

living_room_objects = ['WHISKEY_BOTTLE', 'BUCKET']

living_room_directions = ['WEST door to the garden', 'UPSTAIRS stairway to the ATTIC']

living_room = [:living_room, 'You are in the LIVING_ROOM of a wizards house.  There is a wizard snoring loudly on the couch.', living_room_directions, living_room_objects]

garden_objects = ['WELL', 'FROG', 'CHAIN']

garden_directions = ['EAST door LIVING_ROOM']

garden = [:garden, 'You are in a beautiful GARDEN.', garden_directions, garden_objects ]

attic_objects = ['giant welding TORCH in the corner']

attic_directions = ['DOWNSTAIRS stairway to LIVING_ROOM']

attic = [:attic, 'You are in the ATTIC of the WIZARDS house.', attic_directions, attic_objects]

map = [living_room, garden, attic]

location = map[0]

#### METHODS ####

# Need some type of way to look at a locaiton and see if an object is at this location.

def look(location)
  #if location then print description
  puts location[1]
  location[2].each { |x| puts "From here there is a #{x}" }
  if location[3]
    location[3].each { |x| puts "There is a #{x} here." }
  end
end

def walk(location, direction)
  puts location[0]
  case location[0]
  when :living_room
    if direction == 'upstairs'
      look(map[2])
      location = map[2]
    end
    if direction == 'west'
      look(map[1])
      loctioin = map[1]
    end
  when 'attic'
    if direction == 'downstairs'
      look(map[0])
      location = map[0]
    end
  when 'garden'
    if direction == 'east'
      look(map[0])
      location = map[0]
    end
  else
    puts 'You can not walk that way'
  end
end

# def # get()
#   
# end

def interpret(command,location)
  words = command.split(" ")
  case words.first
  when 'quit' || 'exit'
    exit
  when 'look'
    look(location)
  when 'pikcup'
  
  when 'walk'
    walk(location, words.last)
  else
    puts 'I do not recognize that command'
  end
end

def start(location)
  puts "Welcome to a very simple game!"
  
  while command = gets.strip
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

start(location)

# p location[0]
# 
# p objects[0]
# 
# p map[0]
# 
