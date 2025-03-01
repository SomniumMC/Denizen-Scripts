# This file houses the dialog tree for the following NPC:
## Rhea

# First Created: 11/27/2024

NPC_DialogTree_Rhea:
    type: data
    # this opens the first welcome dialog with the npc saying the "dialog" part and giving the options to the player with the "option" part.
    welcome:
      dialog: <green>Good eve, Storm-sodden! Are you ready for your delivery task?
      option1:
        text: <white>Storm-sodden?
        type: chatting
        key: chat1
      option2:
        text: <white>Yes I am ready!
        type: chatting
        key: chat2
        req_flag:
          target: player
          flag: quest.tutorial_beginnings.stage
          value: 2
    chat1:
      dialog: <green>Don't get ruffled now, I'm jesting.
      option1:
        text: <gray>...
        type: chatting
        key: welcome
    chat2:
      dialog: <green>Good! Can you deliver this to Ayla, the innkeeper? Tavern's called the Crowned Crow, It's on second avenue.
      option1:
        text: <white>I'll certainly get on that!
        type: end
        flag:
          target: player
          flag: quest.tutorial_beginnings.stage
          value: 2

NPC_Rhea_Events:
    type: world
    events:
      on player exits tutorial_quest_check:
      - if <player.flag[quest.tutorial_beginnings.stage]> <= 1:
        - teleport <player> <location[tutorial_quest_check_tele]>
        - narrate "<white><&lb>Rhea<&rb> - <green>Hey I'm not letting you leave here before we have a chat!"
#tutorial_race_check_tele