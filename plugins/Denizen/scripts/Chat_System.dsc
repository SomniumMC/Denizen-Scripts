# This file contains the scripts and events for the server's custom chat system. This system manages chat channels and automatic formatting of player messages and actions.

# First Created: 11/7/2025

Chat_Event:
  type: world
  debug: false
  events:
    on player chats:
      - define curr_channel <player.flag[chat_channel]>
      - if <[curr_channel]> == global:
          - ~discordmessage id:mybot channel:1209227787358044170 "[OOC]|<player.name>: <context.message>"
      - determine cancelled