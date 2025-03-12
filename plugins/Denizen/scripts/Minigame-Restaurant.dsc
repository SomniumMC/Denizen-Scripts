# This file includes all the mechanics for the server Minigame which is a Restaurant business simulator. Players will take orders from NPC customers and make dishes inside a kitchen space with custom workstations for different tools.

# First Created: 11/9/2024

## Storage Module

Cooking_Storage_Event:
  type: world
  debug: false
  events:
    on player right clicks Cooking_Storage_Interaction:
    - ratelimit <player> 5t
    - define location <context.entity.flag[location]>
    - if <player.item_in_hand.material.name> == air:
      - stop
    - if <player.item_in_hand.script.name> != <[location].flag[cooking_furniture.storage.item_stored]>:
      - stop
    - define text_box <[location].flag[cooking_furniture.model.text_display]>
    - define stored:<[location].flag[cooking_furniture.storage.stored_amount]>
    - define stack_size <player.item_in_hand.quantity>
    - if !<player.has_flag[double_click_temp]>:
      #- narrate click
      - flag player double_click_temp:true expire:10t
      - take slot:hand quantity:1
      - define stored:<[stored].add[1]>
      - adjust <[text_box]> text:<[stored]>
      - flag <[location]> cooking_furniture.storage.stored_amount:<[stored]>
    - else:
      #- narrate double_click
      - flag player double_click_temp:true expire:10t
      - take slot:hand quantity:<[stack_size]>
      - define stored:<[stored].add[<[stack_size]>]>
      - adjust <[text_box]> text:<[stored]>
      - flag <[location]> cooking_furniture.storage.stored_amount:<[stored]>
    #on player damages Cooking_Storage_Interaction:
    #- narrate attack



Cooking_Storage_Display_Create:
    type: task
    debug: false
    definitions: item|location
    script:
    - define center <[location].center>
    - define player_yaw <player.eye_location.yaw.round_to_precision[90]>
    - define yaw_mod <[center].with_yaw[<proc[Restaurant_Reverse_Facer_Proc].context[<[player_yaw]>]>]>
    - spawn text_display <[yaw_mod].forward[0.51]> save:text_display
    - spawn item_display[item=air;scale=0.3,0.3,0.001] <[yaw_mod].forward[0.51].down[0.25]> save:item
    - look <entry[item].spawned_entity> yaw:<[player_yaw]>
    - spawn Cooking_Storage_Interaction <[yaw_mod].forward[0.07].down[0.45]> save:interaction
    - flag <[location]> cooking_furniture.storage.text:<entry[text_display].spawned_entity>
    - flag <[location]> cooking_furniture.storage.item_model:<entry[item].spawned_entity>
    - flag <[location]> cooking_furniture.storage.interaction:<entry[interaction].spawned_entity>
    - flag <[location]> cooking_furniture.type:storage
    - flag <entry[interaction].spawned_entity> location:<[location]>

    - adjust <entry[text_display].spawned_entity> text:0
    - flag <[location]> stored_amount:0
    - adjust <entry[item].spawned_entity> item:<[item]>
    - flag <[location]> item_stored:<[item].script.name>

Cooking_Storage_Interaction:
  type: entity
  debug: false
  entity_type: interaction
  mechanisms:
    height: 0.90
    width: 0.88

Cooking_Reverse_Facer_Proc:
  type: procedure
  debug: false
  definitions: player_yaw
  script:
  - if <[player_yaw]> == 360 || <[player_yaw]> == 0:
    - determine 180
  - else if <[player_yaw]> == 270:
    - determine 90
  - else if <[player_yaw]> == 90:
    - determine 270
  - else if <[player_yaw]> == 180:
    - determine 0

Cooking_Facer_Proc:
  type: procedure
  debug: false
  definitions: player_yaw
  script:
  - if <[player_yaw]> == 360 || <[player_yaw]> == 0:
    - determine South
  - else if <[player_yaw]> == 270:
    - determine East
  - else if <[player_yaw]> == 90:
    - determine West
  - else if <[player_yaw]> == 180:
    - determine North


