# This file contains the relevant information for the tool management system. It is used to manage the tools and their respective properties, such as durability, salvaging, and repair costs.

# First Created: 05/2/2024

Tool_Management_Event_Main:
    type: world
    debug: true
    events:
        on player places Tool_Bench:
        - define location <context.location>
        - modifyblock <[location]> cyan_stained_glass
        - spawn item_display[item=Tool_Bench] <[location].center.with_yaw[<player.location.yaw.round_to_precision[90]>]> save:tool_bench
        - spawn tool_bench_entity <[location].center.below[0.5]> save:tool_bench_entity
        - define tool_bench <entry[tool_bench_entity].spawned_entity>
        - flag <[tool_bench]> tool_bench.location:<[location]>
        - flag <[tool_bench]> tool_bench.model:<entry[tool_bench].spawned_entity>

        on player right clicks Tool_Bench_Entity:
        - ratelimit <player> 5t
        - define tool_bench <context.entity>
        - flag player tool_bench:<[tool_bench]>
        - define tool <player.item_in_hand>
        - define bench_state <[tool_bench].flag[state].if_null[null]>
        - if <[tool].script.name.if_null[null]> == config_wrench:
            - flag player tool_bench:<[tool_bench]> expire:30s
            - inventory open d:Tool_Management_Dissasemble_GUI
        - define tool_bag_inv <inventory[tool_bag_<player.inventory.slot[9].flag[id]>].if_null[null]>
        - if <[tool].script.name.if_null[null]> in <script[Tool_Management_Repair_List].list_keys.exclude[type|debug]>:
            - define repair_data <script[Tool_Management_Repair_List].data_key[<[tool].script.name>].if_null[null]>
        - else if <[tool].material.name> in <script[Tool_Management_Repair_List].list_keys.exclude[type|debug]>:
            - define repair_data <script[Tool_Management_Repair_List].data_key[<[tool].material.name>].if_null[null]>
        - if <[repair_data].if_null[null]> == null:
            - narrate "<red>This item cannot be repaired."
            - stop

        - inventory open d:Tool_Management_GUI

        - define ingredient_list <[repair_data].get[ingredients]>
        - define tool_list <[repair_data].get[tools]>
        - foreach <[ingredient_list]> as:ingredient:
            - define ingredient_material <[ingredient].before_last[-]>
            - define ingredient_amount <[ingredient].after_last[-]>
            - define ingredient_item <item[<[ingredient_material]>].with_single[quantity=<[ingredient_amount]>]>
            - adjust def:ingredient_item flag:ingredient_data:<[ingredient]>
            - define new_ingredient_list:->:<[ingredient_item]>
        - foreach <[tool_list]> as:tool:
            - define tool_type <[tool].before_last[_]>
            - define tool_tier <[tool].after_last[_]>
            - choose <[tool_tier]>:
                - case 1:
                    - define tool_material copper
            - define tool_item <item[<[tool_material]>_<[tool_type]>].with_single[lore=<item[<[tool_material]>_<[tool_type]>].flag[lore]>]>
            - adjust def:tool_item flag:tool:<[tool]>
            - define new_tool_list:->:<[tool_item]>
        - foreach <list[10|11|12|19|20|21]> as:slot:
            - define current_item <[new_ingredient_list].get[1].if_null[null]>
            - if <[current_item]> == null:
                - foreach stop
            - inventory set slot:<[slot]> o:<[current_item]> destination:<player.open_inventory>
            - define new_ingredient_list:<-:<[current_item]>
        - foreach <list[17|18|22|23]> as:slot:
            - define current_item <[new_tool_list].get[1].if_null[null]>
            - if <[current_item]> == null:
                - foreach stop
            - inventory set slot:<[slot]> o:<[current_item]> destination:<player.open_inventory>
            - define new_tool_list:<-:<[current_item]>
        #- inventory fill slot:<list[10|11|12|19|20|21]> o:<[new_ingredient_list]> destination:<player.open_inventory>

        - inventory set slot:31 o:<item[green_concrete].with_single[display=<green>Start Repairs?]> destination:<player.open_inventory>
        - inventory set slot:33 o:<item[red_concrete].with_single[display=<red>Disassemble Tool?]> destination:<player.open_inventory>
        - inventory adjust slot:32 flag:repair_data:<[repair_data]> destination:<player.open_inventory>

        on player clicks green_concrete in Tool_Management_GUI:
        - define tool_bench <player.flag[tool_bench]>
        - define tool_bench_location <[tool_bench].flag[tool_bench.location]>
        - define item <player.item_in_hand>
        - define repair_data <player.open_inventory.slot[32].flag[repair_data].if_null[null]>
        - if <[repair_data]> == null:
            - narrate "<red>An error has occured while trying to repair this item."
            - stop
        - flag <[tool_bench]> state:repairing
        - flag <[tool_bench]> item:<[item]>
        - define ingredient_list <[repair_data].get[ingredients]>
        - define tool_list <[repair_data].get[tools]>
        #- foreach <[ingredient_list]> as:ingredient:
        #    - define ingredient_material <[ingredient].before_last[-]>
        #    - define ingredient_amount <[ingredient].after_last[-]>
        #    - define ingredient_item <item[<[ingredient_material]>].with_single[quantity=<[ingredient_amount]>]>
        #    - define ingredient_data <[ingredient_item].flag[ingredient_data].if_null[null]>
        #    - define formatted_ingredients:->:<[ingredient_item]>

        # Recipe check to see if the player has the required ingredients
        - define recipe_amount <[ingredient_list].size>
        - foreach <[ingredient_list]> as:item:
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
            - take item:<[item]> quantity:1
            - flag <[tool_bench]> item:<[item]>
            - flag <[tool_bench]> item_recipe:<[repair_data]>
            - inventory close
            - run Tool_Bench_Display def.tool_bench:<[tool_bench]>



        on player clicks item in Tool_Management_GUI:
        - define item <context.item>
        - if <context.clicked_inventory.script.name||null> != Tool_Management_GUI:
            - determine passively cancelled

        on player clicks red_concrete in Tool_Management_Dissasemble_GUI:
        - define tool_bench <player.flag[tool_bench]>
        - remove <[tool_bench].flag[tool_bench.model]>
        - modifyblock <[tool_bench].flag[tool_bench.location]> air
        - remove <[tool_bench]>

