# This file contains all of the items associated with Cooking Systems

# First Organized: 6/28/2024

# Dairy
Fresh_Milk:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 201
    display name: <white>Fresh Milk
    flags:
      food: 1
      drink: true
      dairy: true
    lore:
    - <green>A pail of fresh milk perfect for cheese making or butter!
BUTTER:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 202
    display name: <white>Butter
    flags:
      food: 2
      dairy: true
    lore:
    - <gold>Milk churned into a wonderful ingredient often used in baking!
CREAM:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 203
    display name: <white>Cream
    flags:
      food: 1
      dairy: true
    lore:
    - <gold>A buttery product of milk, it gives <&dq>creamy<&dq> textures to food.
CHEESE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 204
    flags:
      food: 2
      dairy: true
    display name: <white>Cheese
    lore:
    - <gold>A preserved form of milk, it is made by fermentation.
YOGURT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 205
    flags:
      food: 2
      dairy: true
    display name: <white>Plain Yogurt
    lore:
    - <gold>Milk that has been fermented, it is slightly sour when unflavored.
CHOCOLATE_YOGURT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 206
    flags:
      food: 5
      dairy: true
      sugar: true
    display name: <white>Chocolate Yogurt
    lore:
    - <gold>Yogurt flavored with chocolate, it  is richer in taste.
APPLE_YOGURT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 207
    flags:
      food: 4
      dairy: true
      fruit: true
    display name: <white>Apple Yogurt
    lore:
    - <gold>Yogurt flavored with apple chunks, slightly sweeter.
SWEET_BERRY_YOGURT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 208
    flags:
      food: 4
      dairy: true
      fruit: true
    display name: <white>Sweet Berry Yogurt
    lore:
    - <gold>Yogurt flavored with sweet berries, it tastes sweet!
PUMPKIN_YOGURT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 209
    flags:
      food: 4
      dairy: true
      vegetable: true
    display name: <white>Pumpkin Yogurt
    lore:
    - <gold>Yogurt flavored with pumpkin, it tastes earthy with a hint of sweet.
CARAMEL_YOGURT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 210
    flags:
      food: 6
      dairy: true
      sugar: true
    display name: <white>Caramel Yogurt
    lore:
    - <gold>Yogurt flavored with caramel, it is sweet  and buttery.
ICE_CREAM:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 211
    flags:
      food: 3
      dairy: true
    display name: <white>Ice Cream
    lore:
    - <gold>Milk that has been mixed with snow, it is cold.
CHOCOLATE_ICE_CREAM:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 212
    flags:
      food: 6
      dairy: true
      sugar: true
    display name: <white>Chocolate Ice Cream
    lore:
    - <gold>Ice Cream flavored with chocolate, it is rich in flavor.
CARAMEL_ICE_CREAM:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 213
    flags:
      food: 7
      dairy: true
      sugar: true
    display name: <white>Caramel Ice Cream
    lore:
    - <gold>Ice Cream flavored with caramel. It is buttery and rich.
COOKIES_AND_MILK:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 214
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 301
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 302
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 303
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 304
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 305
    display name: <white>Apple Juice
    flags:
      food: 3
      fruit: true
      drink: true
    lore:
    - <gold>Juice from several apples, it is naturally sweet.
APPLE_SMOOTHIE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 306
    display name: <white>Apple Smoothie
    flags:
      food: 5
      fruit: true
      drink: true
    lore:
    - <gold>Apple juice mixed with snow. Refreshing!
Apple_Jelly:
    type: item
    material: tropical_fish
    display name: <white>Apple Jelly
    mechanisms:
      custom_model_data: 307
    flags:
      food: 3
      fruit: true
      sugar: true
      cooking_tag: jelly
    lore:
    - <gold>Apple juice preserved with added ingedients.
CARAMEL_APPLE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 308
    display name: <white>Caramel Apple
    flags:
      food: 5
      fruit: true
      sugar: true
    lore:
    - <gold>An apple covered in caramel.
APPLE_SAUCE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 309
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 310
    display name: <white>Melon Juice
    flags:
      food: 3
      fruit: true
      drink: true
    lore:
    - <gold>Juice from multiple slices of melon.
MELON_SMOOTHIE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 311
    display name: <white>Melon Smoothie
    flags:
      food: 5
      fruit: true
      drink: true
    lore:
    - <gold>Melon Juice mixed with snow. Refreshing!
