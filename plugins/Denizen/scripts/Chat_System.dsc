# This file contains the scripts and events for the server's custom chat system. This system manages chat channels and automatic formatting of player messages and actions.

# First Created: 11/7/2025

Chat_Event:
  type: world
  debug: false
  events:
    on player chats:
      - determine passively cancelled
      - define curr_channel <player.flag[chat_channel]>
      - choose <[curr_channel]>:
        - case global:
          - ~discordmessage id:mybot channel:1209227787358044170 "[OOC]|<player.name>: <context.message>"
        - case local:
          - define player <player>
          - define character_name <player.flag[character.rpc.name]>
          - narrate "<gray>[Local]|<[character_name]>: <context.message>" targets:<player.location.find_players_within[50]>