# This file include all the script, items, and systems involved in the server's extensive smithing, tailoring, carpentry crafting.

# File Created:02/08/2025

Crafting_Place_Event:
    type: world
    events:
        on player places Crafting_Workbench:
        - define location <context.location>
        - define right_block <[location].with_yaw[<player.location.yaw.round_to_precision[90].add[90]>].forward_flat[1].with_yaw[!]>
        - spawn item_display[item=Crafting_Workbench] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:workbench
        - spawn Workbench_Interaction <[location].center.below[0.5]> save:interaction1
        - spawn Workbench_Interaction <[right_block].center.below[0.5]> save:interaction2
        #- define interaction <entry[interaction].spawned_entity>
        - flag <[location]> workbench.interactions:->:<entry[interaction1].spawned_entity>
        - flag <[location]> workbench.interactions:->:<entry[interaction2].spawned_entity>
        - flag <[location]> workbench.locations:->:<[location]>
        - flag <[location]> workbench.locations:->:<[right_block]>
        - flag <[location]> workbench.model:<entry[workbench].spawned_entity>

        - flag <entry[interaction1].spawned_entity> workbench.home:<[location]>
        - flag <entry[interaction2].spawned_entity> workbench.home:<[location]>
        - modifyblock <[location]> barrier
        - modifyblock <[right_block]> barrier
        - take item:Crafting_Workbench

        #- narrate "Nice <context.material>"
        on player places Crafting_Smelter:
        - define location <context.location>
        - spawn item_display[item=Crafting_Smelter;scale=2,2,2] <[location].center.with_yaw[<player.location.yaw.round_to_precision[45]>].above[0.5]> save:smelter
        - run Crafting_Station_Setup def.location:<[location]> def.item:<context.item_in_hand> def.scale:2,2 def.model:<entry[smelter].spawned_entity>
        - modifyblock <[location]> campfire

        #- take item:Crafting_Smelter
        on player places Crafting_Anvil:
        - define location <context.location>
        - spawn item_display[item=Crafting_Anvil;scale=2,2,2] <[location].center.with_yaw[<player.location.yaw.round_to_precision[45]>].above[0.5]> save:anvil
        - run Crafting_Station_Setup def.location:<[location]> def.item:<context.item_in_hand> def.scale:1,1 def.model:<entry[anvil].spawned_entity>
        - modifyblock <[location]> barrier

        #- take item:Crafting_Anvil
        on player places Crafting_Tailoring_Station:
        - define location <context.location>
        - spawn item_display[item=Crafting_Tailoring_Station;scale=1,1,1] <[location].center.with_yaw[<player.location.yaw.round_to_precision[45]>]> save:tailor_bench
        - run Crafting_Station_Setup def.location:<[location]> def.item:<context.item_in_hand> def.model:<entry[tailor_bench].spawned_entity>
        - modifyblock <[location]> barrier

        #- take item:Crafting_Tailoring_Station
        on player places Crafting_Carpentry_Bench:
        - define location <context.location>
        - spawn item_display[item=Crafting_Carpentry_Bench;scale=1,1,1] <[location].center.with_yaw[<player.location.yaw.round_to_precision[45]>]> save:carpentry_bench
        - run Crafting_Station_Setup def.location:<[location]> def.item:<context.item_in_hand> def.model:<entry[carpentry_bench].spawned_entity>
        - modifyblock <[location]> barrier

        #- take item:Crafting_Tailoring_Station
        on player places Crafting_Agriculture_Station:
        - define location <context.location>
        - spawn item_display[item=Crafting_Agriculture_Station;scale=1,1,1] <[location].center.with_yaw[<player.location.yaw.round_to_precision[45]>]> save:agriculture_station
        - run Crafting_Station_Setup def.location:<[location]> def.item:<context.item_in_hand> def.model:<entry[agriculture_station].spawned_entity>
        - modifyblock <[location]> barrier

        on player places Crafting_Masonry_Station:
        - define location <context.location>
        - spawn item_display[item=Crafting_Agriculture_Station;scale=1,1,1] <[location].center.with_yaw[<player.location.yaw.round_to_precision[45]>]> save:agriculture_station
        - run Crafting_Station_Setup def.location:<[location]> def.item:<context.item_in_hand> def.model:<entry[agriculture_station].spawned_entity>
        - modifyblock <[location]> barrier

