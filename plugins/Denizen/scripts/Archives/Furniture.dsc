# This file includes the module system that crafted furniture items use to render and assemble furniture items for players and staff to use in decorations

# First Assembled: 6/1/2024

Furniture_Events:
    type: world
    debug: false
    events:
        on player right clicks block with:item_flagged:assembles:
        - ratelimit <player> 5t
        - determine passively cancelled
        - define location_above <context.location.above[1]>
        - define location_bottom <context.location>
        - define item <context.item>
        - if <[location_above].material.name> == air:
          - run Assemble_<[item].flag[assembles]> def.location:<[location_above]> def.item:<[item]> def.player:t
          - take slot:hand
        on player right clicks Furniture_Interaction:
        - define interaction <context.entity>
        - if <[interaction].flag[furniture.type]> == chair:
          - if !<context.item.has_flag[assembles]>:
            - mount <player>|<[interaction].flag[furniture.entity].get[1]>
        - if <[interaction].has_flag[display_stand]>:
          - determine cancelled passively
          - define item <context.item>
          - adjust def:item quantity:1
          - if <[item].script.name> != display_stand:
            - if <[interaction].has_flag[contents]>:
              - if <player.is_sneaking>:
                - drop <[interaction].flag[contents]> <[interaction]>
                - remove <[interaction].flag[contents_entity]>
                - flag <[interaction]> contents:!
                - flag <[interaction]> contents_entity:!
            - else if !<player.is_sneaking>:
              - take slot:hand quantity:1
              - spawn item_display[item=<[item]>;scale=0.5,0.5,0.5] <player.cursor_on.above[1.25].left[0.5].forward[0.5]> save:contents
              - flag <[interaction]> contents:<[item]>
              - flag <[interaction]> contents_entity:<entry[contents].spawned_entity>
        on player damages Furniture_Interaction:
        - define interaction <context.entity>
        - define health <[interaction].flag[health]||5>
        - if <[interaction].flag[invincible]||false>:
          - stop
        - if <[health].sub[<context.damage>]> <= 0:
          - drop item:furniture_<[interaction].flag[furniture.item]> <[interaction].location>
          - playsound sound:entity.zombie.break.wooden_door sound_category:blocks <[interaction].location>
          - if <[interaction].flag[furniture.type]> in <list[table|display_stand]>:
          #&& <[interaction].flag[furniture.location].blocks.first.if_null[<[interaction].flag[furniture.location]>].material.name> == barrier:
            - foreach <[interaction].flag[furniture.location].blocks> as:loc:
              - if <[loc].material.name> == cyan_stained_glass:
                - modifyblock <[loc]> air
            - if <[interaction].flag[furniture.location].material.name> == cyan_stained_glass:
                - modifyblock <[interaction].flag[furniture.location]> air
          - foreach <[interaction].flag[furniture.entity]>:
            - remove <[value]>
          - foreach <[interaction].flag[furniture.extra]>:
            - remove <[value]>
          - remove <[interaction]>
        - else:
          - define newhealth <[health].sub[1]>
          - flag <[interaction]> health:<[newhealth]>
          - playsound sound:block.wood.hit sound_category:blocks <[interaction].location>
        on player breaks item_frame location_flagged:invincible_frame bukkit_priority:HIGHEST:
        - determine cancelled
        on player breaks item_frame flagged:invincible_frame bukkit_priority:HIGHEST:
        - determine cancelled

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
    - give Staff_Place_Tool
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
  - define location <player.cursor_on.above[1]>
  #- narrate <[item]>
  - spawn ITEM_DISPLAY[item=<[item]>;scale=1,1,1] <[location].center> save:furniture_entity
  - look <entry[furniture_entity].spawned_entity> yaw:<player.location.yaw.round_to_precision[45]>
  - spawn Furniture_Interaction <[location].center.below[0.5]> save:interaction
  - flag <entry[interaction].spawned_entity> furniture.entity:->:<entry[furniture_entity].spawned_entity>

