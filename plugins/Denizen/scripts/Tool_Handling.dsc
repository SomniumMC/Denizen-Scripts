# This file contains the scripts that handle durability and tool updating.

# First Created: 6/17/2024

Durability_Triggers:
    type: world
    debug: false
    events:
        on player breaks block bukkit_priority:HIGHEST:
        - if <player.item_in_hand.has_flag[durability1]>:
          - run Durability_Update_Task def.slot:hand
        on player right clicks block with:*hoe:
        - if <context.location.material.name||null> in <list[grass_block|dirt|coarse_dirt|dirt_path]>:
          - if <player.inventory.slot[<context.hand>].has_flag[durability1]>:
            - run Durability_Update_Task def.slot:<context.hand>
        on entity damages entity:
        - if <context.damager.entity_type> == player:
          - if <context.cause> == ENTITY_ATTACK || <context.cause> == ENTITY_SWEEP_ATTACK:
            - if <player.item_in_hand.has_flag[durability1]>:
              - run Durability_Update_Task def.slot:hand
        - if <context.entity.entity_type> == player:
          - foreach <list[head|chest|legs|feet]> as:slot:
            - if <player.item_in_hand.has_flag[durability1]>:
              - run Durability_Update_Task def.slot:<[slot]> player:<context.entity>
        on player shoots item:
        - if <context.bow.has_flag[durability1]>:
          - run Durability_Update_Task def.slot:<context.hand>
        on player fishes item:
        - if <player.item_in_hand.material.name> == fishing_rod:
          - if <player.item_in_hand.has_flag[durability1]>:
            - run Durability_Update_Task def.slot:hand
        - else if <player.item_in_offhand.material.name> == fishing_rod:
          - if <player.item_in_offhand.has_flag[durability1]>:
            - run Durability_Update_Task def.slot:offhand

Durability_Update_Task:
  type: task
  debug: true
  definitions: slot|overwrite|inventory
  script:
  - define item <inventory[<[inventory]>].if_null[<player.inventory>].slot[<[slot]>]>
  - if <[item].has_flag[durability1]>:
    - define loss 1
    - define enchants <[item].enchantment_map>
    - if unbreaking in <[enchants].keys>:
      - define level <[enchants].get[unbreaking]>
      ## This line here works by doing a random chance of 100 minus 100 divided by Unbreaking level plus 1 resulting in a equation like: 100-(100/(Unbreaking+1))
      - if <util.random_chance[<element[100].sub[<element[100].div[<element[<[level].add[1]>]>]>]>]>:
        - define loss 0
        #- narrate saved
      #- else:
      #  - narrate lost
    - if <[overwrite]||null> != null:
      - define loss <[overwrite]>
    - if <[loss]> >= 1:
      - inventory adjust slot:<[slot]> flag:durability1:-:<[loss]> destination:<inventory[<[inventory]>].if_null[<player.inventory>]>
      - if <[item].flag[durability2]||null> == null:
        - inventory adjust slot:<[slot]> flag:durability2:<[item].flag[durability1]> destination:<inventory[<[inventory]>].if_null[<player.inventory>]>
      - run update_item_task def:<inventory[<[inventory]>].if_null[<player.inventory>]>|<inventory[<[inventory]>].if_null[<player.inventory>].slot[<[slot]>]>|<[slot]>
    - if <[item].flag[durability1]> < 1:
      - inventory set o:air slot:<[slot]> destination:<inventory[<[inventory]>].if_null[<player.inventory>]>
      - playsound <player.location> sound:ENTITY.ITEM.BREAK sound_category:player

Mending_Delta:
  type: world
  debug: false
  events:
    on delta time minutely every:1:
    - foreach <server.online_players> as:__player:
      - foreach <list[head|chest|legs|feet|hand|offhand]> as:slot:
        - define item <player.inventory.slot[<[slot]>]>
        - if mending in <[item].enchantment_map.keys>:
          - if <[item].has_flag[durability1]>:
            - run Mending_Task def.item:<[item]> def.slot:<[slot]>

