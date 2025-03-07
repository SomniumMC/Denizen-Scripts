# This file includes all the pickaxes that players can obtain.

# First Mined: 04/18/2024

#Blast_Copper_Pickaxe:
#    type: item
#    material: iron_pickaxe
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
#             amount: -2.8
#             slot: hand
#    display name: <gold>Blast Copper Pickaxe
#    flags:
#      lore: <gold>A basic copper pickaxe.
#      durability1: 170
#      skill_base: Blacksmithing
#      level: 1
#      recipe: blast_copper_ingot_3|tool_rod_2
#
#Bronze_Pickaxe:
#    type: item
#    material: iron_pickaxe
#    mechanisms:
#     custom_model_data: 10001
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
#             amount: -2.8
#             slot: hand
#    display name: <gold>Bronze Pickaxe
#    flags:
#      lore: <gold>A basic bronze pickaxe.
#      durability1: 220
#      skill_base: Blacksmithing
#      level: 10
#      recipe: bronze_ingot_3|tool_rod_2
#
#Blast_Iron_Pickaxe:
#    type: item
#    material: iron_pickaxe
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
#             amount: -2.8
#             slot: hand
#    display name: <gold>Blast Iron Pickaxe
#    flags:
#      lore: <gold>A basic iron pickaxe.
#      durability1: 270
#      skill_base: Blacksmithing
#      level: 20
#      recipe: blast_iron_ingot_3|tool_rod_2

Steel_Pickaxe:
    type: item
    debug: false
    material: diamond_pickaxe
    mechanisms:
     components_patch:
        item_model: string:tools:steel_pickaxe
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
             amount: -2.8
             slot: hand
    display name: <gold>Steel Pickaxe
    flags:
      lore: <gold>A basic steel pickaxe.
      durability1: 320
      skill_base: Blacksmithing
      level: 30
      recipe: steel_ingot_3|tool_rod_2

Silver_Pickaxe:
    type: item
    debug: false
    material: iron_pickaxe
    mechanisms:
     components_patch:
        item_model: string:tools:silver_pickaxe
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
             amount: -2.8
             slot: hand
    display name: <gold>Silver Pickaxe
    flags:
      lore: <gold>A basic silver pickaxe.
      durability1: 100
      skill_base: Blacksmithing
      level: 40
      recipe: silver_ingot_3|tool_rod_2

Slate_Silver_Pickaxe:
    type: item
    debug: false
    material: diamond_pickaxe
    mechanisms:
     components_patch:
        item_model: string:tools:silver_slate_pickaxe
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
             amount: -2.8
             slot: hand
    display name: <gold>Slate Silver Pickaxe
    flags:
      lore: <gold>A basic slate silver pickaxe.
      durability1: 420
      skill_base: Blacksmithing
      level: 50
      recipe: slate_silver_ingot_3|tool_rod_2

Adamantine_Pickaxe:
    type: item
    debug: false
    material: iron_pickaxe
    mechanisms:
     components_patch:
        item_model: string:tools:adamantine_pickaxe
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
             amount: -2.8
             slot: hand
    display name: <gold>Adamantine Pickaxe
    flags:
      lore: <gold>A basic adamantine pickaxe.
      durability1: 420
      skill_base: Blacksmithing
      level: 70
      recipe: adamantine_ingot_3|tool_rod_2

Mythril_Pickaxe:
    type: item
    debug: false
    material: iron_pickaxe
    mechanisms:
     components_patch:
        item_model: string:tools:mythril_pickaxe
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
             amount: -2.8
             slot: hand
    display name: <gold>Mythril Pickaxe
    flags:
      lore: <gold>A basic mythril pickaxe.
      durability1: 470
      skill_base: Blacksmithing
      level: 80
      recipe: mythril_ingot_3|tool_rod_2



# Vanilla Replace

Crafted_Blast_Copper_Pickaxe:
    type: item
    debug: false
    material: iron_pickaxe
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
             amount: -2.8
             slot: hand
    display name: <gold>Blast Copper Pickaxe
    flags:
      lore: <gold>A basic copper pickaxe.<n><red>This item is weaker due to improper smithing methods.
      durability1: 50
      durability2: 50
      skill_base: Blacksmithing
      level: 1
      recipe: blast_copper_ingot_3|tool_rod_2
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_copper_ingot|blast_copper_ingot|blast_copper_ingot
    #    - air|stick|air
    #    - air|stick|air

Crafted_Blast_Iron_Pickaxe:
    type: item
    debug: false
    material: iron_pickaxe
    mechanisms:
     custom_model_data: 10002
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
             amount: -2.8
             slot: hand
    display name: <gold>Blast Iron Pickaxe
    flags:
      lore: <gold>A basic iron pickaxe.<n><red>This item is weaker due to improper smithing methods.
      durability1: 100
      durability2: 100
      skill_base: Blacksmithing
      level: 20
      recipe: blast_iron_ingot_3|tool_rod_2
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - blast_iron_ingot|blast_iron_ingot|blast_iron_ingot
    #    - air|stick|air
    #    - air|stick|air