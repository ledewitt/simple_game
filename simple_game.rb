#### MY NOTES ####

# Objects -
# WHISKEY_BOTTLE, BUCKET, FROG, CHAIN

# Locations -
# House with a LIVING_ROOM and an ATTIC
# GARDEN

#### METHODS ####

def describe_location(location) 
  p location[1]
end

#### MAIN BODY OF CODE ####

objects = ['WISKEY_BOTTLE', 'BUCKET', 'FROG', 'CHAIN']

LIVING_ROOM = ['LIVING_ROOM', 'You are in the LIVING_ROOM of a wizards house.  There is a wizard snoring loudly on the couch.', 'WEST door garden', 'Upstairs stairway ATTIC']

GARDEN = ['GARDEN', 'You are in a beautiful GARDEN. There is a WELL in front of you', 'EAST door LIVING_ROOM']

ATTIC = ['ATTIC', 'You are in the ATTIC of the WIZARDS house.  There is a giant welding TORCH in the corner', 'Downstairs stairway LIVING_ROOM']

map = [LIVING_ROOM, GARDEN, ATTIC]

object_locations = ['WHISKEY_BOTTLE LIVING_ROOM', 'BUCKET LIVING_ROOM', 'CHAIN GARDEN', 'FROG GARDEN']

location = map[0]

describe_location(location)

# p location[0]
# 
# p objects[0]
# 
# p map[0]
# 
