# This file contains the relevant scripts that handle death of the player and the relevant injuries or item drops that are a result of that death.

# First died: 12/14/2024

Death_Module:
    type: world
    events:
        on player dies:
        - define cause <context.cause>
        - define player <context.player>
        - define drops <context.drops>
        #- narrate <[drops]>
        - define total:<player.flag[death.total_count]>
        - flag player death.total_count:<[total].add[1]>
        #- narrate <player.flag[death.total_count]>
        - flag player death.<[cause]>.count:+:1

        - define inventory <player.inventory>

        - flag player death.drops:<[inventory]>

        - define satchel_slots:<player.inventory.find_all_items[item_flagged:satchel]>

        - if <[satchel_slots]||null> != null:
          - foreach <[satchel_slots]> as:slot:
            - define satchel <player.inventory.slot[<[slot]>]>
            - if <server.flag[satchel.<[satchel].flag[id]>.storage].is_empty>:
              - foreach next
            - foreach <server.flag[satchel.<[satchel].flag[id]>.storage]> as:item:
              - drop item:<[item]>
              - flag server satchel.<[satchel].flag[id]>.storage:<empty>
            - define dropped_list:->:<[satchel].display.strip_color><&sq>s<&sp>Contents

        - foreach <list[1|2|3|4|5|6|7|8|9|37|38|39|40|41]> as:slot:
          - if <player.inventory.slot[<[slot]>].material.name> != air:
            - run Death_Equip_Damage def:<[slot]>


        - repeat 3:
          - while true:
            - define random_slot <util.random.int[10].to[36]>
            - if <[loop_index]> >= 15:
              - define item<[value]>:null
              #- narrate <red>Failed
              - while stop
            - if <player.inventory.slot[<[random_slot]>].material.name> != air && !<player.inventory.slot[<[random_slot]>].has_flag[soulbound]>:
              - if <[random_slot]> != <[item1]||null> && <[random_slot]> != <[item2]||null> && <[random_slot]> != <[item3]||null>:
                - if <[random_slot]> !in <[satchel_slots]>:

                  - define item<[value]>:<[random_slot]>
                  #- narrate <[loop_index]>
                  - while stop
        - foreach <list[<[item1]>|<[item2]>|<[item3]>]> as:slot:
          - if <[slot]> == null:
            - foreach next
          - if <player.inventory.slot[<[slot]>].script.name> == coinpurse:
            - foreach next
          - drop item:<player.inventory.slot[<[slot]>]>
          - define dropped_list:->:<player.inventory.slot[<[slot]>].display.strip_color.if_null[<player.inventory.slot[<[slot]>].material.name.replace[_].with[ ].to_titlecase>]><&sp>x<player.inventory.slot[<[slot]>].quantity>
          - take slot:<[slot]> quantity:<player.inventory.slot[<[slot]>].quantity>
        - if <[dropped_list]||null> != null:
          - narrate "<aqua>You have lost your<&co><&sp><white><[dropped_list].comma_separated><aqua>!"
        #- drop item:<[item1]>
        #- drop item:<[item2]>
        #- drop item:<[item3]>
        #- define count <player.flag[death_count]>
        #- flag player death.<[count]>:->:<[drops]>

# old system

Death_Storage:
    type: inventory
    inventory: chest
    gui: true
    procedural items:
    - foreach <player.flag[death.drops].list_contents> as:item:
      - if <[item].material.name> == air:
        - define result:->:<item[air]>
        - foreach next
      - define const_item <item[<[item].material>].with_single[display=<[item].display>].with_single[quantity=<[item].quantity>].with_single[custom_model_data=<[item].custom_model_data||0>].with_single[lore=Slot<&co><[loop_index]>]>
      #- adjust def:const_item quantity:<[item].quantity>
      - define result:->:<[const_item]>
    # Add some logic!
    - determine <[result]>
    slots:
    - [GUINUll] [GUINUll] [GUINUll] [GUINUll] [Paper[display=<white>You have died <light_purple><bold><player.flag[death.total_count]> <white>times!]] [GUINUll] [GUINUll] [GUINUll] [GUINUll]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []


Death_Equip_Damage:
    type: task
    definitions: slot
    script:
    - define item <player.inventory.slot[<[slot]>]>
    - if <[item].has_flag[durability2]>:
      - define max_dura <[item].flag[durability2]>
      - define current_dura <[item].flag[durability1]>

      - define mod_dura <[current_dura].sub[<[max_dura].mul[0.15]>]>
      - if <[mod_dura]> <= 0:
        - define mod_dura:1

      - inventory adjust slot:<[slot]> flag:durability1:<[mod_dura]> destination:<player.inventory>
      - run update_item_task def:<player>|<player.inventory.slot[<[slot]>]>|<[slot]>