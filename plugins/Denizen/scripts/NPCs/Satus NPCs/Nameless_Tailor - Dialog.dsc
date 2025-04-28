# This file houses the dialog tree for the following NPC:
## Nameless_Tailor

# First Created: 12/10/2024

NPC_DialogTree_Nameless_Tailor:
    type: data
    debug: false
    display: <yellow>Tailor
    welcome:
      dialog: <green>Hello lovely, here for fine fabrics and garments?
      option1:
        text: <white>I just wanted to ask a question.
        type: chatting
        key: chat1
      option2:
        text: <red>Shop
        type: shop
    chat1:
      dialog: <green>What would you like to know?
      option1:
        text: <white>Where does your fabric come from?
        type: chatting
        key: chat2
      option2:
        text: <white>What do you have in stock?
        type: chatting
        key: chat3
      option3:
        text: <white>Would you like to share a meal?
        type: chatting
        key: chat4
      option4:
        text: <white>Nevermind I don't need help.
        type: end
    chat2:
      dialog: <green>You can make some fabric from spiders silk I hear... but mine? Trade secret.
      option1:
        text: <white>Thanks for the information!
        type: end
    chat3:
      dialog: <green>Swatches, hides, fine fabrics... if I like you lovely, I'll even make you something to wear.
      option1:
        text: <white>I'll have to take a look sometime!
        type: end
    chat4:
      dialog: <green>Sorry sweety, I'm watching my figure.
      option1:
        text: <white>Maybe next time?
        type: end