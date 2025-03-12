# This is a recode of our furniture system which can be found in Archives/Furniture
# It will work by players will have a Assembly Kit which then places into the desired furniture entity

# First Reformatted 3/12/2025

Furniture_Main_Event:
    type: world
    debug: true
    events:
        on player places Furniture_Kit_1x1_Table:
        - ratelimit <player> 5t
        - define location <context.location>
        - define item <context.item_in_hand>
        - run Assemble_1x1_Table def.location:<[location]> def.item:<[item]>
        on player places Furniture_Kit_1x1_Chair:
        - ratelimit <player> 5t
        - define location <context.location>
        - define item <context.item_in_hand>
        - run Assemble_1x1_Chair def.location:<[location]> def.item:<[item]>
        on player places Furniture_Kit_1x2_Table:
        - ratelimit <player> 5t
        - define location <context.location>
        - define item <context.item_in_hand>
        - define right_block <[location].with_yaw[<player.location.yaw.round_to_precision[90].add[90]>].forward_flat[1]>
        - define block_list <list[<[location]>|<[right_block]>]>
        - foreach <[block_list]> as:block:
          - if <[block].material.name> !in <list[air|tripwire]>:
            - narrate "<red>Area blocked!"
            - determine cancelled
        - run Assemble_1x2_Table def.location:<[location]> def.block_list:<[block_list]> def.item:<[item]>
        on player places Furniture_Kit_1x3_Table:
        - ratelimit <player> 5t
        - define location <context.location>
        - define item <context.item_in_hand>
        - define right_block <[location].with_yaw[<player.location.yaw.round_to_precision[90].add[90]>].forward_flat[1]>
        - define left_block <[location].with_yaw[<player.location.yaw.round_to_precision[90].add[90]>].backward_flat[1]>
        - define block_list <list[<[location]>|<[right_block]>]>
        - foreach <[block_list]> as:block:
          - if <[block].material.name> !in <list[air|tripwire]>:
            - narrate "<red>Area blocked!"
            - determine cancelled
        - run Assemble_1x3_Table def.block_list:<[block_list]> def.item:<[item]>
        on player places Furniture_Kit_2x2_Table:
        - ratelimit <player> 5t
        - define location <context.location>
        - define item <context.item_in_hand>
        - define right_block <[location].with_yaw[<player.location.yaw.round_to_precision[90].add[90]>].forward_flat[1]>
        - define backward_block <[location].with_yaw[<player.location.yaw.round_to_precision[90]>].backward_flat[1]>
        - define backward_right_block <[location].with_yaw[<player.location.yaw.round_to_precision[90]>].backward_flat[1].right[1]>
        - define block_list <list[<[location]>|<[right_block]>|<[backward_block]>|<[backward_right_block]>]>
        - foreach <[block_list]> as:block:
          - if <[block].material.name> !in <list[air|tripwire]>:
            - narrate "<red>Area blocked!"
            - determine cancelled
        - run Assemble_2x2_Table def.block_list:<[block_list]> def.item:<[item]>
        on player breaks block location_flagged:furniture_interaction:
        - define interaction <context.location.flag[furniture_interaction]>
        - run Furniture_Cleanup def:<[interaction]>

Assemble_1x1_Table:
    type: task
    debug: false
    definitions: location|item
    script:
    - adjust def:item quantity:1
    - spawn item_display[item=<[item].flag[skin].if_null[furniture_crude_table]>] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:furniture_entity
    - modifyblock <[location]> cyan_stained_glass
    - spawn Furniture_Interaction <[location].center.below[0.5]> save:interaction_entity
    - define interaction <entry[interaction_entity].spawned_entity>
    - flag <[interaction]> furniture.furniture_model:<entry[furniture_entity].spawned_entity>
    - flag <[interaction]> furniture.item:<[item]>
    - flag <[interaction]> furniture.blocks:->:<[location]>
    - flag <[interaction]> furniture.type:1x1_Table
    - flag <[location]> furniture_interaction:<entry[interaction_entity].spawned_entity>

    - take item:<[item]> quantity:1