Tool_Bench_Display:
    type: task
    debug: false
    definitions: tool_bench
    script:
    - define location <[tool_bench].flag[tool_bench.location]>
    - define item <[tool_bench].flag[item]>
    - define player_yaw <player.location.yaw.round_to_precision[90]>
    - spawn item_display[item=;scale=0.5,0.5,0.5] <[location].center.above[0.85].with_yaw[<[player_yaw]>]> save:repair_display
    - flag <[tool_bench]> tool_bench.display.item:<entry[repair_display].spawned_entity>
    - define target_dura <[tool_bench].flag[item_recipe].get[default_dura]>
    - define current_dura <[tool_bench].flag[item].flag[durability1].if_null[<[item].max_durability.sub[<[item].durability>]>]>
    - spawn text_display[text=<[current_dura]>/<[target_dura]>] save:durability_text
    - flag <[tool_bench]> tool_bench.display.durability:<entry[durability_text].spawned_entity>


Tool_Bench_Display_Cleanup:
    type: task
    debug: false
    definitions: tool_bench
    script:
    - foreach <[tool_bench].flag[tool_bench.display]> as:display:
        - remove <[display]>
    - flag <[tool_bench]> tool_bench.display:!

Tool_Bag_Event:
    type: world
    debug: false
    events:
        on player right clicks block with:tool_bag:
        - define item <player.item_in_hand>
        - define id <[item].flag[id].if_null[null]>
        - if <[id]> == null:
            - flag server satchel.total_id:+:1
            - inventory adjust slot:hand flag:id:<server.flag[satchel.total_id]> destination:<player.inventory>
            - note <inventory[Tool_Bag_Inventory_Base]> as:tool_bag_<server.flag[satchel.total_id]>
            - stop
        - else:
            - if <player.is_sneaking>:
                - run tool_bag_putaway
            - else:
                - if <[item].has_flag[tool]>:
                    - stop
                - inventory open d:tool_bag_<[id]>
        on player clicks item in Tool_Bag_Inventory_Base:
        - define inventory_item <context.item>
        - define click_type <context.click>
        - define slot <context.slot>
        - if <[inventory_item].script.name.if_null[null]> == tool_bag:
            - determine cancelled
        - if <[click_type]> == left:
            - if <[inventory_item].has_flag[tool]> || <[inventory_item].material.name> == air && <context.slot> != -998:
                - playsound <player> sound_category:blocks sound:item.bundle.insert
                - stop
            - else:
              - determine passively cancelled
        - if <[click_type]> == right:
            - if <[inventory_item].has_flag[tool]> && <context.slot> != -998 && <context.clicked_inventory.script.name> == Tool_Bag_Inventory_Base:
                - playsound <player> sound_category:blocks sound:entity.arrow.hit_player
                - inventory close
                - run Tool_Bag_Select def.tool:<[inventory_item]> def.slot:<[slot]>
            - else:
              - determine passively cancelled

