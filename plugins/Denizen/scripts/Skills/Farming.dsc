# This file includes all of the new crops, stage items, and logic that governs placing of item displays to represent the crops as they grow.

# First Seeded: 6/7/2024

Farming_Main_Event:
    type: world
    debug: false
    events:
        on player right clicks farmland with:item_flagged:seed:
        - define item <context.item>
        - define location <context.location>
        - define crop_location <context.location.above>
        - if <[item].flag[seed]> in <list[wheat|carrot|potato|pumpkin|melon|beetroot|sweet_berry]> && <context.location.above.material.name> == air:
          - choose <[item].flag[seed]>:
            - case wheat:
              - modifyblock <[crop_location]> wheat
            - case carrot:
              - modifyblock <[crop_location]> carrots
            - case potato:
              - modifyblock <[crop_location]> potatoes
            - case pumpkin:
              - modifyblock <[crop_location]> pumpkin_stem
            - case melon:
              - modifyblock <[crop_location]> melon_stem
            - case bamboo:
              - modifyblock <[crop_location]> bamboo_sapling
            #- case beetroot:
            - case sweet_berry:
              - modifyblock <[crop_location]> sweet_berry_bush
          - take slot:<context.hand> quantity:1
          - playsound <[crop_location]> sound:item_crop_plant sound_category:blocks
        - else if <[item].flag[seed]> in <script[Farming_Seeds].data_key[tree]> && <context.location.above[3].material.name.ends_with[leaves]>:
          - choose <[item].flag[seed]>:
            - case apple:
              - define crop apple
            - case vanilla:
              - define crop vanilla
          - modifyblock <[crop_location]> beetroots
          - playsound <[crop_location]> sound:item_crop_plant sound_category:blocks
          - spawn ITEM_DISPLAY[item=Crop_<[crop]>_0;scale=1,1,1] <[location].above[2.5].left[0.5].forward[0.5]> save:crop_entity
          - flag <[crop_location]> crop:<[crop]>
          - flag <[crop_location]> type:tree
          - flag <[crop_location]> crop_entity:<entry[crop_entity].spawned_entity>
          - take slot:<context.hand> quantity:1
        - else if <[item].flag[seed]> in <script[Farming_Seeds].data_key[ground]>:
          - choose <[item].flag[seed]>:
            - case tomato:
              - define crop tomato
            - case rice:
              - define crop rice
            - case ginger:
              - define crop ginger
            - case corn:
              - define crop corn
            - case barley:
              - define crop barley
            - case rye:
              - define crop rye
            - case chili:
              - define crop chili
          - modifyblock <[crop_location]> beetroots
          - playsound <[crop_location]> sound:item_crop_plant sound_category:blocks
          - spawn ITEM_DISPLAY[item=Crop_<[crop]>_0;scale=1,1,1] <[location].above[1.45].left[0.5].forward[0.5]> save:crop_entity
          - flag <[crop_location]> crop:<[crop]>
          - flag <[crop_location]> type:ground
          - flag <[crop_location]> crop_entity:<entry[crop_entity].spawned_entity>
          - take slot:<context.hand> quantity:1
        - else if <[item].flag[seed]> in <script[Farming_Seeds].data_key[bush]>:
          - choose <[item].flag[seed]>:
            - case strawberry:
              - define crop strawberry
            - case blackberry:
              - define crop blackberry
            - case cranberry:
              - define crop cranberry
            - case blueberry:
              - define crop blueberry
            - case gooseberry:
              - define crop gooseberry
            - case mulberry:
              - define crop mulberry
            - case raspberry:
              - define crop raspberry
          - modifyblock <[crop_location]> beetroots
          - playsound <[crop_location]> sound:item_crop_plant sound_category:blocks
          - spawn ITEM_DISPLAY[item=Crop_Bush_0;scale=1,1,1] <[location].above[1.45].left[0.5].forward[0.5]> save:crop_entity
          - flag <[crop_location]> crop:<[crop]>
          - flag <[crop_location]> type:bush
          - flag <[crop_location]> crop_entity:<entry[crop_entity].spawned_entity>
          - take slot:<context.hand> quantity:1
        - else if <[item].flag[seed]> in <script[Farming_Seeds].data_key[bark]> && <[location].above.with_yaw[<player.location.yaw.round_to_precision[90]>].forward_flat[1].material.name.starts_with[stripped]>:
          - choose <[item].flag[seed]>:
            - case cinnamon:
              - define crop cinnamon
          - modifyblock <[crop_location]> beetroots
          - playsound <[crop_location]> sound:item_crop_plant sound_category:blocks
          - spawn ITEM_DISPLAY[item=Crop_<[crop]>_0;scale=1,1,1] <[location].above[1.45].left[0.5].forward[0.5]> save:crop_entity
          - look <entry[crop_entity].spawned_entity> yaw:<player.location.yaw.round_to_precision[90]>
          - flag <[crop_location]> crop:<[crop]>
          - flag <[crop_location]> type:bark
          - flag <[crop_location]> yaw:<player.location.yaw.round_to_precision[90]>
          - flag <[crop_location]> player_position:<player.location>
          - flag <[crop_location]> crop_entity:<entry[crop_entity].spawned_entity>
          - take slot:<context.hand> quantity:1
        on player breaks beetroots location_flagged:crop bukkit_priority:HIGHEST:
        - define location <context.location>
        - define crop <[location].flag[crop]>
        - define output <script[Farming_Outputs].data_key[<[crop]>]>
        - remove <[location].flag[crop_entity]>
        - if <context.material.age> == 3:
          - drop <[output]> <context.location> quantity:1
          - if <util.random_chance[80]>:
            - drop seeds_<[crop]> <context.location> quantity:<util.random.int[1].to[2]>
        - if <context.material.age> < 3:
          - drop seeds_<[crop]> <context.location> quantity:1
        - foreach <[location].list_flags> as:flag:
          - flag <[location]> <[flag]>:!
        on beetroots grows location_flagged:crop:
        - define location <context.location>
        - define crop <[location].flag[crop]>
        - define age <context.material.age>
        - define type <[location].flag[type]>
        - if <[type]> == tree:
          - define offset 1
        - else:
          - define offset 0


        - remove <[location].flag[crop_entity]>
        - flag <[location]> crop_entity:!
        - if <[type]> == bush:
          - if <[age]> < 3:
            - spawn ITEM_DISPLAY[item=Crop_Bush_<[age]>;scale=1,1,1] <[location].above[<[offset].add[0.45]>].left[0.5].forward[0.5]> save:crop_entity
          - else:
            - spawn ITEM_DISPLAY[item=Crop_<[crop]>_<[age]>;scale=1,1,1] <[location].above[<[offset].add[0.45]>].left[0.5].forward[0.5]> save:crop_entity
        - else:
          - spawn ITEM_DISPLAY[item=Crop_<[crop]>_<[age]>;scale=1,1,1] <[location].above[<[offset].add[0.45]>].left[0.5].forward[0.5]> save:crop_entity
          - if <[type]> == bark:
            - look <entry[crop_entity].spawned_entity> yaw:<[location].flag[player_position].yaw.round_to_precision[90]>
        - flag <[location]> crop_entity:<entry[crop_entity].spawned_entity>
        on player right clicks beetroots location_flagged:crop:
        - define location <context.location>
        - define crop <[location].flag[crop]>
        - define output <script[Farming_Outputs].data_key[<[crop]>].before_last[_]>
        - define max_quantity <script[Farming_Outputs].data_key[<[crop]>].after_last[_]>
        - define type <[location].flag[type]>
        - define quantity <util.random.int[1].to[<[max_quantity]>]>
        #- narrate <[output]>
        - if <[type]> == tree:
          - define offset 1
        - else:
          - define offset 0
        - if <context.location.material.age> == 3:
          - drop item:<proc[apply_info_proc].context[<item[<[output]>]>]> <context.location> quantity:<[quantity]>
          - if <util.random_chance[80]>:
            - drop seeds_<[crop]> <context.location> quantity:<util.random.int[0].to[1]>
          - if <[type]> == bush:
            - define new_age 2
          - else:
            - define new_age 0
          - adjustblock <context.location> age:<[new_age]>
          - remove <[location].flag[crop_entity]>
          - flag <[location]> crop_entity:!
          - if <[type]> == bush:
            - spawn ITEM_DISPLAY[item=Crop_Bush_<[new_age]>;scale=1,1,1] <[location].above[<[offset].add[0.45]>].left[0.5].forward[0.5]> save:crop_entity
          - else:
            - spawn ITEM_DISPLAY[item=Crop_<[crop]>_<[new_age]>;scale=1,1,1] <[location].above[<[offset].add[0.45]>].left[0.5].forward[0.5]> save:crop_entity
            - if <[type]> == bark:
              - look <entry[crop_entity].spawned_entity> yaw:<[location].flag[player_position].yaw.round_to_precision[90]>
          - playsound <context.location> sound:block_azalea_leaves_break sound_category:blocks
          - flag <[location]> crop_entity:<entry[crop_entity].spawned_entity>

