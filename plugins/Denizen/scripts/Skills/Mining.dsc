# This file is responsible and keeps track of the logic for mining ores and stones to recieve custom ores or xp.

Mining_Main_Event:
    type: world
    events:
        on player breaks *_ore:
        - if <player.item_in_hand.enchantment_map.get[silk_touch]||null> != null:
          - stop
        - define ore <context.location.material.name>
        - choose <[ore]>:
          - case coal_ore
          - case iron_ore:
            - if <util.random_chance[1]>:
              - determine high_carbon_raw_iron
            - define xp 5
          - case copper_ore:
            - define xp 5
          - case gold_ore:
            - define xp 5
          - case diamond_ore:
            - define item <item[raw_silver]>
            - adjust def:item quantity:<util.random.int[1].to[3]>
            - determine <[item]>
          - case emerald_ore:
            - determine Geode
          - case deepslate_coal_ore
          - case deepslate_iron_ore:
            - define xp 5
          - case deepslate_copper_ore:
            - define xp 5
          - case deepslate_gold_ore:
            - define xp 5
          - case deepslate_diamond_ore:
            - define item <item[raw_silver]>
            - adjust def:item quantity:<util.random.int[1].to[3]>
            - determine <[item]>
          - case deepslate_emerald_ore:
            - determine Geode
        - if <[xp]||null> != null:
          - drop xp quantity:<util.random.int[0].to[<[xp]>]> <context.location>
        #- drop xp quantity:5 <context.location>
        #- drop xp quantity:50 <context.location>
        #- narrate "Nice <context.material>"