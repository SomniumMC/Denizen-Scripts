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
        - run Assemble_1x3_Table def.location:<[location]> def.block_list:<[block_list]> def.item:<[item]>
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
        - run Assemble_2x2_Table def.location:<[location]> def.block_list:<[block_list]> def.item:<[item]>
        on player places Furniture_Kit_Decoration:
        - ratelimit <player> 5t
        - define location <context.location>
        - define item <context.item_in_hand>
        - run Assemble_Decoration def.location:<[location]> def.item:<[item]>
        on player breaks block location_flagged:furniture_interaction:
        - define interaction <context.location.flag[furniture_interaction]>
        - if <[interaction].has_flag[furniture.invincible]>:
          - determine cancelled
        - run Furniture_Cleanup def:<[interaction]>
        on player damages Furniture_Interaction:
        - define interaction <context.entity>
        - define health <[interaction].flag[health]||5>
        - if <[interaction].flag[furniture.invincible]||false>:
          - stop
        - if <[health].sub[<context.damage>]> <= 0:
          - playsound sound:entity.zombie.break.wooden_door sound_category:blocks <[interaction].location>
          - run Furniture_Cleanup def:<[interaction]>
        - else:
          - define newhealth <[health].sub[1]>
          - flag <[interaction]> health:<[newhealth]>
          - playsound sound:block.wood.hit sound_category:blocks <[interaction].location>
        on player right clicks Furniture_Interaction:
        - define interaction <context.entity>
        - if !<player.item_in_hand.has_flag[furniture_config]>:
          - if <[interaction].flag[furniture.type]> == 1x1_chair:
            - mount <player>|<[interaction].flag[furniture.furniture_model]>

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

Assemble_1x1_Chair:
    type: task
    debug: false
    definitions: location|item
    script:
    - adjust def:item quantity:1
    - spawn item_display[item=<[item].flag[skin].if_null[furniture_crude_chair]>] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:furniture_entity
    - modifyblock <[location]> air
    - spawn Furniture_Interaction[height=0.7;width=0.7] <[location].center.below[0.5]> save:interaction_entity
    - define interaction <entry[interaction_entity].spawned_entity>
    - flag <[interaction]> furniture.furniture_model:<entry[furniture_entity].spawned_entity>
    - flag <[interaction]> furniture.item:<[item]>
    #- flag <[interaction]> furniture.blocks:->:<[location]>
    - flag <[interaction]> furniture.type:1x1_Chair
    - flag <[interaction]> furniture.blocks:<[location]>
    #- flag <[location]> furniture_interaction:<entry[interaction_entity].spawned_entity>

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

Assemble_2x2_Table:
    type: task
    debug: false
    definitions: location|item|block_list
    script:
    - adjust def:item quantity:1
    - spawn item_display[item=<[item].flag[skin].if_null[Furniture_2x2_Crude_Table]>] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:furniture_entity
    - modifyblock <[block_list]> cyan_stained_glass
    - spawn Furniture_Interaction <[location].center.below[0.5]> save:interaction_entity
    - define interaction <entry[interaction_entity].spawned_entity>
    - flag <[interaction]> furniture.furniture_model:<entry[furniture_entity].spawned_entity>
    - flag <[interaction]> furniture.item:<[item]>
    - flag <[interaction]> furniture.blocks:->:<[block_list]>
    - flag <[interaction]> furniture.type:2x2_Table
    - foreach <[block_list]> as:block:
      - flag <[block]> furniture_interaction:<entry[interaction_entity].spawned_entity>

Assemble_Decoration:
    type: task
    debug: false
    definitions: location|item
    script:
    - adjust def:item quantity:1
    - spawn item_display[item=<[item].flag[skin].if_null[Furniture_Decoration_Default]>] <[location].center.with_yaw[<player.location.yaw.round_to_precision[45]>]> save:furniture_entity
    - modifyblock <[location]> air
    - spawn Furniture_Interaction <[location].center.below[0.5]> save:interaction_entity
    - define interaction <entry[interaction_entity].spawned_entity>
    - flag <[interaction]> furniture.furniture_model:<entry[furniture_entity].spawned_entity>
    - flag <[interaction]> furniture.item:<[item]>
    - flag <[interaction]> furniture.blocks:->:<[location]>
    - flag <[interaction]> furniture.type:Decoration
    - flag <[location]> furniture_interaction:<entry[interaction_entity].spawned_entity>

