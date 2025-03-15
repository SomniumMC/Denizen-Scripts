# This file houses the dialog tree for the following NPC:
## Ayla

# First Created: 2/28/2025

NPC_DialogTree_Ayla:
  type: data
  debug: false
    # this opens the first welcome dialog with the npc saying the "dialog" part and giving the options to the player with the "option" part.
  welcome:
    dialog: <green>Oh, hello there! Welcome to the Crowned Crow! What can I do for you?
    option1:
      text: <white>I was given a delivery for you from Rhea.<gold>(Tutorial)
      type: chatting
      key: chat1
      req_flag:
        target: player
        flag: quest.tutorial_beginnings.stage
        value: 2
    option2:
      text: <white>Can ask you a question?
      type: chatting
      key: chat2
  chat1:
    dialog: <green>Oh, thank you! I was expecting this. Here, take this for your trouble.
    option1:
      text: <white>Thank you, do you have any work for me?<gold>(Tutorial)
      give:
        item: coinpurse
        quantity: 1
      type: chatting
      key: chat2
  chat2:
    dialog: <green>Is there anything else I can help you with?
    option1:
      text: <white>What can you tell me about Satus?
      type: chatting
      key: chat3
    option2:
      text: <white>Do you have any work for me?<gold>(Tutorial)
      type: chatting
      key: chat4
  chat3:
    dialog: <green>Satus is a safe haven from the Storm. It's the only place in the world where the Storm can't reach us. It's a good place to be.
    option1:
      text: <white>Thank you for the information.
      type: end
  chat4:
    dialog: <green>Yes, actually. Could you go downstairs and meet Talfein, the chef? He needs some help with the preparations.
    option1:
      text: <white>Alright, I'll go do that.
      type: end
      flag:
        target: player
        flag: quest.tutorial_beginnings.stage
        value: 3