Restaurant_Furniture_Event:
  type: world
  debug: false
  events:
    on player holds item item:Restaurant_Table_Kit:
    - define cuboid <cuboid[Restaurant_Dining_Floor]>
    - playeffect effect:flame at:<[cuboid].shell.parse[center]> offset:0 targets:<player> visibility:32
    on player holds item item:Restaurant_Chair_Kit:
    - define cuboid <cuboid[Restaurant_Dining_Floor]>
    - playeffect effect:flame at:<[cuboid].shell.parse[center]> offset:0 targets:<player> visibility:32
    on player right clicks block with:Restaurant_Table_Kit:
    - ratelimit <player> 5t
    - define ground_location <context.location>
    - define player_yaw <player.eye_location.yaw.round_to_precision[90]>
    - define center_table_location <[ground_location].above[1]>
    - define table_kit <context.item>
    - if <[center_table_location]> !in <cuboid[Restaurant_Dining_Floor].blocks>:
      - narrate "<red>You are out of the area where you can place tables!"
      - stop
    - define table_data <script[Restaurant_Furniture_Data].data_key[table.<[table_kit].flag[type]>.<[table_kit].flag[skin]>]>
    - choose <[table_kit].flag[type]>:
      - case 1x1:
        - spawn item_display[item=rabbit_foot[custom_model_data=<[table_data].get[model]>]] <[center_table_location].center.with_yaw[<proc[Restaurant_Reverse_Facer_Proc].context[<[player_yaw]>]>]> save:table_model
        - flag <[center_table_location]> table_model:<entry[table_model].spawned_entity>

        - define table_locations:->:<[center_table_location]>
    - foreach <[table_locations]> as:location:
      - spawn Restaurant_Table_Interaction <[location].center.below[0.5]> save:table_interaction
      - modifyblock <[location]> barrier
      - flag <[location]> table_interaction:<entry[table_interaction].spawned_entity>
      - flag <entry[table_interaction].spawned_entity> center_table_location:<[center_table_location]>
      - define interaction_list:->:<entry[table_interaction].spawned_entity>
    - flag <[center_table_location]> interaction_list:<[interaction_list]>
    - flag <[center_table_location]> table_locations:<[table_locations]>
    on player damages Restaurant_Table_Interaction:
    - ratelimit <player> 5t
    - define interaction <context.entity>
    - define center_table_location <[interaction].flag[center_table_location]>
    - if <[center_table_location].flag[total_seats]> > 0:
      - narrate "<red>Please remove all seats first!"
      - stop
    - foreach <[center_table_location].flag[table_locations]> as:location:
      - if <[location].material.name> == barrier:
        - modifyblock <[location]> air
    - remove <[center_table_location].flag[interaction_list]>
    - remove <[center_table_location].flag[table_model]>
    - foreach <[center_table_location].list_flags> as:flag:
      - flag <[center_table_location]> <[flag]>:!
    on player right clicks Restaurant_Table_Interaction:
    - ratelimit <player> 5t
    - define item <context.item>
    - define location <location[<context.entity.location.simple>]>
    - define center_table_location <context.entity.flag[center_table_location]>

    - if <player.has_flag[restaurant_selected_patron]>:
      - define patron <player.flag[restaurant_selected_patron]>
      - if <[center_table_location].flag[available_seats]> < 1 || <[center_table_location].flag[available_seats]||null> == null:
        - narrate "<Red>There are not enough seats at this table!"
        - glow <player.flag[restaurant_selected_patron]> toggle for:<player>
        - flag player restaurant_selected_patron:!
        - stop
      - else:
        #- narrate "found table"
        - run Restaurant_Patron_Seating def.patron:<[patron]> def.table:<[location]>



    - if <[item].script.name> == Restaurant_Chair_Kit:
      - narrate chair
      - define player_yaw <player.eye_location.yaw.round_to_precision[90]>
      - define direction <proc[Restaurant_Facer_Proc].context[<proc[Restaurant_Reverse_Facer_Proc].context[<[player_yaw]>]>]>
      - narrate <[direction]>
      - if <context.entity.has_flag[chair_location_<[direction]>]>:
        - narrate "<red>A chair already exists there!"
        - stop
      - define chair_kit <[item]>
      - define chair_data <script[Restaurant_Furniture_Data].data_key[chair.<[chair_kit].flag[type]>.<[chair_kit].flag[skin]>]>
      - choose <[chair_kit].flag[type]>:
        - case 1x1:
          - spawn item_display[item=rabbit_foot[custom_model_data=<[chair_data].get[model]>]] <[location].center.with_yaw[<[player_yaw]>].backward[1]> save:chair_model
          - spawn Restaurant_Chair_Interaction <[location].center.with_yaw[<[player_yaw]>].backward[1].down[0.5]> save:main_chair_interaction
          # This creates a list of seat interactions and stores it on the main seat interaction for data storage
          - define chair_interaction_list:->:<entry[main_chair_interaction].spawned_entity>
          - flag <context.entity.flag[center_table_location]> total_seats:+:1
          - flag <context.entity.flag[center_table_location]> available_seats:+:1
      - flag <entry[main_chair_interaction].spawned_entity> chair_model:<entry[chair_model].spawned_entity>
      - flag <entry[main_chair_interaction].spawned_entity> interaction_list:<[chair_interaction_list]>
      - flag <entry[main_chair_interaction].spawned_entity> attached_table:<context.entity>
      - flag <entry[main_chair_interaction].spawned_entity> direction:<[direction]>
      - flag <entry[main_chair_interaction].spawned_entity> seat_part:main
      - flag <context.entity> chair_location_<[direction]>:<[location]>
      - flag <context.entity.flag[center_table_location]> chair_list:->:<[chair_interaction_list]>
    on player right clicks Restaurant_Chair_Interaction:
    - define interaction <context.entity>
    - mount <player>|<[interaction].flag[chair_model]>
    on player damages Restaurant_Chair_Interaction:
    - ratelimit <player> 5t
    - define chair_interaction <context.entity>
    - if <[chair_interaction].flag[seat_part]> != main:
      - narrate "<red>You have to break the main seat part."
      - stop
    - define chair_interaction_list <[chair_interaction].flag[interaction_list]>
    - define chair_model <[chair_interaction].flag[chair_model]>
    - define table_interaction <[chair_interaction].flag[attached_table]>
    - define seats <[chair_interaction_list].size>
    - narrate <[chair_interaction].flag[direction]>

    - flag <[table_interaction]> chair_location_<[chair_interaction].flag[direction]>:!
    - remove <[chair_model]>
    - remove <[chair_interaction]>
    - flag <[table_interaction].flag[center_table_location]> total_seats:-:<[seats]>
    - flag <[table_interaction].flag[center_table_location]> available_seats:-:<[seats]>
    - flag <[table_interaction].flag[center_table_location]> chair_list:<-:<[chair_interaction_list]>


Restaurant_Table_Interaction:
  type: entity
  debug: false
  entity_type: interaction
  mechanisms:
    height: 1.1
    width: 1.1

Restaurant_Chair_Interaction:
  type: entity
  debug: false
  entity_type: interaction
  mechanisms:
    height: 1
    width: 0.7


Restaurant_Table_Kit:
  type: item
  material: rabbit_foot
  display name: <blue>Restaurant Table Kit
  flags:
    type: 1x1
    skin: crude
  mechanisms:
    custom_model_data: 3

Restaurant_Chair_Kit:
  type: item
  material: rabbit_foot
  display name: <blue>Restaurant Chair Kit
  flags:
    type: 1x1
    skin: crude
  mechanisms:
    custom_model_data: 2


Restaurant_Furniture_Data:
  type: data
  debug: false
  chair:
    1x1:
      crude:
        model: 2
  table:
    1x1:
      crude:
        model: 3


Restaurant_Patron_Spawn:
  type: task
  debug: false
  definitions: patron
  script:
  - spawn <[patron]> <server.flag[restaurant_patron_spawns].random>
  - flag <[patron]> stage:waiting

Restaurant_Patron_Seating:
  type: task
  debug: false
  definitions: patron|table
  script:
  - define chairs <[table].flag[chair_list]>
  - foreach <[chairs]> as:chair:
    - foreach <[chair]> as:seat:
      - define total_seats:->:<[seat]>
  - foreach <[total_seats]> as:seat:
    - if <[seat].has_flag[seated]>:
      - define total_seats:<-:<[seat]>
  - define ready_seats <[total_seats]>
  - define random_seat <[ready_seats].random>
  #- narrate "seat_found <[random_seat]>"

  - flag <[random_seat]> seated:<[patron]>
  - flag <[table]> available_seats:-:1
  - ~walk <[patron]> <[random_seat].location> lookat:<[random_seat].location.above[1]> speed:1
  - mount <[patron]>|<[random_seat].flag[chair_model]>

  - glow <player.flag[restaurant_selected_patron]> toggle for:<player>
  - flag player restaurant_selected_patron:!