Furniture_Cleanup:
    type: task
    debug: false
    definitions: interaction
    script:
    - define block_list <[interaction].flag[furniture.blocks]>
    - foreach <[block_list]> as:block:
      - if <[block].if_null[null]> == null:
        - foreach stop
      - modifyblock <[block]> air
      - flag <[block]> furniture_interaction:!
    - drop item:<[interaction].flag[furniture.item]> <[interaction].location>
    - remove <[interaction].flag[furniture.furniture_model]>
    - remove <[interaction]>

## Furniture Configuration

Furniture_Config_Event:
    type: world
    debug: true
    events:
        on player places block using:off_hand priority:-20:
        - if <player.item_in_hand.script.name.if_null[null]> == Staff_Furniture_Configurator:
          - determine cancelled
        on player right clicks block with:Staff_Furniture_Configurator priority:-20:
        - determine passively cancelled
        - ratelimit <player> 5t
        - if <player.item_in_offhand.material.name> != air:
          - run Staff_Place_Task def.slot:offhand
        on player right clicks Furniture_Interaction with:item_flagged:furniture_config priority:-20:
        - ratelimit <player> 5t
        - if <context.entity.has_flag[furniture.invincible]>:
          - if <player.item_in_hand.flag[furniture_config]> != staff:
            - stop
        - flag <player> Furniture_Entity:<context.entity>
        - inventory open d:Furniture_Config_GUI
        on player clicks item in Furniture_Config_GUI:
        - define item <context.item>
        - define tool <player.item_in_hand>
        - define slot <context.slot>
        - define interaction <player.flag[furniture_entity]>
        - define model <[interaction].flag[furniture].get[furniture_model].if_null[<[interaction].flag[furniture].get[entity].get[1]>]>
        - define scale_x <[model].scale.simple.before[,].round_to[1]>
        - define scale_y <[model].scale.simple.before_last[,].after_last[,].round_to[1]>
        - define scale_z <[model].scale.simple.after_last[,].round_to[1]>
        #- narrate <[model].scale.simple>
        - define x_adjustment 0
        - define y_adjustment 0
        - define z_adjustment 0
        - choose <[slot]>:
          - case 11:
            - if <[tool].flag[furniture_config]> != staff:
              - stop
            - define type:scale
            - define director:x
            - define x_adjustment:1
          - case 12:
            - if <[tool].flag[furniture_config]> != staff:
              - stop
            - define type:scale
            - define director:y
            - define y_adjustment:1
          - case 13:
            - if <[tool].flag[furniture_config]> != staff:
              - stop
            - define type:scale
            - define director:z
            - define z_adjustment:1

          - case 20:
            - if <[tool].flag[furniture_config]> != staff:
              - stop
            - define type:scale
            - define director:x
            - define x_adjustment:-1
          - case 21:
            - if <[tool].flag[furniture_config]> != staff:
              - stop
            - define type:scale
            - define director:y
            - define y_adjustment:-1
          - case 22:
            - if <[tool].flag[furniture_config]> != staff:
              - stop
            - define type:scale
            - define director:z
            - define z_adjustment:-1

          - case 15:
            - define type:teleport
            - define director:x
            - define x_adjustment:1
          - case 16:
            - define type:teleport
            - define director:y
            - define y_adjustment:1
          - case 25:
            - define type:teleport
            - define director:y
            - define y_adjustment:-1
          - case 17:
            - define type:teleport
            - define director:z
            - define z_adjustment:1

          - case 38:
            - define type:yaw
            - define yaw_adjustment:-45
          - case 39:
            - define type:yaw
            - define yaw_adjustment:45
          - case 44:
            - define type:remove
          - case 41:
            - if <[tool].flag[furniture_config]> != staff:
              - stop
            - define type:invincibility
          - case 42:
            - if <[tool].flag[furniture_config]> != staff:
              - stop
            - define type:collision
          - case 43:
            - if <[tool].flag[furniture_config]> != staff:
              - stop
            - if <context.click> == double_click:
              - define type:remove_interaction
        - if <context.click> == shift_left && <[tool].flag[furniture_config]> == staff:
          - define x_adjustment:<[x_adjustment].mul[0.1]>
          - define y_adjustment:<[y_adjustment].mul[0.1]>
          - define z_adjustment:<[z_adjustment].mul[0.1]>
        - choose <[type]>:
          - case scale:
            - adjust <[model]> scale:<[scale_x].add[<[x_adjustment]>].round_to[1]>,<[scale_y].add[<[y_adjustment]>].round_to[1]>,<[scale_z].add[<[z_adjustment]>].round_to[1]>
            #- narrate <[scale_x].add[<[x_adjustment]>].round_to[2]>
          - case teleport:
            - if <[x_adjustment]> != 0:
              - teleport <[model]> <[model].location.left[<[x_adjustment]>]>
            - if <[y_adjustment]> != 0:
              - teleport <[model]> <[model].location.up[<[y_adjustment]>]>
            - if <[z_adjustment]> != 0:
              - teleport <[model]> <[model].location.right[<[z_adjustment]>]>
          - case yaw:
            - look <[model]> yaw:<[model].location.yaw.add[<[yaw_adjustment]>]>
          - case remove:
            - run furniture_cleanup def:<[interaction]>
            - inventory close
          - case invincibility:
            - if <[interaction].has_flag[furniture.invincible]>:
              - narrate "<red>Invincibility Disabled"
              - flag <[interaction]> furniture.invincible:!
            - else:
              - narrate "<green>Invincibility Enabled"
              - flag <[interaction]> furniture.invincible
          - case collision:
            - if <[interaction].has_flag[furniture.collision]>:
              - narrate "<red>Collision Disabled"
              - flag <[interaction]> furniture.collision:!
              - modifyblock <[interaction].location> air
              - flag <[interaction].flag[furniture.blocks]> furniture_interaction:!
            - else:
              - narrate "<green>Collision Enabled"
              - flag <[interaction]> furniture.collision
              - flag <[interaction]> furniture.blocks:<[interaction].location>
              - modifyblock <[interaction].location> barrier
              - flag <[interaction].flag[furniture.blocks]> furniture_interaction:<[interaction]>
          - case remove_interaction:
            - if <[interaction].has_flag[furniture.blocks]>:
              - foreach <[interaction].flag[furniture.blocks]> as:block:
                - flag <[block]> furniture_interaction:!
            - remove <[interaction]>
            - inventory close
        #- inventory adjust slot:5 destination:<player.open_inventory> lore:<yellow>Scale<white><&co><&sp><[model].scale.simple><n><yellow>Location<white><&co><&sp><[model].location.simple><n><yellow>Yaw<white><&co><&sp><[model].location.yaw>

