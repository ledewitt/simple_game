#################
### Constants ###
#################

MAP = { living_room: { description: 'You are in the LIVING_ROOM of a wizards house.  There is a wizard snoring loudly on the couch.',
                       exits: {upstairs: :attic, west: :garden} },
        garden:      { description: 'You are in a beautiful GARDEN.  There is a WELL with water in it.',
                       exits: {east: :living_room} },
        attic:       { description: 'You are in the ATTIC of the WIZARDS house. There is a giant WELDING_TORCH in the corner.',
                       exits: {downstairs: :living_room} } }
INITIAL_OBJECT_LOCATIONS = { living_room: %w[WHISKEY_BOTTLE BUCKET],
                             garden:      %w[FROG CHAIN],
                             inventory:   [ ] }

################
### Commands ###
################

def look(location, object_locations)
  room = MAP[location]
  puts room[:description]
  room[:exits].each do |direction, room|
    puts "You can go #{direction.upcase} to the #{room.upcase}."
  end
  object_locations[location].each do |object|
    puts "A #{object} is here."
  end
  nil
end

def walk(direction, location, object_locations)
  if destination = MAP[location][:exits][direction.to_sym]
    look(destination, object_locations)
    destination
  else
    puts "You cannot go that way."
    nil
  end
end

############
### Game ###
############

def dispatch(command, location, object_locations)
  words = command.split(" ")
  case words.first
  when "quit"
    exit
  when "look"
    look(location, object_locations)
  when "pickup"
    
  when "walk"
    walk(words.last, location, object_locations)
  else
    
  end
end

def introduce
  puts "Welcome to a very simple game!"
end

def run(location, object_locations)
  look(location, object_locations)
  while command = gets.strip
    location = dispatch(command, location, object_locations) || location
  end
end

############
### Main ###
############

current_location = :living_room
object_locations = INITIAL_OBJECT_LOCATIONS.dup

introduce
run(current_location, object_locations)
