# This file houses the dialog tree for the following NPC:
## Brynwen_GeneralStore

# First Created: 2/26/2025


NPC_DialogTree_Brynwen_GeneralStore:
    type: data
    debug: false
    display: <blue>Brynwen
    welcome:
      dialog: <green>Tools and supplies for sale! How can I help you?
      option1:
        text: <white>I just wanted to ask a question.
        type: chatting
        key: chat1
      option2:
        text: <white>I'd like to see your stock - <red>Shop
        type: shop
        key: Grocer_Shop_Satus
    chat1:
      dialog: <green>What would you like to know?
      option1:
        text: <white>Do you run this store by yourself?
        type: chatting
        key: chat2
      option2:
        text: <white>Do you have an extra coinpurse I can have?
        type: chatting
        key: chat3
      option3:
        text: <white>What sort of things do you have in stock?
        type: chatting
        key: chat4
      option4:
        text: <white>Nevermind I don't need help.
        type: end
    chat2:
      dialog: <green>I have a few helpers from time to time, if business is good I may need to hire on part-timers again soon.
      option1:
        text: <white>Goodbye.
        type: end
    chat3:
      dialog: <green>Certainly, here you go!
      option1:
        text: <white>Thanks for giving me one!
        give:
          item: coinpurse
          quantity: 1
        type: end
    chat4:
      dialog: <green>Bits of rope, buckets, maybe a few knives, small tools and the like. Things that should be useful in a pinch.
      option1:
        text: <white>Thanks for letting me know!
        type: end

#NPC_ShopData_Grocer_Satus:
#  type: data
#  shop:
#    ## Item Script Name
#    null:
#      ## Buying Price
#      # Coin amount $ Coin Type
#      value: 5$1
#      # Percentage decrease to buying price turns into selling price
#      markup: 50
#      quantity: 1