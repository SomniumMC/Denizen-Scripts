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
        - if <[repair_data]> == null:
            - narrate "<red>This item cannot be repaired."
            - stop

        - inventory open d:Tool_Management_GUI

        - define ingredient_list <[repair_data].get[ingredients]>
        - foreach <[ingredient_list]> as:ingredient:
            - define ingredient_material <[ingredient].before_last[-]>
            - define ingredient_amount <[ingredient].after_last[-]>
            - define ingredient_item <item[<[ingredient_material]>].with_single[quantity=<[ingredient_amount]>]>
            - adjust def:ingredient_item flag:ingredient_data:<[ingredient]>
            - define new_ingredient_list:->:<[ingredient_item]>
        - foreach <list[10|11|12|19|20|21]> as:slot:
            - define current_item <[new_ingredient_list].get[1]>
            - if <[current_item].if_null[null]> == null:
                - foreach stop
            - inventory set slot:<[slot]> o:<[current_item]> destination:<player.open_inventory>
            - define new_ingredient_list:<-:<[current_item]>
        #- inventory fill slot:<list[10|11|12|19|20|21]> o:<[new_ingredient_list]> destination:<player.open_inventory>

        on player clicks red_concrete in Tool_Management_Dissasemble_GUI:
        - define tool_bench <player.flag[tool_bench]>
        - remove <[tool_bench].flag[tool_bench.model]>
        - modifyblock <[tool_bench].flag[tool_bench.location]> air
        - remove <[tool_bench]>

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
    slots:
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
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