Cooking_Crop_Break:
    type: world
    debug: false
    events:
        on wheat drops wheat from breaking:
        - determine passively cancelled
        on wheat drops wheat_seeds from breaking:
        - determine passively cancelled
        after player breaks wheat bukkit_priority:HIGHEST:
        - if <context.material.age> == 7:
          - drop <proc[apply_info_proc].context[<item[new_wheat]>]> <context.location> quantity:<util.random.int[1].to[3]>
          - if <util.random_chance[80]>:
            - drop seeds_wheat <context.location> quantity:<util.random.int[1].to[3]>
        - if <context.material.age> < 7:
          - drop seeds_wheat <context.location> quantity:1
        on player right clicks wheat:
        - if <context.location.material.age> == 7:
          - drop <proc[apply_info_proc].context[<item[new_wheat]>]> <context.location> quantity:<util.random.int[1].to[3]>
          - if <util.random_chance[80]>:
            - drop seeds_wheat <context.location> quantity:<util.random.int[0].to[2]>
          - adjustblock <context.location> age:0
          - playsound <context.location> sound:block_azalea_leaves_break sound_category:blocks
        on carrots drops carrot from breaking:
        - determine passively cancelled
        after player breaks carrots bukkit_priority:HIGHEST:
        - if <context.material.age> == 7:
          - drop <proc[apply_info_proc].context[<item[new_carrot]>]> <context.location> quantity:<util.random.int[1].to[3]>
          - if <util.random_chance[80]>:
            - drop seeds_carrot <context.location> quantity:<util.random.int[1].to[3]>
        - if <context.material.age> < 7:
          - drop seeds_carrot <context.location>
        on player right clicks carrots:
        - if <context.location.material.age> == 7:
          - drop <proc[apply_info_proc].context[<item[new_carrot]>]> <context.location> quantity:<util.random.int[1].to[3]>
          - if <util.random_chance[80]>:
            - drop seeds_carrot <context.location> quantity:<util.random.int[0].to[2]>
          - adjustblock <context.location> age:0
          - playsound <context.location> sound:block_azalea_leaves_break sound_category:blocks
        on potatoes drops potato from breaking:
        - determine passively cancelled
        after player breaks potatoes bukkit_priority:HIGHEST:
        - if <context.material.age> == 7:
          - drop <proc[apply_info_proc].context[<item[new_potato]>]> <context.location> quantity:<util.random.int[1].to[3]>
          - if <util.random_chance[80]>:
            - drop seeds_potato <context.location> quantity:<util.random.int[1].to[3]>
        - if <context.material.age> < 7:
          - drop seeds_potato <context.location>
        on player right clicks potatoes:
        - if <context.location.material.age> == 7:
          - drop <proc[apply_info_proc].context[<item[new_potato]>]> <context.location> quantity:<util.random.int[1].to[3]>
          - if <util.random_chance[80]>:
            - drop seeds_potato <context.location> quantity:<util.random.int[0].to[2]>
          - adjustblock <context.location> age:0
          - playsound <context.location> sound:block_azalea_leaves_break sound_category:blocks
        on pumpkin_stem drops pumpkin_seeds from breaking:
        - determine passively cancelled
        on attached_pumpkin_stem drops pumpkin_seeds from breaking:
        - determine passively cancelled
        after player breaks pumpkin_stem bukkit_priority:HIGHEST:
        - if <context.material.age> == 7:
          - drop seeds_pumpkin <context.location> quantity:<util.random.int[1].to[3]>
        - if <context.material.age> < 7:
          - drop seeds_pumpkin <context.location>
        after player breaks attached_pumpkin_Stem bukkit_priority:HIGHEST:
        - drop seeds_pumpkin <context.location> quantity:<util.random.int[1].to[3]>
        on melon_stem drops melon_seeds from breaking:
        - determine passively cancelled
        on attached_melon_stem drops melon_seeds from breaking:
        - determine passively cancelled
        after player breaks melon_stem bukkit_priority:HIGHEST:
        - if <context.material.age> == 7:
          - drop seeds_melon <context.location> quantity:<util.random.int[1].to[3]>
        - if <context.material.age> < 7:
          - drop seeds_melon <context.location>
        after player breaks attached_melon_stem bukkit_priority:HIGHEST:
        - drop seeds_melon <context.location> quantity:<util.random.int[1].to[3]>
        on beetroots drops beetroot from breaking:
        - determine passively cancelled
        on beetroots drops beetroot_seeds from breaking:
        - determine passively cancelled
        #after player breaks beetroots bukkit_priority:HIGHEST:
        #- if <context.material.age> == 3:
        #  - drop new_beetroot <context.location> quantity:1
        #  - if <util.random_chance[80]>:
        #    - drop seeds_beetroot <context.location> quantity:<util.random.int[1].to[2]>
        #- if <context.material.age> < 3:
        #  - drop seeds_beetroot <context.location> quantity:1
        #on player right clicks beetroots:
        #- if <context.location.material.age> == 3:
        #  - drop new_beetroot <context.location> quantity:1
        #  - if <util.random_chance[80]>:
        #    - drop seeds_beetroot <context.location> quantity:<util.random.int[0].to[1]>
        #  - adjustblock <context.location> age:0
        #  - playsound <context.location> sound:block_azalea_leaves_break sound_category:blocks
        on cocoa drops cocoa_beans from breaking:
        - determine passively cancelled
        after player breaks cocoa bukkit_priority:HIGHEST:
        - if <context.material.age> == 2:
          - drop new_cocoa_beans <context.location> quantity:<util.random.int[1].to[3]>
        - if <context.material.age> < 2:
          - drop new_cocoa_beans <context.location> quantity:1
        after player breaks sweet_berry_bush bukkit_priority:HIGHEST:
        - if <context.material.age> == 3:
          - drop new_sweet_berry <context.location> quantity:<util.random.int[1].to[3]>
          - if <util.random_chance[80]>:
            - drop seeds_sweet_berry <context.location> quantity:<util.random.int[1].to[2]>
        - if <context.material.age> < 3:
          - drop seeds_sweet_berry <context.location>
        on sweet_berry_bush drops sweet_berries from breaking:
        - determine passively cancelled
        on player right clicks sweet_berry_bush:
        - determine passively cancelled
        - if <context.location.material.age> == 3:
          - drop new_sweet_berry <context.location> quantity:3
          - adjustblock <context.location> age:1
          - playsound <context.location> sound:block_sweet_berry_bush_pick_berries sound_category:blocks
        - if <context.location.material.age> == 2:
          - drop new_sweet_berry <context.location> quantity:1
          - adjustblock <context.location> age:1
          - playsound <context.location> sound:block_sweet_berry_bush_pick_berries sound_category:blocks
        - if <player.item_in_hand.material.name> == bone_meal:
          - take item:bone_meal quantity:1
          - adjustblock <context.location> age:3
          - playeffect effect:BONE_MEAL_USE at:<context.location>
          - playsound sound:BONE_MEAL_USE at:<context.location> sound_category:blocks
        on player right clicks cave_vines_plant:
        - determine passively cancelled
        - if <context.location.material.type> == berries:
          - drop new_glow_berry <context.location> quantity:1
          - adjustblock <context.location> type:normal
        - if <player.item_in_hand.material.name> == bone_meal:
          - take item:bone_meal quantity:1
          - adjustblock <context.location> type:berries
          - playeffect effect:BONE_MEAL_USE at:<context.location>
          - playsound sound:BONE_MEAL_USE at:<context.location> sound_category:blocks
        on player right clicks cave_vines:
        - determine passively cancelled
        - if <context.location.material.type> == berries:
          - drop new_glow_berry <context.location> quantity:1
          - adjustblock <context.location> type:normal
          - playsound <context.location> sound:block_cave_vines_pick_berries sound_category:blocks
        - if <player.item_in_hand.material.name> == bone_meal:
          - take item:bone_meal quantity:1
          - adjustblock <context.location> type:berries
          - playeffect effect:BONE_MEAL_USE at:<context.location>
          - playsound sound:BONE_MEAL_USE at:<context.location> sound_category:blocks
        on nether_wart drops nether_wart from breaking:
        - determine passively cancelled
        after player breaks nether_wart bukkit_priority:HIGHEST:
        - if <context.material.age> == 3:
          - drop new_netherwart <context.location> quantity:<util.random.int[1].to[3]>
        - if <context.material.age> < 3:
          - drop new_netherwart <context.location> quantity:1
        on player right clicks nether_wart:
        - if <context.location.material.age> == 3:
          - drop new_netherwart <context.location> quantity:<util.random.int[1].to[3]>
          - adjustblock <context.location> age:0
          - playsound <context.location> sound:block_azalea_leaves_break sound_category:blocks


