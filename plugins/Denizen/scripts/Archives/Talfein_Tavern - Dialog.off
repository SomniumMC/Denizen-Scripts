# This file houses the dialog tree for the following NPC:
## Talfein_Tavern

# First Created: 2/28/2025

NPC_DialogTree_Talfein_Tavern:
  type: data
  debug: false
  welcome:
    dialog: <green>Ah, hello there! I'm Talfein, the chef of this tavern.
    option1:
      text: <white>What do you need help with?<gold>(Tutorial)
      type: chatting
      key: chat1
      req_flag:
        target: player
        flag: quest.tutorial_beginnings.stage
        value: 3
    option2:
      text: <white>Do you have any extra food I can have?
      type: chatting
      key: chat3
    option3:
      text: Here's the flour you asked for!<gold>(Tutorial)
      req_item:
        item: flour
        quantity: 1
      take:
        item: flour
        quantity: 1
      type: chatting
      key: chat4
      req_flag:
        target: player
        flag: quest.tutorial_beginnings.stage
        value: 4
      flag:
        target: player
        flag: quest.tutorial_beginnings.stage
        value: 5
    option4:
      text: <white>Do you need anymore help?<gold>(Tutorial)
      type: chatting
      key: chat5
      req_flag:
        target: player
        flag: quest.tutorial_beginnings.stage
        value: 5

  chat1:
    dialog: <green>I've got some wheat here, but I need it turned into flour. Could you do that for me?
    option1:
      text: <white>Sure, I can do that.
      give:
        item: new_wheat
        quantity: 1
      type: chatting
      key: chat2
  chat2:
    dialog: <green>Great! Just take this mortar and pestle to the counter right next to me and place it ontop. Then place the wheat into the tool and grind it into flour. Bring it back to me when you're done.
    option1:
      text: <white>Alright, I'll be back soon.
      type: end
      flag:
        target: player
        flag: quest.tutorial_beginnings.stage
        value: 4
      give:
        item: mortar_and_pestle
        quantity: 1
  chat3:
    dialog: <green>Of course! Here you go.
    option1:
      text: <white>Thank you!
      give:
        item: cracker
        quantity: 2
      type: end
  chat4:
    dialog: <green>Thank you! This will be perfect for the bread I'm making. Have some extra dough, you can cook it by clicking a furnace with it.
    option1:
      text: <white>You're welcome, do you need anymore help?
      type: chatting
      key: chat5
      give:
        item: dough
        quantity: 1
  chat5:
    dialog: <green>Actually, yes. Could you go to the blacksmith and let him know that we received our shipment? He'll know what to do next.
    option1:
        text: <white>Sure, I'll let him know.
        type: quest_progress
        flag:
          target: player
          flag: quest.tutorial_beginnings.stage
          value: 6