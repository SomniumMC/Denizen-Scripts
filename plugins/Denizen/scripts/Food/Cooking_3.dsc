# This file contains the entirely revamped for the third(maybe fourth) time of making a cooking system. This time it works off using Data Scripts and Map Tags to construct and read recipes off items.

# First Fried: 6/28/2024

Cooking_Eating_Module:
    type: world
    debug: false
    events:
        on player consumes item_flagged:food:
        #- if !<player.item_in_hand.has_flag[food]>:
        #  - if <player.item_in_offhand.has_flag[food]>:
        #    - feed <player> amount:<player.item_in_offhand.flag[food].sub[1]> saturation:<player.item_in_offhand.flag[food].mul[1.5].sub[0.2]>
        #  #- narrate "<green>The item in your hand has no satiety." targets:<player>
        #  #- determine cancelled
        - if <player.item_in_offhand.has_flag[food]>:
          - narrate "<green>You can only eat from your main hand." targets:<player>
          - determine cancelled
        - if <player.has_effect[hunger]>:
          - playsound sound:ENTITY.PIGLIN.JEALOUS <player> pitch:0.8 volume:0.2
          - determine cancelled
        - feed <player> amount:<player.item_in_hand.flag[food].sub[1]> saturation:<player.item_in_hand.flag[food].mul[1.5].sub[0.2]>
        - if <player.item_in_hand.material> == <material[dried_kelp]>:
          - feed <player> amount:0 saturation:-0.4
        #- if <player.item_in_hand.has_flag[dairy]>:
        #  - run Cooking_Nutrition def:<player>|dairy|<player.item_in_hand.flag[food].mul[2]>
        #- if <player.item_in_hand.has_flag[fruit]>:
        #  - run Cooking_Nutrition def:<player>|fruit|<player.item_in_hand.flag[food].mul[2]>
        #- if <player.item_in_hand.has_flag[grain]>:
        #  - run Cooking_Nutrition def:<player>|grain|<player.item_in_hand.flag[food].mul[2]>
        #- if <player.item_in_hand.has_flag[protein]>:
        #  - run Cooking_Nutrition def:<player>|protein|<player.item_in_hand.flag[food].mul[2]>
        #- if <player.item_in_hand.has_flag[vegetable]>:
        #  - run Cooking_Nutrition def:<player>|vegetable|<player.item_in_hand.flag[food].mul[2]>
        #- if <player.item_in_hand.has_flag[sugar]>:
        #  - run Cooking_Nutrition def:<player>|sugar|<player.item_in_hand.flag[food].mul[2]>
        on player consumes item_flagged:has_bowl:
        - give bowl
        on player consumes item_flagged:has_stick:
        - give stick
        on player consumes item_flagged:foodpoison:
        - if <util.random_chance[<player.item_in_hand.flag[foodpoison]>]>:
          - cast hunger duration:600t amplifier:0
          - cast confusion duration:300t amplifier:0
          - narrate "Your stomach feels really ill."
          - feed amount:-2 saturation:-5
        on player consumes item_flagged:flavored:
        - define item <context.item>
        - define effect <[item].flag[flavored].before_last[-]>
        - narrate <[item].flag[flavored]>
        - choose <[effect]>:
          - case spicy:
            - cast strength duration:600t amplifier:0
          - case sweet:
            - cast regeneration duration:600t amplifier:0
          - case savory:
            - cast regeneration duration:600t amplifier:0
          - case citrus:
            - cast speed duration:600t amplifier:0
          - case pepperiness:
            - cast speed duration:600t amplifier:0
          - case poison:
            - cast poison duration:600t amplifier:1
        on player right clicks cake:
        - determine passively cancelled
        - foreach <context.location.material.level> as:cake_slices:
          - if <context.location.material.level> >= 0:
            - adjustblock <context.location> level:<[cake_slices].add[1]>
          - if <context.location.material.level> == 6:
            - modifyblock <context.location> air
            - feed <player> amount:2 saturation:3
            #- run Cooking_Nutrition def:<player>|dairy|2
            #- run Cooking_Nutrition def:<player>|grain|2
            #- run Cooking_Nutrition def:<player>|sugar|2
            - playsound <context.location> sound:ENTITY.PLAYER.BURP sound_category:Players
          - playsound <context.location> sound:ENTITY.GENERIC.EAT sound_category:Players
          - playeffect <context.location> effect:item_crack special_data:cake
          #- run Cooking_Nutrition def:<player>|dairy|2
          #- run Cooking_Nutrition def:<player>|grain|2
          #- run Cooking_Nutrition def:<player>|sugar|2
          - feed <player> amount:2 saturation:3

#Furnace

Cooking_Furnace_Start:
    type: world
    debug: false
    events:
        on player right clicks furnace with:item_flagged:cooking_id:
        #- if <player.item_in_hand.has_lore[<green>Protein]>:
        - if <player.item_in_hand.flag[meat]> == chicken && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[cooking_cooked_chicken]>]>
        - if <player.item_in_hand.flag[meat]> == beef && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[cooking_cooked_beef]>]>
        - if <player.item_in_hand.flag[meat]> == pork && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[cooking_cooked_pork]>]>
        - if <player.item_in_hand.flag[meat]> == rabbit && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[cooking_cooked_rabbit]>]>
        - if <player.item_in_hand.flag[meat]> == mutton && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[cooking_cooked_mutton]>]>
        - if <player.item_in_hand.flag[meat]> == fish && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[cooking_cooked_fish]>]>
        - if <player.item_in_hand.flag[meat]> == horse && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[cooking_cooked_horse]>]>
        - if <player.item_in_hand.flag[meat]> == goat && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[cooking_cooked_goat]>]>
        - if <player.item_in_hand.flag[Cooking_ID]> == dough && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[new_bread]>]>
        - if <player.item_in_hand.flag[Cooking_ID]> == new_potato && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[new_baked_potato]>]>
        - if <player.item_in_hand.has_flag[Mushroom]> && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[roasted_mushroom]>]>
        - if <player.item_in_hand.flag[Cooking_ID]> == kelp && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[new_dried_kelp]>]>
        - if <player.item_in_hand.flag[Cooking_ID]> == raw_kebab && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[Cooked_Kebab]>]>
        - if <player.item_in_hand.flag[Cooking_ID]> == sunflower_seeds && !<context.location.switched>:
          - determine passively cancelled
          - take iteminhand quantity:1
          - adjustblock <context.location> switched:true
          - playsound sound:item.firecharge.use at:<context.location> sound_category:blocks pitch:0.3
          - wait 10s
          - adjustblock <context.location> switched:false
          - playsound sound:entity.generic.extinguish.fire at:<context.location> sound_category:blocks pitch:0.5
          - drop <context.location.above> <proc[apply_info_proc].context[<item[roasted_sunflower_seeds]>]>
        - if <player.item_in_hand.has_flag[Cooking_ID]> && <context.location.switched>:
          - determine cancelled

Cooking_3_Start:
    type: world
    debug: false
    events:
        on player right clicks *pressure_plate:
        - determine passively cancelled
        - inventory open d:Cooking_Index
        #- narrate <script[cooking_master_data].data_key[fruit]>
        on player clicks item in Cooking_Index:
        - if <context.item.script.name> in <list[CookingDairy|CookingFruit|CookingGrain|CookingProtein|CookingVegetable|CookingSugar|CookingMisc]>:
          - flag <player> temp_inventory_flag:<context.item.script.name.after[Cooking]>
          - flag <player> temp_inventory_page:0
          - inventory open d:Cooking_Category_Inventory

Cooking_3_Craft:
    type: world
    debug: false
    events:
#        on player clicks item in Cooking_Category_Inventory:
#        - if <context.item.script.name> !in <list[CookingButtonL|CookingNull|CookingReturn|CookingButtonR]>:
#          - if <context.clicked_inventory||null> != <player.open_inventory>:
#            - stop
#          - define item <context.item>
#          - define recipe <script[cooking_master_data].data_key[<player.flag[temp_inventory_flag]>.<[item].flag[recipe]>]>
#          #- narrate <[recipe]>
#          - define recipe_amount <[recipe].size.sub[1]>
#          - define tool <[recipe].last>
#          #- if <[tool]> == milk:
#          #  - define tool air
#          #- narrate <[tool]>
#          - foreach <[recipe]> as:item:
#            - define quantity<[loop_index]> <[item].after_last[-]>
#            - define ingredient<[loop_index]> <[item].before_last[-]>
#          - choose <[recipe_amount]>:
#            - case 1:
#              - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <player.inventory.contains_item[<[tool]>]>:
#                - define success 1
#                - take item:<[ingredient1]> quantity:<[quantity1]>
#            - case 2:
#              - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <player.inventory.contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <player.inventory.contains_item[<[tool]>]>:
#                - define success 1
#                - take item:<[ingredient1]> quantity:<[quantity1]>
#                - take item:<[ingredient2]> quantity:<[quantity2]>
#            - case 3:
#              - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <player.inventory.contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <player.inventory.contains_item[<[ingredient3]>].quantity[<[quantity3]>]>:
#                - define success 1
#                - take item:<[ingredient1]> quantity:<[quantity1]>
#                - take item:<[ingredient2]> quantity:<[quantity2]>
#                - take item:<[ingredient3]> quantity:<[quantity3]>
#            - case 4:
#              - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <player.inventory.contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <player.inventory.contains_item[<[ingredient3]>].quantity[<[quantity3]>]> && <player.inventory.contains_item[<[ingredient4]>].quantity[<[quantity4]>]>:
#                - define success 1
#                - take item:<[ingredient1]> quantity:<[quantity1]>
#                - take item:<[ingredient2]> quantity:<[quantity2]>
#                - take item:<[ingredient3]> quantity:<[quantity3]>
#                - take item:<[ingredient4]> quantity:<[quantity4]>
#            - case 5:
#              - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <player.inventory.contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <player.inventory.contains_item[<[ingredient3]>].quantity[<[quantity3]>]> && <player.inventory.contains_item[<[ingredient4]>].quantity[<[quantity4]>]> && <player.inventory.contains_item[<[ingredient5]>].quantity[<[quantity5]>]>:
#                - define success 1
#                - take item:<[ingredient1]> quantity:<[quantity1]>
#                - take item:<[ingredient2]> quantity:<[quantity2]>
#                - take item:<[ingredient3]> quantity:<[quantity3]>
#                - take item:<[ingredient4]> quantity:<[quantity4]>
#                - take item:<[ingredient5]> quantity:<[quantity5]>
#            - case 6:
#              - if <player.inventory.contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <player.inventory.contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <player.inventory.contains_item[<[ingredient3]>].quantity[<[quantity3]>]> && <player.inventory.contains_item[<[ingredient4]>].quantity[<[quantity4]>]> && <player.inventory.contains_item[<[ingredient5]>].quantity[<[quantity5]>]> && <player.inventory.contains_item[<[ingredient6]>].quantity[<[quantity6]>]>:
#                - define success 1
#                - take item:<[ingredient1]> quantity:<[quantity1]>
#                - take item:<[ingredient2]> quantity:<[quantity2]>
#                - take item:<[ingredient3]> quantity:<[quantity3]>
#                - take item:<[ingredient4]> quantity:<[quantity4]>
#                - take item:<[ingredient5]> quantity:<[quantity5]>
#                - take item:<[ingredient6]> quantity:<[quantity6]>
#          - if <[success]||0> == 1:
#            - define cooked_item <item[<[item].flag[recipe].before_last[-]>]>
#            - adjust def:cooked_item lore:<proc[Cooking_Lore_Proc].context[<[cooked_item]>]>
#            - give item:<[cooked_item]> quantity:<[item].flag[recipe].after_last[-]>
#            - if <[tool]> in <list[milk_bucket|water_bucket]>:
#              - give item:bucket
#            - else if <[tool]> == stick:
#              - take item:stick
#        - else:
#          - choose <context.item.script.name>:
#            - case CookingReturn:
#              - inventory open d:Cooking_Index
        on player closes Cooking_Category_Inventory:
        - flag <player> temp_inventory_flag:!
        - flag <player> temp_inventory_page:!

