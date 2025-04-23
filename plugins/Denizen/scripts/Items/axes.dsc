# This file has all of the axes that players can obtain.

# First Chopped: 04/18/2024

#Blast_Copper_Axe:
#    type: item
#    debug: false
#    material: iron_axe
#    mechanisms:
#     custom_model_data: 10000
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 9
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -3.1
#             slot: hand
#    display name: <gold>Blast Copper Axe
#    flags:
#      lore: <gold>A basic copper axe.
#      durability1: 170
#      slashing: 5
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 1
#      recipe: blast_copper_ingot_3|tool_rod_2
#
#Bronze_Axe:
#    type: item
#    debug: false
#    material: iron_axe
#    mechanisms:
#     custom_model_data: 10001
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 9
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -3.1
#             slot: hand
#    display name: <gold>Bronze Axe
#    flags:
#      lore: <gold>A basic bronze axe.
#      durability1: 220
#      slashing: 5
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 10
#      recipe: bronze_ingot_3|tool_rod_2
#
#Blast_Iron_Axe:
#    type: item
#    debug: false
#    material: iron_axe
#    mechanisms:
#     custom_model_data: 10002
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 9
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#           1:
#             operation: add_number
#             amount: -3.1
#             slot: hand
#    display name: <gold>Blast Iron Axe
#    flags:
#      lore: <gold>A basic iron axe.
#      durability1: 270
#      slashing: 5
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 20
#      recipe: blast_iron_ingot_3|tool_rod_2

Steel_Axe:
    type: item
    debug: false
    material: diamond_axe
    mechanisms:
     components_patch:
        item_model: string:tools:steel_axe
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 9
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3.1
             slot: hand
    display name: <gold>Steel Axe
    flags:
      lore: <gold>A basic steel axe.
      durability1: 720
      slashing: 5
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 30
      recipe: steel_ingot_3|tool_rod_2

Silver_Axe:
    type: item
    debug: false
    material: diamond_axe
    mechanisms:
     components_patch:
        item_model: string:tools:silver_axe
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 9
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3.1
             slot: hand
    display name: <gold>Silver Axe
    flags:
      lore: <gold>A basic silver axe.
      durability1: 320
      slashing: 5
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 40
      recipe: silver_ingot_3|tool_rod_2

Slate_Silver_Axe:
    type: item
    debug: false
    material: iron_axe
    mechanisms:
     components_patch:
        item_model: string:tools:silver_slate_axe
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 9
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3.1
             slot: hand
    display name: <gold>Slate Silver Axe
    flags:
      lore: <gold>A basic slate silver axe.
      durability1: 420
      slashing: 5
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 50
      recipe: slate_silver_ingot_3|tool_rod_2

Adamantine_Axe:
    type: item
    debug: false
    material: iron_axe
    mechanisms:
     components_patch:
        item_model: string:tools:adamantine_axe
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 9
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3.1
             slot: hand
    display name: <gold>Adamantine Axe
    flags:
      lore: <gold>A basic adamantine axe.
      durability1: 470
      slashing: 5
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 70
      recipe: adamantine_ingot_3|tool_rod_2

Mythril_Axe:
    type: item
    debug: false
    material: iron_axe
    mechanisms:
     components_patch:
        item_model: string:tools:mythril_axe
     unbreakable: true
     hides: unbreakable|attributes
     attribute_modifiers:
        GENERIC_ATTACK_DAMAGE:
          1:
            operation: add_number
            amount: 9
            slot: hand
        GENERIC_ATTACK_SPEED:
           1:
             operation: add_number
             amount: -3.1
             slot: hand
    display name: <gold>Mythril Axe
    flags:
      lore: <gold>A basic mythril axe.
      durability1: 520
      slashing: 5
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 80
      recipe: mythril_ingot_3|tool_rod_2

# Vanilla Replace

Crafted_Blast_Copper_Axe:
    type: item
    debug: false
    material: iron_axe
    mechanisms:
     custom_model_data: 10000
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Blast Copper Axe
    flags:
      lore: <gold>A basic copper axe.<n><red>This item is weaker due to improper smithing methods.
      durability1: 50
      durability2: 50
      slashing: 5
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 1
      recipe: blast_copper_ingot_3|tool_rod_2
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_copper_ingot|blast_copper_ingot
    #    - stick|blast_copper_ingot
    #    - stick|air
    #  2:
    #    type: shaped
    #    input:
    #    - blast_copper_ingot|blast_copper_ingot
    #    - blast_copper_ingot|stick
    #    - air|stick

Crafted_Blast_Iron_Axe:
    type: item
    debug: false
    material: iron_axe
    mechanisms:
     custom_model_data: 10002
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Blast Iron Axe
    flags:
      lore: <gold>A basic iron axe.<n><red>This item is weaker due to improper smithing methods.
      durability1: 100
      durability2: 100
      slashing: 5
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 20
      recipe: blast_iron_ingot_3|tool_rod_2
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_iron_ingot|blast_iron_ingot
    #    - stick|blast_iron_ingot
    #    - stick|air
    #  2:
    #    type: shaped
    #    input:
    #    - blast_iron_ingot|blast_iron_ingot
    #    - blast_iron_ingot|stick
    #    - air|stick