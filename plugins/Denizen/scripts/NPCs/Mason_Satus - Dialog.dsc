# This file houses the dialog tree for the following NPC:
## Mason_Satus

# First Created: 12/16/2024


NPC_DialogTree_Mason_Satus:
    type: data
    debug: false
    display: <yellow>Mason
    welcome:
      dialog: <green>Hey... you.. want to see deals they're hiding from you? Secret deals on masonry <&dq>They<&dq> do not want you to know about.
      option1:
        text: <white>I just wanted to ask a question.
        type: chatting
        key: chat1
      option2:
        text: <red>Shop
        type: shop
        key: Mason_Shop_Satus
    chat1:
      dialog: <green>What would you like to know? Secrets of the hidden cults that run our lives?
      option1:
        text: <white>Where do you get all this stone from?
        type: chatting
        key: chat2
      option2:
        text: <white>Who are <&dq>They<&dq>?
        type: chatting
        key: chat3
      option3:
        text: <white>Nevermind I don't need help.
        type: end
    chat2:
      dialog: <green>See that's one of the secrets <&dq>They<&dq> hide from you... the rocks underground? They're free... nobody owns them.
      option1:
        text: <white>Thanks I guess.
        type: end
    chat3:
      dialog: <green>Now you're asking the right questions.. you'll find out eventually.
      option1:
        text: <white>Thanks for the information?
        type: end