Cooking_Index:
    type: inventory
    debug: false
    inventory: chest
    title: <yellow><bold>Cooking Index
    size: 27
    gui: true
    slots:
    - [CookingNull] [CookingNull] [CookingNull] [CookingNull] [CookingIndex[lore=<empty>||<light_purple>Press this to return to the cooking menu.]] [CookingNull] [CookingNull] [CookingNull] [CookingNull]
    - [CookingTool] [CookingDairy] [CookingFruit] [CookingGrain] [CookingProtein] [CookingVegetable] [CookingSugar] [CookingMisc] [CookingStorage]
    - [CookingSeed] [CookingDye] [] [] [CookingNutrition] [] [] [] []

Cooking_Master_Data:
    type: data
    debug: false
    dairy:
      fresh_milk-4:
      - milk_bucket-1
      - milk_bucket
      butter-1:
      - fresh_milk-1
      - cooking_pot
      cream-1:
      - fresh_milk-1
      - mixing_bowl
      cheese-1:
      - fresh_milk-1
      - cooking_salt-1
      - cooking_pot
      yogurt-1:
      - fresh_milk-1
      - sauce_pan
      chocolate_yogurt-1:
      - yogurt-1
      - cocoa_powder-1
      - mixing_bowl
      apple_yogurt-1:
      - yogurt-1
      - new_apple-1
      - mixing_bowl
      sweet_berry_yogurt-1:
      - yogurt-1
      - new_sweet_berry-1
      - mixing_bowl
      pumpkin_yogurt-1:
      - yogurt-1
      - new_pumpkin-1
      - mixing_bowl
      caramel_yogurt-1:
      - yogurt-1
      - caramel-1
      - mixing_bowl
      ice_cream-1:
      - fresh_milk-1
      - cooking_salt-1
      - snowball-1
      - mixing_bowl
      chocolate_ice_cream-1:
      - ice_cream-1
      - cocoa_powder-1
      - mixing_bowl
      caramel_ice_cream-1:
      - ice_cream-1
      - caramel-1
      - mixing_bowl
      cookies_and_milk-1:
      - fresh_milk-1
      - new_cookie-1
      - mixing_bowl
    fruit:
      apple_juice-1:
      - new_apple-2
      - juicer
      apple_smoothie-1:
      - apple_juice-1
      - snowball-1
      - mixing_bowl
      apple_jelly-2:
      - apple_juice-1
      - new_sugar-1
      - sauce_pan
      caramel_apple-1:
      - new_apple-1
      - caramel-1
      - stick-1
      - stick
      apple_sauce-1:
      - new_apple-2
      - new_sugar-1
      - bowl-1
      - sauce_pan
      melon_juice-1:
      - new_melon_slice-2
      - juicer
      melon_smoothie-1:
      - melon_juice-1
      - snowball-1
      - mixing_bowl
      melon_jelly-2:
      - melon_juice-1
      - new_sugar-1
      - sauce_pan
      sweet_berry_juice-1:
      - new_sweet_berry-2
      - juicer
      sweet_berry_smoothie-1:
      - sweet_berry_juice-1
      - snowball-1
      - mixing_bowl
      sweet_berry_jelly-2:
      - sweet_berry_juice-1
      - new_sugar-1
      - sauce_pan
      glow_berry_juice-1:
      - new_glow_berry-2
      - juicer
      new_golden_apple-1:
      - new_apple-1
      - gold_nugget-8
      - cooking_pot
      fruit_punch-1:
      - apple_juice-3
      - new_sugar-1
      - juicer
      fruit_salad-1:
      - new_apple-2
      - cream-1
      - bowl-1
      - cutting_board
    grain:
      flour-1:
      - new_wheat-1
      - mortar_and_pestle
      dough-2:
      - flour-1
      - fresh_water-1
      - cooking_salt-1
      - mixing_bowl
      batter-1:
      - flour-1
      - fresh_milk-1
      - cooking_salt-1
      - mixing_bowl
      pasta-1:
      - dough-1
      - butter-1
      - roller
      new_bread-1:
      - dough-1
      - bakeware
      new_cookie-8:
      - batter-1
      - cocoa_powder-1
      - bakeware
      buttered_toast-2:
      - new_bread-1
      - butter-1
      - skillet
      grilled_cheese-1:
      - buttered_toast-1
      - butter-1
      - cheese-1
      - skillet
      melon_jelly_toast-1:
      - melon_jelly-1
      - buttered_toast-1
      - cutting_board
      apple_jelly_toast-1:
      - apple_jelly-1
      - buttered_toast-1
      - cutting_board
      sweet_berry_jelly_toast-1:
      - sweet_berry_jelly-1
      - buttered_toast-1
      - cutting_board
      carrot_cake-1:
      - batter-1
      - new_sugar-1
      - new_carrot-1
      - bakeware
      carrot_bread-1:
      - dough-1
      - new_carrot-1
      - bakeware
      pumpkin_bread-1:
      - dough-1
      - new_pumpkin-1
      - bakeware
      pumpkin_cupcake-4:
      - dough-1
      - new_pumpkin-1
      - mixing_bowl
      carrot_cupcake-4:
      - dough-1
      - new_carrot-1
      - mixing_bowl
      squid_ink_pasta-1:
      - pasta-1
      - ink_sac-1
      - cooking_pot
      mac_n_cheese-1:
      - pasta-1
      - cheese-1
      - bowl-1
      - cooking_pot
      noodle_soup-1:
      - pasta-1
      - stock-1
      - bowl-1
      - cooking_pot
      apple_pie-1:
      - dough-1
      - new_sugar-1
      - new_apple-1
      - bakeware
      sweet_berry_pie-1:
      - dough-1
      - new_sugar-1
      - new_sweet_berry-1
      - bakeware
      glow_berry_pie-1:
      - dough-1
      - new_sugar-1
      - new_glow_berry-1
      - bakeware
      chocolate_cupcake-4:
      - dough-1
      - cocoa_powder-1
      - mixing_bowl
      caramel_cupcake-4:
      - dough-1
      - caramel-1
      - mixing_bowl
      chocolate_cake-1:
      - batter-1
      - chocolate_bar-1
      - new_sugar-1
      - bakeware
      cheese_cake-1:
      - batter-1
      - cheese-1
      - new_sugar-1
      - bakeware
      pumpkin_cheese_cake-1:
      - batter-1
      - cheese-1
      - new_sugar-1
      - new_pumpkin-1
      - bakeware
      chocolate_muffin-4:
      - batter-1
      - cocoa_powder-1
      - bakeware
      carrot_muffin-4:
      - batter-1
      - new_carrot-1
      - bakeware
      pumpkin_muffin-4:
      - batter-1
      - new_pumpkin-1
      - bakeware
      caramel_muffin-4:
      - batter-1
      - caramel-1
      - bakeware
      donut-1:
      - batter-1
      - cooking_oil-1
      - cooking_pot
      chocolate_donut-1:
      - batter-1
      - cooking_oil-1
      - cocoa_powder-1
      - cooking_pot
      jelly_donut-1:
      - batter-1
      - cooking_oil-1
      - apple_jelly-1
      - cooking_pot
      cracker-4:
      - flour-3
      - cooking_salt-1
      - bakeware
      soft_pretzel-2:
      - dough-1
      - cooking_salt-1
      - bakeware
      tortilla-2:
      - flour-1
      - fresh_water-1
      - skillet
      quesadilla-1:
      - tortilla-1
      - cheese-1
      - skillet
      breakfast_burrito-1:
      - tortilla-1
      - butter-1
      - new_potato-1
      - cooking_cooked_pork-1
      - new_egg-1
      - skillet
      sugar_cookie-4:
      - flour-1
      - new_egg-1
      - butter-1
      - new_sugar-2
      - bakeware
      seed_soup-1:
      - seeds_wheat-2
      - bowl-1
      - cooking_pot
      large_cake-1:
      - batter-5
      - new_sugar-4
      - bakeware
      sunflower_seeds-4:
      - sunflower-1
      - mortar_and_pestle
      # New items
      popcorn-2:
      - corn-1
      - cooking_salt-1
      - butter-1
      - bakeware
    protein:
      ground_chicken-1:
      - cooking_raw_chicken-1
      - mortar_and_pestle
      chicken_jerky-4:
      - cooking_raw_chicken-1
      - cooking_salt-1
      - cooking_salt
      fried_chicken-1:
      - cooking_raw_chicken-1
      - flour-1
      - cooking_oil-1
      - cooking_pot
      chicken_nugget-4:
      - ground_chicken-1
      - flour-1
      - cooking_pot
      chicken_sandwich-1:
      - mayonnaise-1
      - new_bread-1
      - ground_chicken-1
      - skillet
      chicken_pot_pie-1:
      - cooking_raw_chicken-1
      - new_potato-1
      - new_carrot-1
      - dough-1
      - bakeware
      chicken_dinner-1:
      - fried_chicken-1
      - mashed_potato-1
      - new_carrot-1
      - cutting_board
      ground_beef-1:
      - cooking_raw_beef-1
      - mortar_and_pestle
      hamburger-1:
      - ground_beef-1
      - mayonnaise-1
      - new_bread-1
      - skillet
      cheeseburger-1:
      - ground_beef-1
      - mayonnaise-1
      - new_bread-1
      - cheese-1
      - skillet
      bacon_cheeseburger-1:
      - cooking_raw_pork-1
      - ground_beef-1
      - mayonnaise-1
      - new_bread-1
      - cheese-1
      - skillet
      beef_jerky-4:
      - cooking_raw_beef-1
      - cooking_salt-1
      - cooking_salt
      ground_pork-1:
      - cooking_raw_pork-1
      - mortar_and_pestle
      pork_jerky-4:
      - cooking_raw_pork-1
      - cooking_salt-1
      - cooking_salt
      baked_ham-1:
      - new_apple-1
      - cooking_raw_pork-1
      - new_sugar-1
      - bakeware
      hot_dog-1:
      - ground_pork-1
      - new_bread-1
      - mayonnaise-1
      - skillet
      bacon_and_new_eggs-1:
      - cooking_raw_pork-1
      - new_egg-1
      - skillet
      ground_fish-1:
      - cooking_raw_fish-1
      - mortar_and_pestle
      fish_jerky-4:
      - cooking_raw_fish-1
      - cooking_salt-1
      - cooking_salt
      fish_sticks-1:
      - ground_fish-1
      - flour-1
      - bakeware
      fish_sandwich-1:
      - ground_fish-1
      - new_bread-1
      - mayonnaise-1
      - skillet
      fish_and_chips-1:
      - cooking_raw_fish-1
      - flour-1
      - fries-1
      - bakeware
      mutton_jerky-4:
      - cooking_raw_mutton-1
      - cooking_salt-1
      - cooking_salt
      ground_rabbit-1:
      - cooking_raw_rabbit-1
      - mortar_and_pestle
      rabbit_jerky-4:
      - cooking_raw_rabbit-1
      - cooking_salt-1
      - cooking_salt
      new_rabbit_stew-1:
      - cooking_raw_rabbit-1
      - new_potato-1
      - new_carrot-1
      - new_brown_mushroom-1
      - bowl-1
      - cooking_pot
      mayonnaise-1:
      - new_egg-1
      - cooking_oil-1
      - juicer
      boiled_egg-1:
      - new_egg-1
      - cooking_pot
      fried_egg-1:
      - new_egg-1
      - skillet
      scrambled_egg-1:
      - new_egg-1
      - fresh_milk-1
      - cooking_salt-1
      pot_roast-1:
      - cooking_raw_beef-1
      - new_potato-1
      - new_carrot-1
      - bowl-1
      - cooking_pot
      raw_kebab-1:
      - cooking_raw_mutton-1
      - new_carrot-1
      - new_brown_mushroom-1
      - stick-1
      - stick
      ground_mutton-1:
      - cooking_raw_mutton-1
      - mortar_and_pestle
    vegetable:
      buttered_baked_potato-1:
      - new_baked_potato-1
      - butter-1
      - cooking_salt-1
      - cutting_board
      mashed_potato-1:
      - new_baked_potato-1
      - butter-1
      - cooking_salt-1
      - bowl-1
      - mixing_bowl
      potato_salad-1:
      - new_baked_potato-1
      - mayonnaise-1
      - bowl-1
      - cutting_board
      fries-1:
      - new_potato-1
      - cooking_oil-1
      - cooking_salt-1
      - cooking_pot
      potato_chips-1:
      - new_potato-1
      - cooking_oil-1
      - cooking_salt-1
      - bakeware
      potato_soup-1:
      - new_potato-1
      - stock-1
      - bowl-1
      - cooking_pot
      glazed_carrot-1:
      - new_carrot-1
      - butter-1
      - cooking_salt-1
      - sauce_pan
      carrot_soup-1:
      - new_carrot-1
      - stock-1
      - bowl-1
      - cooking_pot
      pickled_beets-1:
      - new_beetroot-1
      - vinegar-1
      - cooking_pot
      new_pumpkin_pie-1:
      - new_pumpkin-1
      - new_egg-1
      - new_sugar-1
      - bakeware
      pumpkin_soup-1:
      - new_pumpkin-1
      - stock-1
      - bowl-1
      - cooking_pot
      roasted_mushroom-1:
      - new_brown_mushroom-1
      - new_brown_mushroom
      new_mushroom_soup-1:
      - new_brown_mushroom-3
      - bowl-1
      - cooking_pot
      stuffed_mushroom-1:
      - new_brown_mushroom-1
      - buttered_toast-1
      - cheese-1
      - bakeware
      mushroom_steak-1:
      - new_brown_mushroom-1
      - ground_beef-1
      - butter-1
      - skillet
      cream_of_mushroom-1:
      - new_brown_mushroom-1
      - cream-1
      - bowl-1
      - sauce_pan
      new_beetroot_soup-1:
      - new_beetroot-1
      - stock-1
      - bowl-1
      - cooking_pot
      netherwart_soup-1:
      - new_netherwart-4
      - stock-1
      - bowl-1
      - cooking_pot
      new_golden_carrot-1:
      - new_carrot-1
      - gold_nugget-8
      - cooking_pot
      mushroom_oil-1:
      - new_brown_mushroom-1
      - roller
    sugar:
      new_sugar-1:
      - new_sugar_cane-1
      - mortar_and_pestle
      cocoa_powder-2:
      - new_cocoa_beans-1
      - new_sugar-1
      - mortar_and_pestle
      chocolate_bar-1:
      - new_cocoa_beans-1
      - fresh_milk-1
      - new_sugar-1
      - sauce_pan
      hot_chocolate-1:
      - cocoa_powder-1
      - fresh_milk-1
      - marshmallow-1
      - sauce_pan
      chocolate_bacon-1:
      - chocolate_bar-1
      - cooking_raw_pork-1
      - sauce_pan
      chocolate_pudding-1:
      - cocoa_powder-1
      - fresh_milk-1
      - sauce_pan
      chocolate_caramel_fudge-1:
      - chocolate_bar-1
      - caramel-1
      - bakeware
      caramel-1:
      - new_sugar-1
      - fresh_milk-1
      - cooking_salt-1
      - sauce_pan
      marshmallow-4:
      - new_sugar-1
      - sauce_pan
      gummy_bears-8:
      - new_sugar-1
      - red_dye-1
      - green_dye-1
      - sauce_pan
      jelly_beans-8:
      - new_sugar-1
      - orange_dye-1
      - blue_dye-1
      - sauce_pan
      marshmallow_chicks-4:
      - new_sugar-1
      - yellow_dye-1
      - pink_dye-1
      - sauce_pan
      cotton_candy-4:
      - new_sugar-1
      - cooking_pot
      chocolate_roll-1:
      - dough-1
      - cocoa_powder-1
      - fresh_milk-1
      - bakeware
      smores-1:
      - cracker-1
      - marshmallow-1
      - chocolate_bar-1
      - bakeware
      trailmix-4:
      - seeds_wheat-1
      - chocolate_bar-1
      - cooking_salt-1
      - new_sweet_berry-1
      - bakeware
    misc:
      fresh_water-1:
      - water_bucket-1
      - water_bucket
      cooking_salt-1:
      - fresh_water-1
      - cooking_pot
      cooking_oil-1:
      - seeds_wheat-2
      - roller
      stock-4:
      - bone-1
      - cooking_pot
      vinegar-2:
      - new_potato-1
      - cooking_pot
      yeast-4:
      - flour-1
      - fresh_water-1
      - mixing_bowl
      Sauce_Stew_Base-1:
      - cooking_salt-1
      - new_egg-1
      - mixing_bowl
      Broth_Stew_Base-1:
      - stock-1
      - cooking_salt-1
      - bone-1
      - mixing_bowl
      Alcohol_Stew_Base-1:
      - yeast-1
      - new_sugar-1
      - mixing_bowl


      cooking_recipe_pack-1:
      - cooking_recipe_fragment-9
      - cooking_recipe_fragment
      cooking_recipe_fragment-1:
      - cookingrecipe-1
      - cookingrecipe