Restaurant_Patron_Interact:
  type: world
  debug: false
  events:
    on player damages npc ignorecancelled:true in:restaurant_entrance:
    - define patron <context.entity>
    - if <player.has_flag[restaurant_selected_patron]>:
      - glow <player.flag[restaurant_selected_patron]> toggle for:<player>
      - flag player restaurant_selected_patron:!
      - stop
    - if <[patron].flag[stage]> == waiting:
      - flag player restaurant_selected_patron:<[patron]>
      - glow <[patron]> toggle for:<player>


Restaurant_Patron_Data:
  type: data
  debug: false
  full_list: 2|3|4|5

Restaurant_Counter_Interact_Event:
  type: world
  debug: false
  events:
    on player right clicks block location_flagged:restaurant_plate_counter:
    - ratelimit <player> 5t
    - define location <context.location>
    - define item <context.item>
    - definemap plate_list:
        slot1: <[location].flag[restaurant_plate_counter.slot1]>
        slot2: <[location].flag[restaurant_plate_counter.slot2]>
        slot3: <[location].flag[restaurant_plate_counter.slot3]>
        slot4: <[location].flag[restaurant_plate_counter.slot4]>
    #- narrate <[plate_list].get[slot1]>
    - foreach <[plate_list].keys> as:plate:
      - if <[plate_list].get[<[plate]>]> != <empty>:
        - define existing_plate_list:->:<[plate]>


    - if <[item].material.name> == air:
      - foreach <[plate_list].keys.reverse> as:slot:
        - if <[plate_list].get[<[slot]>]> != <empty>:
          - define plate_slot <[plate_list].get[<[slot]>]>
          - drop item:<[plate_slot].get[item]>
          - remove <[plate_slot].get[model]>
          - flag <[location]> restaurant_plate_counter.<[slot]>:<empty>
          - foreach stop
      - stop

    - if <[item].script.name> == Restaurant_Plate:
      - if <[existing_plate_list].size> >= 4:
        - narrate "<red>Too many plates!"
        - stop
      - foreach <[plate_list].keys> as:slot:
        - if <[plate_list].get[<[slot]>]> == <empty>:
          - choose <[slot]>:
            - case slot1:
              - define loc_mod <[location].center.above[1].backward[0.27].right[0.27]>
            - case slot2:
              - define loc_mod <[location].center.above[1].backward[0.27].left[0.27]>
            - case slot3:
              - define loc_mod <[location].center.above[1].forward[0.27].left[0.27]>
            - case slot4:
              - define loc_mod <[location].center.above[1].forward[0.27].right[0.27]>
          - adjust def:item quantity:1
          - spawn item_display[item=<[item]>] <[loc_mod]> save:empty_plate
          - flag <[location]> restaurant_plate_counter.<[slot]>.item:<[item]>
          - flag <[location]> restaurant_plate_counter.<[slot]>.model:<entry[empty_plate].spawned_entity>
          - flag <[location]> restaurant_plate_counter.<[slot]>.state:filled
          - foreach stop
    #<list[|<[location].flag[restaurant_counter.slot2]>|<[location].flag[restaurant_counter.slot3]>|<[location].flag[restaurant_counter.slot4]>]>


    #- if <[plate_list].get[1]> == <empty>


    #- define plate_list <[location].flag[plates]||null>
    #- define plate_amount <[plate_list].size||0>


    #
    #  - define selected_plate <[plate_list].get[1]>
    #  - remove <[selected_plate]>
    #  - flag <[location]> plates:<-:<[selected_plate]>
    #- if <[item].script.name> == Restaurant_Plate_Empty:
    #  - if <[plate_amount]> => 4:
    #    - narrate "<red>Too many plates!"
    #    - stop
      #- else:
      #  - choose <[plate_slot]>:
      #    - case 1:
      #      - define loc_mod <[location].center.above[1].backward[0.27].right[0.27]>
      #    - case 2:
      #      - define loc_mod <[location].center.above[1].backward[0.27].left[0.27]>
      #    - case 3:
      #      - define loc_mod <[location].center.above[1].forward[0.27].left[0.27]>
      #    - case 4:
      #      - define loc_mod <[location].center.above[1].forward[0.27].right[0.27]>
      #
      #  - spawn item_display[item=Restaurant_Plate_Empty] <[loc_mod]> save:empty_plate
      #  - flag <[location]> plates:->:<entry[empty_plate].spawned_entity>

Cooking_Kitchen_Furniture_Events:
  type: world
  debug: false
  events:
    on player places Cooking_Storage_Block:
    - ratelimit <player> 5t
    - define location <context.location>

    - define central <context.location.center.with_facing_direction>

    #- run Cooking_Storage_Display_Create def.item:<player.item_in_offhand> def.location:<[location]>
    - if <player.item_in_offhand.material.name> == air:
      - narrate "<red>You must be holding an ingredient in your offhand!"
      - determine cancelled
      - stop
    - else:
      - define item <player.item_in_offhand>
      #- define center <[location].center>
      - define player_yaw <player.eye_location.yaw.round_to_precision[90]>
      - modifyblock <[location]> cyan_stained_glass
      #- define yaw_mod <[center].with_yaw[<proc[Cooking_Reverse_Facer_Proc].context[<[player_yaw]>]>]>
      - spawn item_display[item=cooking_storage_block] <[location].center.with_pitch[90].with_yaw[<player.location.yaw.round_to_precision[90].add[180]>]> save:storage_model
      - spawn text_display <[location].center.with_yaw[<player.location.yaw.round_to_precision[90].add[180]>].forward[0.51]> save:text_display
      - spawn item_display[item=<[item]>;scale=0.3,0.3,0.001] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>].backward[0.51].down[0.25]> save:item
      ##- look <entry[item].spawned_entity> yaw:<[player_yaw]>
      - spawn Cooking_Storage_Interaction <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>].backward[0.07].down[0.45]> save:interaction
      - flag <[location]> cooking_furniture.model.text_display:<entry[text_display].spawned_entity>
      - flag <[location]> cooking_furniture.model.item_model:<entry[item].spawned_entity>
      - flag <[location]> cooking_furniture.model.storage_model:<entry[storage_model].spawned_entity>
      - flag <[location]> cooking_furniture.model.interaction:<entry[interaction].spawned_entity>
      - flag <[location]> cooking_furniture.type:storage
      - flag <entry[interaction].spawned_entity> location:<[location]>
