# This file includes all of the bows that players can obtain.

# First Strung: 4/19/2024

Oak_Bow:
    type: item
    material: bow
    mechanisms:
     custom_model_data: 10001
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Oak Bow
    flags:
      lore: <gold>A basic wooden bow made of Oak.
      durability1: 380
      skill_base: Carpentry
      level: 1
      recipe: string_3|oak_planks_3

Crafted_Bow:
    type: item
    material: bow
    mechanisms:
     custom_model_data: 10001
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Generic Bow
    flags:
      lore: <gold>A basic wooden bow made of sticks and string.<n><red>This item is weaker due to shoddy carpentry methods.
      durability1: 150
      durability2: 150
      skill_base: Carpentry
      level: 1
      recipe: string_3|stick_3
    recipes:
      1:
        type: shaped
        input:
        - air|stick|string
        - stick|air|string
        - air|stick|string