# This file includes all the extra cooking ingredients and dishes from custom crops outside of the default main cooking scripts.

# First Extra'd: 6/9/2024

#Ground_Meat_Recipes:
#  type: world
#  events:
#    on player crafts ground_*:
#    - define item <context.item>
#    - determine passively cancelled
#    - foreach <context.recipe> as:item:
#      - if <[item].script.name||air> == mortar_and_pestle || <[item].material.name> == air:
#        - foreach next
#      - else:
#        - take item:<[item]> from:<context.inventory>
#    - give <context.item>
#    #- define inventory <context.inventory>
#    #- if <[inventory].contains_item[mortar_and_pestle]>:
#    #  - stop
#    #- else:
#    #  - foreach <list[2|3|4|5|6|7|8|9|10]> as:slot:
#    #    - if <[inventory].slot[<[slot]>].material.name> == air:
#    #      - inventory set o:mortar_and_pestle slot:<[slot]> destination:<[inventory]>
#    #      - foreach stop
#    #- foreach <[inventory].find_all_items[mortar_and_pestle]> as:slot:
#    #  - narrate <[slot]>
#    #  - inventory set o:mortar_and_pestle slot:<[slot]> destination:<[inventory]>
#    #- narrate "Nice <context.material>"
#    #on player clicks item in inventory:
#    #- narrate <context.slot>
#    #- define inventory <context.inventory>
#    #- inventory set o:mortar_and_pestle slot:<context.slot> destination:<[inventory]>

Strawberry:
  type: item
  debug: false
  data:
    cooking_tag:
      type: ingredient
  material: dried_kelp
  mechanisms:
    custom_model_data: 5000
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
  display name: <white>Corn
  flags:
    food: 1
    Cooking_ID: Vanilla_Bean
    Cooking_Tag: Corn
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
  display name: <white>Popcorn
  flags:
    food: 1
    Cooking_ID: Vanilla_Bean
    Cooking_Tag: Corn
    Vegetable: Corn
    Grain: Corn
  Lore:
  - <gold>Popped CORN. POPPED CORN! The CORN POPPED! If you eat corn it will also become pooped corn.