Cooking_Category_Inventory:
    type: inventory
    debug: false
    inventory: chest
    gui: true
    procedural items:
    - define page <player.flag[temp_inventory_page]>
    - define list <list>
    - define inventory_flag <player.flag[temp_inventory_flag]>
    - if <[inventory_flag]> in <list[dairy|fruit|grain|protein|vegetable|sugar|misc]>:
      - foreach <script[cooking_master_data].data_key[<[inventory_flag]>].keys.get[<[page].mul[45].add[1]>].to[<[page].add[1].mul[45]>]> as:item:
        - define full_item <item[<[item].before_last[-]>]>
        - define quantity <[item].after_last[-]>
        #- if <[item].before_last[-]> in <player.flag[cooking_recipes]||null>:
        #  - define constructed_item <item[CookingMissingRecipe].with_single[display=<[full_item].display>]>
        - define constructed_item <item[<[full_item].material>].with_single[display=<[full_item].display>]>
        - adjust def:constructed_item flag:recipe:<[item]>
        - adjust def:constructed_item lore:<proc[Cooking_Lore_Proc].context[<[full_item]>|<[inventory_flag]>|<[quantity]>]>
        - adjust def:constructed_item custom_model_data:<[full_item].custom_model_data>
        - adjust def:constructed_item quantity:<[quantity]>
        - define temp_list:->:<[constructed_item]>
    - determine <[temp_list]>
    slots:
    - [CookingButtonL] [CookingNull] [CookingReturn] [CookingNull] [air] [CookingNull] [CookingNull] [CookingNull] [CookingButtonR]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

#Cooking_Inventory_Display:
#  type: procedure
#  script:
#  - foreach <script[cooking_master_data].data_key[fruit].keys.get[<[page].mul[45].add[1]>].to[<[page].add[1].mul[45]>]> as:item:
#          - define full_item <item[<[item].before_last[-]>]>
#          - define quantity <[item].after_last[-]>
#          #- if <[item].before_last[-]> in <player.flag[cooking_recipes]||null>:
#          #  - define constructed_item <item[CookingMissingRecipe].with_single[display=<[full_item].display>]>
#          - define constructed_item <item[<[full_item].material>].with_single[display=<[full_item].display>]>
#          - adjust def:constructed_item flag:recipe:<[item]>
#          - adjust def:constructed_item lore:<proc[Cooking_Lore_Proc].context[<[full_item]>|<[inventory_flag]>|<[quantity]>]>
#          - adjust def:constructed_item custom_model_data:<[full_item].custom_model_data>
#          - adjust def:constructed_item quantity:<[quantity]>
#          - define temp_list:->:<[constructed_item]>
#  - determine true


