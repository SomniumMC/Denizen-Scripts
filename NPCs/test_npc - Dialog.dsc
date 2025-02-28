# This file houses the dialog tree for the following NPC:
## test_npc

# First Created: 11/20/2024

NPC_DialogTree_test_npc:
    type: data
    # this opens the first welcome dialog with the npc saying the "dialog" part and giving the options to the player with the "option" part.
    welcome:
      ## This shows what the NPC Says
      dialog: <green>Hey there, how can I help you?
      ## This is what the player is given as an option to respond to the NPC
      option1:
        text: <white>I just wanted to ask a question.
        ## Type determines what kind of dialog option it is
        # Chatting opens a new dialog tree with the Key specified
        type: chatting
        ## Key specifies what is related to the Type needed
        key: chat1
      option2:
        text: <red>Shop
        # Shop opens a shop with the Key provided
        type: shop
    chat1:
      dialog: <green>What would you like to know?
      option1:
        text: <white>Where can I get a bite to eat?
        type: chatting
        key: chat2
      option2:
        text: <white>Where's the town square?
        type: chatting
        key: chat3
      option3:
        text: <white>Nevermind I don't need help.
        # End simply ends the conversation with the npc and unflags the player
        type: end
      option4:
        text: <white>You lied to me, there is no town square!
        # Quest_End is the end to a questline
        type: quest_end
        key: test_quest
        ## Req_flag signifies the player requires a flag to show the dialog option
        req_flag:
          target: player
          flag: quest.test_quest.stage
          value: 2
        ## Flag will apply the flag specified once the dialog option is selected
        flag:
          target: player
          flag: quest.test_quest.stage
          value: 3
    chat2:
      dialog: <green>There's a good restaurant up on the hill over there, amazing food and service!
      option1:
        text: <white>Thanks for letting me know!
        type: end
    chat3:
      dialog: <green>Oh that dilapedated thing? It's to the right of the blacksmith, you won't miss it.
      option1:
        text: <white>Thanks for letting me know!
        # Quest_Start begins the questline
        type: quest_start
        key: test_quest
        flag:
          target: player
          flag: quest.test_quest.stage
          value: 1


NPC_ShopData_test_npc:
  type: data
  shop:
    ## Item Script Name
    bacon_cheeseburger:
      ## Buying Price
      # Coin amount $ Coin Type
      value: 2$3
      # Percentage decrease to buying price turns into selling price
      markup: 50
      quantity: 16