Farming_Seeds:
    type: data
    debug: false
    vanilla:
      - wheat
      - carrot
      - potato
      - pumpkin
      - melon
      - beetroot
      - sweet_berry
    tree:
      - apple
      - vanilla
    ground:
      - tomato
      - rice
      - ginger
      - corn
      - barley
      - rye
      - chili
    bark:
      - cinnamon
    bush:
      - strawberry
      - blackberry
      - cranberry
      - blueberry
      - gooseberry
      - mulberry
      - raspberry


Farming_Outputs:
    type: data
    debug: false
    wheat: new_wheat_3
    carrot: new_carrot_3
    potato: new_potato_3
    pumpkin: new_pumpkin_1
    melon: new_melon_slice_1
    beetroot: new_beetroot_1
    sweet_berry: new_sweet_berry_3
    # Trees
    apple: new_apple_1
    vanilla: vanilla_bean_2
    # Bushes
    strawberry: strawberry_5
    blackberry: blackberry_5
    cranberry: cranberry_5
    blueberry: blueberry_5
    gooseberry: gooseberry_5
    mulberry: mulberry_5
    raspberry: raspberry_5
    # Bark
    cinnamon: cinnamon_2
    # Ground
    tomato: tomato_3
    ginger: ginger_3
    corn: corn_3
    barley: barley_bundle_3
    rye: rye_bundle_3

        #- if <player.item_in_hand.flag[seed]> == beetroot && <context.location.above.material.name> == air:
        #  - modifyblock <[crop_location]> beetroots
        #  - take iteminhand quantity:1
        #  - playsound <[crop_location]> sound:item_crop_plant sound_category:blocks

