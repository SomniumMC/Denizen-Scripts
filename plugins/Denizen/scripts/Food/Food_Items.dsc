# This file contains all of the items associated with Cooking Systems

# First Organized: 6/28/2024

# Dairy
Fresh_Milk:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 201
      components_patch:
        item_model: string:cooking:food/freshmilk
    display name: <white>Fresh Milk
    flags:
      food: 1
      drink: true
      dairy: true
    lore:
    - <green>A pail of fresh milk perfect for cheese making or butter!
    recipes:
      1:
        type: shapeless
        input: milk_bucket
        output_quantity: 4
BUTTER:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 202
      components_patch:
        item_model: string:cooking:ingredients/butter
    display name: <white>Butter
    flags:
      food: 2
      dairy: true
    lore:
    - <gold>Milk churned into a wonderful ingredient often used in baking!
CREAM:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 203
      components_patch:
        item_model: string:cooking:ingredients/cream
    display name: <white>Cream
    flags:
      food: 1
      dairy: true
    lore:
    - <gold>A buttery product of milk, it gives <&dq>creamy<&dq> textures to food.
CHEESE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 204
      components_patch:
        item_model: string:cooking:food/cheese
    flags:
      food: 2
      dairy: true
    display name: <white>Cheese
    lore:
    - <gold>A preserved form of milk, it is made by fermentation.
YOGURT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 205
      components_patch:
        item_model: string:cooking:food/yogurt
    flags:
      food: 2
      dairy: true
    display name: <white>Plain Yogurt
    lore:
    - <gold>Milk that has been fermented, it is slightly sour when unflavored.
CHOCOLATE_YOGURT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 206
      components_patch:
        item_model: string:cooking:food/chocolateyogurt
    flags:
      food: 5
      dairy: true
      sugar: true
    display name: <white>Chocolate Yogurt
    lore:
    - <gold>Yogurt flavored with chocolate, it  is richer in taste.
APPLE_YOGURT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 207
      components_patch:
        item_model: string:cooking:food/appleyogurt
    flags:
      food: 4
      dairy: true
      fruit: true
    display name: <white>Apple Yogurt
    lore:
    - <gold>Yogurt flavored with apple chunks, slightly sweeter.
SWEET_BERRY_YOGURT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 208
      components_patch:
        item_model: string:cooking:food/sweetberryyogurt
    flags:
      food: 4
      dairy: true
      fruit: true
    display name: <white>Sweet Berry Yogurt
    lore:
    - <gold>Yogurt flavored with sweet berries, it tastes sweet!
PUMPKIN_YOGURT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 209
      components_patch:
        item_model: string:cooking:food/pumpkinyogurt
    flags:
      food: 4
      dairy: true
      vegetable: true
    display name: <white>Pumpkin Yogurt
    lore:
    - <gold>Yogurt flavored with pumpkin, it tastes earthy with a hint of sweet.
CARAMEL_YOGURT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 210
      components_patch:
        item_model: string:cooking:food/caramelyogurt
    flags:
      food: 6
      dairy: true
      sugar: true
    display name: <white>Caramel Yogurt
    lore:
    - <gold>Yogurt flavored with caramel, it is sweet  and buttery.
ICE_CREAM:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 211
      components_patch:
        item_model: string:cooking:food/icecream
    flags:
      food: 3
      dairy: true
    display name: <white>Ice Cream
    lore:
    - <gold>Milk that has been mixed with snow, it is cold.
CHOCOLATE_ICE_CREAM:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 212
      components_patch:
        item_model: string:cooking:food/chocolateicecream
    flags:
      food: 6
      dairy: true
      sugar: true
    display name: <white>Chocolate Ice Cream
    lore:
    - <gold>Ice Cream flavored with chocolate, it is rich in flavor.
CARAMEL_ICE_CREAM:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 213
      components_patch:
        item_model: string:cooking:food/caramelicecream
    flags:
      food: 7
      dairy: true
      sugar: true
    display name: <white>Caramel Ice Cream
    lore:
    - <gold>Ice Cream flavored with caramel. It is buttery and rich.
COOKIES_AND_MILK:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 214
      components_patch:
        item_model: string:cooking:food/cookiesandmilk
    display name: <white>Cookies And Milk
    flags:
      food: 3
      dairy: true
      grain: true
      drink: true
    lore:
    - <gold>Cookies with a glass of milk! Yum!

# Fruit
New_MELON_SLICE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 301
      components_patch:
        item_model: string:minecraft:melon_slice
    display name: <white>Melon Slice
    flags:
      food: 1
      Cooking_ID: New_Melon_Slice
      Cooking_Tag: Fruit
      Fruit: Melon_Slice
    lore:
    - <gold>A slice of melon.
New_GLOW_BERRY:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 302
      components_patch:
        item_model: string:minecraft:glow_berry
    display name: <white>Glow Berries
    flags:
      food: 1
      Cooking_ID: glow_berry
      Cooking_Tag: Fruit
      Fruit: Glow_Berry
    lore:
    - <gold>Berries with an biofluorescence to them.
New_APPLE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 303
      components_patch:
        item_model: string:minecraft:apple
    display name: <white>Apple
    flags:
      food: 1
      Cooking_ID: New_Apple
      Cooking_Tag: Fruit
      Fruit: Apple
    lore:
    - <gold>A crisp sweet red apple.
New_SWEET_BERRY:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 304
      components_patch:
        item_model: string:minecraft:sweet_berry
    display name: <white>Sweet Berries
    flags:
      food: 1
      Cooking_ID: New_Sweet_Berry
      Cooking_Tag: Fruit
      Fruit: Sweet_Berry
    lore:
    - <gold>Sweet red berries pick from a bush.
APPLE_JUICE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 305
      components_patch:
        item_model: string:cooking:food/applejuice
    display name: <white>Apple Juice
    flags:
      food: 3
      fruit: true
      drink: true
    lore:
    - <gold>Juice from several apples, it is naturally sweet.
APPLE_SMOOTHIE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 306
      components_patch:
        item_model: string:cooking:food/applesmoothie
    display name: <white>Apple Smoothie
    flags:
      food: 5
      fruit: true
      drink: true
    lore:
    - <gold>Apple juice mixed with snow. Refreshing!
Apple_Jelly:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: tropical_fish
    display name: <white>Apple Jelly
    mechanisms:
      custom_model_data: 307
      components_patch:
        item_model: string:cooking:food/applejelly
    flags:
      food: 3
      fruit: true
      sugar: true
      cooking_tag: jelly
    lore:
    - <gold>Apple juice preserved with added ingedients.