Staff_Place_Event:
  type: world
  debug: false
  events:
    on player places block using:off_hand priority:-20:
    - if <player.item_in_hand.script.name.if_null[null]> == staff_place_tool:
      - determine cancelled
    on player right clicks block with:staff_place_tool priority:-20:
    - determine passively cancelled
    - ratelimit <player> 5t
    - if <player.item_in_offhand.material.name> != air:
      - run Staff_Place_Task def.slot:offhand
    on player right clicks Furniture_Interaction with:staff_place_tool priority:-20:
    - ratelimit <player> 5t
    - flag <player> staff_place_entity:<context.entity> expire:30s
    - inventory open d:Staff_Place_GUI
    on player clicks item in Staff_Place_GUI:
    - define item <context.item>
    - define slot <context.slot>
    - define interaction <player.flag[staff_place_entity]>
    - define model <[interaction].flag[furniture].get[entity].get[1]>
    - define scale_x <[model].scale.simple.before[,]>
    - define scale_y <[model].scale.simple.before_last[,].after_last[,]>
    - define scale_z <[model].scale.simple.after_last[,]>
    #- narrate <[model].scale.simple>
    - define x_adjustment 0
    - define y_adjustment 0
    - define z_adjustment 0
    - choose <[slot]>:
      - case 11:
        - define type:scale
        - define director:x
        - define x_adjustment:1
      - case 12:
        - define type:scale
        - define director:y
        - define y_adjustment:1
      - case 13:
        - define type:scale
        - define director:z
        - define z_adjustment:1

      - case 20:
        - define type:scale
        - define director:x
        - define x_adjustment:-1
      - case 21:
        - define type:scale
        - define director:y
        - define y_adjustment:-1
      - case 22:
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
        - define type:invincibility
      - case 43:
        - if <context.click> == double_click:
          - define type:remove_interaction
    - if <context.click> == shift_left:
      - define x_adjustment:<[x_adjustment].mul[0.1]>
      - define y_adjustment:<[y_adjustment].mul[0.1]>
      - define z_adjustment:<[z_adjustment].mul[0.1]>
    - choose <[type]>:
      - case scale:
        - adjust <[model]> scale:<[scale_x].add[<[x_adjustment]>].round_to[2]>,<[scale_y].add[<[y_adjustment]>].round_to[2]>,<[scale_z].add[<[z_adjustment]>].round_to[2]>
        - narrate <[scale_x].add[<[x_adjustment]>].round_to[2]>
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
        - remove <[model]>
        - remove <[interaction]>
        - inventory close
      - case invincibility:
        - if <[interaction].has_flag[invincible]>:
          - narrate "<red>Invincibility Disabled"
          - flag <[interaction]> invincible:!
        - else:
          - narrate "<green>Invincibility Enabled"
          - flag <[interaction]> invincible
      - case remove_interaction:
        - remove <[interaction]>
        - inventory close
    - inventory adjust slot:5 destination:<player.open_inventory> lore:<yellow>Scale<white><&co><&sp><[model].scale.simple><n><yellow>Location<white><&co><&sp><[model].location.simple><n><yellow>Yaw<white><&co><&sp><[model].location.yaw>

Staff_Place_tool:
  type: item
  material: breeze_rod
  display name: <gold>Staff Place Tool
  lore:
  - <white>Hold item in <yellow>OFFHAND
  - <white><&lt><green>Right Click<white><&gt> <gray>for aligned <red>Block Placement
  - <gray><empty>
  - <white><&lt><blue>Sneak Right Click<white><&gt> <gray>for <red>Freeform Placement

