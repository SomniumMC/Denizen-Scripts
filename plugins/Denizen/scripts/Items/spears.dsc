# This file has all of the possible spears that players can obtain.

# First Poked: 04/19/2024

#Blast_Copper_Spear:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10024
#     unbreakable: true
#     hides: unbreakable|attributes
#     attribute_modifiers:
#        GENERIC_ATTACK_DAMAGE:
#          1:
#            operation: add_number
#            amount: 5
#            slot: hand
#        GENERIC_ATTACK_SPEED:
#          1:
#            operation: add_number
#            amount: -2.4
#            slot: hand
#    display name: <gold>Blast Copper Spear
#    flags:
#      lore: <gold>A basic copper spear.
#      durability1: 170
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 1
#      recipe: blast_copper_ingot_2|tool_rod_1
#
#Bronze_Spear:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10025
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
#    display name: <gold>Bronze Copper Spear
#    flags:
#      lore: <gold>A basic bronze spear.
#      durability1: 220
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 10
#      recipe: bronze_ingot_2|tool_rod_1
#
#Blast_Iron_Spear:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10026
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
#    display name: <gold>Blast Iron Spear
#    flags:
#      lore: <gold>A basic iron spear.
#      durability1: 270
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 20
#      recipe: blast_iron_ingot_2|tool_rod_1

Steel_Spear:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:steel_spear
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
    display name: <gold>Steel Spear
    flags:
      lore: <gold>A basic steel spear.
      durability1: 320
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 30
      recipe: steel_ingot_2|tool_rod_1

Silver_Spear:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:silver_spear
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
    display name: <gold>Silver Spear
    flags:
      lore: <gold>A basic silver spear.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 40
      recipe: silver_ingot_2|tool_rod_1

Slate_Silver_Spear:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:silver_slate_spear
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
    display name: <gold>Slate Silver Spear
    flags:
      lore: <gold>A basic slate silver spear.
      durability1: 420
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 50
      recipe: slate_silver_ingot_2|tool_rod_1

Adamantine_Spear:
    type: item
    material: iron_sword
    mechanisms:
     custom_model_data: 10030
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
    display name: <gold>Adamantine Spear
    flags:
      lore: <gold>A basic adamantine spear.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 70
      recipe: adamantine_ingot_2|tool_rod_1

Mythril_Spear:
    type: item
    material: iron_sword
    mechanisms:
     custom_model_data: 10031
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
    display name: <gold>Mythril Spear
    flags:
      lore: <gold>A basic mythril spear.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 80
      recipe: mythril_ingot_2|tool_rod_1