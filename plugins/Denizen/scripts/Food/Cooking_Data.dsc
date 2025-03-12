# This file contains the master data script that stores all of the recipes for the cooking system.

# Created: 3/11/2025

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
      - egg-1
      - skillet
      sugar_cookie-4:
      - flour-1
      - egg-1
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
      bacon_and_eggs-1:
      - cooking_raw_pork-1
      - egg-1
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
      - egg-1
      - cooking_oil-1
      - juicer
      boiled_egg-1:
      - egg-1
      - cooking_pot
      fried_egg-1:
      - egg-1
      - skillet
      scrambled_egg-1:
      - egg-1
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
      - egg-1
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
      - sugar_cane-1
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
      - egg-1
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

Cooking_Vanilla_Ingredients:
  type: data
  debug: false
  data:
    ingredients:
    - snowball
    - egg
    - sugar_cane