MELON_JELLY:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 312
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 313
    display name: <white>Sweet Berry Juice
    flags:
      food: 3
      fruit: true
      drink: true
    lore:
    - <gold>Juice made from sweet berries.
SWEET_BERRY_SMOOTHIE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 314
    display name: <white>Sweet Berry Smoothie
    flags:
      food: 5
      fruit: true
      drink: true
    lore:
    - <gold>Sweet Berry Juice mixed with snow. Refreshing!
SWEET_BERRY_JELLY:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 315
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 316
    display name: <white>Glowberry Juice
    flags:
      food: 3
      fruit: true
      drink: true
    lore:
    - <white>Makes one feel Grossly Incandescent.
FRUIT_PUNCH:
    type: item
    material: TROPICAL_FISH
    display name: <white>Fruit Punch
    mechanisms:
      custom_model_data: 317
    flags:
      food: 5
      fruit: true
      drink: true
    lore:
    - <gold>A mixture of juice with added sugar.
FRUIT_SALAD:
    type: item
    material: TROPICAL_FISH
    display name: <white>Fruit Salad
    mechanisms:
      custom_model_data: 318
    flags:
      food: 3
      fruit: true
      has_bowl: true
    lore:
    - <gold>Cream and fruit mixed together.
New_Golden_Apple:
    type: item
    material: TROPICAL_FISH
    display name: <gold>Golden Apple
    mechanisms:
      custom_model_data: 319
    flags:
      food: 5
      fruit: true
# Grain
New_Wheat:
    type: item
    material: brick
    mechanisms:
      custom_model_data: 401
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
    material: BRICK
    display name: <white>Flour
    mechanisms:
      custom_model_data: 402
    flags:
      grain: true
    lore:
    - <gold>Ground wheat, a useful ingredient.
DOUGH:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 403
    display name: <white>Dough
    flags:
      cooking_id: dough
      grain: true
    lore:
    - <gold>A thick paste, made of flour.
BATTER:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 404
    display name: <white>Batter
    flags:
      grain: true
      dairy: true
    lore:
    - <gold>Thin mixture of dough often used in baking.
PASTA:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 405
    display name: <white>Pasta
    flags:
      grain: true
      dairy: true
    lore:
    - <gold>A form of dough often boiled or baked.
New_BREAD:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 406
    display name: <white>Bread
    flags:
      food: 3
      grain: true
    lore:
    - <gold>Staple food, it is seen as a necessity to live in some places.
New_COOKIE:
    type: item
    material: dried_kelp
    mechanisms:
      custom_model_data: 407
    display name: <white>Cookie
    flags:
      food: 1
      grain: true
      sugar: true
    lore:
    - <gold>sweet bread made with chocolate. It is baked.
Buttered_TOAST:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 408
    display name: <white>Buttered Toast
    flags:
      food: 3
      grain: true
      dairy: true
    lore:
    - <gold>Toasted bread with butter on top.
GRILLED_CHEESE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 409
    display name: <white>Grilled Cheese
    flags:
      food: 8
      grain: true
      dairy: true
    lore:
    - <gold>two pieces of buttered toast with cheese melted between them.
SWEET_BERRY_JELLY_TOAST:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 410
    display name: <white>Sweet Berry Toast
    flags:
      food: 7
      grain: true
      fruit: true
    lore:
    - <gold>Buttered toast with sweet berry jelly on top.
MELON_JELLY_TOAST:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 411
    display name: <white>Melon Jelly Toast
    flags:
      food: 7
      grain: true
      fruit: true
    lore:
    - <gold>Buttered toast with melon jelly on top.
APPLE_JELLY_TOAST:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 412
    display name: <white>Apple Jelly Toast
    flags:
      food: 7
      grain: true
      fruit: true
    lore:
    - <gold>Buttered toast with apple jelly on top.
CARROT_CAKE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 413
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 414
    display name: <white>Carrot Bread
    flags:
      food: 4
      grain: true
      vegetable: true
    lore:
    - <gold>Bread made with carrots.
PUMPKIN_BREAD:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 415
    display name: <white>Pumpkin Bread
    flags:
      food: 4
      grain: true
      vegetable: true
    lore:
    - <gold>Bread made with pumpkin.
PUMPKIN_CUPCAKE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 416
    display name: <white>Pumpkin Cupcake
    flags:
      food: 1
      grain: true
      vegetable: true
    lore:
    - <gold>A small cake made with pumpkin.
