# This file houses the dialog tree for the following NPC:
## Blacksmith_Satus

# First Created: 12/10/2024

NPC_DialogTree_Blacksmith_Satus:
    type: data
    debug: false
    welcome:
      dialog: <green> Who'sit Huh?!? What do ya need? Metals cooling, no time wasting!
      option1:
        text: <white>I just wanted to ask a question.
        type: chatting
        key: chat1
      option2:
        text: <red>Shop
        type: shop
        key: Blacksmith_inventory
      option3:
        text: <white>Talfein sent me to let you know the shipment arrived, is there anything you need help with?<gold>(Tutorial)
        type: chatting
        key: chat4
        req_flag:
          target: player
          flag: quest.tutorial_beginnings.stage
          value: 6
      option4:
        text: <white>I made the iron dagger you asked for.
        type: chatting
        key: chat7
        req_flag:
          target: player
          flag: quest.tutorial_beginnings.stage
          value: 7
        req_item:
          item: blast_iron_dagger
          quantity: 1
        take:
          item: blast_iron_dagger
          quantity: 1
        flag:
          target: player
          flag: quest.tutorial_beginnings.stage
          value: 8
      option5:
        text: <white>What should I do now?
        type: chatting
        key: chat8
        req_flag:
          target: player
          flag: quest.tutorial_beginnings.stage
          value: 8
    chat1:
      dialog: <green>Is it about metal? Ask yer question!
      option1:
        text: <white>Where does this metal come from?
        type: chatting
        key: chat2
      option2:
        text: <white>What can you make?
        type: chatting
        key: chat3
      option3:
        text: <white>Nevermind I don't need anything.
        type: end
    chat2:
      dialog: <green>local mine, nothing fancy. Why? Trying to cut in on my business?
      option1:
        text: <white>Just curious! Thanks for telling me.
        type: end
    chat3:
      dialog: <green>Basic weapons n' armor, few tools... if ya got crus. No handouts!
      option1:
        text: <white>Thanks for letting me know!
        type: end

    chat4:
      dialog: <green>Good, good. I'll get to it when I can. Can you make me an iron dagger? I need to see if you can follow instructions. Here's a tool rod to get you started.
      option1:
        text: <white>Alright, how do I make it?
        type: chatting
        key: chat6
        give:
          item: tool_rod
          quantity: 1
    chat6:
      dialog: <green>First, you'll want to go over to that workbench next to me. Select the anvil and select weapons. You'll see the dagger recipe in there. Head over to the anvil when you're ready.<n><green>Don't forget to only hit the green areas or you'll ruin the craft!
      option1:
        text: <white>Alright, I'll go do that.
        type: end
        flag:
          target: player
          flag: quest.tutorial_beginnings.stage
          value: 7
        give:
          item: iron_ingot
          quantity: 1
    chat7:
      dialog: <green>Ah good job, but on second thought, the quality on this isn't that great. I'll make it myself later. You can keep this one. Here's a little something for your time.
      option1:
        text: <white>Thank you, but where do I deposit this?
        give:
          item: currency2
          quantity: 1
        type: chatting
        key: chat8
    chat8:
      dialog: <green>Just head on over to the bank at the back of town, the fellow there can help you with an account.
      option1:
        text: <white>Alright, I'll go do that.
        type: quest_progress
        flag:
          target: player
          flag: quest.tutorial_beginnings.stage
          value: 9

NPC_ShopData_Blacksmith_Satus:
  type: data
  debug: false
  shop:
    ## Item Script Name
    enchant_unbreak3:
      ## Buying Price
      # Coin amount $ Coin Type
      value: 2$2
      quantity: 1