Staff_Place_GUI:
  type: inventory
  debug: false
  inventory: chest
  gui: true
  slots:
  - [GUINULL] [GUINULL] [paper[display=<gold>Model<&sp>Scale]] [GUINULL] [<player.flag[staff_place_entity].flag[furniture].get[entity].get[1].item.with_single[lore=<empty>].with_single[display=<gold>Item<&sp>Model]>] [GUINULL] [paper[display=<gold>Model<&sp>Location]] [GUINULL] [GUINULL]
  - [GUINULL] [green_concrete[display=<red>X <green>Increase]] [green_concrete[display=<green>Y <green>Increase]] [green_concrete[display=<blue>Z <green>Increase]] [GUINULL] [green_concrete[display=<red>Left]] [green_concrete[display=<green>Up]] [green_concrete[display=<blue>Right]] [GUINULL]
  - [GUINULL] [red_concrete[display=<red>X <red>Decrease]] [red_concrete[display=<green>Y <red>Decrease]] [red_concrete[display=<blue>Z <red>Decrease]] [GUINULL] [GUINULL] [red_concrete[display=<green>Down]] [GUINULL] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
  - [paper[display=<gold>Model<&sp>Yaw(Rotation)]] [red_concrete[display=<red>Yaw 45 Decrease]] [green_concrete[display=<green>Yaw 45 Increase]] [GUINULL] [shield[display=<yellow>Invincibility Toggle]] [] [structure_void[display=<aqua>Remove Interaction;lore=<red><bold>WARNING<n><white>This will remove the interaction preventing further edits<n><gold>Double Click this to activate]] [barrier[display=<red>Remove Decoration]] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]


##Furniture_Faker:
##  type: task
##  definitions: location|player|unbreakable
##  script:
##  - if <[player]> == f:
##    - define x 1
##    - define z 1
##  - define location_bottom <[location].below[1]>
##  - define light_level_sky <[location].light.sky>
##  - define light_level_block <[location].light.blocks>
##  - spawn BLOCK_DISPLAY[material=<[location_bottom].material.name>;brightness=[sky=<[light_level_sky]>;block=<[light_level_block]>]] <[location_bottom].right[<[x]||0>].backward[<[z]||0>]> save:bottom_facade
##  - flag <[location]> bottom:<[location_bottom].material.name>
##  - flag <[location]> bottom_facade:<entry[bottom_facade].spawned_entity>
##  - modifyblock <[location]> petrified_oak_slab
##  - if <[unbreakable]||null> != null:
##    - flag <[location]> unbreakable
  #- modifyblock <[location_bottom]> air

##Furniture_Cleanup:
##  type: task
##  definitions: location
##  script:
##  - define location_bottom <[location].below[1]>
##  - modifyblock <[location_bottom]> <[location].flag[bottom]>
##  - modifyblock <[location]> air
##  - remove <[location].flag[bottom_facade]>
##  - remove <[location].flag[furniture_entity]>
##  - if <[location].above[1].has_flag[invincible_frame]>:
##    - flag <[location].above[1]> invincible_frame:!
##  - foreach <[location].list_flags> as:flag:
##    - flag <[location]> <[flag]>:!

Assemble_Crude_Chair:
    type: task
    debug: false
    definitions: location|item|player|yaw
    script:
    - define player_yaw <player.location.yaw>
    - spawn ITEM_DISPLAY[item=Furniture_Crude_Chair;scale=1,1,1] <[location].center> save:furniture_entity
    - look <entry[furniture_entity].spawned_entity> yaw:<[yaw]||<[player_yaw]>>
    - spawn Furniture_Interaction[height=0.7;width=0.7] <[location].center.below[0.5]> save:interaction
    - flag <entry[interaction].spawned_entity> furniture.entity:->:<entry[furniture_entity].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.item:<[item].flag[assembles]>
    - flag <entry[interaction].spawned_entity> location:<[location]>
    - flag <entry[interaction].spawned_entity> furniture.type:chair

