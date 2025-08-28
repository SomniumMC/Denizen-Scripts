# This script file is part of the Dungeons module for the Denizen scripting system.
# It defines the mechanics, events, and interactions for the "Crystaline Cavern" dungeon.

# Created 8/28/2025

SomniData_Crystaline_Cavern:
    type: data
    origin: crystaline_cavernpos1
    pos2: crystaline_cavernpos_minepos2
    area: crystaline_cavern_mine
    chunks: 5x6
    dungeon_core:
        type: dungeoncore
        pos:
            - 30|22|-34
        health: 10
        area: crystaline_cavern_mine
        somni: Crystaline_Cavern

Crystaline_Cavern_Surface_Protection:
    type: world
    debug: false
    events:
        on player breaks block in:Crystaline_Cavern_Structure:
            - if <player.gamemode> == creative:
              - stop
            - determine passively cancelled
            - narrate "<red><italic>You cannot break blocks here, go deeper down."