CARROT_CUPCAKE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 417
    display name: <white>Carrot Cupcake
    flags:
      food: 1
      grain: true
      vegetable: true
    lore:
    - <gold>A small cake made with carrots.
SQUID_INK_PASTA:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 418
    display name: <white>Squid Ink Pasta
    flags:
      food: 7
      grain: true
    lore:
    - <gold>Pasta with a strong fishy flavor, it is dyed black by squids ink.
MAC_N_CHEESE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 419
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 420
    display name: <white>Noodle Soup
    flags:
      food: 7
      has_bowl: true
      grain: true
    lore:
    - <gold>Soup stock with bits of noodle cooked in.
APPLE_PIE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 421
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 422
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 423
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 424
    display name: <white>Chocolate Cupcake
    flags:
      food: 1
      grain: true
      sugar: true
    lore:
    - <gold>A small cake made with chocolate.
CARAMEL_CUPCAKE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 425
    display name: <white>Caramel Cupcake
    flags:
      food: 2
      grain: true
      sugar: true
    lore:
    - <gold>A small cake made with caramel.
CHOCOLATE_CAKE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 426
    display name: <white>Chocolate Cake
    flags:
      food: 10
      grain: true
      sugar: true
    lore:
    - <gold>A decent sized cake made with chocolate.
CHEESE_CAKE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 427
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 428
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 429
    display name: <white>Chocolate Muffin
    flags:
      food: 2
      grain: true
      sugar: true
    lore:
    - <gold>A small baked good with chocolate as an ingredient.
CARROT_MUFFIN:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 430
    display name: <white>Carrot Muffin
    flags:
      food: 2
      grain: true
      vegetable: true
    lore:
    - <gold>A small baked good with carrot inside.
PUMPKIN_MUFFIN:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 431
    display name: <white>Pumpkin Muffin
    flags:
      food: 2
      grain: true
      vegetable: true
    lore:
    - <gold>a small baked good with pumpkin inside.
CARAMEL_MUFFIN:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 432
    display name: <white>Caramel Muffin
    flags:
      food: 2
      grain: true
      sugar: true
    lore:
    - <gold>A small baked good with caramel as an ingredient.
DONUT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 433
    display name: <white>Donut
    flags:
      food: 5
      grain: true
    lore:
    - <gold>Fluffy fried pastry.
CHOCOLATE_DONUT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 434
    display name: <white>Chocolate Donut
    flags:
      food: 7
      grain: true
      sugar: true
    lore:
    - <gold>A Donut covered in chocolate.
JELLY_DONUT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 435
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
    material: dried_kelp
    mechanisms:
      custom_model_data: 436
    display name: <white>Cracker
    flags:
      food: 1
      grain: true
    lore:
    - <gold>A simple food good for travel rations.
SOFT_PRETZEL:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 437
    display name: <white>Soft Pretzel
    flags:
      food: 2
      grain: true
    lore:
    - <gold>Baked food, often salted and dipped in things.
TORTILLA:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 438
    display name: <white>Tortilla
    flags:
      food: 2
      grain: true
    lore:
    - <gold>A flat bread like disc.
QUESADILLA:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 439
    display name: <white>Quesadilla
    flags:
      food: 5
      grain: true
      dairy: true
    lore:
    - <gold>Two tortillas with cheese between them.
BREAKFAST_BURRITO:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 440
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
    material: dried_kelp
    mechanisms:
      custom_model_data: 441
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 442
    display name: <white>Burgerflower Seeds
    flags:
      food: 1
      grain: true
      Cooking_ID: sunflower_seeds
    lore:
    - <gold>Seeds from the burger flower. Best roasted.
ROASTED_SUNFLOWER_SEEDS:
    type: item
    material: TROPICAL_FISH
    display name: <white>Roasted Burgerflower Seeds
    mechanisms:
      custom_model_data: 443
    flags:
      food: 2
      grain: true
    lore:
    - <gold>Roasted burgerflower seeds, they have a satisfying crunch.
SEED_SOUP:
    type: item
    material: TROPICAL_FISH
    display name: <white>Seed Soup
    mechanisms:
      custom_model_data: 444
    flags:
      food: 2
      has_bowl: true
      grain: true
    lore:
    - <gold>Steed Stoup
Large_Cake:
    type: item
    material: cake
    display name: <white>Large Cake
    mechanisms:
      custom_model_data: 445
    flags:
      food: 25
      grain: true
      dairy: true
      sugar: true
    lore:
    - <gold>A large cake, it is ideally set on a whole table and shared.