#
      - adjust <entry[text_display].spawned_entity> text:0
      - flag <[location]> cooking_furniture.storage.stored_amount:0
      #- adjust <entry[item].spawned_entity> item:<[item]>
      - flag <[location]> cooking_furniture.storage.item_stored:<[item].script.name>
      - take item:Cooking_Storage_Block
    on player right clicks block with:Restaurant_Plate_Rack:
    - determine passively cancelled
    - define player_yaw <player.location.yaw.round_to_precision[90]>
    - define new_location <context.location.with_yaw[<[player_yaw]>].backward[1]>
    - spawn item_display[item=Restaurant_Plate_Rack] <[new_location].center.with_yaw[<[player_yaw]>]> save:plate_rack
    - spawn Restaurant_Plate_Rack_Interaction <[new_location].center.down[0.5]> save:interaction
    - flag <entry[interaction].spawned_entity> rack_model:<entry[plate_rack].spawned_entity>
    - foreach <list[slot1|slot2|slot3|slot4|slot5|slot6|slot7|slot8]> as:slot:
      - flag <entry[interaction].spawned_entity> <[slot]>:<empty>
    on player right clicks Restaurant_Plate_Rack_Interaction:
    - ratelimit <player> 5t
    - define item <context.item>
    - define plate_rack <context.entity>
    - define rack_model <[plate_rack].flag[rack_model]>
    - definemap plate_list:
        slot1: <[plate_rack].flag[slot1]>
        slot2: <[plate_rack].flag[slot2]>
        slot3: <[plate_rack].flag[slot3]>
        slot4: <[plate_rack].flag[slot4]>
        slot5: <[plate_rack].flag[slot5]>
        slot6: <[plate_rack].flag[slot6]>
        slot7: <[plate_rack].flag[slot7]>
        slot8: <[plate_rack].flag[slot8]>
    - foreach <[plate_list].keys> as:plate:
      - if <[plate_list].get[<[plate]>]> != <empty>:
        - define existing_plate_list:->:<[plate]>

    - if <[item].material.name> == air:
      - foreach <[plate_list].keys.reverse> as:slot:
        - if <[plate_list].get[<[slot]>]> != <empty>:
          - define plate_slot <[plate_list].get[<[slot]>]>
          - drop item:<[plate_slot].get[item]>
          - remove <[plate_slot].get[model]>
          - flag <[plate_rack]> <[slot]>:<empty>
          - foreach stop
      - stop

    - if <[item].script.name> == Restaurant_Plate:
      - if <[existing_plate_list].size> >= 8:
        - narrate "<red>Too many plates!"
        - stop
      - foreach <[plate_list].keys> as:slot:
        - if <[plate_list].get[<[slot]>]> == <empty>:
          - choose <[slot]>:
            - case slot1:
              - define loc_mod <[plate_rack].location.center.with_yaw[<[rack_model].location.yaw.add[90]>].down[0.095].left[0.22].forward[0.24].with_pitch[90]>
            - case slot2:
              - define loc_mod <[plate_rack].location.center.with_yaw[<[rack_model].location.yaw.add[90]>].down[0.095].left[0.22].forward[0.35].with_pitch[90]>
            - case slot3:
              - define loc_mod <[plate_rack].location.center.with_yaw[<[rack_model].location.yaw.add[90]>].down[0.095].left[0.22].forward[0.47].with_pitch[90]>
            - case slot4:
              - define loc_mod <[plate_rack].location.center.with_yaw[<[rack_model].location.yaw.add[90]>].down[0.095].left[0.22].forward[0.6].with_pitch[90]>
            - case slot5:
              - define loc_mod <[plate_rack].location.center.with_yaw[<[rack_model].location.yaw.add[90]>].down[0.095].left[0.22].forward[0.725].with_pitch[90]>
            - case slot6:
              - define loc_mod <[plate_rack].location.center.with_yaw[<[rack_model].location.yaw.add[90]>].down[0.095].left[0.22].forward[0.85].with_pitch[90]>
            - case slot7:
              - define loc_mod <[plate_rack].location.center.with_yaw[<[rack_model].location.yaw.add[90]>].down[0.095].left[0.22].forward[0.97].with_pitch[90]>
            - case slot8:
              - define loc_mod <[plate_rack].location.center.with_yaw[<[rack_model].location.yaw.add[90]>].down[0.095].left[0.22].forward[1.08].with_pitch[90]>
          - adjust def:item quantity:1
          - spawn item_display[item=Restaurant_Plate;scale=1.35,1.35,1.35] <[loc_mod]> save:empty_plate
          - flag <[plate_rack]> <[slot]>.item:Restaurant_Plate
          - flag <[plate_rack]> <[slot]>.model:<entry[empty_plate].spawned_entity>
          - flag <[plate_rack]> <[slot]>.state:filled
          - foreach stop
    on player places Cooking_Sink:
    - define location <context.location>
    - define furniture_type <context.item.flag[Cooking_furniture]>
    #- playsound <[location]> sound:block.stone.place sound_category:blocks
    - spawn item_display[item=Cooking_Sink] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:block_model
    - modifyblock <[location]> cyan_stained_glass
    - flag <[location]> cooking_furniture.model:<entry[block_model].spawned_entity>
    - flag <[location]> cooking_furniture.type:Sink
    on player places Cooking_Oven:
    - define location <context.location>
    - define furniture_type <context.item.flag[Cooking_furniture]>
    #- playsound <[location]> sound:block.stone.place sound_category:blocks
    - spawn item_display[item=Cooking_Oven] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:block_model
    - modifyblock <[location]> cyan_stained_glass
    - flag <[location]> cooking_furniture.model:<entry[block_model].spawned_entity>
    - flag <[location]> cooking_furniture.type:Oven
    on player places Cooking_Counter:
    - define location <context.location>
    - define furniture_type <context.item.flag[Cooking_furniture]>
    #- playsound <[location]> sound:block.stone.place sound_category:blocks
    - spawn item_display[item=Cooking_Counter] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:block_model
    - modifyblock <[location]> cyan_stained_glass
    - flag <[location]> cooking_furniture.model:<entry[block_model].spawned_entity>
    - flag <[location]> cooking_furniture.type:Counter
    on player places Cooking_Middle_Counter:
    - define location <context.location>
    - define furniture_type <context.item.flag[Cooking_furniture]>
    #- playsound <[location]> sound:block.stone.place sound_category:blocks
    - spawn item_display[item=Cooking_Middle_Counter] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:block_model
    - modifyblock <[location]> cyan_stained_glass
    - flag <[location]> cooking_furniture.model:<entry[block_model].spawned_entity>
    - flag <[location]> cooking_furniture.type:Middle_Counter



    on player breaks block location_flagged:cooking_furniture:
    - define location <context.location>
    - if <[location].has_flag[cooking_furniture.module]>:
      - drop item:<item[cooking_<[location].flag[cooking_furniture.module.name]>]> <[location].center>
      - remove <[location].flag[cooking_furniture.module.model]>
      - flag <[location]> cooking_furniture.module:!
    - drop item:<[location].flag[cooking_furniture.model].item> <[location].center>
    - foreach <[location].flag[cooking_furniture.model]> as:display:
      - remove <[display]>

    - if <[location].has_flag[cooking_furniture.model.storage_model]>:
      - drop item:cooking_storage_block <[location].center>
      - drop item:<[location].flag[cooking_furniture.storage].get[item_stored]> quantity:<[location].flag[cooking_furniture.storage].get[stored_amount]> <[location].center>

    - flag <[location]> cooking_furniture:!
    - if <[location].has_flag[cooking_tool]>:
      - remove <[location].flag[cooking_tool.model]>
      - drop item:<[location].flag[cooking_tool.name]> <[location].above[1].center>
      - foreach <[location].flag[cooking_tool.interaction].flag[ingredient_map]> as:ingredient_maps:
        - remove <[ingredient_maps].get[ingredient_model]>
        - remove <[ingredient_maps].get[quantity_display]>
      - remove <[location].flag[cooking_tool.interaction]>
      - flag <[location]> cooking_tool:!
    on player right clicks block location_flagged:cooking_furniture:
    - define item <context.item>
    - define location <context.location>
    - define furniture_type <[location].flag[cooking_furniture.type]>

    - if <[furniture_type]> == sink:
      - if <player.item_in_hand.material.name> == bucket:
        - take item:bucket quantity:1
        - give item:water_bucket quantity:1
      - else:
        - drop item:fresh_water <[location].above[1].center>

    - if <player.is_sneaking> && <[location].has_flag[cooking_tool]> && <[item].material.name> == air:
      - if <[location].flag[cooking_tool.interaction].flag[status]> == ready:
        - remove <[location].flag[cooking_tool.model]>
        - remove <[location].flag[cooking_tool.interaction]>
        - drop item:<[location].flag[cooking_tool.name]> <[location].above[1].center>
        - flag <[location]> cooking_tool:!
        - stop
      - else:
        - narrate "<red>Remove the ingredients first."
        - stop

    - if <[item].script.name> in <list[Bakeware|Cutting_Board|Juicer|Mortar_And_Pestle|Mixing_Bowl|Cooking_Pot|Roller|Sauce_Pan|Skillet]>:
      - define tool_name <[item].script.name>
      #- narrate <[tool_name]>

      - if <[location].has_flag[cooking_tool]>:
        - narrate "<red>This station already has a tool!"
        - stop

      - if <[furniture_type]> == oven:
        - if <[tool_name]> in <list[bakeware|cooking_pot|sauce_pan|skillet]>:
          - if <[location].flag[cooking_furniture.module.name]> == oven_burner:
            - spawn item_display[item=<[tool_name]>] <[location].above[1].center.with_yaw[<[location].flag[cooking_furniture.model].location.yaw>].above[0.07]> save:cooking_tool
          - else:
            - narrate "<red>This oven needs a <blue>Module<white><&co> <green>Oven Burner<red>!"
            - stop

      - else if <[furniture_type]> == counter:
        - if <[tool_name]> in <list[bakeware|cooking_pot|sauce_pan|skillet]>:
          - narrate "<red>This tool requires an <green>Oven<red>!"
          - stop
        - else:
          - spawn item_display[item=<[tool_name]>] <[location].above[1].center.with_yaw[<[location].flag[cooking_furniture.model].location.yaw>]> save:cooking_tool

      - flag <[location]> cooking_tool.name:<[tool_name]>
      - flag <[location]> cooking_tool.model:<entry[cooking_tool].spawned_entity>
      - spawn cooking_interact <[location].above[1].center.below[0.5]> save:interaction
      - flag <[location]> cooking_tool.interaction:<entry[interaction].spawned_entity>
      - flag <entry[interaction].spawned_entity> location:<[location].above[1]>
      - run Cooking_Tool_Setup def.interaction:<entry[interaction].spawned_entity> def.tool:<[tool_name]>
      - take item:<[item]> quantity:1
    - else if <[item].has_flag[compatible_furniture]>:
      - define furniture_module <[item].flag[compatible_furniture]>
      - if <[furniture_type]> == <[furniture_module]>:
        - choose <[furniture_type]>:
          - case oven:
            - spawn item_display[item=Cooking_Oven_Burner] <[location].above[1].center.with_yaw[<[location].flag[cooking_furniture.model].location.yaw>]> save:module_model
        - flag <[location]> cooking_furniture.module.name:<[item].flag[module_name]>
        - flag <[location]> cooking_furniture.module.model:<entry[module_model].spawned_entity>
        - take item:<[item]> quantity:1