CARAMEL_APPLE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 308
      components_patch:
        item_model: string:cooking:food/caramelapple
    display name: <white>Caramel Apple
    flags:
      food: 5
      fruit: true
      sugar: true
    lore:
    - <gold>An apple covered in caramel.
APPLE_SAUCE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 309
      components_patch:
        item_model: string:cooking:food/applesauce
    display name: <white>Applesauce
    flags:
      food: 4
      has_bowl: true
      fruit: true
      sugar: true
    lore:
    - <gold>Crushed up apple paste, it has added sugar.
MELON_JUICE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 310
      components_patch:
        item_model: string:cooking:food/melonjuice
    display name: <white>Melon Juice
    flags:
      food: 3
      fruit: true
      drink: true
    lore:
    - <gold>Juice from multiple slices of melon.
MELON_SMOOTHIE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 311
      components_patch:
        item_model: string:cooking:food/melonsmoothie
    display name: <white>Melon Smoothie
    flags:
      food: 5
      fruit: true
      drink: true
    lore:
    - <gold>Melon Juice mixed with snow. Refreshing!
MELON_JELLY:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 312
      components_patch:
        item_model: string:cooking:food/melonjelly
    display name: <white>Melon Jelly
    flags:
      food: 3
      fruit: true
      sugar: true
      cooking_tag: jelly
    lore:
    - <gold>Melon Juice preserved with added ingredients.
SWEET_BERRY_JUICE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 313
      components_patch:
        item_model: string:cooking:food/sweetberryjuice
    display name: <white>Sweet Berry Juice
    flags:
      food: 3
      fruit: true
      drink: true
    lore:
    - <gold>Juice made from sweet berries.
SWEET_BERRY_SMOOTHIE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 314
      components_patch:
        item_model: string:cooking:food/sweetberrysmoothie
    display name: <white>Sweet Berry Smoothie
    flags:
      food: 5
      fruit: true
      drink: true
    lore:
    - <gold>Sweet Berry Juice mixed with snow. Refreshing!
SWEET_BERRY_JELLY:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 315
      components_patch:
        item_model: string:cooking:food/sweetberryjelly
    display name: <white>Sweet Berry Jelly
    flags:
      food: 3
      fruit: true
      sugar: true
      cooking_tag: jelly
    lore:
    - <gold>Sweet Berry Juice preserved with added ingredients.
GLOW_BERRY_JUICE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 316
      components_patch:
        item_model: string:cooking:food/glowberryjuice
    display name: <white>Glowberry Juice
    flags:
      food: 3
      fruit: true
      drink: true
    lore:
    - <white>Makes one feel Grossly Incandescent.
FRUIT_PUNCH:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    display name: <white>Fruit Punch
    mechanisms:
      custom_model_data: 317
      components_patch:
        item_model: string:cooking:food/fruitpunch
    flags:
      food: 5
      fruit: true
      drink: true
    lore:
    - <gold>A mixture of juice with added sugar.
FRUIT_SALAD:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    display name: <white>Fruit Salad
    mechanisms:
      custom_model_data: 318
      components_patch:
        item_model: string:cooking:food/fruitsalad
    flags:
      food: 3
      fruit: true
      has_bowl: true
    lore:
    - <gold>Cream and fruit mixed together.
New_Golden_Apple:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    display name: <gold>Golden Apple
    mechanisms:
      custom_model_data: 319
      components_patch:
        item_model: string:cooking:food/newgoldenapple
    flags:
      food: 5
      fruit: true

# Grain
New_Wheat:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: brick
    mechanisms:
      custom_model_data: 401
      components_patch:
        item_model: string:minecraft:wheat
    display name: <white>Wheat
    flags:
      Cooking_ID: New_Wheat
      Cooking_Tag: Grain
      Grain: Wheat
      food: 1
    lore:
    - <gold>Golden Wheat, often made into flour.
FLOUR:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    display name: <white>Flour
    mechanisms:
      custom_model_data: 402
      components_patch:
        item_model: string:cooking:ingredients/flour
    flags:
      grain: true
    lore:
    - <gold>Ground wheat, a useful ingredient.
DOUGH:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 403
      components_patch:
        item_model: string:cooking:ingredients/dough
    display name: <white>Dough
    flags:
      cooking_id: dough
      grain: true
    lore:
    - <gold>A thick paste, made of flour.
BATTER:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 404
      components_patch:
        item_model: string:cooking:ingredients/batter
    display name: <white>Batter
    flags:
      grain: true
      dairy: true
    lore:
    - <gold>Thin mixture of dough often used in baking.
PASTA:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 405
      components_patch:
        item_model: string:cooking:ingredients/pasta
    display name: <white>Pasta
    flags:
      grain: true
      dairy: true
    lore:
    - <gold>A form of dough often boiled or baked.
New_BREAD:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      components_patch:
        item_model: string:minecraft:bread
    display name: <white>Bread
    flags:
      food: 3
      grain: true
    lore:
    - <gold>Staple food, it is seen as a necessity to live in some places.
New_COOKIE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 407
      components_patch:
        item_model: string:cooking:food/newcookie
    display name: <white>Cookie
    flags:
      food: 1
      grain: true
      sugar: true
    lore:
    - <gold>sweet bread made with chocolate. It is baked.
Buttered_TOAST:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 408
      components_patch:
        item_model: string:cooking:food/butteredtoast
    display name: <white>Buttered Toast
    flags:
      food: 3
      grain: true
      dairy: true
    lore:
    - <gold>Toasted bread with butter on top.
GRILLED_CHEESE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 409
      components_patch:
        item_model: string:cooking:food/grilledcheese
    display name: <white>Grilled Cheese
    flags:
      food: 8
      grain: true
      dairy: true
    lore:
    - <gold>two pieces of buttered toast with cheese melted between them.
SWEET_BERRY_JELLY_TOAST:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 410
      components_patch:
        item_model: string:cooking:food/sweetberryjellytoast
    display name: <white>Sweet Berry Toast
    flags:
      food: 7
      grain: true
      fruit: true
    lore:
    - <gold>Buttered toast with sweet berry jelly on top.
MELON_JELLY_TOAST:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 411
      components_patch:
        item_model: string:cooking:food/melonjellytoast
    display name: <white>Melon Jelly Toast
    flags:
      food: 7
      grain: true
      fruit: true
    lore:
    - <gold>Buttered toast with melon jelly on top.
APPLE_JELLY_TOAST:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 412
      components_patch:
        item_model: string:cooking:food/applejellytoast
    display name: <white>Apple Jelly Toast
    flags:
      food: 7
      grain: true
      fruit: true
    lore:
    - <gold>Buttered toast with apple jelly on top.