# Vanilla Seeds

Seeds_Wheat:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
        tag: seeds
    material: brick
    display name: <white>Wheat Seeds
    flags:
      seed: wheat
    mechanisms:
      custom_model_data: 1001
    lore:
    - <green>Grain - Seeds
    - <empty>
    - <gold>A bundle of seeds that produces a crop of Wheat.
Seeds_Carrot:
    type: item
    debug: false
    material: brick
    display name: <white>Carrot Seeds
    flags:
      seed: carrot
    mechanisms:
      custom_model_data: 1002
    lore:
    - <green>Vegetable - Seeds
    - <empty>
    - <gold>A bundle of seeds that produces a crop of Carrots.
Seeds_Potato:
    type: item
    debug: false
    material: brick
    display name: <white>Potato Seeds
    flags:
      seed: potato
    mechanisms:
      custom_model_data: 1003
    lore:
    - <green>Vegetable - Seeds
    - <empty>
    - <gold>A bundle of seeds that produces a crop of Potatoes.
Seeds_Pumpkin:
    type: item
    debug: false
    material: brick
    display name: <white>Pumpkin Seeds
    flags:
      seed: pumpkin
    mechanisms:
      custom_model_data: 1004
    lore:
    - <green>Vegetable - Seeds
    - <empty>
    - <gold>A bundle of seeds that produces a crop of Pumpkins.