Cooking_Recipe_Event:
    type: world
    debug: false
    events:
      on player right clicks block with:CookingRecipe:
      - if <player.item_in_hand.has_flag[Recipe]>:
        - define Recipe:<player.inventory.slot[Hand].flag[Recipe]>
        - if <[Recipe]> !in <player.flag[Cooking_Recipes]>:
          - take slot:hand quantity:1
          - flag player Cooking_Recipes:->:<[Recipe]>
          - define Recipe_Name:<[Recipe].replace_text[_].with[ ].to_titlecase>
          - narrate targets:<player> "<aqua>You have unlocked the recipe for <gold><[Recipe_Name]><white>!"
          - playsound <player> sound:entity.arrow.hit.player sound_category:blocks
        - else if <[Recipe]> in <player.flag[Cooking_Recipes]>:
          - narrate targets:<player> "<red>You already have this recipe unlocked."
      on player right clicks block with:cooking_recipe_pack:
      - take item:cooking_recipe_pack
      - define list <list[fruit|dairy|grain|protein|vegetable|sugar].random>
      - define recipe <script[cooking_master_data].data_key[<[list]>].keys.random.before_last[-]>
      #- narrate <item[Cookingrecipe].with_flag[Recipe:<[recipe]>].with_map[lore=<White>This unlocks the knowledge of the <aqua><[recipe].replace_text[_].with[ ].to_titlecase> <white>Recipe.]>
      - give item:<item[Cookingrecipe].with_flag[Recipe:<[recipe]>].with_map[lore=<White>This unlocks the knowledge of the <aqua><[recipe].replace_text[_].with[ ].to_titlecase> <white>Recipe.]>

Cooking_Recipe_Task:
    type: task
    debug: false
    script:
    - if <player.open_inventory.contains_item[CookingSelectedRecipe]>:
      - if if <[2]> in <player.flag[Recipe]>:
        - narrate targets:<[1]> "<red>You already have this recipe unlocked."
        - determine cancelled
      - else <[2]> !in <player.flag[Recipe]>:
        - if <player.inventory.contains_item[paper]>:
          - take item:paper quantity:1
          #- run Cooking_Recipe_Display
          - give item:<item[Cookingrecipe].with_flag[Recipe:<[2]>].with_map[lore=<White>This unlocks the knowledge of the <aqua><[2].replace_text[_].with[ ]> <white>Recipe.]>
        - else:
          - narrate targets:<[1]> "<red>An error has occured, a recipe has not been generated."

Cooking_Recipe_Creator:
    type: command
    debug: false
    description: This allows for the basic creation of recipes that unlock a flag to allow players to craft certain items.
    name: genrecipe
    usage: /genrecipe <&lt>Recipe_ID<&gt>
    tab completions:
      default: Recipe_ID
    script:
    - give item:<item[Cookingrecipe].with_flag[Recipe:<context.raw_args>].with_map[lore=<White>This unlocks the knowledge of the <aqua><context.raw_args.replace_text[_].with[ ].to_titlecase> <white>Recipe.]>
    - narrate targets:<player> "<white>Created a recipe for <aqua><context.raw_args.replace_text[_].with[ ].to_titlecase> <white>with an ID flag of <aqua><context.raw_args>"

Cooking_Recipe_Forget:
    type: command
    debug: false
    description: This allows you to forget(remove the flag) of a recipe your character has stored.
    name: forgetrecipe
    usage: /forgetrecipe <&lt>Recipe_ID<&gt>
    tab completions:
      default: Recipe_ID
    script:
    - flag <player> Cooking_Recipes:<-:<context.raw_args>
    - narrate targets:<player> "<white>Forgotten recipe for <red><context.raw_args.replace_text[_].with[ ].to_titlecase> <white>with an ID flag of <red><context.raw_args>"

Cooking_Recipe_Mob_Drop:
  type: world
  debug: false
  events:
    on player kills entity:
    - if <context.entity.type> in <list[zombie|skeleton|creeper|enderman|witch|spider]>:
      - if <util.random_chance[5]>:
        - drop item:cooking_recipe_pack quantity:1 <context.location>

Cooking_Proc_Reformat:
  type: procedure
  debug: false
  definitions: item
  script:
  - determine <item[<[item]>].with_single[lore=<proc[Cooking_Lore_Proc].context[<[item]>]>]>

Cooking_Lore_Proc:
  type: procedure
  debug: false
  definitions: item|category|quantity
  script:
  - define lore <empty>
  - if <[item].lore||null> != null:
    - define lore <[item].lore><n><gray><element[                          ].strikethrough>
  - if <[item].has_flag[fruit]>:
    - define nutrients:->:fruit
  - if <[item].has_flag[dairy]>:
    - define nutrients:->:dairy
  - if <[item].has_flag[grain]>:
    - define nutrients:->:grain
  - if <[item].has_flag[protein]>:
    - define nutrients:->:protein
  - if <[item].has_flag[vegetable]>:
    - define nutrients:->:vegetable
  - if <[item].has_flag[sugar]>:
    - define nutrients:->:sugar
  - if <[nutrients]||null> != null:
    - define lore <[lore]><n><green>Nutrients<&co><n><red><[nutrients].comma_separated.to_titlecase>
  - if <[item].has_flag[food]>:
    - define lore "<[lore]><n><gold>Replenishes <yellow><[item].flag[food]> <gold>hunger."
  - if <[item].has_flag[foodpoison]>:
    - define lore <[lore]><n><red>Dangerous<&co><&sp><gray><[item].flag[foodpoison]><&pc>
  - if <[category]||null> != null:
    - define ingredients <script[cooking_master_data].data_key[<[category]>.<[item].script.name>-<[quantity]>]>
    - define tool <[ingredients].last.replace[_].with[ ].to_titlecase>
    - foreach <[ingredients].get[1].to[<[ingredients].size.sub[1]>]> as:text:
      - if <item[<[text].before_last[-]>].display||null> == null:
        - define item_name "<item[<[text].before_last[-]>].material.name.replace[_].with[ ].to_titlecase> x<[text].after_last[-]>"
      - else:
        - define item_name "<item[<[text].before_last[-]>].display> x<[text].after_last[-]>"
      - define ingredient_list:->:<[item_name].strip_color>
    - define lore <[lore]><n><gray><element[                          ].strikethrough>
    - define lore "<[lore]><n><dark_purple>Ingredients<&co><n><blue><[ingredient_list].comma_separated> <gold><&lb><red><[tool]><gold><&rb>"
  #- define lore
  - determine <[lore]>


Cooking_Recipe_Generator:
  type: procedure
  debug: false
  definitions: def
  script:
  - define categories <list[fruit|dairy|grain|protein|sugar]>
  - define recipe_name <script[cooking_master_data].data_key[<[categories].random>].keys.random.before_last[-]>
  - define recipe <item[Cookingrecipe].with_flag[Recipe:<[recipe_name]>].with_map[lore=<White>This unlocks the knowledge of the <aqua><[recipe_name].replace_text[_].with[ ].to_titlecase> <white>Recipe.]>
  - determine <[recipe]>

Cooking_Recipe_Pack:
  type: item
  debug: false
  material: brick
  display name: <gold>Wrapped Recipe Pack
  lore:
  - <blue>Open this up to reveal a cooking recipe!
  #recipes:
  #  1:
  #    type: shaped
  #    input:
  #    - Cooking_Recipe_Fragment|Cooking_Recipe_Fragment|Cooking_Recipe_Fragment
  #    - Cooking_Recipe_Fragment|Cooking_Recipe_Fragment|Cooking_Recipe_Fragment
  #    - Cooking_Recipe_Fragment|Cooking_Recipe_Fragment|Cooking_Recipe_Fragment

CookingRecipe:
  type: item
  debug: false
  material: flower_banner_pattern
  display name: <green>Recipe
  mechanisms:
    custom_model_data: 57

Cooking_Recipe_Fragment:
  type: item
  debug: false
  material: brick
  display name: <blue>Cooking Recipe Fragment
  lore:
  - <gold>Combine this together to create an Unopened Recipe Pack
  #recipes:
  #  1:
  #    type: shapeless
  #    input: CookingRecipe

Cooking_Animal_Breeding:
    type: world
    debug: false
    events:
      on player right clicks chicken:
      - if <player.item_in_hand.has_flag[seed]> && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - take flagged:seed quantity:1
      on player right clicks cow:
      - if <player.item_in_hand.flag[cooking_tag]> == grain && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - take iteminhand quantity:1
      on player right clicks sheep:
      - if <player.item_in_hand.flag[cooking_tag]> == grain && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - take iteminhand quantity:1
      on player right clicks pig:
      - if <player.item_in_hand.flag[cooking_tag]> == vegetable && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - take iteminhand quantity:1
      on player right clicks goat:
      - if <player.item_in_hand.flag[cooking_tag]> == grain && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - take iteminhand quantity:1
      on player right clicks rabbit:
      - if <player.item_in_hand.flag[cooking_tag]> == vegetable && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - take iteminhand quantity:1
      on player right clicks horse:
      - if <player.item_in_hand.flag[cooking_tag]> == fruit && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - take iteminhand quantity:1
      on player right clicks donkey:
      - if <player.item_in_hand.flag[cooking_tag]> == fruit && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - take iteminhand quantity:1
      on player right clicks mule:
      - if <player.item_in_hand.flag[cooking_tag]> == fruit && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - take iteminhand quantity:1
      on player right clicks wolf:
      - if <player.item_in_hand.has_flag[protein]> && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - adjust <context.entity> health:20
        - take iteminhand quantity:1
      on player right clicks fox:
      - if <player.item_in_hand.flag[cooking_tag]> == fruit && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - take iteminhand quantity:1
      on player right clicks mooshroom:
      - if <player.item_in_hand.flag[cooking_tag]> == grain && !<context.entity.breeding> && <context.entity.can_breed>:
        - ratelimit <player> 1s
        - adjust <context.entity> breed:true
        - take iteminhand quantity:1


