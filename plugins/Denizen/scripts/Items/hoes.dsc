# This file includes all the hoes that players can obtain.

# First Tilled: 04/18/2024

#Blast_Copper_Hoe:
#    type: item
#    material: iron_hoe
#    mechanisms:
#     custom_model_data: 10000
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 1
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -3
#             slot: hand
#    display name: <gold>Blast Copper Hoe
#    flags:
#      lore: <gold>A basic copper hoe.
#      durability1: 170
#      blunt: 5
#      damage_type: Blunt
#      skill_base: Blacksmithing
#      level: 1
#      recipe: blast_copper_ingot_2|tool_rod_2
#
#Bronze_Hoe:
#    type: item
#    material: iron_hoe
#    mechanisms:
#     custom_model_data: 10001
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 1
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -2.5
#             slot: hand
#    display name: <gold>Bronze Hoe
#    flags:
#      lore: <gold>A basic bronze hoe.
#      durability1: 220
#      blunt: 5
#      damage_type: Blunt
#      skill_base: Blacksmithing
#      level: 10
#      recipe: bronze_ingot_2|tool_rod_2
#
#Blast_Iron_Hoe:
#    type: item
#    material: iron_hoe
#    mechanisms:
#     custom_model_data: 10002
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 1
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -2
#             slot: hand
#    display name: <gold>Blast Iron Hoe
#    flags:
#      lore: <gold>A basic iron hoe.
#      durability1: 270
#      blunt: 5
#      damage_type: Blunt
#      skill_base: Blacksmithing
#      level: 20
#      recipe: blast_iron_ingot_2|tool_rod_2

Steel_Hoe:
    type: item
    debug: false
    material: diamond_hoe
    mechanisms:
     components_patch:
        item_model: string:tools:steel_hoe
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 1
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -1.5
             slot: hand
    display name: <gold>Steel Hoe
    flags:
      lore: <gold>A basic steel hoe.
      durability1: 320
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 30
      recipe: steel_ingot_2|tool_rod_2

Silver_Hoe:
    type: item
    debug: false
    material: iron_hoe
    mechanisms:
     components_patch:
        item_model: string:tools:silver_hoe
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 1
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3
             slot: hand
    display name: <gold>Silver Hoe
    flags:
      lore: <gold>A basic silver hoe.
      durability1: 100
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 40
      recipe: silver_ingot_2|tool_rod_2

Slate_Silver_Hoe:
    type: item
    debug: false
    material: diamond_hoe
    mechanisms:
     components_patch:
        item_model: string:tools:silver_slate_hoe
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 1
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -1
             slot: hand
    display name: <gold>Slate Silver Hoe
    flags:
      lore: <gold>A basic slate silver hoe.
      durability1: 420
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 50
      recipe: slate_silver_ingot_2|tool_rod_2

Adamantine_Hoe:
    type: item
    debug: false
    material: iron_hoe
    mechanisms:
     components_patch:
        item_model: string:tools:adamantine_hoe
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 1
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -0.5
             slot: hand
    display name: <gold>Adamantine Hoe
    flags:
      lore: <gold>A basic adamantine hoe.
      durability1: 470
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 70
      recipe: adamantine_ingot_2|tool_rod_2

Mythril_Hoe:
    type: item
    debug: false
    material: iron_hoe
    mechanisms:
     components_patch:
        item_model: string:tools:mythril_hoe
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 1
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: 0
             slot: hand
    display name: <gold>Mythril Hoe
    flags:
      lore: <gold>A basic mythril hoe.
      durability1: 520
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 80
      recipe: mythril_ingot_2|tool_rod_2

# Vanilla Crafted

Crafted_Blast_Copper_Hoe:
    type: item
    debug: false
    material: iron_hoe
    mechanisms:
     custom_model_data: 10000
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 1
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3
             slot: hand
    display name: <gold>Blast Copper Hoe
    flags:
      lore: <gold>A basic copper hoe.<n><red>This item is weaker due to improper smithing methods.
      durability1: 170
      durability2: 170
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 1
      recipe: blast_copper_ingot_2|tool_rod_2
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_copper_ingot|blast_copper_ingot
    #    - stick|air
    #    - stick|air

Crafted_Blast_Iron_Hoe:
    type: item
    debug: false
    material: iron_hoe
    mechanisms:
     custom_model_data: 10002
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 1
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -2
             slot: hand
    display name: <gold>Blast Iron Hoe
    flags:
      lore: <gold>A basic iron hoe.<n><red>This item is weaker due to improper smithing methods.
      durability1: 270
      durability2: 270
      blunt: 5
      damage_type: Blunt
      skill_base: Blacksmithing
      level: 20
      recipe: blast_iron_ingot_2|tool_rod_2
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_iron_ingot|blast_iron_ingot
    #    - stick|air
    #    - stick|air