Staff_Place:
  type: command
  debug: false
  name: staffplace
  description: Places a display entity or gives a tool for it.
  usage: /staffplace tool
  permission: dscript.staffplace
  tab completions:
    1: tool|remove
  script:
  - define slot hand
  - if <context.args.get[1]> == tool:
    - give staff_furniture_configurator
    - stop
  - if <context.args.get[1]> == remove:
    - remove <player.target>
    - stop
  - run Staff_Place_Task def.slot:<[slot]>

Staff_Place_Task:
  type: task
  debug: false
  definitions: slot
  script:
  - define item <player.inventory.slot[<[slot]>]>
  - adjust def:item quantity:1
  - define location <player.cursor_on.above[1]>
  #- narrate <[item]>
  - spawn ITEM_DISPLAY[item=<[item]>;scale=1,1,1] <[location].center> save:furniture_entity
  - look <entry[furniture_entity].spawned_entity> yaw:<player.location.yaw.round_to_precision[45]>
  - spawn Furniture_Interaction <[location].center.below[0.5]> save:interaction
  - flag <entry[interaction].spawned_entity> furniture.furniture_model:<entry[furniture_entity].spawned_entity>
  - flag <entry[interaction].spawned_entity> furniture.item:<[item]>
  - flag <entry[interaction].spawned_entity> furniture.type:Decoration
  - flag <entry[interaction].spawned_entity> furniture.blocks:->:<[location]>

