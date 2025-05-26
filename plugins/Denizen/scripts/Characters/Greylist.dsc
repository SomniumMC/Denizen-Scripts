# This file contains the Greylist system for the server. It is used to track players who are on the greylist and their associated data.
# If a player is not on the greylist, they will not be able to access certain features or areas of the server.
# To get onto the greylist, the player must create a character and be accepted by the server staff.

# Created: 4/27/2025

Greylist_Blocker:
    type: world
    events:
        on player exits satus:
        - define status:<player.flag[character.rpc.status].if_null[null]>
        - if <[status]> == null:
            - narrate targets:<player> "<red><bold>You must create a character before you can leave Satus!"
            - teleport <player> greylist_tele
            - flag <player> rpc_viewing:<player>
            - inventory open d:Character_RPC_Menu
        - if <[status]> in <list[info_needed|denied]>:
            - narrate targets:<player> "<red><bold>You must make a ticket to resubmit your character application!"
            - teleport <player> greylist_tele
        - if <[status]> == submitted:
            - narrate targets:<player> "<red><bold>Your character is still under review, please wait for staff to review your application!"
            - teleport <player> greylist_tele
        on player right clicks npc priority:-20:
        - if <context.entity.id> == 43:
            - if <player.has_flag[greylist_temp_flag]>:
                - determine cancelled
            - define status:<player.flag[character.rpc.status].if_null[null]>
            - if <[status]> == null:
                - narrate targets:<player> "<red><bold>You must create a character before you can leave Satus!"
                #- teleport <player> greylist_tele
                - flag <player> greylist_temp_Flag expire:5s
                - flag <player> rpc_viewing:<player>
                - inventory open d:Character_RPC_Menu
                - determine cancelled
            - if <[status]> in <list[info_needed|denied]>:
                - narrate targets:<player> "<red><bold>You must make a ticket to resubmit your character application!"
                #- teleport <player> greylist_tele
                - flag <player> greylist_temp_Flag expire:5s
                - determine cancelled
            - if <[status]> == submitted:
                - narrate targets:<player> "<red><bold>Your character is still under review, please wait for staff to review your application!"
                #- teleport <player> greylist_tele
                - flag <player> greylist_temp_Flag expire:5s
                - determine cancelled