CARROT_CAKE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 413
      components_patch:
        item_model: string:cooking:food/carrotcake
    display name: <white>Carrot Cake
    flags:
      food: 7
      grain: true
      dairy: true
      vegetable: true
    lore:
    - <gold>Cake made with carrots.
CARROT_BREAD:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 414
      components_patch:
        item_model: string:cooking:food/carrotbread
    display name: <white>Carrot Bread
    flags:
      food: 4
      grain: true
      vegetable: true
    lore:
    - <gold>Bread made with carrots.
PUMPKIN_BREAD:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 415
      components_patch:
        item_model: string:cooking:food/pumpkinbread
    display name: <white>Pumpkin Bread
    flags:
      food: 4
      grain: true
      vegetable: true
    lore:
    - <gold>Bread made with pumpkin.
PUMPKIN_CUPCAKE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 416
      components_patch:
        item_model: string:cooking:food/pumpkincupcake
    display name: <white>Pumpkin Cupcake
    flags:
      food: 1
      grain: true
      vegetable: true
    lore:
    - <gold>A small cake made with pumpkin.
CARROT_CUPCAKE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 417
      components_patch:
        item_model: string:cooking:food/carrotcupcake
    display name: <white>Carrot Cupcake
    flags:
      food: 1
      grain: true
      vegetable: true
    lore:
    - <gold>A small cake made with carrots.
SQUID_INK_PASTA:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 418
      components_patch:
        item_model: string:cooking:food/squidinkpasta
    display name: <white>Squid Ink Pasta
    flags:
      food: 7
      grain: true
    lore:
    - <gold>Pasta with a strong fishy flavor, it is dyed black by squids ink.
MAC_N_CHEESE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 419
      components_patch:
        item_model: string:cooking:food/macncheese
    display name: <white>Mac n' Cheese
    flags:
      has_bowl: true
      food: 8
      grain: true
      dairy: true
    lore:
    - <gold>Pasta cooked with cheese.
NOODLE_SOUP:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 420
      components_patch:
        item_model: string:cooking:food/noodlesoup
    display name: <white>Noodle Soup
    flags:
      food: 7
      has_bowl: true
      grain: true
    lore:
    - <gold>Soup stock with bits of noodle cooked in.
APPLE_PIE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 421
      components_patch:
        item_model: string:cooking:food/applepie
    display name: <white>Apple Pie
    flags:
      food: 5
      grain: true
      fruit: true
      sugar: true
    lore:
    - <gold>A pie with apple baked in.
SWEET_BERRY_PIE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 422
      components_patch:
        item_model: string:cooking:food/sweetberrypie
    display name: <white>Sweet Berry Pie
    flags:
      food: 5
      grain: true
      fruit: true
      sugar: true
    lore:
    - <gold>A pie with sweet berries baked in.
GLOW_BERRY_PIE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 423
      components_patch:
        item_model: string:cooking:food/glowberrypie
    display name: <white>Glow Berry Pie
    flags:
      food: 5
      grain: true
      fruit: true
      sugar: true
    lore:
    - <gold>A pie that's filling glows beneath the crust.
CHOCOLATE_CUPCAKE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 424
      components_patch:
        item_model: string:cooking:food/chocolatecupcake
    display name: <white>Chocolate Cupcake
    flags:
      food: 1
      grain: true
      sugar: true
    lore:
    - <gold>A small cake made with chocolate.
CARAMEL_CUPCAKE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 425
      components_patch:
        item_model: string:cooking:food/caramelcupcake
    display name: <white>Caramel Cupcake
    flags:
      food: 2
      grain: true
      sugar: true
    lore:
    - <gold>A small cake made with caramel.
CHOCOLATE_CAKE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 426
      components_patch:
        item_model: string:cooking:food/chocolatecake
    display name: <white>Chocolate Cake
    flags:
      food: 10
      grain: true
      sugar: true
    lore:
    - <gold>A decent sized cake made with chocolate.
CHEESE_CAKE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 427
      components_patch:
        item_model: string:cooking:food/cheesecake
    display name: <white>Cheese Cake
    flags:
      food: 8
      grain: true
      dairy: true
      sugar: true
    lore:
    - <gold>A decently sized cake made with cheese mixed in.
PUMPKIN_CHEESE_CAKE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 428
      components_patch:
        item_model: string:cooking:food/pumpkincheesecake
    display name: <white>Pumpkin Cheese Cake
    flags:
      food: 9
      grain: true
      dairy: true
      vegetable: true
      sugar: true
    lore:
    - <gold>A cheese cake with pumpkin inside.
CHOCOLATE_MUFFIN:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 429
      components_patch:
        item_model: string:cooking:food/chocolatemuffin
    display name: <white>Chocolate Muffin
    flags:
      food: 2
      grain: true
      sugar: true
    lore:
    - <gold>A small baked good with chocolate as an ingredient.
CARROT_MUFFIN:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 430
      components_patch:
        item_model: string:cooking:food/carrotmuffin
    display name: <white>Carrot Muffin
    flags:
      food: 2
      grain: true
      vegetable: true
    lore:
    - <gold>A small baked good with carrot inside.
PUMPKIN_MUFFIN:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 431
      components_patch:
        item_model: string:cooking:food/pumpkinmuffin
    display name: <white>Pumpkin Muffin
    flags:
      food: 2
      grain: true
      vegetable: true
    lore:
    - <gold>a small baked good with pumpkin inside.
CARAMEL_MUFFIN:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 432
      components_patch:
        item_model: string:cooking:food/caramelmuffin
    display name: <white>Caramel Muffin
    flags:
      food: 2
      grain: true
      sugar: true
    lore:
    - <gold>A small baked good with caramel as an ingredient.
DONUT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 433
      components_patch:
        item_model: string:cooking:food/donut
    display name: <white>Donut
    flags:
      food: 5
      grain: true
    lore:
    - <gold>Fluffy fried pastry.
CHOCOLATE_DONUT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 434
      components_patch:
        item_model: string:cooking:food/chocolatedonut
    display name: <white>Chocolate Donut
    flags:
      food: 7
      grain: true
      sugar: true
    lore:
    - <gold>A Donut covered in chocolate.
JELLY_DONUT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 435
      components_patch:
        item_model: string:cooking:food/jellydonut
    display name: <white>Jelly Donut
    flags:
      food: 7
      grain: true
      fruit: true
      sugar: true
    lore:
    - <gold>A donut filled with jelly.
CRACKER:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 436
      components_patch:
        item_model: string:cooking:food/cracker
    display name: <white>Cracker
    flags:
      food: 1
      grain: true
    lore:
    - <gold>A simple food good for travel rations.
SOFT_PRETZEL:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 437
      components_patch:
        item_model: string:cooking:food/softpretzel
    display name: <white>Soft Pretzel
    flags:
      food: 2
      grain: true
    lore:
    - <gold>Baked food, often salted and dipped in things.
