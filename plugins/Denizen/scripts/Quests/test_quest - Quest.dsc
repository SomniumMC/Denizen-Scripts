# This is the data storage for the following Quest which stores special items, entities, inventories and general data.

## Quest Name: test_quest

# First Created: 11/23/2024

Quest_Data_test_quest:
    type: data
    debug: false
    quest_name: <yellow>Test Quest - The False Fountain
    1:
      description: <green>Go check out the town square.
      progress: 1/3
    2:
      description: <green>Yell at the test_npc.
      progress: 2/3
    3:
      description: <gold><italic>You successfully called test_npc out on their bad directions.
      progress: completed


Quest_Event_test_quest:
    type: world
    debug: false
    events:
        on player enters fake_town_square flagged:quest.test_quest:
        - if <player.flag[quest.test_quest.stage]> == 1:
          - narrate "<light_purple><italic>As you approach the location that test_npc told you, you realize there is no town or anything around!"
          - flag player quest.test_quest.stage:2