Crafting_Start_Event:
  type: world
  events:
    on player right clicks Workbench_Interaction priority:-20:
    - ratelimit <player> 5t
    - if <player.item_in_hand.script.name> == config_wrench:
      - stop
    - define workbench <context.entity.flag[workbench.home]>
    #- narrate <[workbench]>
    - flag <player> crafting.workbench:<[workbench]>
    - inventory open d:Crafting_Station_Select_GUI
    on player clicks item in Crafting_Station_Select_GUI:
    - define item <context.item>
    - if <context.slot> in <util.list_numbers[from=11;to=17].include[<util.list_numbers[from=20;to=26]>]> && <context.clicked_inventory.script.name> == Crafting_Station_Select_GUI:
      - if <context.item.material.name> == air:
        - stop
      #- narrate <[item].flag[location]>
      - flag <player> crafting.selstation.item:<[item]>
      - flag <player> crafting.selstation.location:<player.flag[crafting.workbench].flag[workbench.links].get[<player.flag[crafting.selstation.item].flag[type]>].get[location]>
      - choose <player.flag[crafting.selstation.item].flag[type]>:
        - case smelter:
          - define skill refining
        - case anvil:
          - define skill blacksmithing
        - case tailoring_Station:
          - define skill tailoring
        - case carpentry_bench:
          - define skill carpentry
        - case agriculture_station:
          - define skill farming
        - case masonry_station:
          - define skill masonry
      - flag <player> crafting.skill:<[skill]>
      - inventory open d:Crafting_Category_Select_GUI
    on player clicks item in Crafting_Category_Select_GUI:
    - define item <context.item>
    - if <context.slot> in <util.list_numbers[from=11;to=17].include[<util.list_numbers[from=20;to=26]>]> && <context.clicked_inventory.script.name> == Crafting_Category_Select_GUI:
      - if <context.item.material.name> == air:
        - stop
      #- narrate <[item].flag[location]>

      - flag <player> crafting.category:<[item].flag[category]>
      - inventory open d:Crafting_Recipe_Select_GUI
    on player clicks item in Crafting_Recipe_Select_GUI:
    - define item <context.item>
    - if <context.slot> in <util.list_numbers[from=11;to=17].include[<util.list_numbers[from=20;to=26]>]> && <context.clicked_inventory.script.name> == Crafting_Recipe_Select_GUI:
      - if <context.item.material.name> == air:
        - stop
      #- narrate <[item].flag[path]>
      - define path <[item].flag[path]>
      #- narrate <script[Crafting_Master_Data].data_key[<[path]>]>
      - run Crafting_Recipe_Task def:<[item]>

Crafting_Recipe_Task:
  type: task
  definitions: item
  script:
  - define path <[item].flag[path]>
  - define recipe <script[Crafting_Master_Data].data_key[<[path]>]>
  - define recipe_amount <[recipe].size>
  - define tool <[recipe].last>
  - foreach <[recipe]> as:item:
    - define quantity<[loop_index]> <[item].after_last[-]>
    - define ingredient<[loop_index]> <[item].before_last[-]>
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
  - if <[success]||0> == 1:
    - define crafted_item <item[<[item].flag[recipe].before_last[-]>]>
    - if <[crafted_item].script.name||null> != null:
      - adjust def:crafted_item lore:<proc[apply_info_proc].context[<[crafted_item]>].lore.if_null[<empty>]>
    - adjust def:crafted_item quantity:<[item].flag[recipe].after_last[-]>
    #- give item:<[crafted_item]> quantity:<[item].flag[recipe].after_last[-]>
    - flag <player> crafting.item:<[crafted_item]>
    - inventory close

    - run Crafting_Station_Push