TORTILLA:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 438
      components_patch:
        item_model: string:cooking:food/tortilla
    display name: <white>Tortilla
    flags:
      food: 2
      grain: true
    lore:
    - <gold>A flat bread like disc.
QUESADILLA:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 439
      components_patch:
        item_model: string:cooking:food/quesadilla
    display name: <white>Quesadilla
    flags:
      food: 5
      grain: true
      dairy: true
    lore:
    - <gold>Two tortillas with cheese between them.
BREAKFAST_BURRITO:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 440
      components_patch:
        item_model: string:cooking:food/breakfastburrito
    display name: <white>Breakfast Burrito
    flags:
      food: 11
      grain: true
      dairy: true
      protein: true
    lore:
    - <gold>A tortilla wrapped around a basic breakfast.
SUGAR_COOKIE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 441
      components_patch:
        item_model: string:cooking:food/sugarcookie
    display name: <white>Sugar Cookie
    flags:
      food: 2
      grain: true
      dairy: true
      sugar: true
    lore:
    - <gold>Sugar baked good with no chocolate.
SUNFLOWER_SEEDS:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 442
      components_patch:
        item_model: string:cooking:food/sunflowerseeds
    display name: <white>Burgerflower Seeds
    flags:
      food: 1
      grain: true
      Cooking_ID: sunflower_seeds
    lore:
    - <gold>Seeds from the burger flower. Best roasted.
ROASTED_SUNFLOWER_SEEDS:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    display name: <white>Roasted Burgerflower Seeds
    mechanisms:
      custom_model_data: 443
      components_patch:
        item_model: string:cooking:food/roastedsunflowerseeds
    flags:
      food: 2
      grain: true
    lore:
    - <gold>Roasted burgerflower seeds, they have a satisfying crunch.
SEED_SOUP:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    display name: <white>Seed Soup
    mechanisms:
      custom_model_data: 444
      components_patch:
        item_model: string:cooking:food/seedsoup
    flags:
      food: 2
      has_bowl: true
      grain: true
    lore:
    - <gold>Steed Stoup
Large_Cake:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: cake
    display name: <white>Large Cake
    mechanisms:
      custom_model_data: 445
      components_patch:
        item_model: string:minecraft:cake
    flags:
      food: 25
      grain: true
      dairy: true
      sugar: true
    lore:
    - <gold>A large cake, it is ideally set on a whole table and shared.


# Protein
New_Egg:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: brick
    mechanisms:
      components_patch:
        item_model: string:minecraft:egg
    display name: <white>Cooking Egg
    flags:
      Cooking_ID: New_Egg
      Cooking_Tag: egg
      Protein: true
    lore:
    - <gold>A fresh egg, it is a good source of protein.

COOKING_RAW_CHICKEN:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 501
      components_patch:
        item_model: string:minecraft:chicken
    display name: <white>Raw Chicken
    flags:
      food: 2
      Cooking_ID: raw_chicken
      meat: chicken
      foodpoison: 30
      protein: true
    lore:
    - <gold>Raw chicken, dangerous when uncooked.
COOKING_COOKED_CHICKEN:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 502
      components_patch:
        item_model: string:minecraft:cooked_chicken
    display name: <white>Cooked Chicken
    flags:
      food: 3
      Cooking_ID: cooked_chicken
      protein: true
    lore:
    - <gold>Cooked chicken, it is unseasoned but safe.
GROUND_CHICKEN:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 503
      components_patch:
        item_model: string:cooking:food/groundchicken
    display name: <white>Ground Chicken
    flags:
      food: 3
      protein: true
      foodpoison: 10
    lore:
    - <gold>Ground raw chicken, it is unsafe to eat raw.
FRIED_CHICKEN:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 504
      components_patch:
        item_model: string:cooking:food/friedchicken
    display name: <white>Fried Chicken
    flags:
      food: 5
      protein: true
      grain: true
    lore:
    - <gold>Chicken fried in flour.
CHICKEN_JERKY:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 505
      components_patch:
        item_model: string:cooking:food/chickenjerky
    display name: <white>Chicken Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Chicken cured with salt.
CHICKEN_NUGGET:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 506
      components_patch:
        item_model: string:cooking:food/chickennugget
    display name: <white>Chicken Nugget
    flags:
      food: 2
      protein: true
      grain: true
    lore:
    - <gold>A fried nugget of chicken meat.
CHICKEN_SANDWICH:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 507
      components_patch:
        item_model: string:cooking:food/chickensandwich
    display name: <white>Chicken Sandwich
    flags:
      food: 12
      protein: true
      grain: true
    lore:
    - <gold>A sandwich made with ground chicken.
CHICKEN_POT_PIE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 508
      components_patch:
        item_model: string:cooking:food/chickenpotpie
    display name: <white>Chicken Pot Pie
    flags:
      food: 7
      protein: true
      vegetable: true
      grain: true
    lore:
    - <gold>A meat pie baked in a pan, made with Chicken.
CHICKEN_DINNER:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 509
      components_patch:
        item_model: string:cooking:food/chickendinner
    display name: <white>Chicken Dinner
    flags:
      food: 10
      protein: true
      vegetable: true
    lore:
    - <gold>A full dinner made with chicken.
COOKING_RAW_BEEF:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 510
      components_patch:
        item_model: string:minecraft:beef
    display name: <white>Raw Beef
    flags:
      food: 2
      Cooking_ID: raw_beef
      meat: beef
      foodpoison: 30
      protein: true
    lore:
    - <gold>A cut of cow meat it is unsafe raw.
COOKING_COOKED_BEEF:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 511
      components_patch:
        item_model: string:minecraft:cooked_beef
    display name: <white>Cooked Steak
    flags:
      Cooking_ID: cooked_beef
      food: 3
      protein: true
    lore:
    - <gold>Cooked Beef, it is safe but bland.
GROUND_BEEF:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 512
      components_patch:
        item_model: string:cooking:food/groundbeef
    display name: <white>Ground Beef
    flags:
      food: 3
      protein: true
      foodpoison: 10
    lore:
    - <gold>Ground raw beef. It is unsafe to eat as is.
HAMBURGER:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 513
      components_patch:
        item_model: string:cooking:food/hamburger
    display name: <white>Hamburger
    flags:
      food: 9
      protein: true
      grain: true
    lore:
    - <gold>A burger made of ground beef, between two pieces of bread.
CHEESEBURGER:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 514
      components_patch:
        item_model: string:cooking:food/cheeseburger
    display name: <white>Cheeseburger
    flags:
      food: 11
      protein: true
      dairy: true
      grain: true
    lore:
    - <gold>A hamburger with cheese.
