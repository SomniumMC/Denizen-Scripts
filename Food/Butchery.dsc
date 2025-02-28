# This file includes all of the mechanics and functions that are associated with the Butchery Skill

# First Butchered: 4/29/2924

Butchery_Event:
    type: world
    events:
        on player right clicks block with:*_Corpse:
        - if !<player.item_in_offhand.has_flag[slashing]>:
          - narrate "<red>You need an item with <blue>Slashing <red>in your offhand to butcher this corpse."
        - else:
          - inventory adjust slot:offhand flag:durability1:-:1 destination:<player.inventory>
          - run update_item_task def:<player>|<player.item_in_offhand>|<player.held_item_slot>
          - if <player.item_in_hand.flag[durability1]> < 1:
            - inventory set o:air slot:offhand destination:<player.inventory>
          #- narrate "Nice <player.item_in_offhand.flag[slashing]>"
          - run Butchery_Rewards def.item:<player.item_in_hand>

Butchery_Rewards:
    type: task
    definitions: item
    script:
    - define mob <[item].flag[mob]>
    #- narrate "this corpse is for <[mob]>"
    - take item:<[item]> quantity:1
    - run Cooking_Sound_Cutting_Board
    #- run SKILL_LEVEL_TASK def:<player>|Butchery|5|Strength
    - choose <[mob]>:
      - case cow:
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Beef]>]> <context.entity.location> quantity:<util.random.int[1].to[3]>
        - drop item:leather <context.entity.location> quantity:<util.random.int[0].to[2]>
      - case mushroom_cow:
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Beef]>]> <context.entity.location> quantity:<util.random.int[1].to[3]>
        - drop item:leather <context.entity.location> quantity:<util.random.int[0].to[2]>
      - case pig:
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Pork]>]> <context.entity.location> quantity:<util.random.int[1].to[3]>
      - case chicken:
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Chicken]>]> <context.entity.location> quantity:1
        - drop item:feather <context.entity.location> quantity:<util.random.int[0].to[4]>
        - if <util.random_chance[25]>:
          - drop item:Egg <context.entity.location> quantity:1
      - case sheep:
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Mutton]>]> <context.entity.location> quantity:<util.random.int[1].to[2]>
        - drop item:white_wool <context.entity.location> quantity:<util.random.int[1].to[3]>
      - case rabbit:
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Rabbit]>]> <context.entity.location> quantity:1
        - if <util.random_chance[10]>:
          - drop item:rabbit_foot <context.entity.location> quantity:1
        - drop item:rabbit_hide <context.entity.location> quantity:<util.random.int[0].to[1]>
      - case horse:
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Horse]>]> <context.entity.location> quantity:<util.random.int[1].to[3]>
        - drop item:leather <context.entity.location> quantity:<util.random.int[0].to[2]>
      - case goat:
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Goat]>]> <context.entity.location> quantity:<util.random.int[1].to[2]>
        - drop item:leather <context.entity.location> quantity:<util.random.int[0].to[1]>
      - case hoglin:
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Pork]>]> <context.entity.location> quantity:<util.random.int[1].to[3]>
        - drop item:leather <context.entity.location> quantity:<util.random.int[0].to[2]>