Crafting_Station_Push:
  type: task
  script:
  - define station <player.flag[crafting.selstation.location]>
  - define item <player.flag[crafting.item]>
  - define station_type <[station].flag[workstation.type]>

  - choose <[station_type]>:
    - case smelter:
      - define offset_y:-0.25
      - define offset_x:1.25
    - case anvil:
      - define offset_y:-0.5
      - define offset_x:0.5
    - case tailoring_station:
      - define offset_y:0.5
      - define offset_x:0.5
    - case carpentry_bench:
      - define offset_y:0.5
      - define offset_x:0.5
    - case agriculture_station:
      - define offset_y:0.5
      - define offset_x:0.5
    - case masonry_station:
      - define offset_y:0.5
      - define offset_x:0.5
  - define station_model <[station].flag[workstation].get[model]>
  - spawn Crafting_Minigame_Textdisplay <[station_model].location.center.with_yaw[<[station_model].location.yaw.round_to_precision[45].add[180]>].above[<[offset_y]>].forward[<[offset_x]>]> save:progress_display
  - flag <[station]> workstation.crafting.progress_display:<entry[progress_display].spawned_entity>
  - flag <[station]> workstation.crafting.progress:0
  - flag server crafting.projects:->:<[station]>

  - look <player> <[station_model].location.center>

  - repeat 5:
    - run Crafting_Minigame_Spawn def.station_location:<[station]> def.station_type:<[station_type]>
Crafting_Minigame_Spawn:
  type: task
  definitions: station_location|station_type
  script:
  - define station_model <[station_location].flag[workstation].get[model]>

  - choose <[station_type]>:
    - case smelter:
      - define offset_y:0
      - define offset_x:1.25
    - case anvil:
      - define offset_y:-0.5
      - define offset_x:0
    - case tailoring_station:
      - define offset_y:1
      - define offset_x:0.5
    - case carpentry_bench:
      - define offset_y:0.5
      - define offset_x:0.5
    - case agriculture_station:
      - define offset_y:0.5
      - define offset_x:0.5
    - case masonry_station:
      - define offset_y:0.5
      - define offset_x:0.5

  - define center_location <[station_model].location.center.with_yaw[<[station_model].location.yaw.round_to_precision[45].add[180]>].above[<[offset_y]>].forward[<[offset_x]>]>

  - define center_mod <[center_location].right[<util.random.decimal[-1].to[0.75]>].above[<util.random.decimal[0].to[1]>]>

  - spawn Crafting_Minigame_Model <[center_mod]> save:model
  - spawn Crafting_Minigame_Interaction <[center_mod].below[0.125]> save:interaction
  - define interaction <entry[interaction].spawned_entity>
  - define clicker <entry[model].spawned_entity>
  - flag <[interaction]> minigame_model:<[clicker]>
  - flag <[interaction]> station_data.location:<[station_location]>
  - flag <[interaction]> station_data.type:<[station_type]>
  - flag <[station_location]> workstation.crafting.clickers:->:<[interaction]>
  #- flag server crafting.clickers:->:<[interaction]>

  - wait 1s
  - adjust <[clicker]> item:orange_concrete

  - wait 1s
  - adjust <[clicker]> item:yellow_concrete

  - wait 1s
  - adjust <[clicker]> item:green_concrete
  - flag <[interaction]> status:ready

  - wait 2s
  - adjust <[clicker]> item:black_concrete
  - flag <[interaction]> status:failed

Crafting_Minigame_Event:
  type: world
  events:
    on player right clicks Crafting_Minigame_Interaction:
    - ratelimit <player> 5t
    - define interaction <context.entity>
    - if <context.item.script.name> == config_wrench:
      - run Crafting_Minigame_Cleanup def:<[interaction].flag[station_data.location]>
      - stop

    - if <[interaction].flag[status]> == ready:
      - playsound <[interaction].location> <player> sound:entity.arrow.hit_player sound_category:blocks volume:0.4 pitch:0.7
      - run Crafting_Minigame_Progress_Update def.station_location:<[interaction].flag[station_data.location]> def.status:success
    - else:
      - playsound <[interaction].location> <player> sound:entity.item.break sound_category:blocks volume:0.6 pitch:0.7
      - run Crafting_Minigame_Progress_Update def.station_location:<[interaction].flag[station_data.location]> def.status:failure

    - flag <[interaction].flag[station_data.location]> workstation.crafting.clickers:<-:<[interaction]>
    #- flag server crafting.clickers:<-:<[interaction]>
    - remove <[interaction].flag[minigame_model]>
    - remove <[interaction]>
    - if <[interaction].flag[station_data.location].has_flag[workstation.crafting.progress].not>:
      - stop
    - run Crafting_Minigame_Spawn def.station_location:<[interaction].flag[station_data.location]> def.station_type:<[interaction].flag[station_data.type]>
