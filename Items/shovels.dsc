# This file includes all of the shovels that players can obtain.

# First Dug 04/18/2024

#Blast_Copper_Shovel:
#    type: item
#    material: iron_shovel
#    mechanisms:
#     custom_model_data: 10000
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 3.5
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -3
#             slot: hand
#    display name: <gold>Blast Copper Shovel
#    flags:
#      lore: <gold>A basic copper shovel.
#      durability1: 170
#      blunt: 5
#      damage_type: Blunt
#      skill_base: Blacksmithing
#      level: 1
#      recipe: blast_copper_ingot_1|tool_rod_2
#
#Bronze_Shovel:
#    type: item
#    material: iron_shovel
#    mechanisms:
#     custom_model_data: 10001
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 4
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -3
#             slot: hand
#    display name: <gold>Bronze Shovel
#    flags:
#      lore: <gold>A basic bronze shovel.
#      durability1: 220
#      blunt: 5
#      damage_type: Blunt
#      skill_base: Blacksmithing
#      level: 10
#      recipe: bronze_ingot_1|tool_rod_2
#
#Blast_Iron_Shovel:
#    type: item
#    material: iron_shovel
#    mechanisms:
#     custom_model_data: 10002
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 4
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -3
#             slot: hand
#    display name: <gold>Blast Iron Shovel
#    flags:
#      lore: <gold>A basic iron shovel.
#      durability1: 270
#      blunt: 5
#      damage_type: Blunt
#      skill_base: Blacksmithing
#      level: 20
#      recipe: blast_iron_ingot_1|tool_rod_2

Steel_Shovel:
    type: item
    material: diamond_shovel
    mechanisms:
     components_patch:
        item_model: string:tools:steel_shovel
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 4.5
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3
             slot: hand
    display name: <gold>Steel Shovel
    flags:
      lore: <gold>A basic steel shovel.
      durability1: 320
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 30
      recipe: steel_ingot_1|tool_rod_2

Silver_Shovel:
    type: item
    material: iron_shovel
    mechanisms:
     components_patch:
        item_model: string:tools:silver_shovel
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 4
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3
             slot: hand
    display name: <gold>Silver Shovel
    flags:
      lore: <gold>A basic silver shovel.
      durability1: 100
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 40
      recipe: silver_ingot_1|tool_rod_2

Slate_Silver_Shovel:
    type: item
    material: diamond_shovel
    mechanisms:
     components_patch:
        item_model: string:tools:silver_slate_shovel
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 5
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3
             slot: hand
    display name: <gold>Slate Silver Shovel
    flags:
      lore: <gold>A basic slate silver shovel.
      durability1: 420
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 50
      recipe: slate_silver_ingot_1|tool_rod_2

Adamantine_Shovel:
    type: item
    material: iron_shovel
    mechanisms:
     components_patch:
        item_model: string:tools:adamantine_shovel
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 5.5
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3
             slot: hand
    display name: <gold>Adamantine Shovel
    flags:
      lore: <gold>A basic adamantine shovel.
      durability1: 470
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 70
      recipe: adamantine_ingot_1|tool_rod_2

Mythril_Shovel:
    type: item
    material: iron_shovel
    mechanisms:
     components_patch:
        item_model: string:tools:mythril_shovel
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
             amount: -3
             slot: hand
    display name: <gold>Blast Mythril Shovel
    flags:
      lore: <gold>A basic mythril shovel.
      durability1: 520
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 80
      recipe: mythril_ingot_1|tool_rod_2

# Vanilla Replace

Crafted_Blast_Copper_Shovel:
    type: item
    material: iron_shovel
    mechanisms:
     custom_model_data: 10000
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 3.5
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3
             slot: hand
    display name: <gold>Blast Copper Shovel
    flags:
      lore: <gold>A basic copper shovel.<n><red>This item is weaker due to improper smithing methods.
      durability1: 50
      durability2: 50
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 1
      recipe: blast_copper_ingot_1|tool_rod_2
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_copper_ingot
    #    - stick
    #    - stick

Crafted_Blast_Iron_Shovel:
    type: item
    material: iron_shovel
    mechanisms:
     custom_model_data: 10002
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 4.5
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3
             slot: hand
    display name: <gold>Blast Iron Shovel
    flags:
      lore: <gold>A basic iron shovel.<n><red>This item is weaker due to improper smithing methods.
      durability1: 100
      durability2: 100
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 20
      recipe: blast_iron_ingot_1|tool_rod_2
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_iron_ingot
    #    - stick
    #    - stick