Cooking_Vanilla_Interact:
    type: world
    debug: false
    events:
      on player right clicks sugar_cane:
      - if <context.location.above.material.name> == air:
        - if <player.item_in_hand.material.name> == bone_meal:
          - take item:bone_meal quantity:1
          - modifyblock <context.location.above> sugar_cane
          - playeffect effect:BONE_MEAL_USE at:<context.location>
          - playsound sound:BONE.MEAL.USE at:<context.location> sound_category:blocks
      on brown_mushroom drops brown_mushroom from breaking:
      - determine passively cancelled
      - drop new_brown_mushroom <context.location>
      on red_mushroom drops red_mushroom from breaking:
      - determine passively cancelled
      - drop new_red_mushroom <context.location>
      on crimson_fungus drops crimson_fungus from breaking:
      - determine passively cancelled
      - drop new_crimson_fungus <context.location>
      on warped_fungus drops warped_fungus from breaking:
      - determine passively cancelled
      - drop new_warped_fungus <context.location>
      on player picks up brown_mushroom:
      - if <context.item.material.name> == brown_mushroom:
         - determine item:new_brown_mushroom[quantity=<context.item.quantity>]
      on player picks up red_mushroom:
      - if <context.item.material.name> == red_mushroom:
         - determine item:new_red_mushroom[quantity=<context.item.quantity>]
      on player picks up crimson_fungus:
      - if <context.item.material.name> == crimson_fungus:
         - determine item:new_crimson_fungus[quantity=<context.item.quantity>]
      on player picks up warped_fungus:
      - if <context.item.material.name> == warped_fungus:
         - determine item:new_warped_fungus[quantity=<context.item.quantity>]
      on player breaks cake bukkit_priority:HIGHEST:
      - if <context.material.level> == 0:
        - drop large_cake <context.location>
      on short_grass drops wheat_seeds from breaking:
      - determine passively cancelled
      - drop seeds_wheat <context.location>
      on tall_grass drops wheat_seeds from breaking:
      - determine passively cancelled
      - drop seeds_wheat <context.location>
      on fern drops wheat_seeds from breaking:
      - determine passively cancelled
      - drop seeds_wheat <context.location>
      on large_fern drops wheat_seeds from breaking:
      - determine passively cancelled
      - drop seeds_wheat <context.location>
      on kelp drops kelp from breaking:
      - determine passively cancelled
      - drop new_kelp <context.location>

Cooking_Milking:
    type: world
    debug: false
    events:
        on player right clicks mooshroom:
        - if <player.item_in_hand.material.name> == bowl:
          - determine passively cancelled
          - playsound sound:ENTITY.MOOSHROOM.MILK at:<context.location> sound_category:neutral
          - take item:bowl
          - give item:new_mushroom_soup

Cooking_Composter:
    type: world
    debug: false
    events:
        on player right clicks composter:
        - foreach <context.location.material.level> as:compost_level:
          - if <player.item_in_hand.has_flag[seed]> && <[compost_level]> <= 7:
            - determine passively cancelled
            - take iteminhand quantity:1
            - playsound sound:block.composter.fill at:<context.location> sound_category:blocks
            - if <util.random_chance[30]>:
              - adjustblock <context.location> level:<[compost_level].add[1]>
              - playeffect effect:COMPOSTER_FILL_ATTEMPT at:<context.location>
              - playsound sound:BLOCK.COMPOSTER.FILL.SUCCESS at:<context.location> sound_category:blocks
          - if <player.item_in_hand.has_flag[food]> && <[compost_level]> <= 7:
            - determine passively cancelled
            - take iteminhand quantity:1
            - playsound sound:block.composter.fill at:<context.location> sound_category:blocks
            - if <util.random_chance[65]>:
              - adjustblock <context.location> level:<[compost_level].add[1]>
              - playeffect effect:COMPOSTER_FILL_ATTEMPT at:<context.location>
              - playsound sound:BLOCK.COMPOSTER.FILL.SUCCESS at:<context.location> sound_category:blocks

Cooking_Grass_Harvest:
     type: world
     debug: false
     events:
        on player breaks grass_block with:*_hoe bukkit_priority:HIGHEST:
        - determine passively cancelled
        - foreach <player.item_in_hand.durability> as:item_durability:
          - inventory adjust slot:hand durability:<[item_durability].add[1]>
        - modifyblock <context.location> dirt
        - if <util.random_chance[10]>:
            - drop <context.location> item:<item[seeds_<script[Farming_Seeds].data_key[vanilla].random>]> quantity:1
            #- case 2:
            #  - drop <context.location> item:seeds_carrot quantity:1
            #- case 3:
            #  - drop <context.location> item:seeds_potato quantity:1
            #- case 4:
            #  - drop <context.location> item:seeds_pumpkin quantity:1
            #- case 5:
            #  - drop <context.location> item:seeds_melon quantity:1
            #- case 6:
            #  - drop <context.location> item:seeds_beetroot quantity:1
            #- case 7:
            #  - drop <context.location> item:seeds_sweet_berry quantity:1
            #- case default:
            #  - determine cancelled

Cooking_Sound_Bakeware:
    type: task
    debug: false
    script:
    - playsound <player> sound:block.bone.block.place pitch:0.8 volume:0.7 sound_category:blocks
    - wait 4t
    - playsound <player> sound:BLOCK.FIRE.AMBIENT pitch:1.7 volume:1 sound_category:blocks
Cooking_Sound_Cutting_Board:
    type: task
    debug: false
    script:
    - playsound <player> sound:item.axe.strip pitch:1.5 volume:0.7 sound_category:blocks
    - wait 4t
    - playsound <player> sound:item.axe.strip pitch:1.5 volume:0.7 sound_category:blocks
    - wait 4t
    - playsound <player> sound:item.axe.strip pitch:1.5 volume:0.7 sound_category:blocks
Cooking_Sound_Juicer:
    type: task
    debug: false
    script:
    - playsound <player> sound:block.beehive.shear pitch:0.7 volume:0.7 sound_category:blocks
Cooking_Sound_Mortar_And_Pestle:
    type: task
    debug: false
    script:
    - playsound <player> sound:item.axe.scrape pitch:0.4 volume:0.8 sound_category:blocks
Cooking_Sound_Mixing_Bowl:
    type: task
    debug: false
    script:
    - playsound <player> sound:item.axe.strip pitch:0.8 volume:0.7 sound_category:blocks
    - wait 3t
    - playsound <player> sound:item.axe.strip pitch:1.2 volume:0.7 sound_category:blocks
Cooking_Sound_Cooking_Pot:
    type: task
    debug: false
    script:
    - playsound <player> sound:BLOCK.BREWING.STAND.BREW pitch:0.4 volume:0.4 sound_category:blocks
Cooking_Sound_Roller:
    type: task
    debug: false
    script:
    - playsound <player> sound:block.big.dripleaf.tilt_up pitch:0.1 volume:0.7 sound_category:blocks
Cooking_Sound_Sauce_Pan:
    type: task
    debug: false
    script:
    - playsound <player> sound:BLOCK.CHAIN.BREAK pitch:0.4 volume:0.4 sound_category:blocks
    - wait 4t
    - playsound <player> sound:BLOCK.FIRE.AMBIENT pitch:1.7 volume:1 sound_category:blocks
Cooking_Sound_Skillet:
    type: task
    debug: false
    script:
    - playsound <player> sound:block.anvil.land pitch:0.6 volume:0.35 sound_category:blocks
    - wait 4t
    - playsound <player> sound:BLOCK.FIRE.AMBIENT pitch:1.7 volume:1 sound_category:blocks

Cooking_Storage_Block:
    type: world
    debug: false
    events:
       on player right clicks block with:salt_block:
       - determine cancelled

# Guide Book

Cooking_Guide_Update:
    type: world
    debug: false
    events:
      on player right clicks block with:Cooking_Guide:
      - define new_model <item[Cooking_Guide]>
      - inventory set o:<item[Cooking_Guide[quantity=<context.item.quantity>]]> destination:<context.hand> slot:<context.hand>
      #- if <context.item.flag[cooking_version]> != <[new_model].flag[cooking_version]>:
      #  - inventory set o:Cooking_Guide destination:<context.hand> slot:<context.hand>

Cooking_Guide:
    type: item
    debug: false
    material: written_book
    mechanisms:
      custom_model_data: 273
    flags:
      cooking_version: 1
    lore:
    - <white>This seems to be a standard cookbook for aspiring chefs.
    - <n>
    - <gray><italic>It's pages seem to update and condense together as time passes by.
    book: Cooking_Guide_Bookscript