Crafting_Minigame_Delta_Event:
  type: world
  debug: false
  events:
    on delta time secondly every:5:
    - if <server.flag[crafting.projects]||null> == null || <server.flag[crafting.projects].is_empty>:
      - stop
    - foreach <server.flag[crafting.projects]> as:station:
      - foreach <[station].flag[workstation.crafting.clickers]> as:clicker:
        - if <[clicker].flag[status]> == failed:
          - run Crafting_Minigame_Progress_Update def.station_location:<[station]> def.status:failure
        #- if <[clicker].flag[station_data.location].flag[workstation.crafting.progress]> <= 5:
        #  - flag <[clicker].flag[station_data.location]> workstation.crafting.progress:-:5

Crafting_Minigame_Progress_Update:
  type: task
  definitions: station_location|status
  script:
  - define station_data <[station_location].flag[workstation]>
  - define progress_display <[station_data].deep_get[crafting.progress_display]>
  - define progress <[station_data].deep_get[crafting.progress]>
  - if <[status]> == success:
    - define progress:+:5
  - else:
    - if <[progress]> >= 5:
      - define progress:-:5
    - flag <[station_location]> workstation.crafting.fails:+:1
  - flag <[station_location]> workstation.crafting.progress:<[progress]>
  #- narrate <[progress]>
  - define progress_sub <element[-100].add[<[progress]>].abs>
  #- narrate <red><[progress_sub]>
  #- narrate <green><element[20].sub[<[progress_sub].div[5].round_up>]>

  - adjust <[progress_display]> text:<element[<&lb>].color[white]><element[|].color[green].repeat[<element[20].sub[<[progress_sub].div[5].round_up>]>]><element[|].color[red].repeat[<element[20].sub[<[progress].div[5].round_up>]>]><element[<&rb>].color[white]><&sp><element[<[station_location].flag[workstation.crafting.fails].if_null[]>].color[red].bold>

  - if <[station_location].flag[workstation.crafting.fails]> >= 20:
    - narrate "<red>You have failed your craft." targets:<[station_location].find_players_within[5]>
    - run Crafting_Minigame_Cleanup def:<[station_location]>

  - if <[progress]> >= 100:
    - run Crafting_Minigame_Cleanup def:<[station_location]>
    - playsound <[station_location]> sound:entity.player.levelup sound_category:blocks pitch:0.7 volume:0.7
    - drop item:<player.flag[crafting.item]> <player.location>

Crafting_Minigame_Cleanup:
  type: task
  definitions: station_location
  script:
  - define station_data <[station_location].flag[workstation]>
  - define progress_display <[station_data].deep_get[crafting.progress_display]>
  - foreach <[station_data].deep_get[crafting.clickers]> as:clicker:
    - remove <[clicker].flag[minigame_model]>
    - remove <[clicker]>
  - remove <[progress_display]>
  - flag <[station_location]> workstation.crafting:!
  - flag server crafting.projects:<-:<[station_location]>

