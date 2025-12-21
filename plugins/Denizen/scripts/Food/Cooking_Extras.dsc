# This file includes all the extra cooking ingredients and dishes from custom crops outside of the default main cooking scripts.

# First Extra'd: 6/9/2024

Strawberry:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: dried_kelp
  mechanisms:
    custom_model_data: 5000
    components_patch:
      item_model: string:cooking:food/strawberry
  display name: <white>Strawberry
  flags:
    food: 1
    Cooking_ID: Strawberry
    Cooking_Tag: Fruit
    Fruit: Strawberry
  lore:
  - <gold>A sweet red berry, it forms seeds on the outside.
Blackberry:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: dried_kelp
  mechanisms:
    custom_model_data: 5001
    components_patch:
      item_model: string:cooking:food/blackberry
  display name: <white>Blackberry
  flags:
    food: 1
    Cooking_ID: Blackberry
    Cooking_Tag: Fruit
    Fruit: Blackberry
  Lore:
  - <gold>A berry dark of color, it is juicy when ripe, staining skin.


Cranberry:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: dried_kelp
  mechanisms:
    custom_model_data: 5002
    components_patch:
      item_model: string:cooking:food/cranberry
  display name: <white>Cranberry
  flags:
    food: 1
    Cooking_ID: Cranberry
    Cooking_Tag: Fruit
    Fruit: Cranberry
  Lore:
  - <gold>Tart berry grown often in water.


Blueberry:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: dried_kelp
  mechanisms:
    custom_model_data: 5003
    components_patch:
      item_model: string:cooking:food/blueberry
  display name: <white>Blueberry
  flags:
    food: 1
    Cooking_ID: Blueberry
    Cooking_Tag: Fruit
    Fruit: Blueberry
  Lore:
  - <gold>Blue berries that grown on a bush, they have round fruit.


Gooseberry:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: dried_kelp
  mechanisms:
    custom_model_data: 5004
    components_patch:
      item_model: string:cooking:food/gooseberry
  display name: <white>Gooseberry
  flags:
    food: 1
    Cooking_ID: Gooseberry
    Cooking_Tag: Fruit
    Fruit: Gooseberry
  Lore:
  - <gold>Grapelike berry that has a stem on it's bottom.


Mulberry:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: dried_kelp
  mechanisms:
    custom_model_data: 5005
    components_patch:
      item_model: string:cooking:food/mulberry
  display name: <white>Mulberry
  flags:
    food: 1
    Cooking_ID: Mulberry
    Cooking_Tag: Fruit
    Fruit: Mulberry
  Lore:
  - <gold>A long berry also know to stain hands.

Raspberry:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: dried_kelp
  mechanisms:
    custom_model_data: 5006
    components_patch:
      item_model: string:cooking:food/raspberry
  display name: <white>Raspberry
  flags:
    food: 1
    Cooking_ID: Raspberry
    Cooking_Tag: Fruit
    Fruit: Raspberry
  Lore:
  - <gold>A redish berry similar to a blackberry.

Tomato:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: tropical_fish
  mechanisms:
    custom_model_data: 5007
    components_patch:
      item_model: string:cooking:food/tomato
  display name: <white>Tomato
  flags:
    food: 1
    Cooking_ID: Tomato
    Cooking_Tag: Vegetable
    Vegetable: Tomato
  Lore:
  - <gold>Fruit with a refreshing acidic taste.

Chili:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: tropical_fish
  mechanisms:
    custom_model_data: 5008
    components_patch:
      item_model: string:cooking:food/chili
  display name: <white>Chili
  flags:
    food: 1
    Cooking_ID: Chili
    Cooking_Tag: Vegetable
    Vegetable: Chili
  Lore:
  - <gold>A red pepper full of heat.

Yeast:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: brick
  display name: <white>Yeast
  flags:
    Cooking_ID: Yeast
  mechanisms:
    components_patch:
      item_model: string:cooking:ingredients/yeast
  Lore:
  - <gold>A mixture found in kitchens and used in various processes ranging from baking to alcohol brewing.