Furniture_Config_GUI:
  type: inventory
  debug: false
  inventory: chest
  title: <gold>Furniture Configurator
  procedural items:
    - define result <list>
    - define tool <player.item_in_hand>
    - if <[tool].flag[furniture_config]> == staff:
      - define result <list[<item[green_concrete].with_single[display=<red>X <green>Increase]>|<item[green_concrete].with_single[display=<green>Y <green>Increase]>|<item[green_concrete].with_single[display=<blue>Z <green>Increase]>|<item[red_concrete].with_single[display=<red>X <red>Decrease]>|<item[red_concrete].with_single[display=<green>Y <red>Decrease]>|<item[red_concrete].with_single[display=<blue>Z <red>Decrease]>|<item[shield].with_single[display=<yellow>Invincibility Toggle]>|<item[bricks].with_single[display=<gold>Collision Block]>|<item[structure_void].with_single[display=<aqua>Remove Interaction].with_single[lore=<red><bold>WARNING<n><white>This will remove the interaction preventing further edits<n><gold>Double Click this to activate]>]>

    - else:
      - define result <list[air]>
    # green_concrete[display=<green>Y <green>Increase]
    # green_concrete[display=<blue>Z <green>Increase]
    # red_concrete[display=<red>X <red>Decrease]
    # red_concrete[display=<green>Y <red>Decrease]
    # red_concrete[display=<blue>Z <red>Decrease]
    # shield[display=<yellow>Invincibility Toggle]
    # structure_void[display=<aqua>Remove Interaction;lore=<red><bold>WARNING<n><white>This will remove the interaction preventing further edits<n><gold>Double Click this to activate]
    - determine <[result]>
  gui: true
  slots:
  - [GUINULL] [GUINULL] [paper[display=<gold>Model<&sp>Scale;lore=<yellow><player.flag[furniture_entity].flag[furniture.furniture_model].scale.simple>]] [GUINULL] [<player.flag[furniture_entity].flag[furniture].get[item].with_single[lore=<empty>].with_single[display=<gold>Item<&sp>Model].if_null[<item[brick].with_single[display=<red>ERROR].with_single[lore=<red>An error has occured, please contact staff.<n>Make sure to explain what happened prior to issue.]>]>] [GUINULL] [paper[display=<gold>Model<&sp>Location]] [GUINULL] [GUINULL]
  - [GUINULL] [] [] [] [GUINULL] [green_concrete[display=<red>Left]] [green_concrete[display=<green>Up]] [green_concrete[display=<blue>Right]] [GUINULL]
  - [GUINULL] [] [] [] [GUINULL] [GUINULL] [red_concrete[display=<green>Down]] [GUINULL] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
  - [paper[display=<gold>Model<&sp>Yaw(Rotation)]] [red_concrete[display=<red>Yaw 45 Decrease]] [green_concrete[display=<green>Yaw 45 Increase]] [GUINULL] [] [] [] [barrier[display=<red>Remove Decoration]] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

## Furniture Assembly System

