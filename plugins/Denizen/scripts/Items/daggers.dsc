# This file has all of the possible daggers that players can obtain.

# First Stabbed: 04/19/2024

#Blast_Copper_Dagger:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10008
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 5
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -2.4
#             slot: hand
#    display name: <gold>Blast Copper Dagger
#    flags:
#      lore: <gold>A basic copper dagger.
#      durability1: 170
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 1
#      recipe: blast_copper_ingot_1|tool_rod_1
#
#Bronze_Dagger:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10009
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 5.5
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -2.4
#             slot: hand
#    display name: <gold>Bronze Copper Dagger
#    flags:
#      lore: <gold>A basic bronze dagger.
#      durability1: 220
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 10
#      recipe: bronze_ingot_1|tool_rod_1
#
#Blast_Iron_Dagger:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10010
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 6
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -2.4
#             slot: hand
#    display name: <gold>Blast Iron Dagger
#    flags:
#      lore: <gold>A basic iron dagger.
#      durability1: 270
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 20
#      recipe: blast_iron_ingot_1|tool_rod_1

Steel_Dagger:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:steel_dagger
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 6.5
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -2.4
             slot: hand
    display name: <gold>Steel Dagger
    flags:
      lore: <gold>A basic steel dagger.
      durability1: 320
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 30
      recipe: steel_ingot_1|tool_rod_1

Silver_Dagger:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:silver_dagger
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 6
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -2.4
             slot: hand
    display name: <gold>Silver Dagger
    flags:
      lore: <gold>A basic silver dagger.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 40
      recipe: silver_ingot_1|tool_rod_1

Slate_Silver_Dagger:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:silver_slate_dagger
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 7
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -2.4
             slot: hand
    display name: <gold>Slate Silver Dagger
    flags:
      lore: <gold>A basic slate silver dagger.
      durability1: 420
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 50
      recipe: slate_silver_ingot_1|tool_rod_1

Adamantine_Dagger:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:adamantine_dagger
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 7.5
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -2.4
             slot: hand
    display name: <gold>Adamantine Dagger
    flags:
      lore: <gold>A basic adamantine dagger.
      durability1: 470
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 70
      recipe: adamantine_ingot_1|tool_rod_1

Mythril_Dagger:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:mythril_dagger
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 8
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -2.4
             slot: hand
    display name: <gold>Mythril Dagger
    flags:
      lore: <gold>A basic mythril dagger.
      durability1: 520
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 80
      recipe: mythril_ingot_1|tool_rod_1


# Vanilla Replace

Crafted_Blast_Copper_Dagger:
    type: item
    material: iron_sword
    mechanisms:
     custom_model_data: 10008
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Blast Copper Dagger
    flags:
      lore: <gold>A basic copper dagger.<n><red>This item is weaker due to improper smithing methods.
      durability1: 50
      durability2: 50
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 1
      recipe: blast_copper_ingot_1|tool_rod_1
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - air|blast_copper_ingot
    #    - stick|air

Crafted_Blast_Iron_Dagger:
    type: item
    material: iron_sword
    mechanisms:
     custom_model_data: 10010
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Blast Iron Dagger
    flags:
      lore: <gold>A basic iron dagger.<n><red>This item is weaker due to improper smithing methods.
      durability1: 100
      durability2: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 20
      recipe: blast_iron_ingot_1|tool_rod_1
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - air|blast_iron_ingot
    #    - stick|air

Crafted_Stone_Dagger:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:stone_dagger
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Stone Dagger
    flags:
      lore: <gold>A flimsy stone dagger.<n><red>This item cannot be repaired.
      durability1: 16
      durability2: 16
      slashing: 4
      damage_type: Slashing
    recipes:
      1:
        type: shaped
        input:
        - air|cobblestone
        - stick|air

Crafted_Flint_Dagger:
    type: item
    material: iron_sword
    mechanisms:
     custom_model_data: 10041
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Flint Dagger
    flags:
      lore: <gold>A pointy flint dagger.<n><red>This item cannot be repaired.
      durability1: 25
      durability2: 25
      slashing: 4
      damage_type: Slashing
    recipes:
      1:
        type: shaped
        input:
        - air|flint
        - stick|air