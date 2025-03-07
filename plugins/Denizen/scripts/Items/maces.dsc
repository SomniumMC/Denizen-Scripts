# This file has all of the possible maces that players can obtain.

# First Whacked: 04/19/2024

#Blast_Copper_Mace:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10016
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
#    display name: <gold>Blast Copper Mace
#    flags:
#      lore: <gold>A basic copper mace.
#      durability1: 170
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 1
#      recipe: blast_copper_ingot_2|tool_rod_1
#
#Bronze_Mace:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10017
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
#    display name: <gold>Bronze Copper Mace
#    flags:
#      lore: <gold>A basic bronze mace.
#      durability1: 220
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 10
#      recipe: bronze_ingot_2|tool_rod_1
#
#Blast_Iron_Mace:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10018
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
#    display name: <gold>Blast Iron Mace
#    flags:
#      lore: <gold>A basic iron mace.
#      durability1: 270
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 20
#      recipe: blast_iron_ingot_2|tool_rod_1

Steel_Mace:
    type: item
    debug: false
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:steel_mace
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
    display name: <gold>Steel Mace
    flags:
      lore: <gold>A basic steel mace.
      durability1: 320
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 30
      recipe: steel_ingot_2|tool_rod_1

Silver_Mace:
    type: item
    debug: false
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:silver_mace
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
    display name: <gold>Silver Mace
    flags:
      lore: <gold>A basic silver mace.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 40
      recipe: silver_ingot_2|tool_rod_1

Slate_Silver_Mace:
    type: item
    debug: false
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:silver_slate_mace
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
    display name: <gold>Slate Silver Mace
    flags:
      lore: <gold>A basic slate silver mace.
      durability1: 420
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 50
      recipe: slate_silver_ingot_2|tool_rod_1

Adamantine_Mace:
    type: item
    debug: false
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:adamantine_mace
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
    display name: <gold>Adamantine Mace
    flags:
      lore: <gold>A basic adamantine mace.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 70
      recipe: adamantine_ingot_2|tool_rod_1

Mythril_Mace:
    type: item
    debug: false
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:mythril_mace
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
    display name: <gold>Mythril Mace
    flags:
      lore: <gold>A basic mythril mace.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 80
      recipe: mythril_ingot_2|tool_rod_1