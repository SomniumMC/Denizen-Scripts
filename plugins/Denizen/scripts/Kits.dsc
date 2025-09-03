# This file manages what players recieve when they join the server.

Starter_Kit_Event:
    type: world
    debug: false
    events:
      #on player respawns elsewhere:
      #- determine spawn
      on player joins:
      - adjust <player> forget_recipe:<server.recipe_ids.filter[starts_with[denizen]]>
      - adjust <player> discover_recipe:<server.recipe_ids.filter[starts_with[denizen]]>
      - if !<player.has_flag[starter_kit]>:
        - run Kit_Task def.kit:Alpha_Kit
        - flag <player> starter_kit:true
        #- teleport <player> spawn
      #- narrate targets:<player> "<gold>Welcome to Falsen Phantasm, this is a heavy development environment, if you have any questions on how to play use the command <element[/guide].on_hover[Click to Run This Command].on_click[/guide]>"

Kit_Task:
    type: task
    debug: false
    definitions: kit
    script:
    - foreach <script[<[kit]>_data].data_key[kit]> as:item:
      - define quantity <[item].after_last[-]>
      - define item_name <[item].before_last[-]>
      - define item <proc[Apply_Info_Proc].context[<item[<[item_name]>]>]>
      #- adjust def:
      - give item:<[item]> quantity:<[quantity]>


PreAlpha_Kit_Data:
    type: data
    debug: false
    kit:
    - Tailored_Leather_Helmet-1
    - Tailored_Leather_Chestplate-1
    - Tailored_Leather_Leggings-1
    - Tailored_Leather_boots-1
    - Crafted_Flint_Dagger-1
    #- Server_Guide-1
    - Stone_Pickaxe-1
    - Stone_Axe-1
    - Bacon_Cheeseburger-1
    - Apple_Jelly_Toast-16
    - basic_lock-1
    - fish_crab-1
    - currency1-32
    - PreAlpha_Glasses-1

Alpha_Kit_Data:
    type: data
    debug: false
    kit:
    - Tailored_Leather_Chestplate-1
    - Tailored_Leather_Leggings-1
    - Tailored_Leather_Boots-1
    - Crafted_Flint_Dagger-1
    - Stone_Pickaxe-1
    - Stone_Axe-1
    - Bacon_Cheeseburger-2
    - Apple_Jelly_Toast-16
    - basic_lock-1
    - fish_crab-1
    - currency1-32
    - coinpurse-1
    - blue_bed-1

IronSet_Kit_Data:
    type: data
    debug: false
    kit:
    - IronSet_Helmet-1
    - IronSet_Chestplate-1
    - IronSet_Leggings-1
    - IronSet_Boots-1

RangedSet_Kit_Data:
    type: data
    debug: false
    kit:
    - Crossbow-1
    - Arrow-64

CraftingSet_Kit_Data:
    type: data
    debug: false
    kit:
    - Furnace-4
    - Anvil-1
    - StoneCutter-1
    - Crafting_Workbench-1
    - Crafting_Carpentry_Bench-1
    - Config_Wrench-1

BuildingSet_Kit_Data:
    type: data
    debug: false
    kit:
    - Oak_Log-64
    - StoneCutter-1
    - iron_axe-1
    - iron_pickaxe-1
    - stone_brick-256

## Kit Items

# Iron Set
IronSet_Helmet:
    type: item
    debug: false
    material: iron_helmet
    mechanisms:
      unbreakable: true
      components_patch:
        equippable: <map[slot=string:head]>
        item_model: string:custom_armor:bear_hat
    display name: <gold>Alpharien Helmet
    flags:
      lore: <gray>Armor said to be<n><gray>from the earliest<n><gray>days, Its sturdy.
      durability1: 250

IronSet_Chestplate:
    type: item
    debug: false
    material: iron_chestplate
    mechanisms:
      unbreakable: true
    display name: <gold>Alpharien Chestplate
    flags:
      lore: <gray>Armor said to be<n><gray>from the earliest<n><gray>days, Its sturdy.
      durability1: 250

IronSet_Leggings:
    type: item
    debug: false
    material: iron_leggings
    mechanisms:
      unbreakable: true
    display name: <gold>Alpharien Leggings
    flags:
      lore: <gray>Armor said to be<n><gray>from the earliest<n><gray>days, Its sturdy.
      durability1: 250

IronSet_Boots:
    type: item
    debug: false
    material: iron_boots
    mechanisms:
      unbreakable: true
    display name: <gold>Alpharien Boots
    flags:
      lore: <gray>Armor said to be<n><gray>from the earliest<n><gray>days, Its sturdy.
      durability1: 250