Crafting_Station_Select_GUI:
  type: inventory
  inventory: chest
  title: <yellow>Select a Station
  gui: true
  procedural items:
  - define workbench_data <player.flag[crafting.workbench].flag[workbench]>
  - define result <list>
  - foreach <[workbench_data].get[links]> as:workstation key:type:
    - define station_item <item[crafting_<[type]>]>
    - adjust def:station_item flag:type:<[type]>
    - adjust def:station_item flag:location:<[workstation].get[location]>
    - define result:->:<[station_item]>
  # Add some logic!
  - determine <[result]>
  slots:
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
  - [GUINULL] [] [] [] [] [] [] [] [GUINULL]
  - [GUINULL] [] [] [] [] [] [] [] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Crafting_Category_Select_GUI:
  type: inventory
  inventory: chest
  title: <yellow>Select a Category
  gui: true
  definitions:
    name: item
  procedural items:
  - define workbench_data <player.flag[crafting.workbench].flag[workbench]>
  - define crafting_Skill <player.flag[crafting.skill]>
  - define result <list>
  - foreach <script[Crafting_Master_Data].data_key[<[crafting_Skill]>]> key:category:
    - define result:->:<item[crafting_icon_<[category]>]>
  #- choose <[workstation_type]>:
  #  - case smelter:
  #    - define result:->:<item[crafting_icon_ingots]>
  #    - define result:->:<item[crafting_icon_alloys]>
  # Add some logic!
  - determine <[result]>
  slots:
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
  - [GUINULL] [] [] [] [] [] [] [] [GUINULL]
  - [GUINULL] [] [] [] [] [] [] [] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Crafting_Recipe_Select_GUI:
  type: inventory
  inventory: chest
  title: <yellow>Select a Recipe
  gui: true
  definitions:
    name: item
  procedural items:
  - define workbench_data <player.flag[crafting.workbench].flag[workbench]>
  - define crafting_skill <player.flag[crafting.skill]>
  - define crafting_category <player.flag[crafting.category]>
  - define result <list>
  - foreach <script[Crafting_Master_Data].data_key[<[crafting_skill]>.<[crafting_category]>]> as:recipe key:item:
    - define construct_item <item[<[item].before[-]>].with_single[quantity=<[item].after[-]>]>
    - adjust def:construct_item flag:path:<[crafting_skill]>.<[crafting_category]>.<[item]>
    - adjust def:construct_item flag:recipe:<[item]>
    - adjust def:construct_item hides:attributes|ITEM_DATA|DYE
    - if <[construct_item].script.name||null> != null:
      - adjust def:construct_item lore:<proc[Apply_Info_Proc].context[<[construct_item]>].lore.if_null[<empty>]>
    - adjust def:construct_item lore:<[construct_item].lore.if_null[<empty>]><proc[Crafting_Recipe_Proc].context[<[construct_item].flag[path]>]>
    - define result:->:<[construct_item]>
  #- choose <[workstation_type]>:
  #  - case smelter:
  #    - define result:->:<item[crafting_icon_ingots]>
  #    - define result:->:<item[crafting_icon_alloys]>
  # Add some logic!
  - determine <[result]>
  slots:
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
  - [GUINULL] [] [] [] [] [] [] [] [GUINULL]
  - [GUINULL] [] [] [] [] [] [] [] [GUINULL]
  - [GUINULL] [] [] [] [] [] [] [] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Crafting_Recipe_Proc:
  type: procedure
  definitions: path
  script:
  - define ingredients <script[Crafting_Master_Data].data_key[<[path]>]>
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



## Configuration of Blocks

Crafting_Station_Setup:
    type: task
    definitions: location|item|model|scale
    script:
    - spawn Crafting_Interaction[height=<[scale].before[,].if_null[<script[Crafting_Interaction].data_key[mechanisms.height]>]>;width=<[scale].after[,].if_null[<script[Crafting_Interaction].data_key[mechanisms.width]>]>] <[location].center.below[0.5]> save:interaction
    - define interaction <entry[interaction].spawned_entity>
    - flag <[interaction]> workstation.home:<[location]>
    - flag <[location]> workstation.interactions:->:<entry[interaction].spawned_entity>
    - flag <[location]> workstation.locations:->:<[location]>
    - flag <[location]> workstation.model:<[model]>
    - flag <[location]> workstation.type:<[item].script.name.after[crafting_]>

