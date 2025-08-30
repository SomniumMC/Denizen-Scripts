# This file includes the logic and mechanics that are involved in custom loot tables for fishing

# First Caught 5/27/2024

Fishing_Main_Event:
  type: world
  debug: false
  events:
      on player fishes item while Caught_Fish:
      - define item <context.item>
      #- narrate <[item]>
      #- define <[new_item]>
      - if <[item].material.name> in <list[cod|salmon|pufferfish|tropical_fish]>:
        - define item <proc[apply_info_proc].context[<item[<script[fishing_table].data_key[<proc[Fishing_Proc]>].random>]>]>
      - if <[item].material.name> == leather_boots:
        - define item <proc[apply_info_proc].context[<item[fished_leather_boots]>]>
      - if <[item].material.name> == fishing_rod:
        - define enchants <[item].enchantment_map>
        - define item <proc[apply_info_proc].context[<item[<script[Master_Pickup_Data].data_key[<[item].material.name>]>]>]>
        - adjust def:item enchantments:<[enchants]>
      - if <[item].material.name> == bow:
        - determine caught:string
        #- define enchants <[item].enchantment_map>
        #- define item <proc[apply_info_proc].context[<item[<script[Master_Pickup_Data].data_key[<[item].material.name>]>]>]>
        #- adjust def:item enchantments:<[enchants]>
      - determine caught:<[item]>
      #- determine cancelled passively
      #- determine caught:Nothing passively
      #- narrate "Nice <context.material>"

Fishing_Table:
  type: data
  debug: false
  normal_fish:
    - cooking_raw_fish
  custom_fish:
    - Fish_Anchovy
    - Fish_Bass
    - Fish_Carp
    - Fish_Catfish
    - Fish_Charr
    - Fish_Crab
    - Fish_Crayfish
    - Fish_Eel
    - Fish_Grouper
    - Fish_Herring
    - Fish_Jellyfish
    - Fish_Octopus
    - Fish_Perch
    - Fish_Sardine
    - Fish_Shrimp
    - Fish_Snapper
    - Fish_Tilapia
    - Fish_Trout
    - Fish_Tuna
    - Fish_Walleye
  crustacean:
    - Fish_Clam
    - Fish_Scallop
  ore:
    - raw_copper
    - raw_iron

Fishing_Proc:
    type: procedure
    debug: false
    script:
    #- choose <list[custom_fish]>
    - if <util.random_chance[70]>:
      - determine normal_fish
    - else if <util.random_chance[70]>:
      - determine custom_fish
    - else:
      - determine ore

# Fish

Fish_Anchovy:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1101
    display name: <white>Anchovy
    flags:
      food: 2
      Cooking_ID: Anchovy
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Bass:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1102
    display name: <white>Bass
    flags:
      food: 2
      Cooking_ID: Bass
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Carp:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1103
    display name: <white>Carp
    flags:
      food: 2
      Cooking_ID: Carp
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Catfish:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1104
    display name: <white>Catfish
    flags:
      food: 2
      Cooking_ID: Catfish
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Charr:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1105
    display name: <white>Charr
    flags:
      food: 2
      Cooking_ID: Charr
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Clam:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1106
    display name: <white>Clam
    flags:
      food: 2
      Cooking_ID: Clam
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Crab:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1107
    display name: <white>Crab
    flags:
      food: 2
      Cooking_ID: Crab
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Crayfish:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1108
    display name: <white>Crayfish
    flags:
      food: 2
      Cooking_ID: Crayfish
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Eel:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1109
    display name: <white>Eel
    flags:
      food: 2
      Cooking_ID: Eel
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Grouper:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1110
    display name: <white>Grouper
    flags:
      food: 2
      Cooking_ID: Grouper
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Herring:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1111
    display name: <white>Herring
    flags:
      food: 2
      Cooking_ID: Herring
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Jellyfish:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1112
    display name: <white>Jellyfish
    flags:
      food: 2
      Cooking_ID: Jellyfish
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Octopus:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1113
    display name: <white>Octopus
    flags:
      food: 2
      Cooking_ID: Octopus
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Perch:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1114
    display name: <white>Perch
    flags:
      food: 2
      Cooking_ID: Perch
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Sardine:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1115
    display name: <white>Sardine
    flags:
      food: 2
      Cooking_ID: Sardine
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Scallop:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1116
    display name: <white>Scallop
    flags:
      food: 2
      Cooking_ID: Scallop
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Shrimp:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1117
    display name: <white>Shrimp
    flags:
      food: 2
      Cooking_ID: Shrimp
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Snapper:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1118
    display name: <white>Snapper
    flags:
      food: 2
      Cooking_ID: Snapper
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Tilapia:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1119
    display name: <white>Tilapia
    flags:
      food: 2
      Cooking_ID: Tilapia
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Trout:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1120
    display name: <white>Trout
    flags:
      food: 2
      Cooking_ID: Trout
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Tuna:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1121
    display name: <white>Tuna
    flags:
      food: 2
      Cooking_ID: Tuna
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous
Fish_Walleye:
    type: item
    debug: false
    material: TROPICAL_FISH
    mechanisms:
      custom_model_data: 1122
    display name: <white>Walleye
    flags:
      food: 2
      Cooking_ID: Walleye
      Cooking_Tag: Fish
      meat: fish
      foodpoison: 30
      protein: true
    lore:
    - <green>Protein
    - <empty>
    - <gray>Refills <yellow>2 <gray>Hunger
    - <red>Dangerous