Cooking_Storage_Block:
  type: item
  debug: false
  material: string
  display name: <gold>Cooking Storage
  mechanisms:
      components_patch:
        item_model: string:minecraft:barrel
  lore:
  - <gold>Hold Ingredient in offhand when placing to select the storage label

Restaurant_Plate_Rack_Interaction:
  type: entity
  debug: false
  entity_type: interaction
  #mechanisms:
    #mech: value

Restaurant_Plate_Rack:
  type: item
  debug: false
  material: string
  display name: <green>Plate Rack
  mechanisms:
      components_patch:
        item_model: string:furniture:plate_rack

Restaurant_Plate:
  type: item
  debug: false
  material: brick
  display name: <gray>Empty Plate
  mechanisms:
    custom_model_data: 32001

Cooking_Sink:
  type: item
  debug: false
  material: string
  display name: <green>Sink
  mechanisms:
      components_patch:
        item_model: string:furniture:sink
  flags:
    cooking_furniture: sink

Cooking_Oven:
  type: item
  debug: false
  material: string
  display name: <green>Oven
  mechanisms:
      components_patch:
        item_model: string:furniture:oven
  flags:
    cooking_furniture: oven

Cooking_Oven_Burner:
  type: item
  debug: false
  material: rabbit_foot
  display name: <green>Oven Burner
  mechanisms:
      components_patch:
        item_model: string:furniture:oven_burner
  flags:
    compatible_furniture: oven
    module_name: oven_burner