Cooking_Guide_Bookscript:
    type: book
    debug: false
    title: <green>Ingredients and You
    author: <gold><bold>Talfein, The Chef
    signed: true

    text:
    - <n><n><n>      <green><bold>Ingredients<n>         and<n>         You<n><n><n><n><n><n>          <white><black>by<n>    <gold>Talfein, The Chef
    - <light_purple>CH 1: A New Beginning<n><p>  <white><black>Welcome to the the start of a wonderful career and your baseline to surviving the first day and beyond. Within these pages you will find the first steps to making the tools and ingredients you need to survive.
    - To begin with, if you ever lose this book, you can always create another by taking your standard cooking salt in your main hand and a book in the offhand.<p>This invokes the basic magic within the world to bring this guide back to you.
    - There are many basic recipes involving the usage of salt that you can perform without needing any cooking implements similar to the book. By taking some raw animal meat you can create jerky. It is not much to fill your belly-
    - However, it does do away with the nasty chance of <red>Food Poisoning<white><black>. The only problem with using salt is you might not be familiar with how to obtain it!<n><n>       -----<&gt><n>        <Gold><bold>Salt
    - <gold><bold>Salt:<n><n><white><black>This could be a difficult thing to find, but also plentiful when you least know it. However, if you are familiar with its sources, it's a cinch to find it in the wild or in your future kitchen. One of the easiest methods to procure it would be using a-
    - bucket of water with a metal pot in the <gold><bold>Cooking Station<white><black>, however that is only when you have access to metals and a proper fire. A much simpler method would be to dig up clay in rivers or finding it in deposits of rock.<n><n>       -----<&gt><n>      <Gold><bold>Campfire
    - <gold><bold>Campfires and Furnaces:<n><n><white><black>Primitive cooking. The simpler times of man, animal, rock, meat, fire, and finally Food. Cooking meat in a furnace or a campfire is a simple affair, just hold your slab of raw flesh and apply it directly to the implement.
    - Cooking meat like this similarly removes the chance of <red>Food Poisoning<white><black> alike salting, it also seems to be more nutritious than gorging on it. However, once you stock up on enough of this to eat to get where you're going, it's smart to keep a supply for other recipes.
    - While eating basic food like this can keep you alive for the interim, wouldn't life be a little more exilhirating if we had some more ingredients to cook with? Or even somewhere to cook for that matter? Well these burning hot questions can be solved once you get a little more settled in.
    - <light_purple>CH 2: The Station<n><p>  <white><black>Having somewhere to cook is an essential to a chef's journey to culinary greatness, where to place it is the problem. We need a surface where we can get heat from, perhaps a furnace will do.
    - Placing a <bold>Pressure Plate <black>ontop a furnace is a perfect example of cooking with fire! This allows us to organize our ingredients together and piece together our tools. However, we don't have any tools to begin with.<n><n>       -----<&gt><n>      <Gold><bold>Tools
    - <gold><bold>Tools:<n><n><white><black>Cooking tools are essential for making anything or else you'll just end up with a big pile of slop which is just bound to make you sick. Who would be desperate enough to eat that garbage? In order to make some of these tools, you need to go to-
    - The <light_purple><bold>Cooking Index <white><black>where organizes all of your currently known recipes, their ingredients, and food group associated! What we'll be needing is the tools which can be made here easy enough with copper ingots, stone, and some wood items.
    - Now that you have basic tools for the job you have planned, you need to decide basically, <&dq>What do I want to make? How do I improve my craft?<&dq> the easiest thing to solve here would be to get your hands on some new ingredients.<n><n>       -----<&gt><n>      <Gold><bold>Farming
    - <gold><bold>Farming:<n><n><white><black>You may be able to till new land, but obtaining the seeds to implant in the arable land is the real backbreaking work. Smashing apart the tall grass that infests the plains might get you some basic seed packets for grain, but-
    - to get new fancy seeds, you will need to dig a little deeper into the soil. Breaking apart the overgrown soil with your hoe should expose all kinds of interesting seeds that are perfect for your farming and later ingredient needs!<n>       -----<&gt><n>      <Gold><bold>Milk and Water
    - <gold><bold>Milk and Water:<n><n><white><black>This white creamy liquid can only be obtained from a few animals in our world. You'd be smart to corral some of the livestock you haven't slaughted along your journey to get here. Milking with a bucket is easy enough-
    - turning the milk into usable portions is easy enough as well! Just by plopping the bucket of fluid into your new station, you can divide the pail into four portions for storage and usage in further recipes. This can also apply to water!
    - <light_purple>CH 3: A Loaf of Life<n><p>  <white><black>Now that you have your hands on a variety of ingredients from your labor of love in the dirt, the next step would be to turn it into edible food. The simplest of things to craft would be a fluffy loaf of <gold><bold>Bread<white><black>.
    - Breadmaking can be a little complex for a newbie baker like yourself, but it can be broken down into a few steps. <gold><bold>Flour<white><black>, <gold><bold>Dough<white><black>, and finally, <gold><bold>Bread<white><black>. Well no time like the present to get grinding!<n>       -----<&gt><n>      <Gold><bold>Flour
    - <gold><bold>Flour:<n><n><white><black>To make flour, you need to collect up some grain from your proceeds in farming. Placing it on your cooking station and selecting your <gold><bold>Mortar and Pestle<white><black> then simply grinding it will result in this powdery mess.<n>       -----<&gt><n>      <Gold><bold>Dough
    - <gold><bold>Dough:<n><n><white><black>Combining <green>three<white><black> of your <green>flour<white><black> you have with a portion of <green>salt<white><black>, <green>water<white><black> and mixing it into a <gold><bold>Mixing Bowl<white><black> will result in a glob of Dough which can be used in other recipes, but finally your bread itself.<n>       -----<&gt><n>      <Gold><bold>Bread
    - <gold><bold>Bread:<n><n><white><black>Sure you could use this dough ball in recipes for complex food like Pies, but you could just as easily stick it right into the furnace below your station just like your meats. Wait a little and pop! Out comes a steamy hot bread loaf!
    - Recipes each have their basic steps to aquire the end products. For example, <green>three flour<white><black>, <green>milk<white><black>, and an <green>new_egg<white><black> will result in <gold><bold>Batter<white><black> for cakes and muffins! Most of the fun with cooking is experimentation!
    - While I last just stated recipes can be complex, they could also be simple too! Simply take <gold><bold>Crackers<white><black> as an example, <green>three flour<white><black> and <green>one salt<white><black> being cooked with <gold><bold>Bakeware<white><black> gives you four servings that can be taken with you on adventures!


Cooking_Hand_Crafting:
    type: world
    debug: false
    events:
      on player right clicks block with:cooking_salt:
      - determine passively cancelled
      - if <player.cursor_on_solid.material.name> == campfire:
         - determine cancelled
      - if <player.item_in_offhand> == <item[book]>:
         - take iteminhand quantity:1
         - take slot:offhand quantity:1
         - give item:<item[Cooking_Guide]>
      - if <player.item_in_offhand.has_flag[meat]>:
         - define meat_type:<player.item_in_offhand.flag[meat]>
         - if <[meat_type]> == goat:
           - determine cancelled
         - if <[meat_type]> == horse:
           - determine cancelled
         - take iteminhand quantity:1
         - take slot:offhand quantity:1
         - define jerky <item[<[meat_type]>_jerky]>
         - adjust def:jerky lore:<proc[Cooking_Lore_Proc].context[<[jerky]>]>
         - give item:<[jerky]> quantity:3
      on player right clicks block with:item_flagged:effect_sauce:
      - determine passively cancelled
      - if <context.location.material.name||null> == barrel:
        - determine cancelled
      - if <player.item_in_offhand.has_flag[food]>:
        - define offhand <player.item_in_offhand>
        - take iteminhand quantity:1
        - take slot:offhand quantity:1
        - if !<[offhand].has_flag[flavored]>:
          - define lore_size <[offhand].lore.size>
          - adjust def:offhand flag:flavored:<context.item.flag[effect_sauce]>-<[lore_size].add[2]>
          - adjust def:offhand lore:<[offhand].lore><n><blue>Flavored<&co><&sp><gold><context.item.flag[effect_sauce].to_titlecase>
        - else:
          - define effect <[offhand].flag[flavored]>
          - adjust def:offhand flag:flavored:<context.item.flag[effect_sauce]>-<[offhand].flag[flavored].after_last[-]>
          - adjust def:offhand lore:<[offhand].lore.set[<blue>Flavored<&co><&sp><gold><context.item.flag[effect_sauce].to_titlecase>].at[<[offhand].flag[flavored].after_last[-]>]>
        - give <[offhand]>

Cooking_Lunchbox_Inventory:
  type: inventory
  debug: false
  inventory: dispenser
  title: <white>Lunch Box
  procedural items:
  - define list <list>
  - foreach <player.item_in_hand.flag[contents]> as:item:
    - define list:->:<[item]>
  - determine <[list]>
  slots:
  - [] [] [] [] [CookingNull] [CookingNull] [CookingNull] [CookingNull] [CookingNull]

Cooking_Lunchbox:
  type: item
  debug: false
  material: tropical_fish
  display name: <white>Lunch Box
  mechanisms:
      custom_model_data: 111
      components_patch: minecraft:item_model=string:cooking:tools/lunchbox

Cooking_Lunchbox_Event:
  type: world
  debug: false
  events:
    on player consumes Cooking_Lunchbox:
      - determine passively cancelled
      - if <player.item_in_hand.has_flag[selected]>:
        - define quantity <player.item_in_hand.flag[contents].get[<player.item_in_hand.flag[selected]>].quantity.sub[1]>
        - define entry <player.item_in_hand.flag[contents].get[<player.item_in_hand.flag[selected]>]>
        - if <[quantity]> == 0:
          - inventory adjust flag:contents:<player.item_in_hand.flag[contents].remove[<player.item_in_hand.flag[selected]>]> slot:hand
          - if <player.item_in_hand.flag[contents].is_empty>:
            - inventory adjust flag:contents:! slot:hand
            - inventory adjust flag:selected:! slot:hand
            - inventory adjust flag:food:! slot:hand
        - else:
          - adjust def:entry quantity:<[quantity]>
          - inventory adjust flag:contents:<player.item_in_hand.flag[contents].set[<[entry]>].at[<player.item_in_hand.flag[selected]>]> slot:hand
        - narrate <&lb><[entry].display><&rb>
        - run Cooking_Lunchbox_Update
    on player right clicks block with:Cooking_Lunchbox:
    - if <player.is_sneaking>:
      - determine passively cancelled
      - inventory open d:Cooking_Lunchbox_Inventory
    on player clicks CookingNull in Cooking_Lunchbox_Inventory:
    - determine passively cancelled
    on player clicks item in Cooking_Lunchbox_Inventory:
    - define inventory_item <context.item>
    - if <context.hotbar_button> != 0:
      - determine passively cancelled
    - if <[inventory_item].has_flag[food]> || <[inventory_item].material.name> == air && <context.slot> != -998:
      - playsound <player> sound_category:blocks sound:item.bundle.insert
      - stop
    - else:
      - determine passively cancelled
    on player clicks Cooking_Lunchbox in Cooking_Lunchbox_Inventory:
    - determine passively cancelled
    on player closes Cooking_Lunchbox_Inventory:
    - foreach <context.inventory.list_contents> as:item:
      - if <[item].script.name> == CookingNull || <[item].material.name> == air:
        - foreach next
      - define temp_list:->:<[item]>
    - if <[temp_list]||0> == 0:
      - inventory adjust flag:contents:! slot:hand
      - inventory adjust flag:selected:! slot:hand
      - inventory adjust flag:food:! slot:hand
    - else:
      - inventory adjust flag:contents:<[temp_list]> slot:hand
    - run Cooking_Lunchbox_Update

Cooking_Lunchbox_Update:
  type: task
  debug: false
  script:
  - define contents_list <player.item_in_hand.flag[contents]>
  - if !<player.item_in_hand.has_flag[contents]>:
    - inventory adjust lore:<gold>Total<&sp>Food<&co><&sp><blue><bold>0<n><white>Contents<&co><n><light_purple><&lb><white>Empty<light_purple><&rb> slot:hand
  - else:
    - foreach <[contents_list]> as:item:
      - define total_food:+:<[item].flag[food].mul[<[item].quantity>]>
      - define contents_name:->:<[item].display><&sp>x<[item].quantity>
    - define selected_number <util.random.int[1].to[<[contents_name].size>]>
    - inventory adjust flag:selected:<[selected_number]> slot:hand
    - define contents_name:<[contents_name].set[<[contents_name].get[<[selected_number]>].strip_color.color[yellow].bold>].at[<[selected_number]>]>
    - inventory adjust lore:<gold>Total<&sp>Food<&co><&sp><blue><bold><[total_food]><n><white>Contents<&co><n><light_purple><&lb><[contents_name].comma_separated><light_purple><&rb> slot:hand
    - inventory adjust flag:food:<[contents_list].get[<[selected_number]>].flag[food]> slot:hand


# Cooking Math Calculator