Assemble_Crude_Table:
    type: task
    debug: false
    definitions: location|item|player
    script:
    - spawn ITEM_DISPLAY[item=Furniture_Crude_Table;scale=1,1,1] <[location].center> save:furniture_entity
    - spawn ITEM_FRAME[visible=false;rotation=up] <[location].above[1].center> save:frame
    - flag <[location].above[1]> invincible_frame
    - spawn Furniture_Interaction[height=1.05;width=1.1] <[location].center.below[0.5]> save:interaction
    - modifyblock <[location]> cyan_stained_glass
    - flag <entry[interaction].spawned_entity> furniture.entity:->:<entry[furniture_entity].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.item:<[item].flag[assembles]>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[frame].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.location:<[location]>
    - flag <[location]> furniture:<[item].flag[assembles]>
    - flag <entry[interaction].spawned_entity> furniture.type:table

Assemble_1x2_Crude_Table:
    type: task
    debug: false
    definitions: location|item|player|yaw
    script:
    - define right_block <[location].with_yaw[<[yaw].round_to_precision[90].add[90].if_null[<player.location.yaw.round_to_precision[90].add[90]>]>].forward_flat[1].with_yaw[!]>
    - spawn ITEM_DISPLAY[item=Furniture_1x2_Crude_Table;scale=1,1,1] <[location].center> save:furniture_entity
    - foreach <list[<[location]>|<[right_block]>]> as:loc:
      - if <[loc].material.name> == air:
        - modifyblock <[loc]> cyan_stained_glass
    - look <entry[furniture_entity].spawned_entity> yaw:<[yaw].round_to_precision[90]||<player.location.yaw.round_to_precision[90]>>

    - spawn Furniture_Interaction[height=1.05;width=1.1] <[location].center.below[0.5]> save:interaction

    - spawn ITEM_FRAME[visible=false;rotation=up] <[location].above[1]> save:frame
    - spawn ITEM_FRAME[visible=false;rotation=up] <[right_block].above[1].left[0.5].forward[0.5]> save:frame2
    - flag <[location].above[1]> invincible_frame
    - flag <[right_block].above[1]> invincible_frame
    - flag <entry[interaction].spawned_entity> furniture.entity:->:<entry[furniture_entity].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[frame].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[frame2].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.item:<[item].flag[assembles]>
    - flag <entry[interaction].spawned_entity> furniture.location:<[location].to_cuboid[<[right_block]>]>
    - flag <entry[interaction].spawned_entity> furniture.type:table

Assemble_1x3_Crude_Table:
    type: task
    debug: false
    definitions: location|item|player|yaw
    script:
    - define right_block <[location].with_yaw[<[yaw].round_to_precision[90].add[90].if_null[<player.location.yaw.round_to_precision[90].add[90]>]>].forward_flat[1].with_yaw[!]>
    - define left_block <[location].with_yaw[<[yaw].round_to_precision[90].add[90].if_null[<player.location.yaw.round_to_precision[90].add[90]>]>].backward_flat[1].with_yaw[!]>
    - spawn ITEM_DISPLAY[item=Furniture_1x3_Crude_Table;scale=1,1,1] <[location].center> save:furniture_entity
    - foreach <list[<[location]>|<[right_block]>|<[left_block]>]> as:loc:
      - if <[loc].material.name> == air:
        - modifyblock <[loc]> cyan_stained_glass
    - look <entry[furniture_entity].spawned_entity> yaw:<[yaw].round_to_precision[90]||<player.location.yaw.round_to_precision[90]>>

    - spawn Furniture_Interaction[height=1.05;width=1.1] <[location].center.below[0.5]> save:interaction

    - spawn ITEM_FRAME[visible=false;rotation=up] <[location].above[1]> save:frame
    - spawn ITEM_FRAME[visible=false;rotation=up] <[right_block].above[1].left[0.5].forward[0.5]> save:frame2
    - spawn ITEM_FRAME[visible=false;rotation=up] <[left_block].above[1].left[0.5].forward[0.5]> save:frame3
    - flag <[location].above[1]> invincible_frame
    - flag <[right_block].above[1]> invincible_frame
    - flag <[left_block].above[1]> invincible_frame
    - flag <entry[interaction].spawned_entity> furniture.entity:->:<entry[furniture_entity].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[frame].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[frame2].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[frame3].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.item:<[item].flag[assembles]>
    - flag <entry[interaction].spawned_entity> furniture.location:<[left_block].to_cuboid[<[right_block]>]>
    - flag <entry[interaction].spawned_entity> furniture.type:table