BACON_CHEESEBURGER:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    display name: <white>Bacon Cheeseburger
    mechanisms:
      custom_model_data: 515
      components_patch:
        item_model: string:cooking:food/baconcheeseburger
    flags:
      food: 13
      protein: true
      dairy: true
      grain: true
    lore:
    - <gold>A cheeseburger with bacon.
BEEF_JERKY:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 516
      components_patch:
        item_model: string:cooking:food/beefjerky
    display name: <white>Beef Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Beef cured with salt.
COOKING_RAW_PORK:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 517
      components_patch:
        item_model: string:minecraft:porkchop
    display name: <white>Raw Pork
    flags:
      food: 2
      Cooking_ID: raw_pork
      meat: pork
      foodpoison: 30
      protein: true
    lore:
    - <gold>Raw meat from a pig. Unsafe to eat raw.
COOKING_COOKED_PORK:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 518
      components_patch:
        item_model: string:minecraft:cooked_porkchop
    display name: <white>Cooked Pork
    flags:
      Cooking_ID: cooked_pork
      food: 3
      protein: true
    lore:
    - <gold>Cooked meat from a pig. It is bland.
GROUND_PORK:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 519
      components_patch:
        item_model: string:cooking:food/groundpork
    display name: <white>Ground Pork
    flags:
      food: 3
      protein: true
      foodpoison: 10
    lore:
    - <gold>raw ground pork. It is unsafe to eat.
PORK_JERKY:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 520
      components_patch:
        item_model: string:cooking:food/porkjerky
    display name: <white>Pork Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Pork cured with salt.
BAKED_HAM:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 521
      components_patch:
        item_model: string:cooking:food/bakedham
    display name: <white>Baked Ham
    flags:
      food: 5
      protein: true
      fruit: true
      sugar: true
    lore:
    - <gold>Ham baked with sugar, and an apple.
HOT_DOG:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 522
      components_patch:
        item_model: string:cooking:food/hotdog
    display name: <white>Hot Dog
    flags:
      food: 9
      protein: true
      grain: true
    lore:
    - <gold>Cooked ground pork in a casing, with a bun made of bread.
BACON_AND_EGGS:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 523
      components_patch:
        item_model: string:cooking:food/baconandeggs
    display name: <white>Bacon And Eggs
    flags:
      food: 5
      protein: true
    lore:
    - <gold>Bacon and eggs.... yes really.
EPIC_BACON:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 524
      components_patch:
        item_model: string:cooking:food/epicbacon
    display name: <white>Epic Bacon
    flags:
      food: 11
      protein: true
COOKING_RAW_FISH:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 525
      components_patch:
        item_model: string:minecraft:cod
    display name: <white>Raw Fish
    flags:
      food: 2
      Cooking_ID: raw_fish
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <gold>Raw fish, parts are unsafe to eat.
COOKING_COOKED_FISH:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 526
      components_patch:
        item_model: string:minecraft:cooked_cod
    display name: <white>Cooked Fish
    flags:
      Cooking_ID: cooked_fish
      food: 3
      protein: true
    lore:
    - <gold>Cooked fish, it's only flavoring is fish.
GROUND_FISH:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 527
      components_patch:
        item_model: string:cooking:food/groundfish
    display name: <white>Ground Fish
    flags:
      food: 3
      protein: true
    lore:
    - <gold>Ground fish meat.
FISH_STICKS:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 528
      components_patch:
        item_model: string:cooking:food/fishsticks
    display name: <white>Fish Sticks
    flags:
      food: 6
      protein: true
      grain: true
    lore:
    - <gold>A length of ground fish fried.
FISH_SANDWICH:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 529
      components_patch:
        item_model: string:cooking:food/fishsandwich
    display name: <white>Fish Sandwich
    flags:
      food: 9
      protein: true
      grain: true
    lore:
    - <gold>A sandwich made with ground fish.
FISH_JERKY:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 530
      components_patch:
        item_model: string:cooking:food/fishjerky
    display name: <white>Fish Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Fish cured in salt.
FISH_AND_CHIPS:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 531
      components_patch:
        item_model: string:cooking:food/fishandchips
    display name: <white>Fish And Chips
    flags:
      food: 7
      protein: true
      grain: true
      vegetable: true
    lore:
    - <gold>Fish and potato, both cut and fried golden.
COOKING_RAW_MUTTON:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 532
      components_patch:
        item_model: string:cooking:food/raw_mutton
    display name: <white>Raw Mutton
    flags:
      food: 2
      Cooking_ID: raw_mutton
      meat: mutton
      foodpoison: 30
      protein: true
    lore:
    - <gold>Raw sheep meat dangerous until cooked.
COOKING_COOKED_MUTTON:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 533
      components_patch:
        item_model: string:cooking:food/cooked_mutton
    display name: <white>Cooked Mutton
    flags:
      food: 3
      Cooking_ID: cooked_mutton
      protein: true
    lore:
    - <gold>Cooked mutton with no seasoning.
MUTTON_JERKY:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 534
      components_patch:
        item_model: string:cooking:food/muttonjerky
    display name: <white>Mutton Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Mutton cured with salt.
GROUND_MUTTON:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 535
      components_patch:
        item_model: string:cooking:food/groundmutton
    display name: <white>Ground Mutton
    flags:
      food: 3
      protein: true
      foodpoison: 10
    lore:
    - <gold>Ground raw mutton. It is unsafe as is.
COOKING_RAW_RABBIT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 536
      components_patch:
        item_model: string:minecraft:rabbit
    display name: <white>Raw Rabbit
    flags:
      food: 2
      Cooking_ID: raw_rabbit
      meat: rabbit
      foodpoison: 30
      protein: true
    lore:
    - <gold>Raw rabbit, it is unsafe until cooked.
COOKING_COOKED_RABBIT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 537
      components_patch:
        item_model: string:cooking:food/cooked_rabbit
    display name: <white>Cooked Rabbit
    flags:
      food: 3
      Cooking_ID: cooked_rabbit
      protein: true
    lore:
    - <gold>Cooked rabbit, safe but bland.
GROUND_RABBIT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 538
      components_patch:
        item_model: string:cooking:food/groundrabbit
    display name: <white>Ground Rabbit
    flags:
      food: 3
      protein: true
      foodpoison: 10
    lore:
    - <gold>Ground raw rabbit.
New_RABBIT_STEW:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 539
      components_patch:
        item_model: string:minecraft:rabbit_stew
    display name: <white>Rabbit Stew
    flags:
      food: 6
      has_bowl: true
      protein: true
      vegetable: true
    lore:
    - <gold>Stew made from rabbit and vegetables.
