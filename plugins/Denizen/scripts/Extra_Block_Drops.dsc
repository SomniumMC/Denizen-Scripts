# This file includes the extra block drops that serve crafting systems

# First Dropped: 6/18/2024

Grass_Drop:
    type: world
    events:
        after player breaks short_grass:
        - if <util.random_chance[45]>:
          - drop <context.location> item:Grass_Fiber quantity:1
        on player breaks clay bukkit_priority:HIGHEST:
        - if <util.random_chance[70]>:
          - drop cooking_salt <context.location> quantity:<util.random.int[1].to[4]>