# Protein
COOKING_RAW_CHICKEN:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 501
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 502
    display name: <white>Cooked Chicken
    flags:
      food: 3
      Cooking_ID: cooked_chicken
      protein: true
    lore:
    - <gold>Cooked chicken, it is unseasoned but safe.
GROUND_CHICKEN:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 503
    display name: <white>Ground Chicken
    flags:
      food: 3
      protein: true
      foodpoison: 10
    lore:
    - <gold>Ground raw chicken, it is unsafe to eat raw.
FRIED_CHICKEN:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 504
    display name: <white>Fried Chicken
    flags:
      food: 5
      protein: true
      grain: true
    lore:
    - <gold>Chicken fried in flour.
CHICKEN_JERKY:
    type: item
    material: dried_kelp
    mechanisms:
      custom_model_data: 505
    display name: <white>Chicken Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Chicken cured with salt.
CHICKEN_NUGGET:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 506
    display name: <white>Chicken Nugget
    flags:
      food: 2
      protein: true
      grain: true
    lore:
    - <gold>A fried nugget of chicken meat.
CHICKEN_SANDWICH:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 507
    display name: <white>Chicken Sandwich
    flags:
      food: 12
      protein: true
      grain: true
    lore:
    - <gold>A sandwich made with ground chicken.
CHICKEN_POT_PIE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 508
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 509
    display name: <white>Chicken Dinner
    flags:
      food: 10
      protein: true
      vegetable: true
    lore:
    - <gold>A full dinner made with chicken.
COOKING_RAW_BEEF:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 510
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 511
    display name: <white>Cooked Steak
    flags:
      Cooking_ID: cooked_beef
      food: 3
      protein: true
    lore:
    - <gold>Cooked Beef, it is safe but bland.
GROUND_BEEF:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 512
    display name: <white>Ground Beef
    flags:
      food: 3
      protein: true
      foodpoison: 10
    lore:
    - <gold>Ground raw beef. It is unsafe to eat as is.
HAMBURGER:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 513
    display name: <white>Hamburger
    flags:
      food: 9
      protein: true
      grain: true
    lore:
    - <gold>A burger made of ground beef, between two pieces of bread.
CHEESEBURGER:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 514
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
    material: TROPICAL_FISH
    display name: <white>Bacon Cheeseburger
    mechanisms:
      custom_model_data: 515
    flags:
      food: 13
      protein: true
      dairy: true
      grain: true
    lore:
    - <gold>A cheeseburger with bacon.
BEEF_JERKY:
    type: item
    material: dried_kelp
    mechanisms:
      custom_model_data: 516
    display name: <white>Beef Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Beef cured with salt.
COOKING_RAW_PORK:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 517
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 518
    display name: <white>Cooked Pork
    flags:
      Cooking_ID: cooked_pork
      food: 3
      protein: true
    lore:
    - <gold>Cooked meat from a pig. It is bland.
GROUND_PORK:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 519
    display name: <white>Ground Pork
    flags:
      food: 3
      protein: true
      foodpoison: 10
    lore:
    - <gold>raw ground pork. It is unsafe to eat.
PORK_JERKY:
    type: item
    material: dried_kelp
    mechanisms:
      custom_model_data: 520
    display name: <white>Pork Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Pork cured with salt.
BAKED_HAM:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 521
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 522
    display name: <white>Hot Dog
    flags:
      food: 9
      protein: true
      grain: true
    lore:
    - <gold>Cooked ground pork in a casing, with a bun made of bread.
BACON_AND_EGGS:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 523
    display name: <white>Bacon And Eggs
    flags:
      food: 5
      protein: true
    lore:
    - <gold>Bacon and eggs.... yes really.
EPIC_BACON:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 524
    display name: <white>Epic Bacon
    flags:
      food: 11
      protein: true
COOKING_RAW_FISH:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 525
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 526
    display name: <white>Cooked Fish
    flags:
      Cooking_ID: cooked_fish
      food: 3
      protein: true
    lore:
    - <gold>Cooked fish, it's only flavoring is fish.
GROUND_FISH:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 527
    display name: <white>Ground Fish
    flags:
      food: 3
      protein: true
    lore:
    - <gold>Ground fish meat.