Seeds_Melon:
    type: item
    debug: false
    material: brick
    display name: <white>Melon Seeds
    flags:
      seed: melon
    mechanisms:
      custom_model_data: 1005
    lore:
    - <green>Fruit - Seeds
    - <empty>
    - <gold>A bundle of seeds that produces a crop of Melons.
Seeds_Beetroot:
    type: item
    debug: false
    material: brick
    display name: <white>Beetroot Seeds
    flags:
      seed: beetroot
    mechanisms:
      custom_model_data: 1006
    lore:
    - <green>Vegetable - Seeds
    - <empty>
    - <gold>A bundle of seeds that produces a crop of Beetroots.
Seeds_Bamboo:
    type: item
    debug: false
    material: brick
    display name: <white>Bamboo Seeds
    flags:
      seed: bamboo
    mechanisms:
      custom_model_data: 1007
    lore:
    - <green>Vegetable - Seeds
    - <empty>
    - <gold>A bundle of shoots that sprout a bamboo sapling.
Seeds_Sweet_Berry:
    type: item
    debug: false
    material: brick
    display name: <white>Sweet Berry Seeds
    flags:
      seed: sweet_berry
    mechanisms:
      custom_model_data: 1008
    lore:
    - <green>Fruit - Seeds
    - <empty>
    - <gold>A bundle of seeds that produces a bush of Sweet Berries.
