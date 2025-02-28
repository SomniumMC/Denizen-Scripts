# This file has all of the possible warhammers that players can obtain.

# First Smacked: 04/19/2024

#Blast_Copper_Warhammer:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10032
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
#    display name: <gold>Blast Copper Warhammer
#    flags:
#      lore: <gold>A basic copper warhammer.
#      durability1: 170
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 1
#      recipe: blast_copper_ingot_2|tool_rod_1
#
#Bronze_Warhammer:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10033
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
#    display name: <gold>Bronze Copper Warhammer
#    flags:
#      lore: <gold>A basic bronze warhammer.
#      durability1: 220
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 10
#      recipe: bronze_ingot_2|tool_rod_1
#
#Blast_Iron_Warhammer:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10034
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
#    display name: <gold>Blast Iron Warhammer
#    flags:
#      lore: <gold>A basic iron warhammer.
#      durability1: 270
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 20
#      recipe: blast_iron_ingot_2|tool_rod_1

Steel_Warhammer:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:steel_warhammer
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
    display name: <gold>Steel Warhammer
    flags:
      lore: <gold>A basic steel warhammer.
      durability1: 320
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 30
      recipe: steel_ingot_2|tool_rod_1

Silver_Warhammer:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:silver_warhammer
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
    display name: <gold>Silver Warhammer
    flags:
      lore: <gold>A basic silver warhammer.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 40
      recipe: silver_ingot_2|tool_rod_1

Slate_Silver_Warhammer:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:silver_slate_warhammer
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
    display name: <gold>Slate Silver Warhammer
    flags:
      lore: <gold>A basic slate silver warhammer.
      durability1: 420
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 50
      recipe: slate_silver_ingot_2|tool_rod_1

Adamantine_Warhammer:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:adamantine_warhammer
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
    display name: <gold>Adamantine Warhammer
    flags:
      lore: <gold>A basic adamantine warhammer.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 70
      recipe: adamantine_ingot_2|tool_rod_1

Mythril_Warhammer:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:mythril_warhammer
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
    display name: <gold>Mythril Warhammer
    flags:
      lore: <gold>A basic mythril warhammer.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 80
      recipe: mythril_ingot_2|tool_rod_1