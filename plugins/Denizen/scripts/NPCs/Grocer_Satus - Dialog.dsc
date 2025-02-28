# This file houses the dialog tree for the following NPC:
## Grocer_Satus

# First Created: 12/16/2024


NPC_DialogTree_Grocer_Satus:
    type: data
    display: <yellow>Grocer
    welcome:
      dialog: <green>Fresh produce and seasoning for sale! How can I help you?
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
        text: <white>Where does all your product come from?
        type: chatting
        key: chat2
      option2:
        text: <white>What can I use these ingredients for?
        type: chatting
        key: chat3
      option3:
        text: <white>Nevermind I don't need help.
        type: end
    chat2:
      dialog: <green>Local farms mostly... some good are imported.
      option1:
        text: <white>Thanks for letting me know!
        type: end
    chat3:
      dialog: <green>Cooking, perhaps some alchemy. Though this isn't the most wide range of ingredients for that.
      option1:
        text: <white>Thanks for letting me know!
        type: end

NPC_ShopData_Grocer_Satus:
  type: data
  shop:
    ## Item Script Name
    new_bread:
      ## Buying Price
      # Coin amount $ Coin Type
      value: 5$1
      # Percentage decrease to buying price turns into selling price
      markup: 50
      quantity: 1
    cooking_salt:
      ## Buying Price
      # Coin amount $ Coin Type
      value: 2$1
      # Percentage decrease to buying price turns into selling price
      markup: 50
      quantity: 5