FISH_STICKS:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 528
    display name: <white>Fish Sticks
    flags:
      food: 6
      protein: true
      grain: true
    lore:
    - <gold>A length of ground fish fried.
FISH_SANDWICH:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 529
    display name: <white>Fish Sandwich
    flags:
      food: 9
      protein: true
      grain: true
    lore:
    - <gold>A sandwich made with ground fish.
FISH_JERKY:
    type: item
    material: dried_kelp
    mechanisms:
      custom_model_data: 530
    display name: <white>Fish Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Fish cured in salt.
FISH_AND_CHIPS:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 531
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 532
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 533
    display name: <white>Cooked Mutton
    flags:
      food: 3
      Cooking_ID: cooked_mutton
      protein: true
    lore:
    - <gold>Cooked mutton with no seasoning.
MUTTON_JERKY:
    type: item
    material: dried_kelp
    mechanisms:
      custom_model_data: 534
    display name: <white>Mutton Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Mutton cured with salt.
GROUND_MUTTON:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 535
    display name: <white>Ground Mutton
    flags:
      food: 3
      protein: true
      foodpoison: 10
    lore:
    - <gold>Ground raw mutton. It is unsafe as is.
COOKING_RAW_RABBIT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 536
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 537
    display name: <white>Cooked Rabbit
    flags:
      food: 3
      Cooking_ID: cooked_rabbit
      protein: true
    lore:
    - <gold>Cooked rabbit, safe but bland.
GROUND_RABBIT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 538
    display name: <white>Ground Rabbit
    flags:
      food: 3
      protein: true
      foodpoison: 10
    lore:
    - <gold>Ground raw rabbit.
New_RABBIT_STEW:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 539
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
    material: dried_kelp
    mechanisms:
      custom_model_data: 540
    display name: <white>Rabbit Jerky
    flags:
      food: 1
      protein: true
    lore:
    - <gold>Rabbit meat cured in salt.
Cooking_Egg:
    type: item
    material: egg
    mechanisms:
      custom_model_data: 541
    Display name: <white>Bird Egg
    flags:
      food: 1
      protein: true
    lore:
    - <gold>A raw chicken egg.
Mayonnaise:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 542
    display name: <white>Mayonnaise
    flags:
      Cooking_Tag: condiment
      protein: true
    lore:
    - <gold>Condiment made of egg.
BOILED_EGG:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 543
    display name: <white>Boiled Egg
    flags:
      food: 3
      protein: true
    lore:
    - <gold>Egg boiled in water.
FRIED_EGG:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 544
    display name: <white>Fried Egg
    flags:
      food: 3
      protein: true
    lore:
    - <gold>Can you fry an egg ontop the tallest mountain?
SCRAMBLED_EGG:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 545
    display name: <white>Scambled Egg
    flags:
      food: 3
      protein: true
      dairy: true
    lore:
    - <gold>An egg scrambled as it cooked in a pan.
POT_ROAST:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 546
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 547
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 548
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 549
    display name: <white>Cooked Horse Meat
    flags:
      food: 3
      protein: true
    lore:
    - <gold>Cooked meat from a horse. Safe for your stomach at least..
COOKING_COOKED_GOAT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 550
    display name: <white>Cooked Goat Meat
    flags:
      food: 3
      protein: true
    lore:
    - <gold>Cooked goat, it still has a musky taste.
RAW_KEBAB:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 551
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 552
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 601
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 602
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 603
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
    material: Pumpkin
    display name: <white>Pumpkin
    mechanisms:
      custom_model_data: 604
    flags:
      Cooking_ID: New_Pumpkin
      Cooking_Tag: Vegetable
      Vegetable: Pumpkin
    lore:
    - <gold>Round gourd, it is very fleshy. Sweet and earth even raw.
New_Netherwart:
    type: item
    material: nether_wart
    display name: <white>Redwart
    mechanisms:
      custom_model_data: 605
    flags:
      Cooking_ID: New_Netherwart
      vegetable: true
    lore:
    - <gold>Strange fungus. It grows like polyps.
New_Baked_Potato:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 606
    display name: <white>Baked Potato
    flags:
      food: 2
      Cooking_ID: New_Baked_Potato
      vegetable: true
    lore:
    - <gold>Potato baked thoroughly.
BUTTERED_BAKED_POTATO:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 607
    display name: <white>Buttered Baked Potato
    flags:
      food: 3
      vegetable: true
      dairy: true
    lore:
    - <gold>Baked potato with butter on or inside.