Assemble_1x1_Chair:
    type: task
    debug: false
    definitions: location|item
    script:
    - adjust def:item quantity:1
    - spawn item_display[item=<[item].flag[skin].if_null[furniture_crude_chair]>] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:furniture_entity
    - spawn Furniture_Interaction <[location].center.below[0.5]> save:interaction_entity
    - define interaction <entry[interaction_entity].spawned_entity>
    - flag <[interaction]> furniture.furniture_model:<entry[furniture_entity].spawned_entity>
    - flag <[interaction]> furniture.item:<[item]>
    #- flag <[interaction]> furniture.blocks:->:<[location]>
    - flag <[interaction]> furniture.type:1x1_Chair
    #- flag <[location]> furniture_interaction:<entry[interaction_entity].spawned_entity>

    - take item:<[item]> quantity:1

Assemble_1x2_Table:
    type: task
    debug: false
    definitions: location|item|block_list
    script:
    - adjust def:item quantity:1


    - spawn item_display[item=<[item].flag[skin].if_null[furniture_1x2_crude_table]>] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:furniture_entity
    - modifyblock <[block_list]> cyan_stained_glass
    - spawn Furniture_Interaction <[location].center.below[0.5]> save:interaction_entity
    - define interaction <entry[interaction_entity].spawned_entity>
    - flag <[interaction]> furniture.furniture_model:<entry[furniture_entity].spawned_entity>
    - flag <[interaction]> furniture.item:<[item]>
    - flag <[interaction]> furniture.blocks:->:<[block_list]>
    - flag <[interaction]> furniture.type:1x2_Table
    - foreach <[block_list]> as:block:
      - flag <[block]> furniture_interaction:<entry[interaction_entity].spawned_entity>

    - take item:<[item]> quantity:1

Assemble_1x3_Table:
    type: task
    debug: false
    definitions: location|item|block_list
    script:
    - adjust def:item quantity:1
    - spawn item_display[item=<[item].flag[skin].if_null[furniture_1x3_crude_table]>] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:furniture_entity
    - modifyblock <[block_list]> cyan_stained_glass
    - spawn Furniture_Interaction <[location].center.below[0.5]> save:interaction_entity
    - define interaction <entry[interaction_entity].spawned_entity>
    - flag <[interaction]> furniture.furniture_model:<entry[furniture_entity].spawned_entity>
    - flag <[interaction]> furniture.item:<[item]>
    - flag <[interaction]> furniture.blocks:->:<[block_list]>
    - flag <[interaction]> furniture.type:1x3_Table
    - foreach <[block_list]> as:block:
      - flag <[block]> furniture_interaction:<entry[interaction_entity].spawned_entity>

    - take item:<[item]> quantity:1

Assemble_2x2_Table:
    type: task
    debug: false
    definitions: location|item|block_list
    script:
    - adjust def:item quantity:1
    - spawn item_display[item=<[item].flag[skin].if_null[furniture_2x2_crude_table]>] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:furniture_entity
    - modifyblock <[block_list]> cyan_stained_glass
    - spawn Furniture_Interaction <[location].center.below[0.5]> save:interaction_entity
    - define interaction <entry[interaction_entity].spawned_entity>
    - flag <[interaction]> furniture.furniture_model:<entry[furniture_entity].spawned_entity>
    - flag <[interaction]> furniture.item:<[item]>
    - flag <[interaction]> furniture.blocks:->:<[block_list]>
    - flag <[interaction]> furniture.type:2x2_Table
    - foreach <[block_list]> as:block:
      - flag <[block]> furniture_interaction:<entry[interaction_entity].spawned_entity>

    - take item:<[item]> quantity:1

Furniture_Cleanup:
    type: task
    debug: false
    definitions: interaction
    script:
    - define block_list <[interaction].flag[blocks]>
    - foreach <[block_list]> as:block:
      - modifyblock <[block]> air
      - flag <[block]> furniture_interaction:!
    - remove <[interaction]>

Furniture_Interaction:
  type: entity
  debug: false
  entity_type: interaction
  flags:
    health: 5
  mechanisms:
    height: 1
    width: 1.05

