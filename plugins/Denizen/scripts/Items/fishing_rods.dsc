# This file includes all of the fishing rods players can obtain and the vanilla replacements to rods.

# First Reeled: 6/20/2024

Wooden_Fishing_Rod:
    type: item
    debug: false
    material: fishing_rod
    mechanisms:
     custom_model_data: 10000
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Wooden Fishing Rod
    flags:
      lore: <gold>A standard wooden fishing rod.
      durability1: 128
      damage_type: Blunt
      skill_base: Carpentry
      level: 1
      #recipe: tool_rod_3|string_2


# Crafted Rod

Crafted_Wooden_Fishing_Rod:
    type: item
    debug: false
    material: fishing_rod
    mechanisms:
     custom_model_data: 10000
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Wooden Fishing Rod
    flags:
      lore: <gold>A standard wooden fishing rod.<n><red>This item is weaker due to shoddy carpentry methods.
      durability1: 64
      durability2: 64
      damage_type: Blunt
      skill_base: Carpentry
      level: 1
      recipe: stick_3|string_2
    recipes:
      1:
        type: shaped
        input:
        - air|air|stick
        - air|stick|string
        - stick|air|string