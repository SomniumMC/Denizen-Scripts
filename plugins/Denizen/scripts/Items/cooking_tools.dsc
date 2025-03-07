# This file contains all of the cooking tools needed for the cooking systems.

# First Crafted: 6/28/2024

# Tools

Bakeware:
    type: item
    debug: false
    material: Brick
    display name: <white>Bakeware
    mechanisms:
      custom_model_data: 101
    lore:
    - <green>Tool
    - <empty>
    - <gray>A glazed cooking container used in the oven.
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - brick|brick|brick
    #    - brick|air|brick
    #    - brick|brick|brick

Cutting_Board:
    type: item
    debug: false
    material: brick
    display name: <white>Cutting Board
    mechanisms:
      custom_model_data: 102
    lore:
    - <green>Tool
    - <empty>
    - <gray>A sturdy wooden board for cutting food.
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_copper_ingot|air|air
    #    - air|stick|air
    #    - air|air|*planks
    #  2:
    #    type: shaped
    #    input:
    #    - air|air|blast_copper_ingot
    #    - air|stick|air
    #    - *planks|air|air

Juicer:
    type: item
    debug: false
    material: brick
    display name: <white>Juicer
    mechanisms:
      custom_model_data: 103
    Lore:
    - <green>Tool
    - <empty>
    - <gray>Circular half-dome to twist juice from things against!
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - stone_pressure_plate
    #    - stone_pressure_plate

Mortar_And_Pestle:
    type: item
    debug: false
    material: BRICK
    display name: <white>Mortar and Pestle
    mechanisms:
      custom_model_data: 104
    lore:
    - <green>Tool
    - <empty>
    - <gray>Useful tool of an alchemist trade.
    - <gray>Commonly used in crushing of spices or ingredients.
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - smooth_stone/stone/deepslate/sandstone|stick|smooth_stone/stone/deepslate/sandstone
    #    - air|smooth_stone/stone/deepslate/sandstone|air

Mixing_Bowl:
    type: item
    debug: false
    material: BRICK
    display name: <white>Mixing Bowl
    mechanisms:
      components_patch: minecraft:item_model=string:utensils:mix
    lore:
    - <green>Tool
    - <empty>
    - <gray>Bowl the perfect size for mixing ingredients!
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - *planks|stick|*planks
    #    - air|*planks|air

Cooking_Pot:
    type: item
    debug: false
    material: BRICK
    display name: <white>Cooking Pot
    mechanisms:
      components_patch: minecraft:item_model=string:utensils:cookpot
      custom_model_data: 106
    lore:
    - <green>Tool
    - <empty>
    - <gray>Tall cookware perfect for boiling in!
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_copper_ingot|stick|blast_copper_ingot
    #    - air|blast_copper_ingot|air

Roller:
    type: item
    debug: false
    material: BRICK
    display name: <white>Roller
    mechanisms:
      custom_model_data: 107
    lore:
    - <green>Tool
    - <empty>
    - <gray>Short wooden dowel with handles.
    - <gray>Used in pressing some ingredients flat!
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - stick|air|air
    #    - air|*log|air
    #    - air|air|stick
    #  2:
    #    type: shaped
    #    input:
    #    - air|air|stick
    #    - air|*log|air
    #    - stick|air|air

Sauce_Pan:
    type: item
    debug: false
    material: BRICK
    display name: <white>Sauce Pan
    mechanisms:
      custom_model_data: 108
    lore:
    - <green>Tool
    - <empty>
    - <gray>A pan used in boiling down ingredients into a sauce!
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - stick|blast_copper_ingot

Skillet:
    type: item
    debug: false
    material: BRICK
    display name: <white>Skillet
    mechanisms:
      custom_model_data: 109
    lore:
    - <green>Tool
    - <empty>
    - <gray>A copper skillet used on an open fire or hot oven.
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - stick|stick|blast_copper_ingot