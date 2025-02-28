# This file houses the dialog tree for the following NPC:
## Blacksmith_Satus

# First Created: 12/10/2024

NPC_DialogTree_Blacksmith_Satus:
    type: data
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