Assemble_2x2_Crude_Table:
    type: task
    debug: false
    definitions: location|item|player|yaw
    script:
    - define right_block <[location].with_yaw[<[yaw].round_to_precision[90].add[90].if_null[<player.location.yaw.round_to_precision[90].add[90]>]>].forward_flat[1].with_yaw[!]>
    - define backward_block <[location].with_yaw[<[yaw].round_to_precision[90].if_null[<player.location.yaw.round_to_precision[90]>]>].backward_flat[1].with_yaw[!]>
    - define backward_right_block <[location].with_yaw[<[yaw].round_to_precision[90].if_null[<player.location.yaw.round_to_precision[90]>]>].backward_flat[1].right[1].with_yaw[!]>
    - spawn ITEM_DISPLAY[item=Furniture_2x2_Crude_Table;scale=1,1,1] <[location].center> save:furniture_entity
    - foreach <list[<[location]>|<[right_block]>|<[backward_block]>|<[backward_right_block]>]> as:loc:
      - if <[loc].material.name> == air:
        - modifyblock <[loc]> cyan_stained_glass
    - look <entry[furniture_entity].spawned_entity> yaw:<[yaw].round_to_precision[90]||<player.location.yaw.round_to_precision[90]>>

    - spawn Furniture_Interaction[height=1.05;width=1.1] <[location].center.below[0.5]> save:interaction

    - spawn ITEM_FRAME[visible=false;rotation=up] <[location].above[1]> save:frame
    - spawn ITEM_FRAME[visible=false;rotation=up] <[right_block].above[1].left[0.5].forward[0.5]> save:frame2
    - spawn ITEM_FRAME[visible=false;rotation=up] <[backward_block].above[1].left[0.5].forward[0.5]> save:frame3
    - spawn ITEM_FRAME[visible=false;rotation=up] <[backward_right_block].above[1].left[0.5].forward[0.5]> save:frame4
    - flag <[location].above[1]> invincible_frame
    - flag <[right_block].above[1]> invincible_frame
    - flag <[backward_block].above[1]> invincible_frame
    - flag <[backward_right_block].above[1]> invincible_frame
    - flag <entry[interaction].spawned_entity> furniture.entity:->:<entry[furniture_entity].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[frame].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[frame2].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[frame3].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[frame4].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.item:<[item].flag[assembles]>
    - flag <entry[interaction].spawned_entity> furniture.location:<[location].to_cuboid[<[backward_right_block]>]>
    - flag <entry[interaction].spawned_entity> furniture.type:table


Assemble_Runestone_Inscriber:
    type: task
    debug: false
    definitions: location|item|player
    script:
    - spawn ITEM_DISPLAY[item=Furniture_Runestone_Inscriber;scale=1,1,1] <[location].center> save:furniture_entity
    - flag <[location]> furniture.entity:->:<entry[furniture_entity].spawned_entity>
    - flag <[location]> furniture.item:<[item].flag[assembles]>
    - flag <[location]> runestone_inscriber
    - flag <[location]> stage:ready
    #- run Furniture_Faker def.location:<[location]>