Cooking_Counter:
  type: item
  debug: false
  material: string
  display name: <green>Counter
  mechanisms:
      components_patch:
        item_model: string:furniture:counter
  flags:
    cooking_furniture: counter

Cooking_Middle_Counter:
  type: item
  debug: false
  material: string
  display name: <green>Middle Cabinet
  mechanisms:
      components_patch:
        item_model: string:furniture:middle_cabinet
  flags:
    cooking_furniture: middle_counter


Cooking_Interact:
  type: entity
  debug: false
  entity_type: interaction
  mechanisms:
    height: 0.5
    width: 0.5

Cooking_Tool_Setup:
  type: task
  debug: false
  definitions: interaction|tool
  script:
  - definemap ingredient_map:
      slot1: <empty>
      slot2: <empty>
      slot3: <empty>
      slot4: <empty>
      slot5: <empty>
      slot6: <empty>
  - flag <[interaction]> ingredient_map:<[ingredient_map]>
  - flag <[interaction]> status:ready
  - flag <[interaction]> tool:<[tool]>


Cooking_Main_Event:
  type: world
  debug: false
  events:
    on player right clicks Cooking_Interact:
    - ratelimit <player> 5t
    - determine passively cancelled
    - define item <context.item>
    - define interaction <context.entity>
    - define location <[interaction].flag[location]>
    - define ingredient_map <[interaction].flag[ingredient_map]>
    - define workstation_yaw <[location].below[1].flag[cooking_furniture.model].location.yaw>
    - definemap location_mods:
        slot1: <[location].center.with_yaw[<[workstation_yaw]>].down[0.5].backward[0.15].left[0.35]>
        slot2: <[location].center.with_yaw[<[workstation_yaw]>].down[0.5].backward[0.35].left[0.35]>
        slot3: <[location].center.with_yaw[<[workstation_yaw]>].down[0.5].backward[0.35].left[0.125]>
        slot4: <[location].center.with_yaw[<[workstation_yaw]>].down[0.5].backward[0.35].right[0.125]>
        slot5: <[location].center.with_yaw[<[workstation_yaw]>].down[0.5].backward[0.35].right[0.35]>
        slot6: <[location].center.with_yaw[<[workstation_yaw]>].down[0.5].backward[0.15].right[0.35]>

    - if <[item].material.name> != air:
      - if <[ingredient_map].get[slot6]> != <empty>:
        - if <script[<[item].script.name>].data_key[data.cooking_tag].get[type]> == ingredient || <[item].material.name> in <script[cooking_vanilla_ingredients].data_key[ingredients]>:
          - foreach <[ingredient_map]> as:data key:slot:
            - define item_name <[item].script.name.if_null[<[item].material.name>]>
            - define ingredient_list:->:<[data].get[ingredient]||null>
            - if <[data].get[ingredient]||null> == <[item_name]>:
              - run Cooking_Ingredient_Stacking def.item:<[item_name]> def.ingredient_map:<[ingredient_map]> def.interaction:<[interaction]> def.location_mods:<[location_mods]> def.slot:<[slot]>
              - foreach stop
            - else:
              - define ingredient:null
          - if <[item].script.name> !in <[ingredient_list]>:
            - narrate "<red>Tool is full!"
          - stop
        - else:
          - stop
      - else:
        - foreach <[ingredient_map]> key:slot as:data:
          - if <[data]> != <empty>:
            - foreach next
          - else:
            - define slot:<[slot]>
            - flag <[interaction]> selected_slot:<[slot]>

            - define loc_mod <[location_mods].get[<[slot]>].parsed>
            - if <script[<[item].script.name>].data_key[data.cooking_tag].get[type]> == ingredient || <[item].material.name> in <script[cooking_vanilla_ingredients].data_key[ingredients]>:
              - define item_name <[item].script.name.if_null[<[item].material.name>]>
              - if <[ingredient_map].get[slot1]> != <empty>:
                - foreach <[ingredient_map]> as:data key:slot:
                  - if <[data].get[ingredient]||null> == <[item_name]>:
                    #- narrate "<red>This item is already present."
                    - run Cooking_Ingredient_Stacking def.item:<[item_name]> def.ingredient_map:<[ingredient_map]> def.interaction:<[interaction]> def.location_mods:<[location_mods]> def.slot:<[slot]>
                    - stop
              - flag <[interaction]> ingredient_map.<[slot]>.ingredient:<[item_name]>
              - flag <[interaction]> selected_ingredient:<[item_name]> expire:5t
              - foreach stop
            - else:
              - stop
        - flag <[interaction]> status:in_use
        - spawn item_display[item=<[interaction].flag[selected_ingredient]>;scale=0.25,0.25,0.25] <[loc_mod].above[0.2].parsed> save:ingredient_display
        #- adjust <entry[ingredient_display].spawned_entity> left_rotation:<location[1,0,0].to_axis_angle_quaternion[<element[90].to_radians>]>
        - flag <[interaction]> ingredient_map.<[interaction].flag[selected_slot]>.ingredient_model:<entry[ingredient_display].spawned_entity>
        - flag <[interaction]> ingredient_map.<[interaction].flag[selected_slot]>.quantity:1
    - else if <[item].material.name> == air && <player.is_sneaking>:
      - foreach <[ingredient_map].reverse> as:data key:slot:
        - if <[data]> == <empty>:
          - foreach next
        - else:
          - remove <[interaction].flag[ingredient_map].get[<[slot]>].get[ingredient_model]>
          - if <[interaction].flag[ingredient_map].get[<[slot]>].get[quantity]||null> != null:
            - remove <[interaction].flag[ingredient_map].get[<[slot]>].get[quantity_display]>
          #- drop item:<[data].get[ingredient]> <[interaction].location> quantity:<[interaction].flag[ingredient_map].get[<[slot]>].get[quantity]||1>
          - flag <[interaction]> ingredient_map.<[slot]>:<empty>
          - if <[slot]> == slot1:
            - flag <[interaction]> status:ready
          - foreach stop
    - else if <[item].material.name> == air && !<player.is_sneaking>:
      - foreach <[ingredient_map]> as:data key:slot:
        - if <[data]> == <empty>:
          - foreach next
        - define ingredient <[data].get[ingredient]>
        - define quantity <[data].get[quantity]>
        - define total_list:->:<[ingredient]>-<[quantity]>
      - foreach <script[cooking_master_data].list_keys.exclude[type]> as:key:
        - foreach <script[cooking_master_data].data_key[<[key]>]> as:data key:recipe:
          #- narrate <[data].last>
          - if <[data].last> == <[interaction].flag[tool]>:
            - define valid_recipes:->:<map[].with[<[recipe]>].as[<[data]>].with[category].as[<[key]>]>
      #- narrate <[valid_recipes].first>
      - define ingredient_provided:<[total_list].include[<[interaction].flag[tool]>]>
      - foreach <[valid_recipes]> as:map:
        - define key <[map].keys.first>
        - define data <[map].get[<[key]>]>
        - define category <[map].get[category]>
        - if <[ingredient_provided].contains[<[data]>]>:
          #- narrate <[key]>
          - flag player cooking_recipe:->:<[category]>+<[key]> expire:5s
      - flag player cooking_workstation:<[location].below[1]> expire:5s
      - inventory open d:Cooking_Recipe_GUI
      #- narrate <player.flag[cooking_recipe]>
      #- narrate <[total_list].comma_separated>