Cooking_Math_Command:
  type: command
  debug: false
  name: foodcal
  description: Does something
  usage: /foodcal <&lt>food_id<&gt>
  script:
  - flag player cooking_math:!
  #- run Cooking_Math_Task def:<context.raw_args>
  - narrate "<red>Final Value: <proc[Cooking_Math_Proc].context[<context.raw_args>].round_to_precision[1]>"

Cooking_Math_Proc:
  type: procedure
  debug: false
  definitions: food_id
  script:
  - define current_value:+:1
  - narrate <[current_value]>
  - define ingredient_value:0
  - define recipe_quantity:0
  - foreach <script[Cooking_Master_Data].list_keys> as:category:
    - if <[category]> == type:
      - foreach next
    - define cooking_category <[category]>
    - foreach <script[Cooking_Master_Data].data_key[<[category]>].keys> as:potential_id:
      - define potential_id <[potential_id].before_last[-]>
      - if <[food_id]> == <[potential_id]>:
        - define placement <[loop_index]>
        #- narrate "<green>Current item: <[food_id]>"
        - foreach stop
    - if <[placement]||null> != null:
      - foreach stop
  - define real_id <script[Cooking_Master_Data].data_key[<[cooking_category]>].keys.get[<[placement]>]>
  - define recipe <script[Cooking_Master_Data].data_key[<[cooking_category]>.<[real_id]>]||null>
  - define recipe_quantity <[real_id].after_last[-]>
  - if <[recipe]> == null:
    - narrate "<red>This broke because of <[food_id]>"
    - stop
  - narrate "<green>Current item: <aqua><[food_id].to_uppercase> <green>Recipe: <blue><[recipe]> <gold>Current Value: <blue><[current_value]>"
  - foreach <[recipe]> as:entry:
    - define quantity:0
    - define quantity <[entry].after_last[-]>
    - define ingredient <[entry].before_last[-]>
    - if <[ingredient]> in <script[Cooking_Math_Data].data_key[tools]>:
      - foreach next
    - else if <[ingredient]> in <script[Cooking_Math_Data].data_key[ingredients]>:
      - define ingredient_value:0
      - repeat <[quantity]>:
        - define ingredient_value:+:1
      - define current_value:+:<[ingredient_value]>
      #- narrate <[current_value]>
      - foreach next
    - else if <[ingredient]> in <script[Cooking_Math_Data].data_key[meat]>:
      - define ingredient_value:0
      - repeat <[quantity]>:
        - define ingredient_value:+:2
      - define current_value:+:<[ingredient_value]>
      - foreach next
    - else if <[ingredient]> in <script[Cooking_Math_Data].data_key[cooked_meat]>:
      - define ingredient_value:0
      - repeat <[quantity]>:
        - define ingredient_value:+:3
      - define current_value:+:<[ingredient_value]>
      - foreach next
    - else if <[ingredient]> in <script[Cooking_Math_Data].data_key[condiments]>:
      - define ingredient_value:0
      - repeat <[quantity]>:
        - define ingredient_value:+:2
      - define current_value:+:<[ingredient_value]>
      - foreach next
    - else if <[ingredient]> in <script[Cooking_Math_Data].data_key[ignore]>:
      - foreach next
    - else:
      - define ingredient_value:0
      - repeat <[quantity]>:
        #- narrate <[ingredient_value]>
        - define recipe_value:<proc[Cooking_Math_Proc].context[<[ingredient]>].round_to_precision[1]>
        - define ingredient_value:+:<[recipe_value]>
        #- narrate <proc[Cooking_Math_Proc].context[<[ingredient]>]>
      - define current_value:+:<[ingredient_value]>
  - define div_value:<[current_value].div[<[recipe_quantity]>]>
  #- flag player cooking_math:+:<[div_value]>
  - determine <[div_value]>
  #- flag player cooking_math:
    #- foreach <script[Cooking_Master_Data].data_key[<[category]>]>

Cooking_Math_Data:
  type: data
  debug: false
  tools:
    - mixing_bowl
    - sauce_pan
    - cooking_pot
    - roller
    - mortar_and_pestle
    - cutting_board
    - juicer
    - bakeware
    - skillet
  ingredients:
    - new_apple
    - new_carrot
    - new_beetroot
    - new_potato
    - new_wheat
    - new_pumpkin
    - fresh_milk
    - new_melon_slice
    - seeds_wheat
    - new_sugar
    - new_sweet_berry
    - new_glow_berry
    - new_cocoa_beans
    - snowball
    - new_brown_mushroom
    - chili
    - corn
    - rice
    - tomato
    - Rye_Bundle
    - Barley_Bundle
    - strawberry
    - blackberry
    - cranberry
    - blueberry
    - gooseberry
    - mulberry
    - raspberry
    - cinnamon
    - vanilla_bean
    - ginger
    - new_netherwart
    - ink_sac
  meat:
    - cooking_raw_pork
    - cooking_raw_beef
    - cooking_raw_mutton
    - cooking_raw_chicken
    - cooking_raw_fish
    - cooking_raw_rabbit
    - cooking_raw_horse
    - cooking_raw_goat
    - new_egg
    - bone
  cooked_meat:
    - cooking_cooked_pork
  condiments:
    - mayonnaise
  ignore:
    - cooking_salt
    - fresh_water
    - cooking_oil
    - stick
    - bowl
    - red_dye
    - green_dye
    - yellow_dye
    - orange_dye
    - pink_dye
    - water_bucket
    - milk_bucket


## Please remove and convert later

#cookinginventorytools:
#    type: world
#    events:
#        on player clicks CookingTool in cooking_index:
#        - inventory open d:cookinginventorytool
#        on player clicks CookingReturn in cookinginventorytool:
#        - inventory open d:cooking_index
#        #Recipes
#        on player clicks bakeware in cookinginventorytool:
#        - if <player.inventory.contains_item[brick].quantity[8]>:
#          - take item:brick quantity:8
#          - wait 1t
#          - give bakeware
#        on player clicks cutting_board in cookinginventorytool:
#        - if <player.inventory.contains_item[stick].quantity[1]> && <player.inventory.contains_item[blast_copper_ingot].quantity[1]> && <player.inventory.contains_item[*_planks].quantity[1]>:
#          - take item:blast_copper_ingot quantity:1
#          - take item:stick quantity:1
#          - take item:*_planks quantity:1
#          - wait 1t
#          - give cutting_board
#        on player clicks juicer in cookinginventorytool:
#        - if <player.inventory.contains_item[stone_pressure_plate].quantity[2]>:
#          - take item:stone_pressure_plate quantity:2
#          - wait 1t
#          - give juicer
#        on player clicks mortar_and_pestle in cookinginventorytool:
#        - if <player.inventory.contains_item[stone].quantity[3]> && <player.inventory.contains_item[stick].quantity[1]>:
#          - take item:stone quantity:3
#          - take item:stick quantity:1
#          - wait 1t
#          - give mortar_and_pestle
#        on player clicks mixing_bowl in cookinginventorytool:
#        - if <player.inventory.contains_item[*_planks].quantity[3]> && <player.inventory.contains_item[stick].quantity[1]>:
#          - take item:*_planks quantity:8
#          - take item:stick quantity:1
#          - wait 1t
#          - give mixing_bowl
#        on player clicks cooking_pot in cookinginventorytool:
#        - if <player.inventory.contains_item[blast_copper_ingot].quantity[3]> && <player.inventory.contains_item[stick].quantity[1]>:
#          - take item:blast_copper_ingot quantity:3
#          - take item:stick quantity:1
#          - wait 1t
#          - give cooking_pot
#        on player clicks roller in cookinginventorytool:
#        - if <player.inventory.contains_item[*_log].quantity[1]> && <player.inventory.contains_item[stick].quantity[2]>:
#          - take item:*_log quantity:1
#          - take item:stick quantity:2
#          - wait 1t
#          - give roller
#        on player clicks sauce_pan in cookinginventorytool:
#        - if <player.inventory.contains_item[blast_copper_ingot].quantity[1]> && <player.inventory.contains_item[stick].quantity[1]>:
#          - take item:blast_copper_ingot quantity:1
#          - take item:stick quantity:1
#          - wait 1t
#          - give sauce_pan
#        on player clicks skillet in cookinginventorytool:
#        - if <player.inventory.contains_item[blast_copper_ingot].quantity[1]> && <player.inventory.contains_item[stick].quantity[1]>:
#          - take item:copper_ingot quantity:1
#          - take item:stick quantity:2
#          - wait 1t
#          - give skillet
#        on player clicks bucket in cookinginventorytool:
#        - if <player.inventory.contains_item[blast_copper_ingot].quantity[3]>:
#          - take item:copper_ingot quantity:3
#          - wait 1t
#          - give bucket
#        on player clicks shears in cookinginventorytool:
#        - if <player.inventory.contains_item[blast_copper_ingot].quantity[2]>:
#          - take item:copper_ingot quantity:2
#          - wait 1t
#          - give shears


cookinginventorytool:
    type: inventory
    debug: false
    inventory: chest
    title: <yellow><bold>Tools
    size: 27
    gui: true
    slots:
    - [CookingNull] [CookingNull] [CookingReturn] [CookingNull] [CookingTool] [CookingNull] [CookingNull] [CookingNull] [CookingNull]
    - [bakeware[lore=<green>Tool||<gray>A glazed cooking container used in the oven.||<dark_purple>Ingredients: 8x Bricks]] [cutting_board[lore=<green>Tool||<gray>A glazed cooking container used in the oven.||<dark_purple>Ingredients: 1x Copper, 1x Stick, 1x Plank]] [juicer[lore=<green>Tool||<gray>Circular half-dome to twist juice from things against!||<dark_purple>Ingredients: 2x Stone Pressure Plate]] [mortar_and_pestle[lore=<green>Tool||<gray>Useful tool of an alchemist trade.|<gray>Commonly used in crushing of spices or ingredients.||<dark_purple>Ingredients: 3x Stone, 1x Stick]] [mixing_bowl[lore=<green>Tool||<gray>Bowl the perfect size for mixing ingredients!||<dark_purple>Ingredients: 3x Planks, 1x Stick]] [cooking_pot[lore=<green>Tool||<gray>Tall cookware perfect for boiling in!||<dark_purple>Ingredients: 3x Copper, 1x Stick]] [roller[lore=<green>Tool||<gray>Short wooden dowel with handles.|<gray>Used in pressing some ingredients flat!||<dark_purple><dark_purple>Ingredients: 1x Wood Log, 2x Stick]] [sauce_pan[lore=<green>Tool||<gray>A pan used in boiling down ingredients into a sauce!||<dark_purple>Ingredients: 1x Copper, 1x Stick]] [skillet[lore=<green>Tool||<gray>A copper skillet used on an open fire or hot oven.||<dark_purple>Ingredients: 1x Copper, 2x Stick]]
    - [bucket[lore=<dark_purple>Ingredients: 3x Copper]] [shears[lore=<dark_purple>Ingredients: 2x Copper]] [] [] [] [] [] [] []

