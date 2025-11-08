# This file contains the scripts and events for the server's custom chat system. This system manages chat channels and automatic formatting of player messages and actions.

# First Created: 11/7/2025

Chat_Event:
  type: world
  debug: false
  events:
    on player chats:
        - determine passively cancelled
        - define curr_channel <player.flag[chat_channel].if_null[null]>
        - if <[curr_channel]> == null:
            - flag <player> chat_channel:global
            - define curr_channel global
        - define player <player>
        - define character_name <player.flag[character.rpc.name].if_null[<red>Character Name Missing]>
        - choose <[curr_channel]>:
            - case global:
                - ~discordmessage id:mybot channel:1209227787358044170 "[OOC]|<[character_name]>/<player.name>: <context.message>"
                - narrate "<red>[Global]|<white><[character_name]>/<player.name><bold>: <white><context.message>" targets:<server.online_players>
            - case local:
                - narrate "<gray>[Local]|<white><[character_name]><bold>: <white><context.message>" targets:<player.location.find_players_within[50]>