MASHED_POTATO:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 608
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 609
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 610
    display name: <white>Fries
    flags:
      food: 2
      vegetable: true
    lore:
    - <gold>Wedges of potato that are fried or baked.
POTATO_CHIPS:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 611
    display name: <white>Potato Chips
    flags:
      food: 2
      vegetable: true
    lore:
    - <gold>Thin wedges of potato typically baked after being made extra thin.
POTATO_SOUP:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 612
    display name: <white>Potato Soup
    flags:
      food: 3
      has_bowl: true
      vegetable: true
    lore:
    - <gold>Soup made with potato.
GLAZED_CARROT:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 613
    display name: <white>Glazed Carrots
    flags:
      food: 4
      vegetable: true
      dairy: true
    lore:
    - <gold>A carrot with a glazed surface.
CARROT_SOUP:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 614
    display name: <white>Carrot Soup
    flags:
      food: 3
      has_bowl: true
      vegetable: true
    lore:
    - <gold>A soup made with carrots.
PICKLED_BEETS:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 615
    display name: <white>Pickled Beets
    flags:
      food: 3
      vegetable: true
    lore:
    - <gold>beets pickled in a brine.
New_PUMPKIN_PIE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 616
    display name: <white>Pumpkin Pie
    flags:
      food: 5
      vegetable: true
      sugar: true
    lore:
    - <gold>Pie baked out of pumpkin.
PUMPKIN_SOUP:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 617
    display name: <white>Pumpkin Soup
    flags:
      food: 3
      has_bowl: true
      vegetable: true
    lore:
    - <gold>Soup made of pumpkin.
New_Brown_Mushroom:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 618
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 619
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 620
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 621
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 622
    display name: <white>Roasted Mushroom
    flags:
      food: 3
      vegetable: true
    lore:
    - <gold>Brown mushroom roasted on heat.
NEW_MUSHROOM_SOUP:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 623
    display name: <white>Mushroom Soup
    flags:
      food: 2
      has_bowl: true
      vegetable: true
    lore:
    - <gold>Soup made of mushrooms.
STUFFED_MUSHROOM:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 624
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 625
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
    material: BRICK
    mechanisms:
      custom_model_data: 626
    display name: <white>Mushroom Oil
    flags:
      vegetable: true
    lore:
    - <gold>Oil from mushrooms.
CREAM_OF_MUSHROOM:
    type: item
    material: TROPICAL_FISH
    display name: <white>Cream of Mushroom
    mechanisms:
      custom_model_data: 627
    flags:
      food: 4
      has_bowl: true
      vegetable: true
      dairy: true
    lore:
    - <gold>Soup made of mushroom & cream.
New_Beetroot_Soup:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 628
    display name: <white>Beetroot Soup
    flags:
      food: 3
      has_bowl: true
      vegetable: true
    lore:
    - <gold>Soup made of beetroots.
Netherwart_Soup:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 629
    display name: <white>Redwart Soup
    flags:
      food: 3
      has_bowl: true
      vegetable: true
    lore:
    - <gold>Soup made of Netherwart.
New_Golden_Carrot:
    type: item
    material: TROPICAL_FISH
    display name: <gold>Golden Carrot
    mechanisms:
      custom_model_data: 630
    flags:
      food: 5
      vegetable: true
New_Poisonous_Potato:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 631
    display name: <white>Poisonous Potato
    flags:
      food: 1
      Cooking_ID: poisonous_potato
      poison: 60
      vegetable: true
New_Kelp:
    type: item
    material: kelp
    display name: <white>Kelp
    mechanisms:
      custom_model_data: 632
    flags:
      food: 1
      Cooking_ID: Kelp
      vegetable: true
New_Dried_Kelp:
    type: item
    material: dried_kelp
    display name: <white>Dried Kelp
    mechanisms:
      custom_model_data: 633
    flags:
      food: 1
      vegetable: true

# Sugars
New_Sugar:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 701
    display name: <white>Sugar
    flags:
      sugar: true
    lore:
    - <gold>A sweet powder made from sugarcane.
New_Cocoa_Beans:
    type: item
    material: cocoa_beans
    mechanisms:
      custom_model_data: 702
    display name: <white>Cocoa Beans
    flags:
      sugar: true
    lore:
    - <gold>A bean with a unique taste.
COCOA_POWDER:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 703
    display name: <white>Cocoa Powder
    flags:
      sugar: true
    lore:
    - <gold>Powder from Cocoa Beans it is sweeted with sugar.
CHOCOLATE_BAR:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 704
    display name: <white>Chocolate Bar
    flags:
      food: 4
      sugar: true
    lore:
    - <gold>A bar made of Cocoa bean, sugar and milk.
HOT_CHOCOLATE:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 705
    display name: <white>Hot Chocolate
    flags:
      food: 4
      sugar: true
      dairy: true
    lore:
    - <gold>Milk and cocoa powder, it is sweet!
CHOCOLATE_BACON:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 706
    display name: <white>Chocolate Bacon
    flags:
      food: 7
      sugar: true
      protein: true
    lore:
    - <gold>Bacon covered in chocolate.
CHOCOLATE_PUDDING:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 707
    display name: <white>Chocolate Pudding
    flags:
      food: 4
      sugar: true
      dairy: true
    lore:
    - <gold>A milky chocolately treat.
CHOCOLATE_ROLL:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 708
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
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 709
    display name: <white>Chocolate Caramel Fudge
    flags:
      food: 8
      sugar: true
    lore:
    - <gold>Chocolate baked into a solid state, it has caramel mixed in.
CARAMEL:
    type: item
    material: TROPICAL_FISH
    display name: <white>Caramel
    mechanisms:
      custom_model_data: 710
    flags:
      food: 3
      sugar: true
      dairy: true
    lore:
    - <gold>A firm golden-brown substance made from heating sugar.
MARSHMALLOW:
    type: item
    material: dried_kelp
    display name: <white>Marshmallow
    mechanisms:
      custom_model_data: 711
    flags:
      food: 1
      sugar: true
    lore:
    - <gold>Fluffy sugar blob
GUMMY_BEARS:
    type: item
    material: dried_kelp
    mechanisms:
      custom_model_data: 712
    display name: <white>Gummy Bears
    flags:
      food: 1
      sugar: true
    lore:
    - <gold>Gummy bear like sweet made with gelatin.
JELLY_BEANS:
    type: item
    material: dried_kelp
    display name: <white>Jelly Beans
    mechanisms:
      custom_model_data: 713
    flags:
      food: 1
      sugar: true
    lore:
    - <gold>crunchy yet gooey sugar beans.
MARSHMALLOW_CHICKS:
    type: item
    material: dried_kelp
    mechanisms:
      custom_model_data: 714
    display name: <white>Marshmallow Chickadees
    flags:
      food: 1
      sugar: true
    lore:
    - <gold>Marshmallow in the shape of baby birds.
COTTON_CANDY:
    type: item
    material: dried_kelp
    mechanisms:
      custom_model_data: 715
    display name: <white>Cotton Candy
    flags:
      food: 1
      sugar: true
    lore:
    - <gold>Sugar whipped into a hair thin cotton like substance.
SMORES:
    type: item
    material: tropical_fish
    mechanisms:
      custom_model_data: 716
    display name: <white>Smores
    flags:
      food: 7
      sugar: true
      grain: true
    lore:
    - <gold>Fun for the campfire, crackers, chocolate, and marshmallow, Yum.
TRAILMIX:
    type: item
    material: dried_kelp
    mechanisms:
      custom_model_data: 717
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
    material: sugar_cane
    mechanisms:
      custom_model_data: 718
    display name: <white>Sugar Cane
    lore:
    - <gold>A shoot that can be cooked down into sugar.


# Misc
COOKING_SALT:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 801
    display name: <white>Cooking Salt
    lore:
    - <gold>Salt made from the sea, or harvested.
Fresh_Water:
    type: item
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 802
    flags:
      food: 0
      drink: true
    display name: <white>Fresh Water
    lore:
    - <green>A pail of fresh water ready for cooking! Or to put out fire in a pinch.
COOKING_OIL:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 803
    display name: <white>Cooking Oil
    lore:
    - <gold>Oil used to fry and cook dishes.
VINEGAR:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 804
    display name: <white>Vinegar
    lore:
    - <gold>A useful component in cooking, try making brine.
STOCK:
    type: item
    material: BRICK
    mechanisms:
      custom_model_data: 805
    display name: <white>Stock
    lore:
    - <gold>Stock used in soups.
New_Snowball:
    type: item
    material: Snowball
    mechanisms:
      custom_model_data: 806
    display name: <white>Snowball
    lore:
    - <gold>A ball of snow, good if you want things to be chilled.