cookinginventorystorage:
    type: world
    debug: false
    events:
        on player clicks CookingStorage in cooking_index:
        - inventory open d:cookinginventorystorages
        on player clicks CookingReturn in cookinginventorystorages:
        - inventory open d:cooking_index
        #Recipes
        on player clicks new_hay_block in cookinginventorystorages:
        - if <player.inventory.contains_item[new_wheat].quantity[9]>:
          - take item:new_wheat quantity:9
          - wait 1t
          - give new_hay_block quantity:1
        on player clicks new_wheat in cookinginventorystorages:
        - if <player.inventory.contains_item[new_hay_block].quantity[1]>:
          - take item:new_hay_block quantity:1
          - wait 1t
          - give new_wheat quantity:9
        on player clicks new_melon_block in cookinginventorystorages:
        - if <player.inventory.contains_item[new_melon_slice].quantity[9]>:
          - take item:new_melon_slice quantity:9
          - wait 1t
          - give new_melon_block quantity:1
        on player clicks new_melon_slice in cookinginventorystorages:
        - if <player.inventory.contains_item[new_melon_block].quantity[1]>:
          - take item:new_melon_block quantity:1
          - wait 1t
          - give new_melon_slice quantity:9
        on player clicks salt_block in cookinginventorystorages:
        - if <player.inventory.contains_item[cooking_salt].quantity[9]>:
          - take item:cooking_salt quantity:9
          - wait 1t
          - give salt_block quantity:1
        on player clicks cooking_salt in cookinginventorystorages:
        - if <player.inventory.contains_item[salt_block].quantity[1]>:
          - take item:salt_block quantity:1
          - wait 1t
          - give cooking_salt quantity:9
        on player clicks new_kelp_block in cookinginventorystorages:
        - if <player.inventory.contains_item[new_dried_kelp].quantity[9]>:
          - take item:new_dried_kelp quantity:9
          - wait 1t
          - give new_kelp_block quantity:1
        on player clicks new_dried_kelp in cookinginventorystorages:
        - if <player.inventory.contains_item[new_kelp_block].quantity[1]>:
          - take item:new_kelp_block quantity:1
          - wait 1t
          - give new_dried_kelp quantity:9

cookinginventorystorages:
    type: inventory
    debug: false
    inventory: chest
    title: <yellow><bold>Storage
    size: 54
    gui: true
    slots:
    - [CookingNull] [CookingNull] [CookingReturn] [CookingNull] [CookingStorage] [CookingNull] [CookingNull] [CookingNull] [CookingNull]
    - [new_hay_block[lore=<green>Grain - Storage||<dark_purple>Ingredients: 9x Wheat]] [new_wheat[quantity=9;display=<white>9x Wheat;lore=<green>Grain||<dark_purple>Ingredients: 1x Hay Bale]] [new_melon_block[lore=<green>Fruit - Storage||<dark_purple>Ingredients: 9x Melon Slice]] [new_melon_slice[quantity=9;display=<white>9x Melon Slice;lore=<green>Fruit||<dark_purple>Ingredients: 1x Melon Block]] [salt_block[lore=<green>Misc - Storage||<dark_purple>Ingredients: 9x Salt]] [cooking_salt[quantity=9;display=<white>9x Salt;lore=<green>Misc - Ingredient||<dark_purple>Ingredients: 1x Salt Block]] [new_kelp_block[lore=<green>Vegetable - Storage||<dark_purple>Ingredients: 9x Dried Kelp]] [new_dried_kelp[quantity=9;display=<white>9x Dried Kelp;lore=<green>Vegetable||<dark_purple>Ingredients: 1x Kelp Block]]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []


cookinginventoryseed:
    type: world
    debug: false
    events:
        on player clicks CookingSeed in cooking_index:
        - inventory open d:cookinginventoryseeds
        on player clicks CookingReturn in cookinginventoryseeds:
        - inventory open d:cooking_index
        #Recipes
        on player clicks seeds_wheat in cookinginventoryseeds:
        - if <player.inventory.contains_item[new_wheat].quantity[2]>:
          - take item:new_wheat quantity:2
          - wait 1t
          - give seeds_wheat quantity:1
        on player clicks seeds_carrot in cookinginventoryseeds:
        - if <player.inventory.contains_item[new_carrot].quantity[2]>:
          - take item:new_carrot quantity:2
          - wait 1t
          - give seeds_carrot quantity:1
        on player clicks seeds_potato in cookinginventoryseeds:
        - if <player.inventory.contains_item[new_potato].quantity[2]>:
          - take item:new_potato quantity:2
          - wait 1t
          - give seeds_potato quantity:1
        on player clicks seeds_pumpkin in cookinginventoryseeds:
        - if <player.inventory.contains_item[new_pumpkin].quantity[2]>:
          - take item:new_pumpkin quantity:1
          - wait 1t
          - give seeds_pumpkin quantity:4
        on player clicks seeds_melon in cookinginventoryseeds:
        - if <player.inventory.contains_item[new_melon_slice].quantity[2]>:
          - take item:new_melon_slice quantity:2
          - wait 1t
          - give seeds_melon quantity:1
        on player clicks seeds_beetroot in cookinginventoryseeds:
        - if <player.inventory.contains_item[new_beetroot].quantity[2]>:
          - take item:new_beetroot quantity:2
          - wait 1t
          - give seeds_beetroot quantity:1
        on player clicks seeds_bamboo in cookinginventoryseeds:
        - if <player.inventory.contains_item[bamboo].quantity[2]>:
          - take item:bamboo quantity:2
          - wait 1t
          - give seeds_bamboo quantity:1
        on player clicks seeds_sweet_berry in cookinginventoryseeds:
        - if <player.inventory.contains_item[new_sweet_berry].quantity[2]>:
          - take item:new_sweet_berry quantity:2
          - wait 1t
          - give seeds_sweet_berry quantity:1

cookinginventoryseeds:
    type: inventory
    debug: false
    inventory: chest
    title: <yellow><bold>Seeds
    size: 54
    gui: true
    slots:
    - [CookingNull] [CookingNull] [CookingReturn] [CookingNull] [CookingSeed] [CookingNull] [CookingNull] [CookingNull] [CookingNull]
    - [seeds_wheat[lore=<green>Grain - Seeds||<dark_purple>Ingredients: 2x Wheat]] [seeds_carrot[lore=<green>Vegetable - Seeds||<dark_purple>Ingredients: 2x Carrot]] [seeds_potato[lore=<green>Vegetable - Seeds||<dark_purple>Ingredients: 2x Potato]] [seeds_pumpkin[quantity=4;lore=<green>Vegetable - Seeds||<dark_purple>Ingredients: 1x Pumpkin]] [seeds_melon[lore=<green>Fruit - Seeds||<dark_purple>Ingredients: 2x Melon Slice]] [seeds_beetroot[lore=<green>Vegetable - Seeds||<dark_purple>Ingredients: 2x Beetroot]] [seeds_bamboo[lore=<green>Vegetable - Seeds||<dark_purple>Ingredients: 2x Bamboo]] [seeds_sweet_berry[lore=<green>Fruit - Seeds||<dark_purple>Ingredients: 2x Sweet Berry]] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

cookinginventorydye:
    type: world
    debug: false
    events:
        on player clicks CookingDye in cooking_index:
        - inventory open d:cookinginventorydyes
        on player clicks CookingReturn in cookinginventorydyes:
        - inventory open d:cooking_index
        on player clicks brown_dye in cookinginventorydyes:
        - if <player.inventory.contains_item[new_cocoa_beans].quantity[1]> && <player.inventory.contains_item[mortar_and_pestle].quantity[1]>:
          - take item:new_cocoa_beans quantity:1
          - wait 1t
          - run Cooking_Sound_Mortar_And_Pestle
          - give brown_dye quantity:1
        on player clicks red_dye in cookinginventorydyes:
        - if <player.inventory.contains_item[new_beetroot].quantity[1]> && <player.inventory.contains_item[mortar_and_pestle].quantity[1]>:
          - take item:new_beetroot quantity:1
          - wait 1t
          - run Cooking_Sound_Mortar_And_Pestle
          - give red_dye quantity:1
        on player clicks pink_dye in cookinginventorydyes:
        - if <player.inventory.contains_item[new_sweet_berry].quantity[1]> && <player.inventory.contains_item[mortar_and_pestle].quantity[1]>:
          - take item:new_sweet_berry quantity:1
          - wait 1t
          - run Cooking_Sound_Mortar_And_Pestle
          - give pink_dye quantity:1

cookinginventorydyes:
    type: inventory
    debug: false
    inventory: chest
    title: <yellow><bold>Dyes
    size: 54
    gui: true
    slots:
    - [CookingNull] [CookingNull] [CookingReturn] [CookingNull] [CookingDye] [CookingNull] [CookingNull] [CookingNull] [CookingNull]
    - [brown_dye[lore=<dark_purple>Ingredients: 1x Cocoa Bean, Mortar and Pestle]] [red_dye[lore=<dark_purple>Ingredients: 1x Beetroot, Mortar and Pestle]] [pink_dye[lore=<dark_purple>Ingredients: 1x Sweet Berry, Mortar and Pestle]] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

# Storage

New_Hay_Block:
    type: item
    debug: false
    material: hay_block
    display name: <white>Hay Bale
    mechanisms:
      custom_model_data: 901
    lore:
    - <green>Grain - Storage
    - <empty>
    - <gold>Contains 9 Bundles of wheat.
New_Melon_Block:
    type: item
    debug: false
    material: melon
    display name: <white>Melon Block
    mechanisms:
      custom_model_data: 902
    lore:
    - <green>Fruit - Storage
    - <empty>
    - <gold>Contains 9 Slices of Melon.
Salt_Block:
    type: item
    debug: false
    material: calcite
    display name: <white>Salt Block
    mechanisms:
      custom_model_data: 903
    lore:
    - <green>Misc - Storage
    - <empty>
    - <gold>Contains 9 Piles of Salt.
New_Kelp_Block:
    type: item
    debug: false
    material: dried_kelp_block
    display name: <white>Dried Kelp Block
    mechanisms:
      custom_model_data: 903
    lore:
    - <green>Vegetable - Storage
    - <empty>
    - <gold>Contains 9 Wrappings of Kelp.