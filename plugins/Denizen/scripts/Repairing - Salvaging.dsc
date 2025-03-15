#This file includes the code that is responsible for repairing and salvaging items based off of the Recipe flag on the item itself.

# Date Re-Created: 2/27/2025

RepairEvent:
    type: world
    debug: false
    events:
      on player right clicks Iron_Block with:item_flagged:durability1:
      - ratelimit <player> 1t
      - narrate Test


#RepairEvent:
#    type: world
#    debug: false
#    events:
#        on player right clicks Iron_Block with:item_flagged:durability1:
#        - if !<player.has_flag[temp_double_click]>:
#          - determine passively cancelled
#          - define max_dura <context.item.flag[durability2]>
#          - define current_dura <context.item.flag[durability1]>
#          - narrate "Durability <[current_dura].div[<[max_dura]>].mul[100].round_down_to_precision[1]><&pc>"
#          #- narrate "Nice <context.item.flag[durability1]> out of <context.item.flag[durability2]>"
#          - define item <context.item>
#          - foreach <item[<[item].script.name>].flag[recipe]> as:Text:
#            - if <[text].before_last[_].starts_with[toolrod]>:
#              - foreach next
#            #- define item_ingredient:<[Text].before_last[_]>   ##<item[<[text].before_last[_]>].with_single[quantity=<[text].after_last[_]>]>
#            - define list1:->:<[text].before_last[_]>
#            - define list2:->:<[text].after_last[_]>
#            #- flag <player> recipe_ingredient<[loop_index]>:<[Text].before_last[_]> expire:5s
#            #- flag <player> recipe_ingredient<[loop_index]>quantity:<[Text].after_last[_]> expire:5s
#          #- define ingredients <context.>
#          #- narrate <[list1]>
#          - flag <player> temp_recipe_list_item:<[list1]> expire:5s
#          #- narrate <[list1]>
#          - flag <player> temp_recipe_list_quantity:<[list2]> expire:5s
#          - foreach <[list2]> as:entry:
#            - define total:+:<[entry]>
#          - flag <player> temp_recipe_list_total_quantity:<[total]> expire:5s
#          #- give <[list]>
#          - flag <player> temp_double_click:true expire:5s
#        - else:
#          - if <context.item.flag[durability1]> == <context.item.flag[durability2]>:
#            - narrate "<red>This item is already at max durability."
#            - stop
#          - determine passively cancelled
#          - define item <context.item>
#          - if <player.item_in_offhand.script.name||0> in <player.flag[temp_recipe_list_item]> || <player.item_in_offhand.material.name> in <player.flag[temp_recipe_list_item]>:
#            #- narrate true
#            #- narrate <player.item_in_offhand.script.name>
#            #- narrate <player.flag[temp_recipe_list_item]>
#            #- narrate <player.item_in_offhand.script.name>
#            #- narrate <player.flag[temp_recipe_list_item]>
#            #- define index <player.flag[temp_recipe_list_item].find[<player.item_in_offhand.script.name>]>
#            #- narrate <[index]>
#            - define player_level <player.flag[Repairlevel]||0>
#            - define item_level <item[<[item].script.name>].flag[level]>
#            #- narrate <[item_level]>
#            - define amount 1
#            ##<player.flag[temp_recipe_list_item].get[<[index]>]>
#            - define total <player.flag[temp_recipe_list_total_quantity]>
#            - define repair_percentage <[amount].div[<[total]>].mul[100]>
#            #- narrate <[repair_percentage]>
#            - define current_dura <context.item.flag[durability1].div[<context.item.flag[durability2]>].mul[100].round_up_to_precision[0.1]>
#            #- narrate <[current_dura]>
#            - define added_percent <[current_dura].add[<[repair_percentage]>].add[<[player_level]>].round_up_to_precision[0.1]>
#            #- narrate <[added_percent]>
#            - if <[added_percent]> > 100:
#              - define new_dura_percent 1
#            - else:
#              - define new_dura_percent:<[added_percent].div[100]>
#              #- narrate <[new_dura_percent]>
#            - define new_dura <context.item.flag[durability2].mul[<[new_dura_percent]>].round_up>
#            #- if <[new_dura]>
#            #- narrate <[new_dura]>
#            - define chance <util.random.decimal[<[player_level].mul[0.5]>].to[<[item_level]>]>
#            - if <[chance]> > <[item_level].div[2]>:
#              - inventory adjust slot:hand flag:durability1:<[new_dura]>
#              - flag <player> temp_double_click:!
#              - playsound <context.location> sound:block_anvil_use sound_category:blocks pitch:0.5
#              - take slot:offhand quantity:1
#              #- run SKILL_LEVEL_TASK def:<player>|Repair|5|Strength
#              - run update_item_task def:<player>|<player.item_in_hand>|<player.held_item_slot>
#            #- narrate success
#          - else:
#            - narrate "<red>Invalid Item!"
#
#
#SalvageEvent:
#    type: world
#    debug: false
#    events:
#        on player right clicks Gold_Block with:item_flagged:durability1:
#        - if !<player.has_flag[temp_double_click]>:
#            - determine passively cancelled
#            - flag <player> temp_double_click:true expire:5s
#            - define item <context.item>
#            - foreach <item[<[item].script.name>].flag[recipe]> as:Text:
#              - define list1:->:<[text].before_last[_]>
#              - define list2:->:<[text].after_last[_]>
#            - flag <player> temp_recipe_list_item:<[list1]> expire:5s
#            - flag <player> temp_recipe_list_quantity:<[list2]> expire:5s
#            - define max_dura <context.item.flag[durability2]>
#            - define current_dura <context.item.flag[durability1]>
#            - narrate "Durability <[current_dura].div[<[max_dura]>].mul[100].round_down_to_precision[1]><&pc>"
#            - narrate "<gold>Are you sure you want to salvage this item?"
#
#
#
#        - else:
#            - determine passively cancelled
#            - flag <player> temp_double_click:!
#            - define player_level <player.flag[Salvagelevel]||0>
#            - define item_level <item[<context.item.script.name>].flag[level]>
#            - if <[player_level]> < 10 && <context.item.flag[durability1]> < <context.item.flag[durability2]>:
#              - narrate "<red>Your rank only allows fully repaired items."
#              - stop
#            #- narrate "Double Clicked"
#            - define current_dura_per <context.item.flag[durability1].div[<context.item.flag[durability2]>].mul[100].add[<[player_level]>].round_up_to_precision[0.1]>
#            - define current_dura_dec <[current_dura_per].div[100]>
#            - if <[current_dura_dec]> >= 1:
#              - define current_dura_dec 1
#            - flag <player> recipe_ingredient1:!
#            - flag <player> recipe_ingredient2:!
#            - flag <player> recipe_ingredient3:!
#            - flag <player> recipe_ingredient4:!
#            - flag <player> recipe_ingredient5:!
#            - flag <player> recipe_ingredient6:!
#            - define full_item <item[<context.item.script.name>]>
#            - foreach <[full_item].flag[recipe]> as:text:
#              - flag <player> recipe_ingredient<[loop_index]>:<[text]>
#              #- flag <player> ingredient<[loop_index]> <[text].before_last[_]>
#              #- define ingredient<[loop_index]>_quantity <[text].after_last[_]>
#            #- narrate <player.flag[recipe_ingredient1]>
#            - define recipe_amount:0
#            - define chance <util.random.decimal[<[player_level].mul[0.5]>].to[<[item_level]>]>
#            - narrate <[chance]>
#            - if <[chance]> > <[item_level].div[2]>:
#              - if <player.has_flag[recipe_ingredient1]>:
#                - define recipe1 <player.flag[recipe_ingredient1].before_last[_]>
#                - define recipe1_quantity <player.flag[recipe_ingredient1].after_last[_]>
#                - define recipe_amount:+:1
#              - if <player.has_flag[recipe_ingredient2]>:
#                - define recipe2 <player.flag[recipe_ingredient2].before_last[_]>
#                - define recipe2_quantity <player.flag[recipe_ingredient2].after_last[_]>
#                - define recipe_amount:+:1
#              - if <player.has_flag[recipe_ingredient3]>:
#                - define recipe3 <player.flag[recipe_ingredient3].before_last[_]>
#                - define recipe3_quantity <player.flag[recipe_ingredient3].after_last[_]>
#                - define recipe_amount:+:1
#              - if <player.has_flag[recipe_ingredient4]>:
#                - define recipe4 <player.flag[recipe_ingredient4].before_last[_]>
#                - define recipe4_quantity <player.flag[recipe_ingredient4].after_last[_]>
#                - define recipe_amount:+:1
#              - if <player.has_flag[recipe_ingredient5]>:
#                - define recipe5 <player.flag[recipe_ingredient5].before_last[_]>
#                - define recipe5_quantity <player.flag[recipe_ingredient5].after_last[_]>
#                - define recipe_amount:+:1
#              - if <player.has_flag[recipe_ingredient6]>:
#                - define recipe6 <player.flag[recipe_ingredient6].before_last[_]>
#                - define recipe6_quantity <player.flag[recipe_ingredient6].after_last[_]>
#                - define recipe_amount:+:1
#              - choose <[recipe_amount]>:
#                - case 1:
#                  - give item:<[recipe1]> quantity:<[recipe1_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                - case 2:
#                  - give item:<[recipe1]> quantity:<[recipe1_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe2]> quantity:<[recipe2_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                - case 3:
#                  - give item:<[recipe1]> quantity:<[recipe1_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe2]> quantity:<[recipe2_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe3]> quantity:<[recipe3_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                - case 4:
#                  - give item:<[recipe1]> quantity:<[recipe1_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe2]> quantity:<[recipe2_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe3]> quantity:<[recipe3_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe4]> quantity:<[recipe4_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                - case 5:
#                  - give item:<[recipe1]> quantity:<[recipe1_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe2]> quantity:<[recipe2_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe3]> quantity:<[recipe3_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe4]> quantity:<[recipe4_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe5]> quantity:<[recipe5_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                - case 6:
#                  - give item:<[recipe1]> quantity:<[recipe1_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe2]> quantity:<[recipe2_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe3]> quantity:<[recipe3_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe4]> quantity:<[recipe4_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe5]> quantity:<[recipe5_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#                  - give item:<[recipe6]> quantity:<[recipe6_quantity].mul[<[current_dura_dec]>].round_to_precision[1]>
#              - playsound <context.location> sound:entity_item_break sound_category:blocks pitch:<util.random.decimal[0.6].to[1.2]>
#              - take item:<context.item>
#              #- run SKILL_LEVEL_TASK def:<player>|Salvage|5|Strength
#              - run update_item_task def:<player>|<player.item_in_hand>|<player.held_item_slot>