RABBIT_JERKY:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 540
      components_patch:
        item_model: string:cooking:food/rabbitjerky
    display name: <white>Rabbit Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Rabbit meat cured in salt.
Cooking_Egg:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: egg
    mechanisms:
      custom_model_data: 541
      components_patch:
        item_model: string:minecraft:egg
    Display name: <white>Bird Egg
    flags:
      food: 1
      protein: true
    lore:
    - <gold>A raw chicken egg.
Mayonnaise:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 542
      components_patch:
        item_model: string:cooking:ingredients/mayo
    display name: <white>Mayonnaise
    flags:
      Cooking_Tag: condiment
      protein: true
    lore:
    - <gold>Condiment made of egg.
BOILED_EGG:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 543
      components_patch:
        item_model: string:cooking:food/boiledegg
    display name: <white>Boiled Egg
    flags:
      food: 3
      protein: true
    lore:
    - <gold>Egg boiled in water.
FRIED_EGG:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 544
      components_patch:
        item_model: string:cooking:food/friedegg
    display name: <white>Fried Egg
    flags:
      food: 3
      protein: true
    lore:
    - <gold>Can you fry an egg ontop the tallest mountain?
SCRAMBLED_EGG:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 545
      components_patch:
        item_model: string:cooking:food/scrambledegg
    display name: <white>Scambled Egg
    flags:
      food: 3
      protein: true
      dairy: true
    lore:
    - <gold>An egg scrambled as it cooked in a pan.
POT_ROAST:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 546
      components_patch:
        item_model: string:cooking:food/potroast
    display name: <white>Pot Roast
    flags:
      food: 5
      has_bowl: true
      protein: true
      vegetable: true
    lore:
    - <gold>A roast made with hearty beef, potatoes and carrots!
COOKING_RAW_HORSE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 547
      components_patch:
        item_model: string:cooking:food/rawhorse
    display name: <white>Raw Horse Meat
    flags:
      food: 2
      Cooking_ID: raw_horse
      meat: horse
      foodpoison: 30
      protein: true
    lore:
    - <gold>A fallen steed, it is unethical and unsafe to eat. Raw anyways.
COOKING_RAW_GOAT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 548
      components_patch:
        item_model: string:cooking:food/rawgoat
    display name: <white>Raw Goat Meat
    flags:
      food: 2
      Cooking_ID: raw_goat
      meat: goat
      foodpoison: 30
      protein: true
    lore:
    - <gold>Gamey meat from a goat. It is unsafe to eat raw.
COOKING_COOKED_HORSE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 549
      components_patch:
        item_model: string:cooking:food/cookedhorse
    display name: <white>Cooked Horse Meat
    flags:
      food: 3
      protein: true
    lore:
    - <gold>Cooked meat from a horse. Safe for your stomach at least..
COOKING_COOKED_GOAT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 550
      components_patch:
        item_model: string:cooking:food/cookedgoat
    display name: <white>Cooked Goat Meat
    flags:
      food: 3
      protein: true
    lore:
    - <gold>Cooked goat, it still has a musky taste.
RAW_KEBAB:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 551
      components_patch:
        item_model: string:cooking:food/rawkebab
    display name: <white>Raw Kebab
    flags:
      food: 5
      Cooking_ID: Raw_Kebab
      foodpoison: 30
      has_stick: true
      protein: true
      vegetable: true
    lore:
    - <gold>A skewer with meat and vegetables on it. It is raw.
Cooked_KEBAB:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 552
      components_patch:
        item_model: string:cooking:food/cookedkebab
    display name: <white>Cooked Kebab
    flags:
      food: 6
      Cooking_ID: Cooked_Kebab
      has_stick: true
      protein: true
      vegetable: true
    lore:
    - <gold>A skewer with meat and vegetables cooked on it.

# Vegetable
New_POTATO:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 601
      components_patch:
        item_model: string:minecraft:potato
    display name: <white>Potato
    flags:
      food: 1
      Cooking_ID: New_Potato
      Cooking_Tag: Vegetable
      Vegetable: Potato
    lore:
    - <gold>Starchy tuber grown in the ground.
New_CARROT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 602
      components_patch:
        item_model: string:minecraft:carrot
    display name: <white>Carrot
    flags:
      food: 1
      Cooking_ID: New_Carrot
      Cooking_Tag: Vegetable
      Vegetable: Carrot
    lore:
    - <gold>Root plant from the ground.
New_Beetroot:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 603
      components_patch:
        item_model: string:minecraft:beetroot
    display name: <white>Beetroot
    flags:
      food: 1
      Cooking_ID: New_Beetroot
      Cooking_Tag: Vegetable
      Vegetable: Beetroot
    lore:
    - <gold>A sweet root plant from the ground.
New_Pumpkin:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: Pumpkin
    display name: <white>Pumpkin
    mechanisms:
      custom_model_data: 604
      components_patch:
        item_model: string:minecraft:pumpkin
    flags:
      Cooking_ID: New_Pumpkin
      Cooking_Tag: Vegetable
      Vegetable: Pumpkin
    lore:
    - <gold>Round gourd, it is very fleshy. Sweet and earth even raw.
New_Netherwart:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: nether_wart
    display name: <white>Redwart
    mechanisms:
      custom_model_data: 605
      components_patch:
        item_model: string:minecraft:nether_wart
    flags:
      Cooking_ID: New_Netherwart
      vegetable: true
    lore:
    - <gold>Strange fungus. It grows like polyps.
New_Baked_Potato:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 606
      components_patch:
        item_model: string:minecraft:baked_potato
    display name: <white>Baked Potato
    flags:
      food: 2
      Cooking_ID: New_Baked_Potato
      vegetable: true
    lore:
    - <gold>Potato baked thoroughly.
BUTTERED_BAKED_POTATO:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 607
      components_patch:
        item_model: string:cooking:food/butteredbakedpotato
    display name: <white>Buttered Baked Potato
    flags:
      food: 3
      vegetable: true
      dairy: true
    lore:
    - <gold>Baked potato with butter on or inside.
MASHED_POTATO:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 608
      components_patch:
        item_model: string:cooking:food/mashedpotato
    display name: <white>Mashed Potato
    flags:
      food: 3
      has_bowl: true
      vegetable: true
      dairy: true
    lore:
    - <gold>Potatoes mashed and typically given additional ingredients.
POTATO_SALAD:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 609
      components_patch:
        item_model: string:cooking:food/potatosalad
    display name: <white>Potato Salad
    flags:
      food: 3
      has_bowl: true
      vegetable: true
      protein: true
    lore:
    - <gold>A creamy potato and vegetable salad.
FRIES:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 610
      components_patch:
        item_model: string:cooking:food/fries
    display name: <white>Fries
    flags:
      food: 2
      vegetable: true
    lore:
    - <gold>Wedges of potato that are fried or baked.