Mending_Task:
  type: task
  debug: false
  definitions: item|slot
  script:
  - define xp_loss <[item].enchantment_map.get[mending].mul[5]>
  - if <player.calculate_xp> >= <[xp_loss]>:
    - define current_dura <[item].flag[durability1]>
    - define max_dura <[item].flag[durability2]>
    - if <[current_dura]> != <[max_dura]>:
      - define new_dura <[current_dura].add[<[xp_loss]>]>
      - if <[new_dura]> > <[max_dura]>:
        - define xp_loss <[xp_loss].sub[<[new_dura].sub[<[max_dura]>].abs>]>
        - define new_dura <[max_dura]>
      #- narrate <[xp_loss]>
      - inventory adjust slot:<[slot]> flag:durability1:<[new_dura]> destination:<player.inventory>
      - experience take <[xp_loss]>
      - run update_item_task def:<player>|<player.inventory.slot[<[slot]>]>|<[slot]>

Vanilla_Equipment_Craft:
  type: world
  debug: false
  events:
    on player crafts item_flagged:durability1:
    - determine <proc[Apply_Info_Proc].context[<context.item>]>

update_item_task:
  type: task
  debug: false
  script:
  - wait 1t
  - define lore <empty>
  - if <[2].has_flag[lore]>:
    - define lore <[lore]><blue><[2].flag[lore].separated_by[<n>].if_null[<[2].flag[lore]>]>
    - define test t
  - if <[2].has_flag[durability1]>:
    - define lore "<[lore]><n><element[                          ].strikethrough><n><gold>Durability: <[2].flag[durability1].round_up.if_null[<red>ERROR - Please report to devs!]> / <[2].flag[durability2].round_up.if_null[<[2].flag[durability1].round_up>].if_null[<red>ERROR - Please report to devs!]>"
    - define test t
  - if <[2].has_flag[damage_type]>:
    - if <[2].flag[damage_type]> == slashing:
      - define lore <[lore]><n><red>Cutting
  - if !<[2].attribute_modifiers.is_empty>:
    - define lore <[lore]><n><gray><element[                          ].strikethrough><n><proc[Attributes_Lore_Proc].context[<[2]>]>
  #- if <[2].has_flag[slashingdefense]>:
  #  - define lore "<[lore]><n><red>Slashing Defense: <[2].flag[slashingdefense].round_up>"
  #- if <[2].has_flag[bluntdefense]>:
  #  - define lore "<[lore]><n><red>Blunt Defense: <[2].flag[bluntdefense].round_up>"
  #- if <[2].has_flag[piercingdefense]>:
  #  - define lore "<[lore]><n><red>Piercing Defense: <[2].flag[piercingdefense].round_up>"
  #- if <[2].has_flag[power]>:
  #  - define lore "<[lore]><n><red>Power: <[2].flag[Power].round_up>"
  - if <[2].has_flag[fruit]||null>:
    - define lore <[lore]><n><green>Fruit
    - define test t
  - if <[2].has_flag[sugar]||null>:
    - define lore <[lore]><n><green>Sugar
    - define test t
  - if <[2].has_flag[dairy]||null>:
    - define lore <[lore]><n><green>Dairy
    - define test t
  - if <[2].has_flag[storage]||null>:
    - define lore <[lore]><n><green>Storage
    - define test t
  - if <[2].has_flag[seed]||null>:
    - define lore <[lore]><n><green>Seed
    - define test t
  - if <[2].has_flag[grain]||null>:
    - define lore <[lore]><n><green>Grain
    - define test t
  - if <[2].has_flag[protein]||null>:
    - define lore <[lore]><n><green>Protein
    - define test t
  - if <[2].has_flag[vegetable]||null>:
    - define lore <[lore]><n><green>Vegetable
    - define test t
  - if <[2].has_flag[food]||null>:
    - if <[2].flag[food]> > 0:
      - define lore "<[lore]><n><gold>Replenishes <yellow><[2].flag[food]> <gold>hunger."
      - define test t
  - inventory adjust slot:<[3]> lore:<[lore]> destination:<[1]>
  - if <[2].has_flag[durability1]> && <[2].has_flag[durability2].not>:
    - inventory adjust slot:<[3]> flag:durability2:<[2].flag[durability1]> destination:<[1]>

