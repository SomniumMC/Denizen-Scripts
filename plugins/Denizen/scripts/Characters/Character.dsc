# This file contains the command and guis that consist of the basic character profile of a player's character. Including Stats, Skills, RPC Info, ect.

character_command:
    type: command
    debug: false
    name: character
    description: Opens the character menu
    usage: /character
    alias: /char
    script:
    - inventory open d:character_menu

rpc_command:
    type: command
    debug: false
    name: rpc
    description: Does something
    usage: /rpc
    script:
    - if <context.args.get[2]||null> != null:
      - define player_name <context.args.get[2]||null>
      - if <server.match_player[<[player_name]>]||null> == null:
        - narrate "<red>Player not found"
        - flag <player> rpc_viewing:<player>
        - stop
      - else:
        - flag <player> rpc_viewing:<server.match_player[<[player_name]>]||null>
    - inventory open d:Character_RPC_Menu

Character_Menu_Controls:
    type: world
    debug: false
    events:
        on player clicks Character_Quests in Character_Menu:
        - inventory open d:Quest_Player_Inventory
        on player clicks Character_Stats in Character_Menu:
        - inventory open d:Character_Stats_Menu
        on player clicks GUIReturn in Character_Stats_Menu:
        - inventory open d:Character_Menu
        on player clicks Character_RPC in Character_Menu:
        - inventory open d:Character_RPC_Menu
        #after player opens Character_Menu:
        #- inventory adjust slot:11 destination:<player.open_inventory> skull_skin:<player.name>

Character_Menu:
    type: inventory
    debug: false
    title: <green>Character Menu
    inventory: chest
    gui: true
    slots:
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [Character_RPC] [GUINULL] [Character_Stats] [GUINULL] [Character_Quests] [GUINULL] [Character_Skills] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Character_Stats_Menu:
    type: inventory
    debug: false
    title: <green><bold>Basic Stats
    inventory: chest
    gui: true
    slots:
    - [GUIReturn] [GUINULL] [GUINULL] [GUINULL] [Character_Head] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [GUINull] [Stat_Strength] [Stat_Agility] [Stat_Toughness] [Stat_Endurance] [Stat_Vitality] [Stat_Wisdom] [Stat_Intelligence] [GUINull]
    - [<item[Race_<player.flag[race]>_Head].with_single[display=<green>Selected Race<white><&co><&sp><gold><player.flag[race]>]>] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Character_RPC:
    type: item
    debug: false
    material: player_head
    display name: <red>My RPC
    mechanisms:
      skull_skin: <player.name||null>
    lore:
    - <green>This is my character in the roleplay setting
    - <gray><&sp>
    - <yellow>Click this to edit the character details

Character_Head:
    type: item
    debug: false
    material: player_head
    display name: <gold><player.name||null>
    mechanisms:
      skull_skin: <player.name||null>

Character_Stats:
    type: item
    debug: false
    material: bell
    display name: <green>Character Stats
    lore:
    - <red>Press this to open the Stats Menu

Character_Quests:
    type: item
    debug: false
    material: filled_map
    display name: <yellow>Quests
    mechanisms:
      hides: all
    lore:
    - <green>Click to open the current Quests Menu

Character_Skills:
    type: item
    debug: false
    material: ender_eye
    display name: <blue>Skills
    lore:
    - <red><bold>Disabled until implemented.

