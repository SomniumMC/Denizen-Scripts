# This file houses the dialog tree for the following NPC:
## Bank_Satus

# First Created: 11/20/2024

NPC_DialogTree_Bank_Satus:
    type: data
    # this opens the first welcome dialog with the npc saying the "dialog" part and giving the options to the player with the "option" part.
    display: <yellow>Satus Banker
    welcome:
      dialog: <green>Hey there, would you like to view your bank?
      option1:
        text: <white>I just wanted to ask a question.
        type: chatting
        key: chat1
      option2:
        text: <red>Bank
        type: inventory
        key: Bank_GUI
        has_flag:
          target: player
          flag: bank.satus
          bool: true
        flag:
          target: player
          flag: bank_location
          value: satus
    chat1:
      dialog: <green>How can I assist you?
      option1:
        text: <white>How do I use the bank?
        type: chatting
        key: chat2
      option2:
        text: <gold>Can you open an account for me?
        type: end
        has_flag:
          target: player
          flag: bank.satus
          bool: false
        flag:
          target: player
          flag: bank_location
          value: satus
        task:
          target: player
          key: Bank_Account_Create
      option3:
        text: <white>Nevermind, I am fine.
        type: end
    chat2:
      dialog: <green>You first need to open an account with me. After doing so, you can store money and are given a single item vault. Item vaults are location specific so be sure to keep in mind where your items are before leaving on a trip! This means that they can only be accessed at that one location.<n><n>Now what else can I assist you with?
      option1:
        text: <gold>Can you open an account for me?
        type: end
        has_flag:
          target: player
          flag: bank.satus
          bool: false
        flag:
          target: player
          flag: bank_location
          value: satus
        task:
          target: player
          key: Bank_Account_Create
      option2:
        text: <white>Nevermind, I am fine.
        type: end