Attributes_Lore_Proc:
  type: procedure
  definitions: item
  debug: false
  script:
  - define attributes <[item].attribute_modifiers>
  - foreach <[attributes]> key:id as:map:
    #- narrate <[id]>
    #- define key
    #- narrate <[key]>
    - choose <[id]>:
      - case ATTACK_DAMAGE:
        - define text_replace Attack_Damage
        - define color <dark_green.parsed>
      - case ATTACK_Speed:
        - define text_replace Attack_Speed
        - define color <dark_green.parsed>
      - case ARMOR:
        - define text_replace Armor
        - define color <blue.parsed>+
      - case ARMOR_TOUGHNESS:
        - define text_replace Armor_Toughness
        - define color <blue.parsed>+
    - define amount <[map].get[1].get[amount]>
    - if <[text_replace]> == attack_speed:
      - define amount <[amount].add[4]>
    - define slot <[map].get[1].get[slot]>
    - define formatted:->:<n><&sp><[color]><[amount]><&sp><[text_replace].replace[_].with[ ]>
  - define format_combine <[formatted].comma_separated.replace[,].with[]>
  - define lore "<n><gray>When on <[slot].to_titlecase><&co><[format_combine]>"
  - determine <[lore]>

Apply_Info_Proc:
  type: procedure
  definitions: item
  debug: false
  script:
  - define lore <empty>
  - if <[item].lore||null> != null:
    - define lore <[item].lore.separated_by[<n>]>
  - else if <[item].has_flag[lore]>:
    - define lore <[item].flag[lore]>
  - if <[item].has_flag[durability1]>:
    - if !<[item].has_flag[durability2]>:
      - adjust def:item flag:durability2:<[item].flag[durability1].round_up>
    - define lore "<[lore]><gray><n><element[                          ].strikethrough><n><gold>Durability: <[item].flag[durability1].round_up> / <[item].flag[durability2].round_up>"
  - if <[item].has_flag[damage_type]>:
    - if <[item].flag[damage_type]> == slashing:
      - define lore <[lore]><n><red>Cutting
  - if <[item].has_flag[fruit]> || <[item].has_flag[sugar]> || <[item].has_flag[dairy]> || <[item].has_flag[storage]> || <[item].has_flag[seed]> || <[item].has_flag[grain]> || <[item].has_flag[protein]> || <[item].has_flag[vegetable]> || <[item].has_flag[food]>:
    - define food 1
  #- if <[item].has_flag[sugar]>:
  #  - define food 1
  #- if <[item].has_flag[dairy]>:
  #  - define food 1
  #- if <[item].has_flag[storage]>:
  #  - define food 1
  #- if <[item].has_flag[seed]>:
  #  - define food 1
  #- if <[item].has_flag[grain]>:
  #  - define food 1
  #- if <[item].has_flag[protein]>:
  #  - define food 1
  #- if <[item].has_flag[vegetable]>:
  #  - define food 1
  #- if <[item].has_flag[food]>:
  #  - define food 1
  #- if <[item].has_flag[foodpoison]>:
  #  - define lore <[lore]><n><red>Dangerous<&co><&sp><gray><[item].flag[foodpoison]><&pc>
  - if !<[item].attribute_modifiers.is_empty>:
    - define lore <[lore]><n><gray><element[                          ].strikethrough><n><proc[Attributes_Lore_Proc].context[<[item]>]>
  - if <[food]||null> != null:
    - define lore <proc[Cooking_Lore_Proc].context[<[item]>]>
  #- adjust def:item flag:appraised:1
  - adjust def:item lore:<[lore]>
  #- narrate <[lore]>
  - determine <[item]>