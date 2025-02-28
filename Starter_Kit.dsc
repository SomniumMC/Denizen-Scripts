# This file manages what players recieve when they join the server.

Starter_Kit_Event:
    type: world
    events:
      #on player respawns elsewhere:
      #- determine spawn
      on player joins:
      - adjust <player> forget_recipe:<server.recipe_ids.filter[starts_with[denizen]]>
      - adjust <player> discover_recipe:<server.recipe_ids.filter[starts_with[denizen]]>
      - if !<player.has_flag[starter_kit]>:
        - run Kit_Task def.kit:starter_kit
        - flag <player> starter_kit:1
        #- teleport <player> spawn
      #- narrate targets:<player> "<gold>Welcome to Falsen Phantasm, this is a heavy development environment, if you have any questions on how to play use the command <element[/guide].on_hover[Click to Run This Command].on_click[/guide]>"

Kit_Task:
    type: task
    definitions: kit
    script:
    - foreach <script[<[kit]>_data].data_key[kit]> as:item:
      - define quantity <[item].after_last[-]>
      - define item_name <[item].before_last[-]>
      - define item <proc[Apply_Info_Proc].context[<item[<[item_name]>]>]>
      #- adjust def:
      - give item:<[item]> quantity:<[quantity]>


Starter_Kit_Data:
    type: data
    kit:
    - Tailored_Leather_Helmet-1
    - Tailored_Leather_Chestplate-1
    - Tailored_Leather_Leggings-1
    - Tailored_Leather_boots-1
    - Crafted_Flint_Dagger-1
    - Server_Guide-1
    - Stone_Pickaxe-1
    - Stone_Axe-1
    - Bacon_Cheeseburger-1
    - Apple_Jelly_Toast-16
    - coinpurse-1