POTATO_CHIPS:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 611
      components_patch:
        item_model: string:cooking:food/potatochips
    display name: <white>Potato Chips
    flags:
      food: 2
      vegetable: true
    lore:
    - <gold>Thin wedges of potato typically baked after being made extra thin.
POTATO_SOUP:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 612
      components_patch:
        item_model: string:cooking:food/potatosoup
    display name: <white>Potato Soup
    flags:
      food: 3
      has_bowl: true
      vegetable: true
    lore:
    - <gold>Soup made with potato.
GLAZED_CARROT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 613
      components_patch:
        item_model: string:cooking:food/glazedcarrot
    display name: <white>Glazed Carrots
    flags:
      food: 4
      vegetable: true
      dairy: true
    lore:
    - <gold>A carrot with a glazed surface.
CARROT_SOUP:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 614
      components_patch:
        item_model: string:cooking:food/carrotsoup
    display name: <white>Carrot Soup
    flags:
      food: 3
      has_bowl: true
      vegetable: true
    lore:
    - <gold>A soup made with carrots.
PICKLED_BEETS:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 615
      components_patch:
        item_model: string:cooking:food/pickledbeets
    display name: <white>Pickled Beets
    flags:
      food: 3
      vegetable: true
    lore:
    - <gold>beets pickled in a brine.
New_PUMPKIN_PIE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 616
      components_patch:
        item_model: string:cooking:food/newpumpkinpie
    display name: <white>Pumpkin Pie
    flags:
      food: 5
      vegetable: true
      sugar: true
    lore:
    - <gold>Pie baked out of pumpkin.
PUMPKIN_SOUP:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 617
      components_patch:
        item_model: string:cooking:food/pumpkinsoup
    display name: <white>Pumpkin Soup
    flags:
      food: 3
      has_bowl: true
      vegetable: true
    lore:
    - <gold>Soup made of pumpkin.
New_Brown_Mushroom:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 618
      components_patch:
        item_model: string:minecraft:brown_mushroom
    display name: <white>Brown Mushroom
    flags:
      food: 1
      mushroom: brown
      Cooking_Tag: mushroom
      Cooking_ID: new_brown_mushroom
      vegetable: true
    lore:
    - <gold>Mushrooms grown best in the dark, they are brown.
New_Red_Mushroom:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 619
      components_patch:
        item_model: string:minecraft:red_mushroom
    display name: <white>Red Mushroom
    flags:
      food: 1
      mushroom: red
      Cooking_Tag: mushroom
      foodpoison: 60
      vegetable: true
    lore:
    - <gold>Mushrooms grown best in the dark, they are red.
New_Crimson_Fungus:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 620
      components_patch:
        item_model: string:minecraft:crimson_fungus
    display name: <white>Crimson Fungus
    flags:
      food: 1
      mushroom: crimson
      Cooking_Tag: mushroom
      foodpoison: 60
      vegetable: true
    lore:
    - <gold>Strange red mushrooms.
New_Warped_Fungus:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 621
      components_patch:
        item_model: string:minecraft:warped_fungus
    display name: <white>Warped Fungus
    flags:
      food: 1
      mushroom: warped
      Cooking_Tag: mushroom
      foodpoison: 60
      vegetable: true
    lore:
    - <gold>Odd mushrooms with a strange shape.
ROASTED_MUSHROOM:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 622
      components_patch:
        item_model: string:cooking:food/roastedmushroom
    display name: <white>Roasted Mushroom
    flags:
      food: 3
      vegetable: true
    lore:
    - <gold>Brown mushroom roasted on heat.
NEW_MUSHROOM_SOUP:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 623
      components_patch:
        item_model: string:cooking:food/newmushroomsoup
    display name: <white>Mushroom Soup
    flags:
      food: 2
      has_bowl: true
      vegetable: true
    lore:
    - <gold>Soup made of mushrooms.
STUFFED_MUSHROOM:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 624
      components_patch:
        item_model: string:cooking:food/stuffedmushroom
    display name: <white>Stuffed Mushroom
    flags:
      food: 7
      vegetable: true
      grain: true
      dairy: true
    lore:
    - <gold>A mushroom stuffed with all manner of ingredient.
MUSHROOM_STEAK:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 625
      components_patch:
        item_model: string:cooking:food/mushroomsteak
    display name: <white>Mushroom Steak
    flags:
      food: 7
      vegetable: true
      protein: true
      dairy: true
    #Give this a cooked meat tag for those vegetarians
    lore:
    - <gold>Mushroom and steak, it is a hearty meal.
MUSHROOM_OIL:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 626
      components_patch:
        item_model: string:cooking:ingredients/mushroomoil
    display name: <white>Mushroom Oil
    flags:
      vegetable: true
    lore:
    - <gold>Oil from mushrooms.
CREAM_OF_MUSHROOM:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    display name: <white>Cream of Mushroom
    mechanisms:
      custom_model_data: 627
      components_patch:
        item_model: string:cooking:food/creamofmushroom
    flags:
      food: 4
      has_bowl: true
      vegetable: true
      dairy: true
    lore:
    - <gold>Soup made of mushroom & cream.
New_Beetroot_Soup:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 628
      components_patch:
        item_model: string:minecraft:beetroot_soup
    display name: <white>Beetroot Soup
    flags:
      food: 3
      has_bowl: true
      vegetable: true
    lore:
    - <gold>Soup made of beetroots.
Netherwart_Soup:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 629
      components_patch:
        item_model: string:cooking:food/netherwartsoup
    display name: <white>Redwart Soup
    flags:
      food: 3
      has_bowl: true
      vegetable: true
    lore:
    - <gold>Soup made of Netherwart.
New_Golden_Carrot:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    display name: <gold>Golden Carrot
    mechanisms:
      custom_model_data: 630
      components_patch:
        item_model: string:minecraft:golden_carrot
    flags:
      food: 5
      vegetable: true
New_Poisonous_Potato:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 631
      components_patch:
        item_model: string:minecraft:poisonous_potato
    display name: <white>Poisonous Potato
    flags:
      food: 1
      Cooking_ID: poisonous_potato
      poison: 60
      vegetable: true
New_Kelp:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: kelp
    display name: <white>Kelp
    mechanisms:
      custom_model_data: 632
      components_patch:
        item_model: string:minecraft:kelp
    flags:
      food: 1
      Cooking_ID: Kelp
      vegetable: true
New_Dried_Kelp:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    display name: <white>Dried Kelp
    mechanisms:
      custom_model_data: 633
      components_patch:
        item_model: string:minecraft:dried_kelp
    flags:
      food: 1
      vegetable: true