Furniture_Kit_1x1_Table:
    type: item
    debug: false
    data:
      assembles: 1x1_Table
    material: string
    display name: <white>1x1 Table Kit
    mechanisms:
      components_patch:
        item_model: string:furniture:crude_table
    lore:
    - <gray>Place this kit on the ground to assemble a 1x1 table.
    - <gray>Take to a Assembly Station to give a skin.
    flags:
      furniture_type: table
      furniture_size: 1x1

Furniture_Kit_1x1_Chair:
    type: item
    debug: false
    data:
      assembles: 1x1_Chair
    material: string
    display name: <white>1x1 Chair Kit
    lore:
    - <gray>Place this kit on the ground to assemble a 1x1 chair.
    - <gray>Take to a Assembly Station to give a skin.
    flags:
      furniture_type: chair
      furniture_size: 1x1

Furniture_Kit_1x2_Table:
    type: item
    debug: false
    data:
      assembles: 1x2_Table
    material: string
    display name: <white>1x2 Table Kit
    lore:
    - <gray>Place this kit on the ground to assemble a 1x2 table.
    - <gray>Take to a Assembly Station to give a skin.
    flags:
      furniture_type: table
      furniture_size: 1x2

Furniture_Kit_1x3_Table:
    type: item
    debug: false
    data:
      assembles: 1x3_Table
    material: string
    display name: <white>1x3 Table Kit
    lore:
    - <gray>Place this kit on the ground to assemble a 1x3 table.
    - <gray>Take to a Assembly Station to give a skin.
    flags:
      furniture_type: table
      furniture_size: 1x3

Furniture_Kit_2x2_Table:
    type: item
    debug: false
    data:
      assembles: 2x2_Table
    material: string
    display name: <white>2x2 Table Kit
    lore:
    - <gray>Place this kit on the ground to assemble a 2x2 table.
    - <gray>Take to a Assembly Station to give a skin.
    flags:
      furniture_type: table
      furniture_size: 2x2

Furniture_Crude_Chair:
    type: item
    debug: false
    material: string
    display name: <yellow>Assembly Kit<&co> <blue>Crude Chair
    mechanisms:
      components_patch:
        item_model: string:furniture:crude_chair
    lore:
    - <red>This is the default model of 1x1 Chair

Furniture_Crude_Table:
    type: item
    debug: false
    material: string
    display name: <yellow>Assembly Kit<&co> <blue>Crude Table
    mechanisms:
      components_patch:
        item_model: string:furniture:crude_table
    lore:
    - <red>This is the default model of 1x1 Table


Furniture_1x2_Crude_Table:
    type: item
    debug: false
    material: string
    display name: <yellow>Assembly Kit<&co> <blue>1x2 Crude Table
    mechanisms:
      components_patch:
        item_model: string:furniture:1x2_crude_table
    lore:
    - <red>This is the default model of 1x2 Table

Furniture_1x3_Crude_Table:
    type: item
    debug: false
    material: string
    display name: <yellow>Assembly Kit<&co> <blue>1x3 Crude Table
    mechanisms:
      components_patch:
        item_model: string:furniture:1x3_crude_table
    lore:
    - <red>This is the default model of 1x3 Table

Furniture_2x2_Crude_Table:
    type: item
    debug: false
    material: string
    display name: <yellow>Assembly Kit<&co> <blue>2x2 Crude Table
    mechanisms:
      components_patch:
        item_model: string:furniture:2x2_crude_table
    lore:
    - <red>This is the default model of 2x2 Table

Furniture_Runestone_Inscriber:
    type: item
    debug: false
    material: string
    display name: <yellow>Assembly Kit<&co> <blue>Runestone Inscriber
    mechanisms:
      components_patch:
        item_model: string:furniture:runestone_inscriber

Furniture_Display_Stand:
    type: item
    debug: false
    material: string
    display name: <yellow>Assembly Kit<&co> <blue>Display Stand
    mechanisms:
      components_patch:
        item_model: string:furniture:display_stand