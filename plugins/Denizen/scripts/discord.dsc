#Discord Bot handler.
connect_to_discord:
    type: world
    debug: false
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

discord_command:
    type: command
    name: discord
    description: Posts the discord link to the chat.
    usage: /discord
    script:
    - narrate "<gold>Join our discord! <blue>Link: <reset><element[https://discord.gg/QX2zHyNaMs]>"

dynmap_command:
    type: command
    name: map
    description: Posts the dynmap link to the chat.
    usage: /map
    script:
    - narrate "<gold>View the dynmap! <blue>Link: <reset><element[https://dynmap.somniummc.com]>"
