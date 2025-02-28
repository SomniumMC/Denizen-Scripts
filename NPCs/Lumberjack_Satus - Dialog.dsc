# This file houses the dialog tree for the following NPC:
## Lumberjack_Satus

# First Created: 12/16/2024

NPC_DialogTree_Lumberjack_Satus:
    type: data
    display: <yellow>Lumberjack
    welcome:
      dialog: <green>Ugh... this axe is so heavy! Want to buy some lumber?
      option1:
        text: <white>I just wanted to ask a question.
        type: chatting
        key: chat1
      option2:
        text: <red>Shop
        type: shop
        key: Lumberjack_Shop_Satus
    chat1:
      dialog: <green>What would you like to know?
      option1:
        text: <white>Do you enjoy cutting trees?
        type: chatting
        key: chat2
      option2:
        text: <white>What can I use this wood for?
        type: chatting
        key: chat3
      option3:
        text: <white>Nevermind I don't need help.
        type: end
    chat2:
      dialog: <green>I love it! Plus it's great to build muscle, I'll be the strongest someday!
      option1:
        text: <white>Thanks for letting me know!
        type: end
    chat3:
      dialog: <green>You can build houses, make things from wood! So many options!
      option1:
        text: <white>Thanks for letting me know!
        type: end