Crafting_Config_Event:
    type: world
    events:
        on player right clicks Workbench_Interaction with:Config_Wrench:
        - ratelimit <player> 5t
        - define item <context.item>
        - define interaction <context.entity>
        - inventory adjust slot:hand destination:<player.inventory> flag:selected:<[interaction].flag[workbench.home]>
        - if <player.is_sneaking>:
          - narrate "<blue>Workbench Selected"
          - stop
        - else:
          - inventory adjust slot:hand destination:<player.inventory> flag:craftstation:!
          - inventory open d:Crafting_Configuration_GUI

        on player right clicks Crafting_Interaction with:Config_Wrench:
        - ratelimit <player> 5t
        - define wrench <context.item>
        - define interaction <context.entity>
        - if <player.is_sneaking>:
          - if <[wrench].flag[selected].if_null[<empty>]> != <empty>:
            - inventory adjust slot:hand destination:<player.inventory> flag:selected:<empty>
            - narrate "<red>Workbench Cleared"
            - stop
        #- narrate test
        - inventory adjust slot:hand destination:<player.inventory> flag:craftstation:<[interaction].flag[workstation.home]>
        - inventory open d:Crafting_Configuration_GUI
        on player clicks item in Crafting_Configuration_GUI:
        - define slot <context.slot>
        - define item <context.item>
        - define wrench <player.item_in_hand>
        - choose <[slot]>:
          - case 13:
            - define workbench:<[wrench].flag[selected]||null>
            - if <[item].material.name> == heart_of_the_sea:
              - if <[workbench].has_flag[workbench.links.<[wrench].flag[craftstation].flag[workstation.type]>]>:
                - narrate "<red>This workbench already has a similar linked station!"
                - stop
              - flag <[wrench].flag[craftstation]> workstation.linked:<[workbench]>
              - flag <[workbench]> workbench.links.<[wrench].flag[craftstation].flag[workstation.type]>.location:<[wrench].flag[craftstation]>
              - inventory close
              - narrate "<green>Linked <blue><[wrench].flag[craftstation].flag[workstation.model].item.display.strip_color>"
            - else if <[item].material.name> == ender_eye:
              - flag <[wrench].flag[craftstation].flag[workstation.linked]> workbench.links.<[wrench].flag[craftstation].flag[workstation.type]>:!
              - flag <[wrench].flag[craftstation]> workstation.linked:!
              - inventory close
              - narrate "<red>De-Linked <blue><[wrench].flag[craftstation].flag[workstation.model].item.display.strip_color>"
          - case 17:
            - if <[wrench].has_flag[craftstation]>:
              - run Crafting_Config_WorkstationCleanup def:<[wrench].flag[craftstation]>
            - else:
              - run Crafting_Config_WorkbenchCleanup def:<[wrench].flag[selected]>

Crafting_Configuration_GUI:
    type: inventory
    inventory: chest
    title: <yellow>Configuration
    gui: true
    procedural items:
    - define wrench <player.item_in_hand>
    - if <[wrench].flag[selected].if_null[<empty>]> != <empty>:
      - define selected_item:<[wrench].flag[selected].flag[workbench].get[model].item.script.name>
      - define result:->:<item[<[selected_item]>].with_single[display=<gold>Selected<&sp>Station<white><&co><&sp><item[<[selected_item]>].display>]>
    - else:
      - define result:->:Crafting_MissingWorkbench
      - define missing:1
    - if !<[wrench].flag[craftstation].has_flag[workstation.linked]>:
      - if <[missing]||null> == null:
        - if <[wrench].has_flag[selected]>:
          - define result:->:<item[heart_of_the_sea[display=<light_purple>Link Craftstation;lore=<white>Click this to link the craftstation to the workstation]]>
    - else:
      - if <[wrench].has_flag[craftstation]>:
        - define result:->:<item[ender_eye[display=<light_purple>De-Link Craftstation;lore=<white>Click this to de-link the craftstation from the workstation]]>
    #- define result <list>
    ## Add some logic!
    - determine <[result]>
    slots:
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [] [GUINULL] [] [] [] [] [Barrier[display=<red><bold>Disassemble;lore=<white>Click this to take apart this station]] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]


Crafting_Config_WorkstationCleanup:
    type: task
    definitions: location
    script:
    - define station_data <[location].flag[workstation]>
    - drop item:<[station_data].get[model].item> <[location]>
    - remove <[station_data].get[model]>
    - remove <[station_data].get[interactions]>
    - modifyblock <[station_data].get[locations]> air
    - flag <[location].flag[workstation.linked]> workbench.links.<[station_data].get[type]>:!
    - flag <[location]> workstation:!
    - inventory close

