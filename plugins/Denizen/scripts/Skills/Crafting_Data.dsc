# This file contains the master data scripts for crafting. The crafting recipes stored here will be organized into categories similar to the Cooking Script to state what station its done in.

Crafting_Master_Data:
    type: data
    debug: false
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
      locks:
        basic_lock-1:
        - steel_ingot-1
        - iron_nugget-5
        lockpick-3:
        - steel_ingot-1
        key_ring-1:
        - iron_ingot-1
        - iron_nugget-2
        - copper_block-1
        - gold_ingot-1
      crafting_tools:
        copper_hammer-1:
        - copper_ingot-2
        - tool_rod-1
        copper_saw-1:
        - copper_ingot-2
        - tool_rod-1
        copper_knife-1:
        - copper_ingot-1
        - tool_rod-1
        copper_file-1:
        - copper_ingot-1
        - tool_rod-1
        copper_needle-1:
        - copper_ingot-1
        bronze_hammer-1:
        - bronze_ingot-2
        - tool_rod-1
        bronze_saw-1:
        - bronze_ingot-2
        - tool_rod-1
        bronze_knife-1:
        - bronze_ingot-1
        - tool_rod-1
        bronze_file-1:
        - bronze_ingot-1
        - tool_rod-1
        bronze_needle-1:
        - bronze_ingot-1
        tool_bench-1:
        - anvil-1
        - crafting_table-1
        - iron_block-2
        tool_bag-1:
        - leather-2
        - string-4
        - iron_ingot-1
        - copper_ingot-4

    refining:
      ingots:
        iron_ingot-16:
        - raw_iron-12
        gold_ingot-16:
        - raw_gold-12
        copper_ingot-16:
        - raw_copper-12
        silver_ingot-4:
        - raw_silver-4
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
        slime_ball-1:
        - dough-2
        - fresh_water-3
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
      satchels:
        Satchel_Digger_Tier1-1:
        - leather-5
        - string-3
        - iron_ingot-1
        - cobblestone-32
        Satchel_Miner_Tier1-1:
        - leather-5
        - string-3
        - iron_ingot-1
        - raw_iron-10
        Satchel_Woodcutter_Tier1-1:
        - leather-5
        - string-3
        - iron_ingot-1
        - *log-16
        Satchel_Fisher_Tier1-1:
        - leather-5
        - string-3
        - iron_ingot-1
        - crafted_wooden_fishing_rod-1
        satchel_farming_tier1-1:
        - leather-5
        - string-3
        - iron_ingot-1
        - new_wheat-16
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
        - *planks-5
        - iron_ingot-2
        - white_wool-2
        - string-10
        Crafting_Carpentry_Bench-1:
        - *planks-5
        - iron_ingot-2
        - stick-2
        Crafting_Agriculture_Station-1:
        - *planks-5
        - composter-1
        - new_wheat-2
        Crafting_Masonry_Station-1:
        - *planks-5
        - stonecutter-1
        - stone-2
        furniture_assembly_bench-1:
        - *planks-8
        - iron_ingot-2
        - stonecutter-1
        - crafting_table-1
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
        - *planks-5
        - andesite-2
        - crafting_table-1
        cooking_middle_counter-1:
        - *planks-5
        cooking_sink-1:
        - copper_block-1
        - iron_ingot-2
        - water_bucket-1
        cooking_oven-1:
        - iron_block-1
        - campfire-1
        - glass-2
        cooking_oven_burner-1:
        - iron_ingot-1
        - charcoal-4
        cooking_storage_block-1:
        - *planks-5
        - chest-1
        - iron_ingot-4
        Furniture_Configurator-1:
        - iron_ingot-4
        - stick-2
        Furniture_Kit_1x1_Chair-1:
        - *planks-4
        - stick-2
        Furniture_Kit_1x1_Table-1:
        - *planks-5
        - stick-4
        Furniture_Kit_1x2_Table-1:
        - *planks-10
        - stick-4
        Furniture_Kit_1x3_Table-1:
        - *planks-15
        - stick-4
        Furniture_Kit_2x2_Table-1:
        - *planks-20
        - stick-4
        Furniture_Kit_Decoration-1:
        - *planks-5
        - oak_slab-2
        Enchanting_Table-1:
        - iron_block-4
        - amethyst_shard-8
        - book-1
        - steel_ingot-2
        Jukebox-1:
        - amethyst_shard-4
        - *planks-8
        - redstone-1
      cooking_tools:
        bakeware-1:
        - brick-8
        cutting_board-1:
        - copper_ingot-1
        - *planks-2
        - stick-1
        juicer-1:
        - stone_pressure_plate-2
        mortar_and_pestle-1:
        - stone-3
        - stick-1
        mixing_bowl-1:
        - *planks-8
        - stick-1
        cooking_pot-1:
        - iron_ingot-3
        - stick-1
        roller-1:
        - *log-1
        - stick-2
        sauce_pan-1:
        - iron_ingot-1
        - stick-1
        skillet-1:
        - iron_ingot-2
        - stick-1
        cooking_link_tool-1:
        - stick-1
        - string-1
        - iron_ingot-1
        - redstone-4
      alcohol_tools:
        Alcohol_Mixing_Tub-1:
        - *planks-6
        - stick-4
        - water_bucket-1
        - iron_ingot-2
        Alcohol_Fermentation_Barrel-1:
        - *planks-8
        - stick-4
        - barrel-1
        - iron_ingot-2
        Alcohol_Wineskin-1:
        - leather-2
        - string-1
        alcohol_clay_jug-1:
        - clay_ball-8
        - bucket-1
    farming:
      farming_storage:
        new_hay_block-1:
        - new_wheat-9
        new_wheat-9:
        - new_hay_block-1
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
        stone_bricks-64:
        - cobblestone-128
      concrete:
        white_concrete_powder-32:
        - sand-4
        - gravel-4
        - white_dye-1
        light_gray_concrete_powder-32:
        - sand-4
        - gravel-4
        - light_gray_dye-1
        gray_concrete_powder-32:
        - sand-4
        - gravel-4
        - gray_dye-1
        black_concrete_powder-32:
        - sand-4
        - gravel-4
        - black_dye-1
        brown_concrete_powder-32:
        - sand-4
        - gravel-4
        - brown_dye-1
        red_concrete_powder-32:
        - sand-4
        - gravel-4
        - red_dye-1
        orange_concrete_powder-32:
        - sand-4
        - gravel-4
        - orange_dye-1
        yellow_concrete_powder-32:
        - sand-4
        - gravel-4
        - yellow_dye-1
        lime_concrete_powder-32:
        - sand-4
        - gravel-4
        - lime_dye-1
        green_concrete_powder-32:
        - sand-4
        - gravel-4
        - green_dye-1
        cyan_concrete_powder-32:
        - sand-4
        - gravel-4
        - cyan_dye-1
        light_blue_concrete_powder-32:
        - sand-4
        - gravel-4
        - light_blue_dye-1
        blue_concrete_powder-32:
        - sand-4
        - gravel-4
        - blue_dye-1
        purple_concrete_powder-32:
        - sand-4
        - gravel-4
        - purple_dye-1
        magenta_concrete_powder-32:
        - sand-4
        - gravel-4
        - magenta_dye-1
        pink_concrete_powder-32:
        - sand-4
        - gravel-4
        - pink_dye-1
        # Full concrete
        white_concrete-32:
        - sand-4
        - gravel-4
        - white_dye-1
        - fresh_water-1
        light_gray_concrete-32:
        - sand-4
        - gravel-4
        - light_gray_dye-1
        - fresh_water-1
        gray_concrete-32:
        - sand-4
        - gravel-4
        - gray_dye-1
        - fresh_water-1
        black_concrete-32:
        - sand-4
        - gravel-4
        - black_dye-1
        - fresh_water-1
        brown_concrete-32:
        - sand-4
        - gravel-4
        - brown_dye-1
        - fresh_water-1
        red_concrete-32:
        - sand-4
        - gravel-4
        - red_dye-1
        - fresh_water-1
        orange_concrete-32:
        - sand-4
        - gravel-4
        - orange_dye-1
        - fresh_water-1
        yellow_concrete-32:
        - sand-4
        - gravel-4
        - yellow_dye-1
        - fresh_water-1
        lime_concrete-32:
        - sand-4
        - gravel-4
        - lime_dye-1
        - fresh_water-1
        green_concrete-32:
        - sand-4
        - gravel-4
        - green_dye-1
        - fresh_water-1
        cyan_concrete-32:
        - sand-4
        - gravel-4
        - cyan_dye-1
        - fresh_water-1
        light_blue_concrete-32:
        - sand-4
        - gravel-4
        - light_blue_dye-1
        - fresh_water-1
        blue_concrete-32:
        - sand-4
        - gravel-4
        - blue_dye-1
        - fresh_water-1
        purple_concrete-32:
        - sand-4
        - gravel-4
        - purple_dye-1
        - fresh_water-1
        magenta_concrete-32:
        - sand-4
        - gravel-4
        - magenta_dye-1
        - fresh_water-1
        pink_concrete-32:
        - sand-4
        - gravel-4
        - pink_dye-1
        - fresh_water-1