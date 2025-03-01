# This file houses the dialog tree for the following NPC:
## Nyomi

# First Created: 11/27/2024

NPC_DialogTree_Nyomi:
    type: data
    # this opens the first welcome dialog with the npc saying the "dialog" part and giving the options to the player with the "option" part.
    welcome:
      dialog: <green>Someone sure can sleep, huh? The ship's already docked at Satus! The Chief Officer has your first task once you've gathered your... belongings.<n><gold>((You can click on the options in chat to select what to say))
      option1:
        text: <white>Wait where am I?
        type: chatting
        key: chat1
        deny_flag:
          target: player
          flag: dialog_nyomi.race
          value: aquired
      option2:
        text: <white>Can you tell me about Satus?
        type: chatting
        key: chat3
        req_flag:
          target: player
          flag: dialog_nyomi.race
          value: aquired
      option3:
        text: Chief officer? First task?<gold>(Tutorial)
        type: chatting
        key: chat4
        req_flag:
          target: player
          flag: dialog_nyomi.race
          value: aquired
    chat1:
      dialog: <green>Shucks, how hard did the Storm hit your head? You're going to ask what race you are next!
      option1:
        text: <white>... what race am I?
        type: inventory
        key: race_select_inventory
    chat2:
      dialog: <green>... Oh wow. I think you're a <gold><player.flag[race].get[name].to_titlecase> <green>But I can't be sure, I didn't study the races very well.
      option1:
        text: <white>That can't be right, let me try again.    <white><&lb><gold><italic>Race Select<white><&rb>
        type: inventory
        key: race_select_inventory
      option2:
        text: <white>I still want to know what Satus is...    <white><&lb><gold><italic>Confirm Choice<white><&rb>
        type: chatting
        key: chat3
        flag:
          target: player
          flag: dialog_nyomi.race
          value: aquired
        task:
          target: player
          key: Race_Bonus_Task
    chat3:
      dialog: <green>Ah yes, Satus! The only safe harbour in the world! The Storm can't reach us here. I don't know much else. I'm from the Isles... Don't ask.
      option1:
        text: <white>Thanks for catching me up!
        type: end
    chat4:
      dialog: <green>You can find Rhea on the main deck, can't miss her! She probably has a delivery task for you. How else were you going to pay for your passage, huh? I've seen your bags... if you could call them that...
      option1:
        text: <white>Thanks for pointing me in the right direction!
        type: quest_start
        key: tutorial_beginnings
        flag:
          target: player
          flag: quest.tutorial_beginnings.stage
          value: 1

Nyomi_race_Events:
    type: world
    events:
        after player clicks guireturn in race_select_inventory:
        - if <player.flag[chatting]> == nyomi:
          - run NPC_Chat def.npc:Nyomi def.type:chatting def.data:<script[NPC_DialogTree_Nyomi].data_key[chat2]>
        on player enters tutorial_race_check:
        - if !<player.flag[quest.tutorial_beginnings.stage]> >= 1:
          - teleport <player> <location[tutorial_race_check_tele]>
          - narrate "<white><&lb>Nyomi<&rb> - <green>Hey I'm not letting you leave here before we have a chat!"