Assemble_Display_Stand:
    type: task
    debug: false
    definitions: location|item|player|yaw
    script:
    - spawn ITEM_DISPLAY[item=furniture_display_stand;scale=1,1,1] <[location].center.above[0.5]> save:furniture_entity
    - spawn block_display[material=stone_brick_slab] <[location]> save:slab
    - foreach <list[<[location]>]> as:loc:
      - if <[loc].material.name> == air:
        - modifyblock <[loc]> cyan_stained_glass
    - spawn Furniture_Interaction[height=1.05;width=1.1] <[location].center.below[0.5]> save:interaction

    - spawn ITEM_FRAME[visible=false;rotation=up] <[location].above[1].center> save:frame
    - flag <[location].above[1]> invincible_frame
    - flag <entry[interaction].spawned_entity> furniture.entity:->:<entry[furniture_entity].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[frame].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.extra:->:<entry[slab].spawned_entity>
    - flag <entry[interaction].spawned_entity> furniture.item:<[item].flag[assembles]>
    - flag <entry[interaction].spawned_entity> furniture.location:<[location]>
    - flag <entry[interaction].spawned_entity> furniture.type:display_stand
    - flag <entry[interaction].spawned_entity> display_stand
    #- flag <[block]> display_stand:1
    #- flag <[block]> stand:<entry[stand].spawned_entity>



#Furniture_Interaction:
#  type: entity
#  debug: false
#  entity_type: interaction
#  mechanisms:
#    height: 1
#    width: 1
#
#
#
#Furniture_Crude_Chair:
#    type: item
#    debug: false
#    material: string
#    display name: <yellow>Assembly Kit<&co> <blue>Crude Chair
#    mechanisms:
#      components_patch:
#        item_model: string:furniture:crude_chair
#    flags:
#      assembles: crude_chair
#
#Furniture_Crude_Table:
#    type: item
#    debug: false
#    material: string
#    display name: <yellow>Assembly Kit<&co> <blue>Crude Table
#    mechanisms:
#      components_patch:
#        item_model: string:furniture:crude_table
#    flags:
#      assembles: crude_table
#
#
#Furniture_1x2_Crude_Table:
#    type: item
#    debug: false
#    material: string
#    display name: <yellow>Assembly Kit<&co> <blue>1x2 Crude Table
#    mechanisms:
#      components_patch:
#        item_model: string:furniture:1x2_crude_table
#    flags:
#      assembles: 1x2_crude_table
#
#Furniture_1x3_Crude_Table:
#    type: item
#    debug: false
#    material: string
#    display name: <yellow>Assembly Kit<&co> <blue>1x3 Crude Table
#    mechanisms:
#      components_patch:
#        item_model: string:furniture:1x3_crude_table
#    flags:
#      assembles: 1x3_crude_table
#
#Furniture_2x2_Crude_Table:
#    type: item
#    debug: false
#    material: string
#    display name: <yellow>Assembly Kit<&co> <blue>2x2 Crude Table
#    mechanisms:
#      components_patch:
#        item_model: string:furniture:2x2_crude_table
#    flags:
#      assembles: 2x2_crude_table
#
#Furniture_Runestone_Inscriber:
#    type: item
#    debug: false
#    material: string
#    display name: <yellow>Assembly Kit<&co> <blue>Runestone Inscriber
#    mechanisms:
#      components_patch:
#        item_model: string:furniture:runestone_inscriber
#    flags:
#      assembles: Runestone_Inscriber
#
#Furniture_Display_Stand:
#    type: item
#    debug: false
#    material: string
#    display name: <yellow>Assembly Kit<&co> <blue>Display Stand
#    mechanisms:
#      components_patch:
#        item_model: string:furniture:display_stand
#    flags:
#      assembles: Display_Stand
#
#
#
#Display_Stand:
#    type: item
#    debug: false
#    material: string
#    display name: <red>Display Stand
#    mechanisms:
#      custom_model_data: 1
#    lore:
#      - <gold>Use this to assemble a display stand to show off your fancy items.
#
#invis_frame:
#    type: item
#    debug: false
#    material: item_frame
#    display name: <gold>Invisible Item Frame
#    data:
#      visible: false