Character_RPC_Events:
    type: world
    debug: false
    events:
        on player clicks item in Character_RPC_Menu:
        - define item <context.item>
        - define click_type <context.click>
        - choose <[item].flag[type]>:
          - case Name:
            - if <[click_type]> == right:
              - define edit_book <item[character_rpc_editbook]>
              - adjust def:edit_book flag:type:name
              - adjust def:edit_book lore:<[edit_book].lore.set[<red>Editing<&co><&sp><gold>Name].at[2]>
              - give item:<[edit_book]>
              - inventory close
          - case description:
            - if <[click_type]> == left:
              - narrate <player.flag[character.rpc.description]>
            - if <[click_type]> == right:
              - define edit_book <item[character_rpc_editbook]>
              - adjust def:edit_book flag:type:description
              - adjust def:edit_book lore:<[edit_book].lore.set[<red>Editing<&co><&sp><gold>Description].at[2]>
              - give item:<[edit_book]>
              - inventory close
          - case lore:
            - if <[click_type]> == left:
              - define book <item[character_rpc_viewbook]>
              - adjust def:book lore:<[book].lore.set[<red>Viewing<&co><&sp><gold>Lore].at[2]>
              - adjust def:book book_pages:<player.flag[character.rpc.lore]>
              - give item:<item[character_rpc_viewbook]>
            - if <[click_type]> == right:
              - define edit_book <item[character_rpc_editbook]>
              - adjust def:edit_book flag:type:lore
              - adjust def:edit_book lore:<[edit_book].lore.set[<red>Editing<&co><&sp><gold>Lore].at[2]>
              - give item:<[edit_book]>
              - inventory close
          - case age:
            - if <[click_type]> == right:
              - define edit_book <item[character_rpc_editbook]>
              - adjust def:edit_book flag:type:age
              - adjust def:edit_book lore:<[edit_book].lore.set[<red>Editing<&co><&sp><gold>Age].at[2]>
              - give item:<[edit_book]>
              - inventory close
          - case height:
            - if <[click_type]> == right:
              - define edit_book <item[character_rpc_editbook]>
              - adjust def:edit_book flag:type:height
              - adjust def:edit_book lore:<[edit_book].lore.set[<red>Editing<&co><&sp><gold>Height].at[2]>
              - give item:<[edit_book]>
              - inventory close
          - case profession:
            - if <[click_type]> == right:
              - define edit_book <item[character_rpc_editbook]>
              - adjust def:edit_book flag:type:profession
              - adjust def:edit_book lore:<[edit_book].lore.set[<red>Editing<&co><&sp><gold>Profession].at[2]>
              - give item:<[edit_book]>
              - inventory close
          - case confirm:
            - run Character_RPC_AppSend
            - flag <player> character.rpc.submitted:true
            - inventory close
              #- discordmessage id:mybot channel:1341502905554964550 "<player.name> has sent a app, this is a test"
        after player edits book:
        - if <context.old_book.script.name> == Character_RPC_EditBook:
          - if <context.signing>:
            - determine NOT_SIGNING
          - define type <context.old_book.flag[type]>
          - define contents <context.book.book_pages>
          - choose <[type]>:
            - case Name:
              - if <context.book.book_pages.get[1].to_list.size> > 27:
                - narrate "<red>Max Characters 25!"
                - take slot:hand
                - stop
              - flag player character.rpc.name:<[contents].get[1].strip_color>
            - case Description:
              - if <context.book.book_pages.get[1].to_list.size> > 52:
                - narrate "<red>Max Characters 50!"
                - take slot:hand
                - stop
              - flag player character.rpc.description:<[contents].get[1].strip_color>
            - case Lore:
              - flag player character.rpc.lore:<context.book.book_pages>
            - case Age:
              - if <context.book.book_pages.get[1].to_list.size> > 6:
                - narrate "<red>Max Characters 4!"
                - take slot:hand
                - stop
              - flag player character.rpc.age:<[contents].get[1].strip_color>
            - case Height:
              - if <context.book.book_pages.get[1].to_list.size> > 7:
                - narrate "<red>Max Characters 5!"
                - take slot:hand
                - stop
              - flag player character.rpc.height:<[contents].get[1].strip_color>
            - case Profession:
              - if <context.book.book_pages.get[1].to_list.size> > 22:
                - narrate "<red>Max Characters 20!"
                - take slot:hand
                - stop
              - flag player character.rpc.profession:<[contents].get[1].strip_color>
              #- flag player character.rpc.submitted:true
              #- narrate "<green>Character Submitted!"
              #- take slot:hand
          - narrate <context.book.book_pages.get[1]>
          - take slot:hand
        on player drops Character_RPC_EditBook:
        - playeffect at:<context.location> effect:smoke_large
        - remove <context.entity>
        on player drops Character_RPC_ViewBook:
        - playeffect at:<context.location> effect:smoke_large
        - remove <context.entity>