Seeds_Netherwart:
    type: item
    debug: false
    material: brick
    display name: <white>Redwart Seeds
    flags:
      seed: netherwart
    mechanisms:
      custom_model_data: 1009
    lore:
    - <green>Vegetable - Seeds
    - <empty>
    - <gold>A bundle of clippings that produces a bundle of Redwarts.

# Custom Seeds

Seeds_Apple:
    type: item
    debug: false
    material: brick
    display name: <white>Apple Seeds
    flags:
      seed: apple
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Fruit - Seeds
    - <empty>
    - <gold>A set of seeds used to grow an apple tree.

Seeds_Strawberry:
    type: item
    debug: false
    material: brick
    display name: <white>Strawberry Seeds
    flags:
      seed: strawberry
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Fruit - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a strawberry bush.

Seeds_Blackberry:
    type: item
    debug: false
    material: brick
    display name: <white>Blackberry Seeds
    flags:
      seed: blackberry
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Fruit - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a blackberry bush.

Seeds_Cranberry:
    type: item
    debug: false
    material: brick
    display name: <white>Cranberry Seeds
    flags:
      seed: cranberry
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Fruit - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a cranberry bush.

Seeds_Blueberry:
    type: item
    debug: false
    material: brick
    display name: <white>Blueberry Seeds
    flags:
      seed: blueberry
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Fruit - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a blueberry bush.

