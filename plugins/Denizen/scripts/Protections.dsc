# This script is used to protect certain entities from being interacted with in survival mode on Satus.

# First Protected: 03/04/2025

protections_script:
    type: world
    debug: false
    events:
        on player right clicks item_frame:
        - if <context.entity.location.world.name> == world:
          - if <player.gamemode> == survival:
            - determine cancelled
        on player damages item_frame:
        - if <context.entity.location.world.name> == world:
          - if <player.gamemode> == survival:
            - determine cancelled

        on player right clicks armor_stand:
        - if <context.entity.location.world.name> == world:
          - if <player.gamemode> == survival:
            - determine cancelled
        on player damages armor_stand:
        - if <context.entity.location.world.name> == world:
          - if <player.gamemode> == survival:
            - determine cancelled

        on player right clicks bookshelf:
        - if <context.entity.location.world.name> == world:
          - if <player.gamemode> == survival:
            - determine cancelled
        on player right clicks lectern:
        - if <context.entity.location.world.name> == world:
            - if <player.gamemode> == survival:
              - determine cancelled