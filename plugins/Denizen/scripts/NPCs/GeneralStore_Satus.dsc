# This file houses the dialog tree for the following NPC:
## GeneralStore_Satus

# First Created: 2/26/2025


NPC_DialogTree_GeneralStore_Satus:
    type: data
    debug: false
    display: <yellow>General Store
    welcome:
      dialog: <green>Tools and supplies for sale! How can I help you?
      option1:
        text: <white>I just wanted to ask a question.
        type: chatting
        key: chat1
      option2:
        text: <red>Shop
        type: shop
        key: Grocer_Shop_Satus
    chat1:
      dialog: <green>What would you like to know?
      option1:
        text: <white>Do you have an extra coinpurse I can have?
        type: chatting
        key: chat2
      #option2:
      #  text: <white>What can I use these ingredients for?
      #  type: chatting
      #  key: chat3
      #option3:
      #  text: <white>Nevermind I don't need help.
      #  type: end
    chat2:
      dialog: <green>Certainly, here you go!
      option1:
        text: <white>Thanks for giving me one!
        give:
          item: coinpurse
          quantity: 1
        type: end
    #chat3:
    #  dialog: <green>Cooking, perhaps some alchemy. Though this isn't the most wide range of ingredients for that.
    #  option1:
    #    text: <white>Thanks for letting me know!
    #    type: end

#NPC_ShopData_Grocer_Satus:
#  type: data
#  shop:
#    ## Item Script Name
#    coinpurse:
#      ## Buying Price
#      # Coin amount $ Coin Type
#      value: 5$1
#      # Percentage decrease to buying price turns into selling price
#      markup: 50
#      quantity: 1
#    cooking_salt:
#      ## Buying Price
#      # Coin amount $ Coin Type
#      value: 2$1
#      # Percentage decrease to buying price turns into selling price
#      markup: 50
#      quantity: 5