Crafting_Config_WorkbenchCleanup:
    type: task
    definitions: location
    script:
    - define station_data <[location].flag[workbench]>
    - drop item:<[station_data].get[model].item> <[location]>
    - remove <[station_data].get[model]>
    - remove <[station_data].get[interactions]>
    - foreach <[station_data].get[links]> as:workstation:
      - flag <[workstation].get[location]> workstation.linked:!
    - modifyblock <[station_data].get[locations]> air
    - flag <[location]> workbench:!
    - inventory close

Workbench_Interaction:
    type: entity
    entity_type: interaction
    mechanisms:
        width: 1.1
        height: 1.1

Crafting_Interaction:
    type: entity
    entity_type: interaction
    mechanisms:
        width: 1.1
        height: 1.1

Crafting_Minigame_Interaction:
    type: entity
    entity_type: interaction
    mechanisms:
        width: 0.25
        height: 0.25

Crafting_Minigame_Model:
    type: entity
    entity_type: item_display
    mechanisms:
        scale: 0.25,0.25,0.25
        item: red_concrete

Crafting_Minigame_Textdisplay:
  type: entity
  entity_type: text_display
  mechanisms:
    text: <element[<&lb>].color[white]><element[|].color[red].repeat[20]><element[<&rb>].color[white]>
    #see_through: false
    #text_shadowed: false
    default_background: false
    #opacity: 100
    background_color: TRANSPARENT

Crafting_Workbench:
    type: item
    material: string
    display name: <red>Crafting Workbench
    mechanisms:
      components_patch:
        item_model: string:furniture:workbench
    recipes:
      1:
        type: shaped
        input:
        - crafting_table|anvil|white_wool
        - air|*planks|air
        - *planks|*planks|*planks

Crafting_Smelter:
    type: item
    material: string
    display name: <red>Smelter
    mechanisms:
      components_patch:
        item_model: string:furniture:smelter

Crafting_Anvil:
    type: item
    material: string
    display name: <red>Anvil
    mechanisms:
      components_patch:
        item_model: string:furniture:blacksmith_anvil

Crafting_Tailoring_Station:
    type: item
    material: string
    display name: <red>Tailoring Station
    mechanisms:
      components_patch:
        item_model: string:furniture:tailoring_station

Crafting_Agriculture_Station:
    type: item
    material: string
    display name: <red>Agriculture Station
    mechanisms:
      components_patch:
        item_model: string:minecraft:composter

Crafting_Carpentry_Bench:
    type: item
    material: string
    display name: <red>Carpentry Bench
    mechanisms:
      components_patch:
        item_model: string:minecraft:fletching_table
    recipes:
      1:
        type: shaped
        input:
        - crafting_table|iron_axe|oak_log
        - air|*planks|air
        - *planks|*planks|*planks

Crafting_Masonry_Station:
    type: item
    material: string
    display name: <red>Agriculture Station
    mechanisms:
      components_patch:
        item_model: string:minecraft:stonecutter

Crafting_MissingWorkbench:
    type: item
    material: red_concrete
    display name: <red><bold>Missing Workbench!
    lore:
      - <white>Please select a workbench in order to link the station

Config_Wrench:
    type: item
    material: brick
    display name: <yellow>Configuration Wrench
    mechanisms:
      components_patch:
        item_model: string:tools:spool_of_thread
    recipes:
      1:
        type: shaped
        input:
        - iron_ingot|air|iron_ingot
        - air|crafting_table|air
        - air|stick|air

Crafting_Tailorkit:
    type: item
    material: brick
    display name: <red><bold>Missing Workbench!
    mechanisms:
      components_patch:
        item_model: string:tools:spool_of_thread

Crafting_Hammer:
    type: item
    material: brick
    display name: <red><bold>Missing Workbench!
    mechanisms:
      components_patch:
        item_model: string:tools:blacksmith_hammer