Furniture_Assembly_Event:
  type: world
  debug: false
  events:
    on player places Furniture_Assembly_Bench:
    - define location <context.location>
    - modifyblock <[location]> cyan_stained_glass
    - spawn item_display[item=furniture_assembly_bench] <[location].center> save:bench_entity
    - spawn Furniture_Assembly_Bench_Interaction <[location].center.below[0.5]> save:bench_interaction
    - flag <entry[bench_interaction].spawned_entity> assembly.home:<[location]>
    - flag <entry[bench_interaction].spawned_entity> assembly.bench:<entry[bench_entity].spawned_entity>
    on player right clicks Furniture_Assembly_Bench_Interaction:
    - ratelimit player 5t
    - define interaction <context.entity>
    - if <player.item_in_hand.has_flag[skin]>:
      - stop
    - if <player.item_in_hand.script.name||null> == config_wrench:
      - flag <player> assembly_bench:<[interaction]> expire:10s
      - inventory open d:Furniture_Assembly_Bench_Config_GUI
    - else:
      - if <player.item_in_hand.has_flag[furniture_type]>:
        - flag <player> assembly_kit:<context.item>
        - inventory open d:Furniture_Assembly_Bench_GUI
    on player clicks item in Furniture_Assembly_Bench_Config_GUI:
    - if <context.slot> == 5:
      - remove <player.flag[assembly_bench].flag[assembly.bench]>
      - modifyblock <player.flag[assembly_bench].flag[assembly.home]> air
      - drop item:furniture_assembly_bench <player.flag[assembly_bench].flag[assembly.home]>
      - remove <player.flag[assembly_bench]>
      - inventory close
    on player clicks item in Furniture_Assembly_Bench_GUI:
    - if <context.slot> in <list[1|2|3|4|5|6|7|8|9|-998]> || <context.item.material.name> == air:
      - stop
    - else:
      - run furniture_recipe_task def:<context.item>


Furniture_Assembly_Bench_Config_GUI:
  type: inventory
  inventory: dispenser
  debug: false
  title: <gold>Configuration
  gui: true
  slots:
  - [GUINULL] [GUINULL] [GUINULL]
  - [GUINULL] [red_concrete[display=<red>Deconstruct?]] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL]

Furniture_Assembly_Bench_GUI:
  type: inventory
  inventory: chest
  debug: false
  title: <gold>Furniture Assembly Bench
  gui: true
  definitions:
    selected_furniture: <player.flag[assembly_kit].with_single[quantity=1]>
  procedural items:
  - define result <list>
  - define item <player.flag[assembly_kit]>
  - define assembly_type <script[<[item].script.name>].data_key[data.assembles]>
  - choose <[assembly_type]>:
    - case 1x1_Table:
      - define skins:<script[Furniture_Skin_Recipes].data_key[free_skins].get[1x1_Table].if_null[<empty>]>
    - case 1x1_Chair:
      - define skins:<script[Furniture_Skin_Recipes].data_key[free_skins].get[1x1_Chair].if_null[<empty>]>
    - case 1x2_Table:
      - define skins:<script[Furniture_Skin_Recipes].data_key[free_skins].get[1x2_Table].if_null[<empty>]>
    - case 1x3_Table:
      - define skins:<script[Furniture_Skin_Recipes].data_key[free_skins].get[1x3_Table].if_null[<empty>]>
    - case 2x2_Table:
      - define skins:<script[Furniture_Skin_Recipes].data_key[free_skins].get[2x2_Table].if_null[<empty>]>
    - case Decoration:
      - define skins:<script[Furniture_Skin_Recipes].data_key[free_skins].get[Decoration].if_null[<empty>]>
    - default:
      - define skins <item[red_concrete].with_single[display=<red>ERROR]>
  #- define skins <player.flag[skins].get[furniture.<[assembly_type]>]>
  - foreach <[skins]> as:skin:
    - define item <item[furniture_skin_<[assembly_type]>_<[skin]>]>
    - adjust def:item lore:<proc[Furniture_Recipe_Proc].context[<[assembly_type]>.<[skin]>]>
    - adjust def:item flag:path:<[assembly_type]>.<[skin]>
    - adjust def:item flag:skin:<[skin]>
    - define result:->:<[item]>
  - determine <[result]>
  slots:
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [selected_furniture] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []

Furniture_Skin_Recipes:
  type: data
  free_skins:
    1x1_Table:
    - end_table
    1x1_Chair:
    - comfy_oak_stool
    1x2_Table:
    - empty
    1x3_Table:
    - empty
    2x2_Table:
    - empty
    Decoration:
    - wheel
    - ship_wheel
    - tent
    - washtub
    - plate_empty
    - skelly
  1x1_Table:
    end_table:
    - oak_planks-4
    - white_wool-2
    - chest-1
  1x1_Chair:
    comfy_oak_stool:
    - oak_planks-4
    - white_wool-2
  1x2_Table:
  - empty
  1x3_Table:
  - empty
  2x2_Table:
  - empty
  Decoration:
    wheel:
    - oak_planks-4
    - iron_ingot-1
    ship_wheel:
    - oak_planks-5
    - iron_ingot-1
    tent:
    - white_wool-4
    - oak_planks-4
    washtub:
    - oak_planks-4
    - iron_ingot-1
    plate_empty:
    - iron_ingot-1
    skelly:
    - bone-8

Furniture_Recipe_Proc:
  type: procedure
  debug: false
  definitions: path
  script:
  - define ingredients <script[Furniture_Skin_Recipes].data_key[<[path]>]>
  #- define tool <[ingredients].last.replace[_].with[ ].to_titlecase>
  - foreach <[ingredients].get[1].to[<[ingredients].size>]> as:text:
    - if <item[<[text].before_last[-]>].display||null> == null:
      - define item_name "<item[<[text].before_last[-]>].material.name.replace[_].with[ ].to_titlecase> x<[text].after_last[-]>"
    - else:
      - define item_name "<item[<[text].before_last[-]>].display> x<[text].after_last[-]>"
    - define ingredient_list:->:<[item_name].strip_color>
  - define lore <n><gray><element[                          ].strikethrough>
  - define lore "<[lore]><n><dark_purple>Ingredients<&co><n><blue><[ingredient_list].comma_separated> "
  - determine <[lore]>


## Copied from Crafting2.dsc
Furniture_Recipe_Task:
  type: task
  debug: false
  definitions: skin_item
  script:
  - define path <[skin_item].flag[path]>
  - define recipe <script[Furniture_Skin_Recipes].data_key[<[path]>]>
  - define recipe_amount <[recipe].size>
  - define tool <[recipe].last>
  - foreach <[recipe]> as:item:
    - define quantity<[loop_index]> <[item].after_last[-]>
    - define ingredient<[loop_index]> <[item].before_last[-]>
  - if <player.gamemode> != creative:
    - choose <[recipe_amount]>:
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
  - if <player.gamemode> == creative:
    - define success 1
  - if <[success]||0> == 1:
    - define skinned_item <item[furniture_kit_<[skin_item].flag[type]>]>
    - adjust def:skinned_item components_patch:item_model=string<&co><[skin_item].flag[model]>
    #- adjust def:skinned_item display:<[skin_item].display_name>
    - adjust def:skinned_item lore:<[skinned_item].lore><n><gold>Skin<&co><&sp><[skin_item].display>
    - adjust def:skinned_item flag:skin:Furniture_Skin_<[skin_item].flag[type]>_<[skin_item].flag[skin]>
    - give item:<[skinned_item]>
    - if <player.gamemode> != creative:
      - take item:furniture_kit_<[skin_item].flag[type]> quantity:1
      - inventory close

    #- run Crafting_Station_Push




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
    mechanisms:
      components_patch:
        item_model: string:furniture:crude_chair
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
    mechanisms:
      components_patch:
        item_model: string:furniture:1x2_crude_table
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
    mechanisms:
      components_patch:
        item_model: string:furniture:1x3_crude_table
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
    mechanisms:
      components_patch:
        item_model: string:furniture:2x2_crude_table
    lore:
    - <gray>Place this kit on the ground to assemble a 2x2 table.
    - <gray>Take to a Assembly Station to give a skin.
    flags:
      furniture_type: table
      furniture_size: 2x2

Furniture_Kit_Decoration:
    type: item
    debug: false
    data:
      assembles: Decoration
    material: string
    display name: <white>Decoration Kit
    mechanisms:
      components_patch:
        item_model: string:furniture:barrel
    lore:
    - <gray>Place this kit on the ground to assemble a decoration.
    - <gray>Take to a Assembly Station to give a skin.
    flags:
      furniture_type: decoration

