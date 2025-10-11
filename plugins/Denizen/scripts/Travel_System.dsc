# This file includes all the mechanics for the Server's Travel System. It handles player transportation between locations using player formed roads and designated fast travel points.

# First Created: 9/28/2025

## Brainstorming Notes:

# The main idea behind the travel system is allow players and staff to setup fast travel points on the map by creating physical roads or paths between locations.
# This works by having the player create a road by placing a block or sign at one point, then right clicking the block or sign will open a GUI.
# The player will then be able to select a destination from the GUI, and be teleported to that location with a cost set by distance traveled for hunger and money to be stored at that location for taxes collected by the creator of the road.
# Roads can be created by any player, but only staff can create fast travel points that are not connected to a road.

# Players who first create a road will be given a flag that tracks the player's block step events to check what type of blocks they are stepping on to validate that the player is travelling on a player made road.
# If the player steps off the road, they will be given a warning message and a timer to return to the road before being teleported back to the start of the road to redo the entire trip.



Travel_Interaction:
    type: entity
    debug: false
    entity_type: interaction
    mechanisms:
        height: 1
        width: 1