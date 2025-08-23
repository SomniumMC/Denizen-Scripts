# This file contains the recipes for the repair and tool management system

Tool_Management_Repair_List:
    type: data
    debug: false
    ## Vanilla Tools
    wooden_axe:
        ingredients:
            - oak_planks-2
            - stick-1
        default_dura: 59
        tools:
            - cut_1
            - file_1
    wooden_pickaxe:
        ingredients:
            - oak_planks-2
            - stick-1
        default_dura: 59
        tools:
            - cut_1
            - file_1
    wooden_shovel:
        ingredients:
            - oak_planks-1
            - stick-1
        default_dura: 59
        tools:
            - cut_1
            - file_1
    wooden_hoe:
        ingredients:
            - oak_planks-1
            - stick-1
        default_dura: 59
        tools:
            - cut_1
            - file_1
    wooden_sword:
        ingredients:
            - oak_planks-1
            - stick-1
        default_dura: 59
        tools:
            - cut_1
            - file_1
    stone_axe:
        ingredients:
            - cobblestone-2
            - stick-1
        default_dura: 131
        tools:
            - hammer_1
            - file_1
    stone_pickaxe:
        ingredients:
            - cobblestone-2
            - stick-1
        default_dura: 131
        tools:
            - hammer_1
            - file_1
    stone_shovel:
        ingredients:
            - cobblestone-1
            - stick-1
        default_dura: 131
        tools:
            - hammer_1
            - file_1
    stone_hoe:
        ingredients:
            - cobblestone-1
            - stick-1
        default_dura: 131
        tools:
            - hammer_1
            - file_1
    stone_sword:
        ingredients:
            - cobblestone-1
            - stick-1
        default_dura: 131
        tools:
            - hammer_1
            - file_1
    iron_axe:
        ingredients:
            - iron_ingot-2
            - stick-1
        default_dura: 250
        tools:
            - hammer_1
            - file_1
    iron_pickaxe:
        ingredients:
            - iron_ingot-2
            - stick-1
        default_dura: 250
        tools:
            - hammer_1
            - file_1
    iron_shovel:
        ingredients:
            - iron_ingot-1
            - stick-1
        default_dura: 250
        tools:
            - hammer_1
            - file_1
    iron_hoe:
        ingredients:
            - iron_ingot-1
            - stick-1
        default_dura: 250
        tools:
            - hammer_1
            - file_1
    iron_sword:
        ingredients:
            - iron_ingot-1
            - stick-1
        default_dura: 250
        tools:
            - hammer_1
            - file_1
    golden_axe:
        ingredients:
            - gold_ingot-2
            - stick-1
        default_dura: 131
        tools:
            - hammer_1
            - file_1
    golden_pickaxe:
        ingredients:
            - gold_ingot-2
            - stick-1
        default_dura: 131
        tools:
            - hammer_1
            - file_1
    golden_shovel:
        ingredients:
            - gold_ingot-1
            - stick-1
        default_dura: 131
        tools:
            - hammer_1
            - file_1
    golden_hoe:
        ingredients:
            - gold_ingot-1
            - stick-1
        default_dura: 131
        tools:
            - hammer_1
            - file_1
    golden_sword:
        ingredients:
            - gold_ingot-1
            - stick-1
        default_dura: 131
        tools:
            - hammer_1
            - file_1
    # Outlier Tools
    shears:
        ingredients:
            - iron_ingot-1
        default_dura: 238
        tools:
            - hammer_1
            - file_1
    fishing_rod:
        ingredients:
            - stick-2
            - string-1
        default_dura: 64
        tools:
            - cut_1
            - file_1
    ## Vanilla Armor
    leather_helmet:
        ingredients:
            - leather-3
            - string-1
        default_dura: 55
        tools:
            - needle_1
    leather_chestplate:
        ingredients:
            - leather-5
            - string-1
        default_dura: 80
        tools:
            - needle_1
    leather_leggings:
        ingredients:
            - leather-7
            - string-1
        default_dura: 75
        tools:
            - needle_1
    leather_boots:
        ingredients:
            - leather-2
            - string-1
        default_dura: 65
        tools:
            - needle_1
    chainmail_helmet:
        ingredients:
            - iron_ingot-2
        default_dura: 165
        tools:
            - hammer_1
    chainmail_chestplate:
        ingredients:
            - iron_ingot-5
        default_dura: 240
        tools:
            - hammer_1
    chainmail_leggings:
        ingredients:
            - iron_ingot-4
        default_dura: 225
        tools:
            - hammer_1
    chainmail_boots:
        ingredients:
            - iron_ingot-2
        default_dura: 210
        tools:
            - hammer_1
    iron_helmet:
        ingredients:
            - iron_ingot-2
        default_dura: 165
        tools:
            - hammer_1
            - file_1
    iron_chestplate:
        ingredients:
            - iron_ingot-5
        default_dura: 240
        tools:
            - hammer_1
            - file_1
    iron_leggings:
        ingredients:
            - iron_ingot-4
        default_dura: 225
        tools:
            - hammer_1
            - file_1
    iron_boots:
        ingredients:
            - iron_ingot-2
        default_dura: 210
        tools:
            - hammer_1
            - file_1
    golden_helmet:
        ingredients:
            - gold_ingot-2
        default_dura: 120
        tools:
            - hammer_1
            - file_1
    golden_chestplate:
        ingredients:
            - gold_ingot-5
        default_dura: 180
        tools:
            - hammer_1
            - file_1
    golden_leggings:
        ingredients:
            - gold_ingot-4
        default_dura: 165
        tools:
            - hammer_1
            - file_1
    golden_boots:
        ingredients:
            - gold_ingot-2
        default_dura: 150
        tools:
            - hammer_1
            - file_1
    ## Custom Equipment
    # Steel Gear
    steel_pickaxe:
        ingredients:
            - steel_ingot-2
            - tool_rod-1
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_axe:
        ingredients:
            - steel_ingot-2
            - tool_rod-1
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_shovel:
        ingredients:
            - steel_ingot-1
            - tool_rod-1
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_hoe:
        ingredients:
            - steel_ingot-1
            - tool_rod-1
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_sword:
        ingredients:
            - steel_ingot-1
            - tool_rod-1
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_dagger:
        ingredients:
            - steel_ingot-1
            - tool_rod-1
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_spear:
        ingredients:
            - steel_ingot-1
            - tool_rod-1
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_warhammer:
        ingredients:
            - steel_ingot-1
            - tool_rod-1
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_mace:
        ingredients:
            - steel_ingot-1
            - tool_rod-1
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_helmet:
        ingredients:
            - steel_ingot-2
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_chestplate:
        ingredients:
            - steel_ingot-5
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_leggings:
        ingredients:
            - steel_ingot-4
        default_dura: 720
        tools:
            - hammer_2
            - file_2
    steel_boots:
        ingredients:
            - steel_ingot-2
        default_dura: 720
        tools:
            - hammer_2
            - file_2