#magic_pill:
#    type: item
#    material: apple
#    display name: <red>Magic Pill
#    mechanisms:
#        custom_model_data: 1
#        components_patch:
#            consumable:
#                consume_seconds: float:1
#                animation: string:none
#                sound: string:entity.generic.drink
#                has_consume_particles: int:0
#                on_consume_effects: <element[list:10:<list[<map[type=string:minecraft:clear_all_effects]>]>]>


Crafting_Icon_Ingots:
  type: item
  material: iron_ingot
  display name: <red>Ingots
  flags:
    category: ingots
  lore:
  - <white>Refine your ore into ingots

Crafting_Icon_Alloys:
  type: item
  material: netherite_ingot
  display name: <red>Alloys
  flags:
    category: alloys
  lore:
  - <white>Combine your ingots into new stronger bars

Crafting_Icon_Armor:
  type: item
  material: iron_chestplate
  display name: <red>Armor
  flags:
    category: armor
  lore:
  - <white>Hammer together ingots into defensive armor

Crafting_Icon_Leather_Armor:
  type: item
  material: leather_chestplate
  display name: <red>Armor
  flags:
    category: leather_armor
  lore:
  - <white>Stitch together leather into protective armor

Crafting_Icon_Weapons:
  type: item
  material: iron_sword
  display name: <red>Weapons
  flags:
    category: weapons
  lore:
  - <white>Forge a weapon to surpass Copper Gear

Crafting_Icon_Leather_Materials:
  type: item
  material: leather
  display name: <red>Leather Materials
  flags:
    category: leather_materials
  lore:
  - <white>Prepare materials for crafting leather goods

Crafting_Icon_Tools:
  type: item
  material: iron_shovel
  display name: <red>Tools
  flags:
    category: tools
  lore:
  - <white>Create tools used to get more materials

Crafting_Icon_Stations:
  type: item
  material: anvil
  display name: <red>Stations
  mechanisms:
      components_patch:
        item_model: string:furniture:tailoring_station
  flags:
    category: stations
  lore:
  - <white>Build stations to craft more advanced items

Crafting_Icon_Metal_Materials:
  type: item
  material: iron_ingot
  display name: <red>Metal Materials
  flags:
    category: metal_materials
  lore:
  - <white>Prepare materials for crafting metal goods

Crafting_Icon_Wooden_Materials:
  type: item
  material: stick
  display name: <red>Wooden Materials
  flags:
    category: wooden_materials
  lore:
  - <white>Prepare materials for crafting wooden goods

Crafting_Icon_Ores:
  type: item
  material: iron_ore
  display name: <red>Ores
  flags:
    category: ores
  lore:
  - <white>Extract ores from the earth

Crafting_Icon_Furniture:
  type: item
  material: string
  display name: <red>Furniture
  mechanisms:
      components_patch:
        item_model: string:furniture:comfy_oak_stool
  flags:
    category: furniture
  lore:
  - <white>Build furniture to decorate your home

Crafting_Icon_Cooking_Tools:
  type: item
  material: brick
  display name: <red>Cooking Tools
  mechanisms:
      components_patch:
        item_model: string:cooking:tools/skillet
  flags:
    category: cooking_tools
  lore:
  - <white>Prepare tools for cooking

Crafting_Icon_Farming_Storage:
  type: item
  material: chest
  display name: <red>Farming Storage
  mechanisms:
      components_patch:
        item_model: string:minecraft:hay_block
  flags:
    category: farming_storage
  lore:
  - <white>Store your farming goods

Crafting_Icon_Wooden_Equipment:
  type: item
  material: fishing_rod
  display name: <red>Wooden Equipment
  flags:
    category: wooden_equipment
  lore:
  - <white>Prepare materials for crafting wooden equipment

Crafting_Icon_Seeds:
  type: item
  material: wheat_seeds
  display name: <red>Seeds
  mechanisms:
      components_patch:
        item_model: string:cooking:seeds/wheatseedsitem
  flags:
    category: seeds
  lore:
  - <white>Grow your own crops

Crafting_Icon_Masonry_Blocks:
  type: item
  material: stone_bricks
  display name: <red>Masonry Blocks
  flags:
    category: masonry_blocks
  lore:
  - <white>Prepare materials for crafting masonry blocks