Tool_Bag_Select:
    type: task
    debug: false
    definitions: tool|slot
    script:
    - define bag <player.item_in_hand>
    - adjust def:bag components_patch:[minecraft:item_model=string:<[tool].components_patch.get[minecraft:item_model].replace[string:].with[]>]
    - adjust def:bag flag:tool:<[tool].flag[tool]>
    - adjust def:bag flag:slot:<[slot]>
    - inventory set slot:hand o:<[bag]> destination:<player.inventory>

Tool_Bag_Putaway:
    type: task
    debug: false
    script:
    - define bag <player.item_in_hand>
    - adjust def:bag components_patch:[minecraft:item_model=string:tools:toolbag]
    - adjust def:bag flag:tool:!
    - adjust def:bag flag:slot:!
    - inventory set slot:hand o:<[bag]> destination:<player.inventory>

Tool_Bag_Inventory_Base:
    type: inventory
    inventory: chest
    title: <gold>Tool Bag
    gui: false
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

Tool_Bench:
    type: item
    debug: false
    display name: <gold>Tool Bench
    material: anvil
    mechanisms:
        components_patch:
            item_model: string:furniture:tool_bench
    lore:
        - <yellow>A workbench for repairing and salvaging tools.
        - <blue>Right-click to open the tool management menu.

Tool_Bench_Entity:
    type: entity
    debug: false
    entity_type: interaction
    mechanisms:
        width: 1.1
        height: 1.1

Tool_Management_GUI:
    type: inventory
    inventory: chest
    title: 七七七七七七七七㆙
    gui: true
    definitions:
      ItemPreview: <player.item_in_hand>
      Inactive_Button: <item[gray_concrete].with_single[display=<white>Inactive Button].with_single[lore=<gold>This will be available after the current task is finished.]>
      FullRepair_Icon: <item[paper].with_single[display=<green>Items Required].with_single[lore=<gold>These items are required to fully repair the equipment.]>
      Tools_Icon: <item[paper].with_single[display=<green>Tools Required].with_single[lore=<gold>These tools are required to repair the equipment.]>
    slots:
    - [GUINULL] [FullRepair_Icon] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [Tools_Icon] [GUINULL]
    - [air] [air] [air] [GUINULL] [ItemPreview] [GUINULL] [GUINULL] [air] [air]
    - [air] [air] [air] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [air] [air]
    - [GUINULL] [GUINULL] [GUINULL] [Inactive_Button] [GUINULL] [Inactive_Button] [GUINULL] [GUINULL] [GUINULL]

Tool_Management_Dissasemble_GUI:
    type: inventory
    inventory: dispenser
    gui: true
    definitions:
      confirm_button: <item[red_concrete].with_single[display=<red>Dissasemble Station?]>
    slots:
    - [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [confirm_button] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL]

## Repair List
Tool_Management_Repair_List:
    type: data
    debug: false
    # Vanilla Tools
    wooden_axe:
        ingredients:
            - oak_planks-3
            - stick-2
        default_dura: 59
        tools:
            - saw_1
            - knife_1




## Tools

Tool_Bag:
    type: item
    debug: false
    display name: <gold>Tool Bag
    material: brick
    mechanisms:
        components_patch:
            item_model: string:tools:toolbag
    lore:
    - <yellow>A bag for storing tools.
    - <white><&lt><light_purple>Right Click<white><&gt> To open the tool management menu.
    - <white><&lt><aqua>F<white><&gt> To cycle between tools.

# Tier 1

Copper_Hammer:
    type: item
    debug: false
    display name: <gold>Copper Hammer
    material: brick
    mechanisms:
        components_patch:
            item_model: string:tools:iron_hammer
    flags:
        lore: <yellow>A hammer made of copper.<n><light_purple>Tier 1 Hammering
        durability1: 100
        tool: hammer_1

Copper_Saw:
    type: item
    debug: false
    display name: <gold>Copper Saw
    material: brick
    mechanisms:
        components_patch:
            item_model: string:tools:chisel
    flags:
        lore: <yellow>A saw made of copper.<n><light_purple>Tier 1 Sawing
        durability1: 100
        tool: saw_1

Copper_Knife:
    type: item
    debug: false
    display name: <gold>Copper Knife
    material: brick
    mechanisms:
        components_patch:
            item_model: string:tools:chisel
    flags:
        lore: <yellow>A knife made of copper.<n><light_purple>Tier 1 Cutting
        durability1: 100
        tool: cut_1

Copper_File:
    type: item
    debug: false
    display name: <gold>Copper File
    material: brick
    mechanisms:
        components_patch:
            item_model: string:tools:chisel
    flags:
        lore: <yellow>A file made of copper.<n><light_purple>Tier 1 Filing
        durability1: 100
        tool: file_1