# Sugars
New_Sugar:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 701
      components_patch:
        item_model: string:cooking:ingredients/sugar
    display name: <white>Sugar
    flags:
      sugar: true
    lore:
    - <gold>A sweet powder made from sugarcane.
    recipes:
      1:
        type: shapeless
        input: sugar_cane
New_Cocoa_Beans:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: cocoa_beans
    mechanisms:
      custom_model_data: 702
      components_patch:
        item_model: string:minecraft:cocoa_beans
    display name: <white>Cocoa Beans
    flags:
      sugar: true
    lore:
    - <gold>A bean with a unique taste.
COCOA_POWDER:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 703
      components_patch:
        item_model: string:cooking:ingredients/cocoapowder
    display name: <white>Cocoa Powder
    flags:
      sugar: true
    lore:
    - <gold>Powder from Cocoa Beans it is sweeted with sugar.
CHOCOLATE_BAR:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 704
      components_patch:
        item_model: string:cooking:food/chocolatebar
    display name: <white>Chocolate Bar
    flags:
      food: 4
      sugar: true
    lore:
    - <gold>A bar made of Cocoa bean, sugar and milk.
HOT_CHOCOLATE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 705
      components_patch:
        item_model: string:cooking:food/hotchocolate
    display name: <white>Hot Chocolate
    flags:
      food: 4
      sugar: true
      dairy: true
    lore:
    - <gold>Milk and cocoa powder, it is sweet!
CHOCOLATE_BACON:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 706
      components_patch:
        item_model: string:cooking:food/chocolatebacon
    display name: <white>Chocolate Bacon
    flags:
      food: 7
      sugar: true
      protein: true
    lore:
    - <gold>Bacon covered in chocolate.
CHOCOLATE_PUDDING:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 707
      components_patch:
        item_model: string:cooking:food/chocolatepudding
    display name: <white>Chocolate Pudding
    flags:
      food: 4
      sugar: true
      dairy: true
    lore:
    - <gold>A milky chocolately treat.
CHOCOLATE_ROLL:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 708
      components_patch:
        item_model: string:cooking:food/chocolateroll
    display name: <white>Chocolate Roll
    flags:
      food: 5
      sugar: true
      grain: true
      dary: true
    lore:
    - <gold>Small roll of cake with cream inside.
CHOCOLATE_CARAMEL_FUDGE:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 709
      components_patch:
        item_model: string:cooking:food/chocolatecaramelfudge
    display name: <white>Chocolate Caramel Fudge
    flags:
      food: 8
      sugar: true
    lore:
    - <gold>Chocolate baked into a solid state, it has caramel mixed in.
CARAMEL:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    display name: <white>Caramel
    mechanisms:
      custom_model_data: 710
      components_patch:
        item_model: string:cooking:food/caramel
    flags:
      food: 3
      sugar: true
      dairy: true
    lore:
    - <gold>A firm golden-brown substance made from heating sugar.
MARSHMALLOW:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    display name: <white>Marshmallow
    mechanisms:
      custom_model_data: 711
      components_patch:
        item_model: string:cooking:food/marshmallow
    flags:
      food: 1
      sugar: true
    lore:
    - <gold>Fluffy sugar blob
GUMMY_BEARS:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 712
      components_patch:
        item_model: string:cooking:food/gummybears
    display name: <white>Gummy Bears
    flags:
      food: 1
      sugar: true
    lore:
    - <gold>Gummy bear like sweet made with gelatin.
JELLY_BEANS:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    display name: <white>Jelly Beans
    mechanisms:
      custom_model_data: 713
      components_patch:
        item_model: string:cooking:food/jellybeans
    flags:
      food: 1
      sugar: true
    lore:
    - <gold>crunchy yet gooey sugar beans.
MARSHMALLOW_CHICKS:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 714
      components_patch:
        item_model: string:cooking:food/marshmallowchicks
    display name: <white>Marshmallow Chickadees
    flags:
      food: 1
      sugar: true
    lore:
    - <gold>Marshmallow in the shape of baby birds.
COTTON_CANDY:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 715
      components_patch:
        item_model: string:cooking:food/cottoncandy
    display name: <white>Cotton Candy
    flags:
      food: 1
      sugar: true
    lore:
    - <gold>Sugar whipped into a hair thin cotton like substance.
SMORES:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: tropical_fish
    mechanisms:
      custom_model_data: 716
      components_patch:
        item_model: string:cooking:food/smores
    display name: <white>Smores
    flags:
      food: 7
      sugar: true
      grain: true
    lore:
    - <gold>Fun for the campfire, crackers, chocolate, and marshmallow, Yum.
TRAILMIX:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: dried_kelp
    mechanisms:
      custom_model_data: 717
      components_patch:
        item_model: string:cooking:food/trailmix
    display name: <white>Trailmix
    flags:
      food: 2
      sugar: true
      grain: true
      fruit: true
    lore:
    - <gold>A hearty mix of various foodstuffs.
New_Sugar_Cane:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: sugar_cane
    mechanisms:
      custom_model_data: 718
      components_patch:
        item_model: string:cooking:food/newsugarcane
    display name: <white>Sugar Cane
    lore:
    - <gold>A shoot that can be cooked down into sugar.


# Misc
COOKING_SALT:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 801
      components_patch:
        item_model: string:cooking:ingredients/salt
    display name: <white>Cooking Salt
    lore:
    - <gold>Salt made from the sea, or harvested.
Fresh_Water:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 802
      components_patch:
        item_model: string:cooking:food/freshwater
    flags:
      food: 0
      drink: true
    display name: <white>Fresh Water
    lore:
    - <green>A pail of fresh water ready for cooking! Or to put out fire in a pinch.
    recipes:
      1:
        type: shapeless
        input: water_bucket
        output_quantity: 4
COOKING_OIL:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 803
      components_patch:
        item_model: string:cooking:ingredients/cooking_oil
    display name: <white>Cooking Oil
    lore:
    - <gold>Oil used to fry and cook dishes.
VINEGAR:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 804
      components_patch:
        item_model: string:cooking:ingredients/vinegar
    display name: <white>Vinegar
    lore:
    - <gold>A useful component in cooking, try making brine.
STOCK:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: BRICK
    mechanisms:
      custom_model_data: 805
      components_patch:
        item_model: string:cooking:ingredients/stock
    display name: <white>Stock
    lore:
    - <gold>Stock used in soups.
New_Snowball:
    type: item
    debug: false
    data:
      cooking_tag:
        type: ingredient
    material: Snowball
    mechanisms:
      custom_model_data: 806
    display name: <white>Snowball
    lore:
    - <gold>A ball of snow, good if you want things to be chilled.