Seeds_Gooseberry:
    type: item
    debug: false
    material: brick
    display name: <white>Gooseberry Seeds
    flags:
      seed: gooseberry
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Fruit - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a gooseberry bush.

Seeds_Mulberry:
    type: item
    debug: false
    material: brick
    display name: <white>Mulberry Seeds
    flags:
      seed: mulberry
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Fruit - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a mulberry bush.

Seeds_Raspberry:
    type: item
    debug: false
    material: brick
    display name: <white>Raspberry Seeds
    flags:
      seed: raspberry
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Fruit - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a raspberry bush

Seeds_Tomato:
    type: item
    debug: false
    material: brick
    display name: <white>Tomato Seeds
    flags:
      seed: tomato
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Vegetable - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a tomato crop.

Seeds_Rice:
    type: item
    debug: false
    material: brick
    display name: <white>Rice Seeds
    flags:
      seed: rice
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Grain - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a rice crop.

Seeds_Cinnamon:
    type: item
    debug: false
    material: brick
    display name: <white>Cinnamon Seeds
    flags:
      seed: Cinnamon
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Grain - Seeds
    - <empty>
    - <gold>A grafting of Cinnamon, place on farm facing a stripped tree.

Seeds_Vanilla:
    type: item
    debug: false
    material: brick
    display name: <white>Vanilla Seeds
    flags:
      seed: Vanilla
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Grain - Seeds
    - <empty>
    - <gold>A grafting of vanilla, place on farm two blocks below a tree.

Seeds_Ginger:
    type: item
    debug: false
    material: brick
    display name: <white>Ginger Seeds
    flags:
      seed: ginger
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Grain - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a ginger crop.

Seeds_Corn:
    type: item
    debug: false
    material: brick
    display name: <white>Corn Seeds
    flags:
      seed: corn
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Grain - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a corn crop.

Seeds_Barley:
    type: item
    debug: false
    material: brick
    display name: <white>Barley Seeds
    flags:
      seed: barley
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Grain - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a barley crop.

Seeds_Rye:
    type: item
    debug: false
    material: brick
    display name: <white>Rye Seeds
    flags:
      seed: rye
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Grain - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a rye crop.

Seeds_Chili:
    type: item
    debug: false
    material: brick
    display name: <white>Chili Seeds
    flags:
      seed: chili
    mechanisms:
      custom_model_data: 1010
    lore:
    - <green>Vegetable - Seeds
    - <empty>
    - <gold>A set of seeds used to grow a chili crop.
#Crops Stages
## Players should not have access to these as these are just the display representations of the crop stages

Crop_Apple_0:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Apple Stage 0
    mechanisms:
      custom_model_data: 1001

Crop_Apple_1:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Apple Stage 1
    mechanisms:
      custom_model_data: 1002

Crop_Apple_2:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Apple Stage 2
    mechanisms:
      custom_model_data: 1003

Crop_Apple_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Apple Stage 3
    mechanisms:
      custom_model_data: 1004

Crop_Bush_0:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Bush Stage 0
    mechanisms:
      custom_model_data: 1005

Crop_Bush_1:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Bush Stage 1
    mechanisms:
      custom_model_data: 1006

Crop_Bush_2:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Bush Stage 2
    mechanisms:
      custom_model_data: 1007

Crop_Strawberry_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Strawberry Stage 3
    mechanisms:
      custom_model_data: 1008

Crop_Blackberry_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Blackberry Stage 3
    mechanisms:
      custom_model_data: 1009


Crop_Cranberry_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Cranberry Stage 3
    mechanisms:
      custom_model_data: 1010


Crop_Blueberry_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Blueberry Stage 3
    mechanisms:
      custom_model_data: 1011


Crop_Gooseberry_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Gooseberry Stage 3
    mechanisms:
      custom_model_data: 1012


Crop_Mulberry_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Mulberry Stage 3
    mechanisms:
      custom_model_data: 1013


