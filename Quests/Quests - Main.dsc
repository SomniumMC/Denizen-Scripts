# This file houses all the main scripts for managing the quest system that players interact with. This works by reading a map tag on the player's "Quest" flag acting as a namespace for the quest.

## Flag Example: Quest.Quest_Name.Quest_Stage_Number

# This above flag will show the Quest Stage for that specific quest. This can then be referenced back using a tag from the script of that quest name and stage as the key to get further details. This allows the player to open their quests menu to pull up what their current task is in that specific quest.

# First Created: 11/23/2024

Quest_Player_Inventory:
    type: inventory
    inventory: chest
    title: <green>Current Quests
    size: 36
    gui: true
    procedural items:
    - if <player.flag[quest].is_empty>:
      - determine air
    - define list <list>
    - foreach <player.flag[quest].keys.reverse> as:quest_id:
      - define quest_stage <player.flag[quest.<[quest_id]>.stage]>
      - define item <item[paper[display=<[quest_id]>]]>
      - adjust def:item flag:quest_id:<[quest_id]>
      - adjust def:item flag:quest_stage:<[quest_stage]>
      - define list:->:<[item]>
    - determine <[list]>
    slots:
    - [GUIReturn] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [GUINull] [] [] [] [] [] [] [] [GUINull]
    - [GUINull] [] [] [] [] [] [] [] [GUINull]
    - [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]


Quest_Inventory_Update_Event:
  type: world
  events:
    after player opens Quest_Player_Inventory:
    - wait 1t
    - foreach <player.open_inventory.find_all_items[item_flagged:quest_id]> as:slot:
      - inventory set o:<proc[Quest_Display_Proc].context[<player.open_inventory.slot[<[slot]>]>]> slot:<[slot]> destination:<player.open_inventory>
    on player clicks GUIReturn in Quest_Player_Inventory:
    - inventory open d:Character_Menu


Quest_Display_Proc:
  type: procedure
  definitions: item
  script:
  - define quest_data <script[Quest_Data_<[item].flag[quest_id]>]>
  - define quest_stage_number <[item].flag[quest_stage]>
  - define quest_stage_data <[quest_data].data_key[<[quest_stage_number]>]>

  - define quest_name <[quest_data].data_key[quest_name].parsed>
  - define stage_description <[quest_stage_data].get[description]>

  - adjust def:item display:<[quest_name]>

  - if <[quest_stage_data].get[progress]> == completed:
    - adjust def:item lore:<gold>Quest<&sp>Completed!<n><&sp.repeat[40].strikethrough><n><[stage_description].parsed>
  - else:
    - adjust def:item lore:<gold>Current<&sp>Progress<&co><&sp><white><[quest_stage_data].get[progress]><n><&sp.repeat[40].strikethrough><n><yellow>Current<&sp>Task<&co><&sp><[stage_description].parsed>
  - determine <[item]>



Quest_Inventory_Command:
    type: command
    description: Opens the player quests menu.
    name: quests
    usage: /quests
    script:
      - inventory open d:QUEST_PLAYER_INVENTORY