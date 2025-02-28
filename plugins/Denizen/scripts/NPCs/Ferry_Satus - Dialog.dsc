# This file houses the dialog tree for the following NPC:
## Ferry_Satus

# First Created: 12/01/2024

NPC_DialogTree_Ferryman_Satus:
    type: data
    # this opens the first welcome dialog with the npc saying the "dialog" part and giving the options to the player with the "option" part.
    welcome:
      dialog: <green>Ready to go to the mainland?
      option1:
        text: <white>I'm ready, please take me.
        type: teleport
        key: ferry_mainland
      option2:
        text: <red>I'm not ready yet, I'd like to stay here.
        type: end