Character_RPC_Menu:
    type: inventory
    debug: false
    inventory: chest
    gui: true
    title: <green>RPC Info
    procedural items:
    - define item_list <list>
    - define entity <player.flag[rpc_viewing]>
    - if !<[entity].has_flag[character.rpc.submitted]>:
      - define item_list:->:<item[Character_RPC_Confirm]>
    - else:
      - define item_list:->:<item[Character_RPC_Locked]>
    - define status <[entity].flag[character.rpc.status].if_null[not_submitted]>
    - define status_item <item[Character_RPC_Status]>
    - choose <[status]>:
      - case not_submitted:
        - adjust def:status_item "lore:<[status_item].lore><red>Not Submitted"
        - adjust def:status_item material:structure_void
      - case accepted:
        - adjust def:status_item "lore:<[status_item].lore><green>Accepted<n><white>For any large modifications, please submit a ticket."
        - adjust def:status_item material:lime_stained_glass
      - case denied:
        - adjust def:status_item "lore:<[status_item].lore><red>Denied<n><white>For more information, please submit a ticket."
        - adjust def:status_item material:barrier
      - case info_needed:
        - adjust def:status_item "lore:<[status_item].lore><yellow>Needs More Information<n><white>Please submit a ticket."
        - adjust def:status_item material:yellow_stained_glass
    - define item_list:->:<item[<[status_item]>]>
    - determine <[item_list]>
    slots:
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [Character_RPC_Name] [GUINULL] [Character_RPC_Desc] [GUINULL] [Character_RPC_Journal] [GUINULL] [Character_RPC_Age] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [Character_RPC_Height] [GUINULL] [Character_RPC_Profession] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [] [GUINULL] [GUINULL] [] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Character_RPC_EditBook:
    type: item
    debug: false
    material: writable_book
    display name: <green>Character Edit Book
    flags:
      type: name
    lore:
    - <green>Open to edit character details
    - <empty>

Character_RPC_ViewBook:
    type: item
    debug: false
    material: written_book
    display name: <green>Character View Book
    flags:
      type: name
    lore:
    - <green>Open to view character details
    - <empty>

Character_RPC_Name:
    type: item
    debug: false
    material: name_tag
    display name: <green>Character Name
    flags:
      type: name
    lore:
    - <green>Current Name<&co><&sp><player.flag[rpc_viewing].flag[character.rpc.name].if_null[<red><bold>Empty]>
    - <red>Right Click to edit

Character_RPC_Desc:
    type: item
    debug: false
    material: paper
    display name: <green>Character Description
    flags:
      type: description
    lore:
    - <green>Click to view
    - <red>Right Click to edit

Character_RPC_Lore:
    type: item
    debug: false
    material: book
    display name: <green>Character Lore
    flags:
      type: lore
    lore:
    - <green>Click to view
    - <red>Right Click to edit

Character_RPC_Age:
    type: item
    debug: false
    material: clock
    display name: <green>Character Age
    flags:
      type: age
    lore:
    - <green>Current Age<&co><&sp><player.flag[rpc_viewing].flag[character.rpc.age].if_null[<red><bold>Empty]>
    - <red>Right Click to edit

Character_RPC_Height:
    type: item
    debug: false
    material: iron_boots
    display name: <green>Character Height
    flags:
      type: height
    lore:
    - <green>Current Height<&co><&sp><player.flag[rpc_viewing].flag[character.rpc.height].if_null[<red><bold>Empty]>
    - <red>Right Click to edit

Character_RPC_Profession:
    type: item
    debug: false
    material: bookshelf
    display name: <green>Character Profession
    flags:
      type: profession
    lore:
    - <green>Current Profession<&co><&sp><player.flag[rpc_viewing].flag[character.rpc.profession].if_null[<red><bold>Empty]>
    - <red>Right Click to edit

Character_RPC_Journal:
    type: item
    debug: false
    material: writable_book
    display name: <green>Character Journal
    lore:
    - <red>Not Implemented
    #- <green>Click to spawn copy

Character_RPC_Confirm:
    type: item
    debug: false
    material: emerald
    display name: <green><bold>Confirm
    flags:
      type: confirm
    lore:
    - <light_purple>Click to submit character to staff

Character_RPC_Locked:
    type: item
    debug: false
    material: barrier
    display name: <red><bold>Locked
    flags:
      type: locked
    lore:
    - <red>Character is locked from major editing
    - <red>Submit a ticket to unlock

Character_RPC_Status:
    type: item
    debug: false
    material: emerald
    display name: <green>Application Status
    lore:
    - <green>Current Status<&co><&sp>