Cinnamon:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: tropical_fish
  mechanisms:
    custom_model_data: 5009
    components_patch:
      item_model: string:cooking:food/cinnamon
  display name: <white>Cinnamon
  flags:
    food: 1
    Cooking_ID: Cinnamon
    Cooking_Tag: Raw_Cinnamon
  Lore:
  - <gold>Bark that is known to hold a unique and excellent flavor.

Ground_Cinnamon:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: brick
  display name: <white>Ground Cinnamon
  flags:
    Cooking_ID: Ground_Cinnamon
    Cooking_Tag: Spice
  mechanisms:
    custom_model_data: 5001
    components_patch:
      item_model: string:cooking:food/ground_cinnamon
  Lore:
  - <gold>A pile of ground cinnamon useful in all manner of dishes.

Vanilla_Bean:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: tropical_fish
  mechanisms:
    custom_model_data: 5010
    components_patch:
      item_model: string:cooking:food/vanilla_bean
  display name: <white>Vanilla Bean
  flags:
    food: 1
    Cooking_ID: Vanilla_Bean
    Cooking_Tag: Raw_Vanilla
  Lore:
  - <gold>A long bean often dried brown.
Ground_Vanilla:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: brick
  display name: <white>Ground Vanilla
  flags:
    Cooking_ID: Ground_Vanilla
    Cooking_Tag: Spice
  mechanisms:
    custom_model_data: 5002
    components_patch:
      item_model: string:cooking:food/ground_vanilla
  Lore:
  - <gold>A pile of ground vanila useful in all manner of dishes.

Ginger:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: tropical_fish
  mechanisms:
    custom_model_data: 5011
    components_patch:
      item_model: string:cooking:food/ginger
  display name: <white>Ginger
  flags:
    food: 1
    Cooking_ID: Ginger
    Cooking_Tag: Root
    Vegetable: Ginger
  Lore:
  - <gold>A plant with roots known for it's unique taste and properties.

Corn:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: tropical_fish
  mechanisms:
    custom_model_data: 5012
    components_patch:
      item_model: string:cooking:food/corn
  display name: <white>Corn
  flags:
    food: 1
    Cooking_ID: Corn
    Cooking_Tag: Raw_Grain
    Vegetable: Corn
    Grain: Corn
  Lore:
  - <gold>Yellow vegetable hidden in leafy husks.

Barley_Bundle:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: brick
  display name: <white>Barley Bundle
  flags:
    Cooking_ID: Barley
    Cooking_Tag: Raw_Grain
  mechanisms:
    custom_model_data: 5003
    components_patch:
      item_model: string:cooking:ingredients/barley
  Lore:
  - <gold>A bundle of barley, can be ground to barley flour or used elsewise.

Rye_Bundle:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: brick
  display name: <white>Rye Bundle
  flags:
    Cooking_ID: Rye
    Cooking_Tag: Raw_Grain
  mechanisms:
    custom_model_data: 5004
    components_patch:
      item_model: string:cooking:ingredients/rye
  Lore:
  - <gold>A bundle of rye, can be ground to rye flour or used elsewise.

Popcorn:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: tropical_fish
  mechanisms:
    custom_model_data: 5012
    components_patch:
      item_model: string:cooking:food/popcorn
  display name: <white>Popcorn
  flags:
    food: 1
    Cooking_ID: Popcorn
    Vegetable: Corn
    Grain: Corn
  Lore:
  - <gold>Popped CORN. POPPED CORN! The CORN POPPED! If you eat corn it will also become pooped corn.

Cabbage:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: tropical_fish
  mechanisms:
    components_patch:
      item_model: string:cooking:food/cabbage
  display name: <white>Cabbage
  flags:
    food: 1
    Cooking_ID: Cabbage
    Cooking_Tag: Raw_Vegetable
    Vegetable: Cabbage
  Lore:
  - <gold>Green vegetable surrounded by leafy layers.