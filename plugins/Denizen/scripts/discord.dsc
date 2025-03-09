#Discord Bot handler. 
connect_to_discord:
    type: world
    events:
        after server start:
        - ~discordconnect id:mybot tokenfile:data/discord.dat
        - ~discordmessage id:mybot channel:1209227787358044170 "The main server has started!"
        on player joins:
        - ~discordmessage id:mybot channel:1209227787358044170 "<player.name> has joined the main server!"
        on player quits:
        - ~discordmessage id:mybot channel:1209227787358044170 "<player.name> has left the main server!"
        after player chats:
        - ~discordmessage id:mybot channel:1209227787358044170 "[OOC]|<player.name>: <context.message>"