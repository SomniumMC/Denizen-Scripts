# This file contains the master data scripts for crafting. The crafting recipes stored here will be organized into categories similar to the Cooking Script to state what station its done in.

Crafting_Master_Data:
    type: data
    blacksmithing:
      armor:
      # Steel Armor
        steel_helmet-1:
        - steel_ingot-5
        steel_chestplate-1:
        - steel_ingot-8
        steel_leggings-1:
        - steel_ingot-7
        steel_boots-1:
        - steel_ingot-4
      # Silver Armor
        silver_helmet-1:
        - silver_ingot-5
        silver_chestplate-1:
        - silver_ingot-8
        silver_leggings-1:
        - silver_ingot-7
        silver_boots-1:
        - silver_ingot-4
      # Slate Silver Armor
        slate_silver_helmet-1:
        - slate_silver_ingot-5
        slate_silver_chestplate-1:
        - slate_silver_ingot-8
        slate_silver_leggings-1:
        - slate_silver_ingot-7
        slate_silver_boots-1:
        - slate_silver_ingot-4
      # Test Recipes
      weapons:
      # Tutorial Dagger
        blast_iron_dagger-1:
        - iron_ingot-1
        - tool_rod-1
      # Steel
        steel_sword-1:
        - steel_ingot-2
        - tool_rod-1
        steel_dagger-1:
        - steel_ingot-1
        - tool_rod-1
        steel_spear-1:
        - steel_ingot-1
        - tool_rod-3
        steel_mace-1:
        - steel_ingot-2
        - tool_rod-2
        steel_warhammer-1:
        - steel_ingot-2
        - tool_rod-2
      # Silver
        silver_sword-1:
        - silver_ingot-2
        - tool_rod-1
        silver_dagger-1:
        - silver_ingot-1
        - tool_rod-1
        silver_spear-1:
        - silver_ingot-1
        - tool_rod-3
        silver_mace-1:
        - silver_ingot-2
        - tool_rod-2
        silver_warhammer-1:
        - silver_ingot-2
        - tool_rod-2
      # Slate Silver
        slate_silver_sword-1:
        - slate_silver_ingot-2
        - tool_rod-1
        slate_silver_dagger-1:
        - slate_silver_ingot-1
        - tool_rod-1
        slate_silver_spear-1:
        - slate_silver_ingot-1
        - tool_rod-3
        slate_silver_mace-1:
        - slate_silver_ingot-2
        - tool_rod-2
        slate_silver_warhammer-1:
        - slate_silver_ingot-2
        - tool_rod-2
      tools:
      # Steel
        steel_pickaxe-1:
        - steel_ingot-3
        - tool_rod-2
        steel_shovel-1:
        - steel_ingot-1
        - tool_rod-2
        steel_axe-1:
        - steel_ingot-3
        - tool_rod-2
        steel_hoe-1:
        - steel_ingot-2
        - tool_rod-2
      # Silver
        silver_pickaxe-1:
        - silver_ingot-3
        - tool_rod-2
        silver_shovel-1:
        - silver_ingot-1
        - tool_rod-2
        silver_axe-1:
        - silver_ingot-3
        - tool_rod-2
        silver_hoe-1:
        - silver_ingot-2
        - tool_rod-2
      # Slate Silver
        slate_silver_pickaxe-1:
        - slate_silver_ingot-3
        - tool_rod-2
        slate_silver_shovel-1:
        - slate_silver_ingot-1
        - tool_rod-2
        slate_silver_axe-1:
        - slate_silver_ingot-3
        - tool_rod-2
        slate_silver_hoe-1:
        - slate_silver_ingot-2
        - tool_rod-2
    refining:
      ingots:
        iron_ingot-16:
        - raw_iron-12
        gold_ingot-16:
        - raw_gold-12
        copper_ingot-16:
        - raw_copper-12
      alloys:
        bronze_ingot-2:
        - raw_copper-3
        - raw_tin-1
        steel_ingot-1:
        - iron_ingot-1
        - charcoal-1
        - high_carbon_raw_iron-1
      ores:
        raw_tin-1:
        - diorite-5
    tailoring:
      leather_armor:
        tailored_leather_helmet-1:
        - leather-5
        tailored_leather_chestplate-1:
        - leather-8
        tailored_leather_leggings-1:
        - leather-7
        tailored_leather_boots-1:
        - leather-4
      leather_materials:
        flesh_bound_leather-5:
        - rotten_flesh-16
        - string-4
    carpentry:
      stations:
        crafting_anvil-1:
        - iron_ingot-5
        - iron_block-3
        - iron_nugget-3
        crafting_smelter-1:
        - iron_ingot-5
        - smooth_stone-4
        - lava_bucket-1
        Crafting_Tailoring_Station-1:
        - oak_planks-5
        - iron_ingot-2
        - white_wool-2
        - string-10
        Crafting_Carpentry_Bench-1:
        - oak_planks-5
        - iron_ingot-2
        - stick-2
        Crafting_Agriculture_Station-1:
        - oak_planks-5
        - composter-1
        - new_wheat-2
        Crafting_Masonry_Station-1:
        - oak_planks-5
        - stonecutter-1
        - stone-2
      wooden_materials:
        tool_rod-1:
        - stick-1
        - leather-1
        - string-1
      wooden_equipment:
        Wooden_Fishing_Rod-1:
        - stick-3
        - string-2
        - leather-1
        carrot_on_a_stick-1:
        - Wooden_Fishing_Rod-1
        - new_carrot-1
      furniture:
        cooking_counter-1:
        - oak_planks-5
        - andesite-2
        - crafting_table-1
        cooking_middle_counter-1:
        - oak_planks-5
        cooking_sink-1:
        - copper_block-1
        - iron_ingot-2
        - water_bucket-1
        cooking_oven-1:
        - iron_block-1
        - campfire-1
        - glass-2
        cooking_oven_burner:
        - iron_ingot-1
        - charcoal-4
        furniture_crude_chair-1:
        - oak_planks-4
        - stick-2
        furniture_crude_table-1:
        - oak_planks-5
        - stick-4
        furniture_1x2_crude_table-1:
        - oak_planks-10
        - stick-4
        furniture_1x3_crude_table-1:
        - oak_planks-15
        - stick-4
        furniture_2x2_crude_table-1:
        - oak_planks-20
        - stick-4
      cooking_tools:
        bakeware-1:
        - brick-8
        cutting_board-1:
        - copper_ingot-1
        - oak_planks-2
        - stick-1
        juicer-1:
        - stone_pressure_plate-2
        mortar_and_pestle-1:
        - stone-3
        - stick-1
        mixing_bowl-1:
        - oak_planks-8
        - stick-1
        cooking_pot-1:
        - iron_ingot-3
        - stick-1
        roller-1:
        - oak_log-1
        - stick-2
        sauce_pan-1:
        - iron_ingot-1
        - stick-1
        skillet-1:
        - iron_ingot-2
        - stick-1
    farming:
      farming_storage:
        new_hay_block:
        - new_wheat-9
      seeds:
        seeds_wheat-1:
        - new_wheat-2
        seeds_carrot-1:
        - new_carrot-2
        seeds_potato-1:
        - new_potato-2
        #seeds_beetroot-1:
        seeds_melon-1:
        - new_melon_slice-2
        seeds_pumpkin-3:
        - new_pumpkin-1
        seeds_apple-1:
        - new_apple-2
    masonry:
      masonry_blocks:
        packed_mud-16:
        - new_wheat-4
        - mud-12