Furniture_Configurator:
    type: item
    debug: false
    material: brick
    display name: <yellow>Furniture Configurator
    flags:
      furniture_config: player
    mechanisms:
      components_patch:
        item_model: string:tools:iron_hammer
    lore:
    - <gold>Right click on a furniture entity to configure it.

Staff_Furniture_Configurator:
  type: item
  material: breeze_rod
  display name: <gold>Staff Place Tool
  flags:
    furniture_config: staff
  lore:
  - <white>Hold item in <yellow>OFFHAND
  - <white><&lt><green>Right Click<white><&gt> <gray>for aligned <red>Block Placement
  #- <gray><empty>
  #- <white><&lt><blue>Sneak Right Click<white><&gt> <gray>for <red>Freeform Placement

Furniture_Assembly_Bench:
    type: item
    debug: false
    material: string
    display name: <yellow>Assembly Bench
    mechanisms:
      components_patch:
        item_model: string:furniture:assembly_bench
    lore:
    - <gray>Place this bench to assemble furniture kits.
    - <gray>Right click with a kit after placing to modify it.

Furniture_Assembly_Bench_Interaction:
  type: entity
  debug: false
  entity_type: interaction
  flags:
    health: 5
  mechanisms:
    height: 1.05
    width: 1.05


## Furniture Skins

# Default

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

Furniture_Decoration_Default:
    type: item
    debug: false
    material: string
    display name: <yellow>Assembly Kit<&co> <blue>Decoration
    mechanisms:
      components_patch:
        item_model: string:furniture:barrel
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

#Custom Skins

#1x1 Chair

Furniture_Skin_1x1_Chair_comfy_oak_stool:
    type: item
    debug: false
    material: string
    display name: <yellow>Comfy Stool
    mechanisms:
      components_patch:
        item_model: string:furniture:comfy_oak_stool
    flags:
      type: 1x1_Chair
      model: furniture:comfy_oak_stool

#1x1 Table

Furniture_Skin_1x1_Table_end_table:
    type: item
    debug: false
    material: string
    display name: <yellow>End Table
    mechanisms:
      components_patch:
        item_model: string:furniture:end_table
    flags:
      type: 1x1_Table
      model: furniture:end_table

#Decoration

Furniture_Skin_Decoration_wheel:
    type: item
    debug: false
    material: string
    display name: <yellow>Wheel
    mechanisms:
      components_patch:
        item_model: string:furniture:wheel
    flags:
      type: Decoration
      model: furniture:wheel

Furniture_Skin_Decoration_ship_wheel:
    type: item
    debug: false
    material: string
    display name: <yellow>Ship Wheel
    mechanisms:
      components_patch:
        item_model: string:furniture:ship_wheel
    flags:
      type: Decoration
      model: furniture:ship_wheel

Furniture_Skin_Decoration_tent:
    type: item
    debug: false
    material: string
    display name: <yellow>Tent
    mechanisms:
      components_patch:
        item_model: string:furniture:tent
    flags:
      type: Decoration
      model: furniture:tent

Furniture_Skin_Decoration_washtub:
    type: item
    debug: false
    material: string
    display name: <yellow>Washtub
    mechanisms:
      components_patch:
        item_model: string:furniture:washtub
    flags:
      type: Decoration
      model: furniture:washtub

Furniture_Skin_Decoration_plate_empty:
    type: item
    debug: false
    material: string
    display name: <yellow>Empty Plate
    mechanisms:
      components_patch:
        item_model: string:furniture:plate_empty
    flags:
      type: Decoration
      model: furniture:plate_empty

Furniture_Skin_Decoration_skelly:
    type: item
    debug: false
    material: string
    display name: <yellow>Sitting Skeleton
    mechanisms:
      components_patch:
        item_model: string:dungeons:skelly
    flags:
      type: Decoration
      model: dungeons:skelly