Crop_Raspberry_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Raspberry Stage 3
    mechanisms:
      custom_model_data: 1014

Crop_Tomato_0:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Tomato Stage 0
    mechanisms:
      custom_model_data: 1015

Crop_Tomato_1:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Tomato Stage 1
    mechanisms:
      custom_model_data: 1016

Crop_Tomato_2:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Tomato Stage 2
    mechanisms:
      custom_model_data: 1017

Crop_Tomato_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Tomato Stage 3
    mechanisms:
      custom_model_data: 1018


Crop_Rice_0:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Rice Stage 0
    mechanisms:
      custom_model_data: 1019

Crop_Rice_1:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Rice Stage 1
    mechanisms:
      custom_model_data: 1020

Crop_Rice_2:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Rice Stage 2
    mechanisms:
      custom_model_data: 1021

Crop_Rice_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Rice Stage 3
    mechanisms:
      custom_model_data: 1022


Crop_Cinnamon_0:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Cinnamon Stage 0
    mechanisms:
      custom_model_data: 1023

Crop_Cinnamon_1:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Cinnamon Stage 1
    mechanisms:
      custom_model_data: 1024

Crop_Cinnamon_2:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Cinnamon Stage 2
    mechanisms:
      custom_model_data: 1025

Crop_Cinnamon_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Cinnamon Stage 3
    mechanisms:
      custom_model_data: 1026

Crop_Vanilla_0:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Vanilla Stage 0
    mechanisms:
      custom_model_data: 1027

Crop_Vanilla_1:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Vanilla Stage 1
    mechanisms:
      custom_model_data: 1028

Crop_Vanilla_2:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Vanilla Stage 2
    mechanisms:
      custom_model_data: 1029

Crop_Vanilla_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Vanilla Stage 3
    mechanisms:
      custom_model_data: 1030

Crop_Ginger_0:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Ginger Stage 0
    mechanisms:
      custom_model_data: 1031

Crop_Ginger_1:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Ginger Stage 1
    mechanisms:
      custom_model_data: 1032

Crop_Ginger_2:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Ginger Stage 2
    mechanisms:
      custom_model_data: 1033

Crop_Ginger_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Ginger Stage 3
    mechanisms:
      custom_model_data: 1034

Crop_Corn_0:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Corn Stage 0
    mechanisms:
      custom_model_data: 1035

Crop_Corn_1:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Corn Stage 1
    mechanisms:
      custom_model_data: 1036

Crop_Corn_2:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Corn Stage 2
    mechanisms:
      custom_model_data: 1037

Crop_Corn_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Corn Stage 3
    mechanisms:
      custom_model_data: 1038

Crop_Barley_0:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Barley Stage 0
    mechanisms:
      custom_model_data: 1039

Crop_Barley_1:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Barley Stage 1
    mechanisms:
      custom_model_data: 1040

Crop_Barley_2:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Barley Stage 2
    mechanisms:
      custom_model_data: 1041

Crop_Barley_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Barley Stage 3
    mechanisms:
      custom_model_data: 1042

Crop_Rye_0:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Rye Stage 0
    mechanisms:
      custom_model_data: 1043

Crop_Rye_1:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Rye Stage 1
    mechanisms:
      custom_model_data: 1044

Crop_Rye_2:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Rye Stage 2
    mechanisms:
      custom_model_data: 1045

Crop_Rye_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Rye Stage 3
    mechanisms:
      custom_model_data: 1046

Crop_Chili_0:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Chili Stage 0
    mechanisms:
      custom_model_data: 1047

Crop_Chili_1:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Chili Stage 1
    mechanisms:
      custom_model_data: 1048

Crop_Chili_2:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Chili Stage 2
    mechanisms:
      custom_model_data: 1049

Crop_Chili_3:
    type: item
    debug: false
    material: rabbit_foot
    display name: <light_purple>Chili Stage 3
    mechanisms:
      custom_model_data: 1050