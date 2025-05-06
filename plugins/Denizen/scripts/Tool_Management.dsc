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
        - define tool_bench <context.entity>
        - define item <player.item_in_hand>
        - if <[item].script.name.if_null[null]> == config_wrench:
            - flag player tool_bench:<[tool_bench]> expire:30s
            - inventory open d:Tool_Management_Dissasemble_GUI
        - define tool_bag_inv <inventory[tool_bag_<player.inventory.slot[9].flag[id]>]>


        on player clicks red_concrete in Tool_Management_Dissasemble_GUI:
        - define tool_bench <player.flag[tool_bench]>
        - remove <[tool_bench].flag[tool_bench.model]>
        - modifyblock <[tool_bench].flag[tool_bench.location]> air
        - remove <[tool_bench]>

Tool_Bag_Event:
    type: world
    debug: true
    events:
        on player right clicks block with:tool_bag:
        - define item <player.item_in_hand>
        - define id <[item].flag[id].if_null[null]>
        - if <[id]> == null:
            - flag server satchel.total_id:+:1
            - inventory adjust slot:hand flag:id:<server.flag[satchel.total_id]> destination:<player.inventory>
            - note <inventory[Tool_Bag_Inventory_Base]> as:tool_bag_<[id]>
            - stop
        - else:
            - inventory open d:tool_bag_<[id]>'
        on player clicks item in Tool_Bag_Inventory_Base:
        - narrate test

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
    procedural items:
    - define result <list>
    # Add some logic!
    - determine <[result]>
    slots:
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL] [Item_Preview] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

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



## Tools

Tool_Bag:
    type: item
    debug: false
    display name: <gold>Tool Bag
    material: leather
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
    flags:
        lore: <yellow>A hammer made of copper.<n><light_purple>Tier 1 Hammering
        durability1: 100
        tool: hammer_1

Copper_Saw:
    type: item
    debug: false
    display name: <gold>Copper Saw
    material: brick
    flags:
        lore: <yellow>A saw made of copper.<n><light_purple>Tier 1 Sawing
        durability1: 100
        tool: saw_1

Copper_Knife:
    type: item
    debug: false
    display name: <gold>Copper Knife
    material: brick
    flags:
        lore: <yellow>A knife made of copper.<n><light_purple>Tier 1 Cutting
        durability1: 100
        tool: cut_1

Copper_File:
    type: item
    debug: false
    display name: <gold>Copper File
    material: brick
    flags:
        lore: <yellow>A file made of copper.<n><light_purple>Tier 1 Filing
        durability1: 100
        tool: file_1