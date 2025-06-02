# This file ensures that the server is saved every 5 minutes.
# It is a simple script that runs every 5 minutes and executes the command to save the server.

Server_Saver:
    type: world
    debug: false
    events:
        on delta time minutely every:5:
        - adjust server save