Cooking_Ingredient_Stacking:
  type: task
  debug: false
  definitions: item|ingredient_map|interaction|location_mods|slot
  script:


        - if <[interaction].flag[ingredient_map].get[<[slot]>].get[quantity_display]||null> == null:
          - define loc_mod <[location_mods].get[<[slot]>]>
          - spawn text_display[text=<aqua>1;background_color=TRANSPARENT;scale=0.5,0.5,0.5;text_color=aqua] <[loc_mod].above[0.035].with_yaw[<[interaction].flag[location].below[1].flag[cooking_furniture.model].location.yaw.add[180]>].forward[0.15]> save:text_display
          #- adjust <entry[text_display].spawned_entity> left_rotation:<location[1,0,0].to_axis_angle_quaternion[<element[270].to_radians>]>
          - flag <[interaction]> ingredient_map.<[slot]>.quantity_display:<entry[text_display].spawned_entity>
        - flag <[interaction]> ingredient_map.<[slot]>.quantity:+:1
        - adjust <[interaction].flag[ingredient_map].get[<[slot]>].get[quantity_display]> text:<aqua><[interaction].flag[ingredient_map].get[<[slot]>].get[quantity].strip_color>

Cooking_Recipe_GUI:
  type: inventory
  debug: false
  inventory: chest
  gui: true
  procedural items:
  #- define page <player.flag[temp_inventory_page]>
  - define list <list>
  - foreach <player.flag[cooking_recipe]> as:recipe:
    - define category <[recipe].before[+]>
    - define full_item <item[<[recipe].after[+].before_last[-]>]>
    - define quantity <[recipe].after_last[-]>
    #- if <[item].before_last[-]> in <player.flag[cooking_recipes]||null>:
    #  - define constructed_item <item[CookingMissingRecipe].with_single[display=<[full_item].display>]>
    - define constructed_item <item[<[full_item].material>].with_single[display=<[full_item].display>]>
    - adjust def:constructed_item flag:recipe:<[recipe].after[+]>
    - adjust def:constructed_item flag:category:<[category]>
    - adjust def:constructed_item lore:<proc[Cooking_Lore_Proc].context[<[full_item]>|<[category]>|<[quantity]>]>
    - adjust def:constructed_item custom_model_data:<[full_item].custom_model_data>
    - adjust def:constructed_item quantity:<[quantity]>
    - define temp_list:->:<[constructed_item]>
  - determine <[temp_list]>
  slots:
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
  - [GUINULL] [] [] [] [] [] [] [] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Cooking_4_Craft:
    type: world
    debug: false
    events:
      on player clicks item in Cooking_Recipe_GUI:
      - if <context.item.script.name> !in <list[CookingButtonL|CookingNull|CookingReturn|CookingButtonR]>:
        - if <context.clicked_inventory||null> != <player.open_inventory>:
          - stop
        - define item <context.item>
        - define recipe <script[cooking_master_data].data_key[<[item].flag[category]>.<[item].flag[recipe]>]>
        #- narrate <[recipe]>
        - define recipe_amount <[recipe].size.sub[1]>
        - define tool <[recipe].last>
        - define workstation <player.flag[cooking_workstation]>
        #- narrate <[workstation]>
        #- if <[tool]> == milk:
        #  - define tool air
        #- narrate <[tool]>

        - if <[workstation].has_flag[link]>:
          #- narrate true
          - foreach <[workstation].flag[link]> as:linked:
            - if <[linked].get[type]> == sink:
              - define free_ingredients:->:fresh_water
            - if <[linked].get[type]> == storage:
              #- narrate <[linked].get[location]>
              - define stored_ingredients:->:<[linked].get[location].flag[cooking_furniture.storage.item_stored]>-<[linked].get[location].flag[cooking_furniture.storage.stored_amount]>&<[linked].get[location]>
              #<map[item=<[linked].get[location].flag[cooking_furniture_.storage.item_stored]>;amount=<[linked].get[location].flag[cooking_furniture_.storage.stored_amount]>]>
        - foreach <[recipe]> as:item:
          - if <[item].before_last[-]> in <[free_ingredients]>:
            - define recipe:<-:<[item]>
            - define recipe_amount:-:1
          - foreach <[stored_ingredients]> as:data:
            - if <[data].before_last[-]> == <[item].before_last[-]>:
              - define storage_location <[data].after[&]>
              - if <[data].after_last[-].before[&]> >= <[item].after_last[-]>:

                - define recipe:<-:<[item]>
                - define recipe_amount:-:1
                - flag <[storage_location]> cooking_furniture.storage.stored_amount:-:<[item].after_last[-]>
                - adjust <[storage_location].flag[cooking_furniture.model.text_display]> text:<[storage_location].flag[cooking_furniture.storage.stored_amount]>

        #- narrate <[stored_ingredients]>
        - foreach <[recipe]> as:item:
          - define quantity<[loop_index]> <[item].after_last[-]>
          - define ingredient<[loop_index]> <[item].before_last[-]>
        - if <[recipe].is_empty>:
          - define recipe_amount:0

        - choose <[recipe_amount]>:
          - case 0:
            - define success 1
          - case 1:
            - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]>:
              - define success 1
              - take item:<[ingredient1]> quantity:<[quantity1]>
          - case 2:
            - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <player.inventory.contains_item[<[ingredient2]>].quantity[<[quantity2]>]>:
              - define success 1
              - take item:<[ingredient1]> quantity:<[quantity1]>
              - take item:<[ingredient2]> quantity:<[quantity2]>
          - case 3:
            - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <player.inventory.contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <player.inventory.contains_item[<[ingredient3]>].quantity[<[quantity3]>]>:
              - define success 1
              - take item:<[ingredient1]> quantity:<[quantity1]>
              - take item:<[ingredient2]> quantity:<[quantity2]>
              - take item:<[ingredient3]> quantity:<[quantity3]>
          - case 4:
            - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <player.inventory.contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <player.inventory.contains_item[<[ingredient3]>].quantity[<[quantity3]>]> && <player.inventory.contains_item[<[ingredient4]>].quantity[<[quantity4]>]>:
              - define success 1
              - take item:<[ingredient1]> quantity:<[quantity1]>
              - take item:<[ingredient2]> quantity:<[quantity2]>
              - take item:<[ingredient3]> quantity:<[quantity3]>
              - take item:<[ingredient4]> quantity:<[quantity4]>
          - case 5:
            - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <player.inventory.contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <player.inventory.contains_item[<[ingredient3]>].quantity[<[quantity3]>]> && <player.inventory.contains_item[<[ingredient4]>].quantity[<[quantity4]>]> && <player.inventory.contains_item[<[ingredient5]>].quantity[<[quantity5]>]>:
              - define success 1
              - take item:<[ingredient1]> quantity:<[quantity1]>
              - take item:<[ingredient2]> quantity:<[quantity2]>
              - take item:<[ingredient3]> quantity:<[quantity3]>
              - take item:<[ingredient4]> quantity:<[quantity4]>
              - take item:<[ingredient5]> quantity:<[quantity5]>
          - case 6:
            - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <player.inventory.contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <player.inventory.contains_item[<[ingredient3]>].quantity[<[quantity3]>]> && <player.inventory.contains_item[<[ingredient4]>].quantity[<[quantity4]>]> && <player.inventory.contains_item[<[ingredient5]>].quantity[<[quantity5]>]> && <player.inventory.contains_item[<[ingredient6]>].quantity[<[quantity6]>]>:
              - define success 1
              - take item:<[ingredient1]> quantity:<[quantity1]>
              - take item:<[ingredient2]> quantity:<[quantity2]>
              - take item:<[ingredient3]> quantity:<[quantity3]>
              - take item:<[ingredient4]> quantity:<[quantity4]>
              - take item:<[ingredient5]> quantity:<[quantity5]>
              - take item:<[ingredient6]> quantity:<[quantity6]>
        - if <[success]||0> == 1:
          - define cooked_item <item[<[item].flag[recipe].before_last[-]>]>
          - adjust def:cooked_item lore:<proc[Cooking_Lore_Proc].context[<[cooked_item]>]>
          - give item:<[cooked_item]> quantity:<[item].flag[recipe].after_last[-]>
          - if <[tool]> in <list[milk_bucket|water_bucket]>:
            - give item:bucket
          - else if <[tool]> == stick:
            - take item:stick

