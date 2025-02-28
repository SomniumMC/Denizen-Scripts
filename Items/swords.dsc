# This file has all of the possible swords that players can obtain.

# First Slashed: 04/18/2024

#Blast_Copper_Sword:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10000
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
#    display name: <gold>Blast Copper Sword
#    flags:
#      lore: <gold>A basic copper sword.
#      durability1: 170
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 1
#      recipe: blast_copper_ingot_2|tool_rod_1
#
#Bronze_Sword:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10001
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
#    display name: <gold>Bronze Copper Sword
#    flags:
#      lore: <gold>A basic bronze sword.
#      durability1: 220
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 10
#      recipe: bronze_ingot_2|tool_rod_1
#
#Blast_Iron_Sword:
#    type: item
#    material: iron_sword
#    mechanisms:
#     custom_model_data: 10002
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
#    display name: <gold>Blast Iron Sword
#    flags:
#      lore: <gold>A basic iron sword.
#      durability1: 270
#      slashing: 4
#      damage_type: Slashing
#      skill_base: Blacksmithing
#      level: 20
#      recipe: blast_iron_ingot_2|tool_rod_1

Steel_Sword:
    type: item
    material: iron_sword
    mechanisms:
      components_patch:
        item_model: string:weapons:steel_sword
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
      #components_patch:
      #  hide_additional_tooltip: <map[]>
    display name: <gold>Steel Sword
    flags:
      lore: <gold>A basic steel sword.
      durability1: 320
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 30
      recipe: steel_ingot_2|tool_rod_1

Silver_Sword:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:silver_sword
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
    display name: <gold>Silver Sword
    flags:
      lore: <gold>A basic silver sword.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 40
      recipe: silver_ingot_2|tool_rod_1

Slate_Silver_Sword:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:silver_slate_sword
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
    display name: <gold>Slate Silver Sword
    flags:
      lore: <gold>A basic slate silver sword.
      durability1: 420
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 50
      recipe: slate_silver_ingot_2|tool_rod_1

Adamantine_Sword:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:adamantine_sword
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
    display name: <gold>Adamantine Sword
    flags:
      lore: <gold>A basic adamantine sword.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 70
      recipe: adamantine_ingot_2|tool_rod_1

Mythril_Sword:
    type: item
    material: iron_sword
    mechanisms:
     components_patch:
        item_model: string:weapons:mythril_sword
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
    display name: <gold>Mythril Sword
    flags:
      lore: <gold>A basic mythril sword.
      durability1: 100
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 80
      recipe: mythril_ingot_2|tool_rod_1

# Vanilla Crafted

Crafted_Blast_Copper_Sword:
    type: item
    material: iron_sword
    mechanisms:
     custom_model_data: 10000
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Blast Copper Sword
    flags:
      lore: <gold>A basic copper sword.<n><red>This item is weaker due to improper smithing methods.
      durability1: 170
      durability2: 170
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 1
      recipe: blast_copper_ingot_2|tool_rod_1
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_copper_ingot
    #    - blast_copper_ingot
    #    - stick

Crafted_Blast_Iron_Sword:
    type: item
    material: iron_sword
    mechanisms:
     custom_model_data: 10002
     unbreakable: true
     hides: unbreakable|attributes
    display name: <gold>Blast Iron Sword
    flags:
      lore: <gold>A basic iron sword.<n><red>This item is weaker due to improper smithing methods.
      durability1: 270
      durability2: 270
      slashing: 4
      damage_type: Slashing
      skill_base: Blacksmithing
      level: 20
      recipe: blast_iron_ingot_2|tool_rod_1
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_iron_ingot
    #    - blast_iron_ingot
    #    - stick