Character_RPC_AppSend:
    type: task
    debug: false
    script:
    - if !<player.has_flag[character.rpc.name]>:
      - define fail:->:name
    - if !<player.has_flag[character.rpc.description]>:
      - define fail:->:description
    - if !<player.has_flag[character.rpc.lore]>:
      - define fail:->:lore
    - if !<player.has_flag[character.rpc.age]>:
      - define fail:->:age
    - if !<player.has_flag[character.rpc.height]>:
      - define fail:->:height
    - if !<player.has_flag[character.rpc.profession]>:
      - define fail:->:profession
    - if <[fail]||null> != null:
      - narrate "<red>You are missing these features<&co><&sp><gold><[fail].comma_separated.to_titlecase>"
      - stop
    - definemap app_data:
        player_name: <player.name>
        name: <player.flag[character.rpc.name]>
        description: <player.flag[character.rpc.description]>
        lore: <player.flag[character.rpc.lore]>
        age: <player.flag[character.rpc.age]>
        height: <player.flag[character.rpc.height]>
        profession: <player.flag[character.rpc.profession]>

    - narrate "<green>Processing Application..."

    - define formatted "Character Name<&co><&sp><[app_data].get[name]><n>
      Basic Description<&co><&sp><[app_data].get[description]><n>
      Character Lore<&co><&sp><[app_data].get[lore].get[1].strip_color>...<n>
      Character Age<&co><&sp><[app_data].get[age]><n>
      Character Height<&co><&sp><[app_data].get[height]><n>
      Character Profession<&co><&sp><[app_data].get[profession]>"

    - definemap options:
        1:
            label: Accepted
            value: accept
            description: Applicant has been accepted.
            #emoji: \<&co>white_check_mark<&co>
        2:
            label: Needs Info
            value: info_needed
            description: Applicant needs to add more information.
            #emoji: \<&co>question<&co>
        3:
            label: Denied
            value: deny
            description: Applicant has been denied. They need to ask staff for more information.
            #emoji: \<&co>x<&co>
        4:
            label: Needs Time
            value: time_needed
            description: Staff Needs more time to review the application.
            #emoji: \<&co>hourglass_flowing_sand<&co>

    - define menu <discord_selection.with[id].as[application_menu].with[options].as[<[options]>]>

    - define embed <discord_embed.with_map[title=<[app_data].get[player_name]><&sq>s<&sp>Application;description=<[formatted]>;timestamp=<util.time_now>;color=#00FFFF]>
    - discordmessage id:mybot channel:1341502905554964550 <[embed]> rows:<[menu]> save:application_message
    #- run Character_RPC_Discord_Menu def:<entry[application_message].message>
    - wait 15s
    - narrate "<green>Application Sent!"

Character_RPC_Discord_Menu_Events:
    type: world
    debug: false
    events:
        on discord selection used id:application_menu:
        - ~discordinteraction defer interaction:<context.interaction>

        - define player_name <context.message.embed.get[1].map.get[title].before[']>

        - choose <context.option.get[value]>:
            - case accept:
                - define message "Application was Accepted!"
                - flag <server.match_player[<[player_name]>].if_null[<server.match_offline_player[<[player_name]>]>]> character.rpc.status:accepted
                - if <server.match_player[<[player_name]>]||null> != null:
                  - narrate targets:<server.match_player[<[player_name]>]||null> "<green>Your application has been accepted!"
            - case info_needed:
                - define message "Application needs more information."
                - flag <server.match_player[<[player_name]>].if_null[<server.match_offline_player[<[player_name]>]>]> character.rpc.status:info_needed
                - if <server.match_player[<[player_name]>]||null> != null:
                  - narrate targets:<server.match_player[<[player_name]>]||null> "<yellow>Your application needs more information, please ask staff for more information."
            - case time_needed:
                - define message "Application requires more time to review."
                - flag <server.match_player[<[player_name]>].if_null[<server.match_offline_player[<[player_name]>]>]> character.rpc.status:info_needed
                - if <server.match_player[<[player_name]>]||null> != null:
                  - narrate targets:<server.match_player[<[player_name]>]||null> "<yellow>Your application requires more time to approve, please wait atmost 24hrs before contacting staff."
            - case deny:
                - define message "Application was Denied."
                - flag <server.match_player[<[player_name]>].if_null[<server.match_offline_player[<[player_name]>]>]> character.rpc.status:denied
                - if <server.match_player[<[player_name]>]||null> != null:
                  - narrate targets:<server.match_player[<[player_name]>]||null> "<red>Your application has been denied, please ask staff for more information."

        - ~discordinteraction reply interaction:<context.interaction> "<[player_name]>'s <[message]>"

Character_RPC_Unlock:
    type: command
    debug: false
    name: rpcunlock
    description: Does something
    usage: /rpcunlock <&lt>player_name<&gt>
    permission: dscript.mycmd
    tab completions:
      1: <server.online_players.parse_tag[<player.display_name>]>
    script:
    - define player_name <context.args.get[1]||null>
    - if <[player_name]> == null:
      - narrate "<red>Invalid Username"
      - stop
    - if <server.match_player[<[player_name]>]||null> == null:
      - narrate "<red>Player not found"
      - stop
    - else:
        - flag <server.match_player[<[player_name]>]> character.rpc.submitted:!
        - narrate "<green>RPC Editing Unlocked for <[player_name]>"
        - discordmessage id:mybot channel:1341502905554964550 "<[player_name]>'s RPC has been unlocked by Staff Member<&co><player.name.strip_color>"