Cooking_Link_Tool:
  type: item
  material: brick
  display name: <element[Cooking Link Tool].color[#ff9838]>
  lore:
  - <green>Selected<&sp>Link<White><&co><&sp><blue>Empty
  mechanisms:
    components_patch:
      item_model: string:cooking:tools/link_tool

Cooking_Link_Event:
  type: world
  debug: false
  events:
    on player left clicks block with:Cooking_Link_Tool:
    - determine passively cancelled
    - define location <context.location>
    - define linker <context.item>
    - if <player.is_sneaking> && <[linker].has_flag[pos1]>:
      - narrate "<red>Unlinked Tool"
      - inventory adjust slot:hand lore:<green>Selected<&sp>Link<White><&co><&sp><blue>Empty destination:<player.inventory>
      - inventory adjust slot:hand flag:pos1:! destination:<player.inventory>
      - stop
    - if <[location].has_flag[cooking_furniture]>:
      - define furniture_type <[location].flag[cooking_furniture].get[type]>
      - if <[furniture_type]> == oven || <[furniture_type]> == counter:
        - inventory adjust slot:hand flag:pos1:<[location]> destination:<player.inventory>
        - narrate "<blue>Workstation Selected"
        - inventory adjust slot:hand lore:<green>Selected<&sp>Link<White><&co><&sp><blue><[furniture_type].to_titlecase> destination:<player.inventory>
    on player right clicks block with:Cooking_Link_Tool:
    - determine passively cancelled
    - define location <context.location>
    - define linker <context.item>
    - if <[linker].has_flag[pos1]>:
      - define link_location <[linker].flag[pos1]>
    - if <player.is_sneaking> && <[link_location]||null> != null && <[location].flag[cooking_furniture.type]> in <list[sink|storage]>:
      - if <[location].has_flag[cooking_furniture]>:
        - if <map[type=<[location].flag[cooking_furniture.type]>;location=<[location]>]> in <[link_location].flag[link]>:
          - narrate "<red>Unlinked <blue><[location].flag[cooking_furniture.type].to_titlecase>"
          - flag <[link_location]> link:<-:<map[type=<[location].flag[cooking_furniture.type]>;location=<[location]>]>
      - if <[link_location].flag[link].is_empty>:
        - flag <[link_location]> link:!
      - stop
    - if <[location].has_flag[cooking_furniture]> && <[location].flag[cooking_furniture.type]> in <list[sink|storage]> && <[link_location]||null> != null:
      - if <map[type=<[location].flag[cooking_furniture.type]>;location=<[location]>]> !in <[link_location].flag[link]>:
        - define furniture_type <[location].flag[cooking_furniture.type]>
        - narrate "<green>Linked <blue><[location].flag[cooking_furniture.type].to_titlecase>"
        - flag <[link_location]> link:->:<map[type=<[furniture_type]>;location=<[location]>]>
      #- flag <[link_location]> link_amount:++: