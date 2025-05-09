# This is the new system for managing NPC dialog trees and creating and managing npcs in the game.

# First Created: 5/7/2025

NPC_Event_Main:
    type: world
    debug: false
    events:
        on player right clicks npc:
        - ratelimit <player> 5t
        - define npc_id <context.entity.id>
        #- narrate <[npc_name]>

        - if <server.flag[npc.<[npc_id]>]> == null:
          - stop

        - run NPC_Dialog_Welcome def.npc_id:<[npc_id]>

NPC_Edit_Command:
    type: command
    name: npcedit
    description: Edit the NPC dialog tree.
    usage: /npcedit
    permission: dscript.npcedit
    script:
        - define npc_id <player.target.id.if_null[null]>
        - if <[npc_id]> == null:
          - narrate "<red>You must be looking at an NPC to edit it."
          - stop
        - flag <player> npc_edit.id:<[npc_id]>
        - flag <player> npc_edit.path:welcome
        - flag <player> npc_edit.prev:welcome
        - inventory open d:NPC_Edit_Menu_Main

NPC_Edit_Event:
    type: world
    debug: true
    events:
        on player clicks item in NPC_Edit_Menu_Main:
        - define item <context.item>
        - define npc_id <player.flag[npc_edit.id]>
        - define type <[item].flag[type]||null>
        - define path <[item].flag[path]||null>
        - define click_type <context.click>
        - if <[type]> == GUIL:
            - flag <player> npc_edit.path:welcome
            - inventory open d:NPC_Edit_Menu_Main
            - stop
        - if <[path]> == null:
            - stop
        - if <[type]> == new_option:
            - if <[click_type]> == right:
                - define edit_book <item[NPC_Edit_Book]>
                - flag <player> npc_edit.path:<[path]>
                - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Response
                - adjust def:edit_book flag:type:response
                - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.<player.flag[npc_edit.path]>.response].if_null[]>
                - give <[edit_book]>
                - inventory close
            - stop
        - flag <player> npc_edit.task:<[type]>
        - define edit_book <item[NPC_Edit_Book]>
        #- adjust def:edit_book flag:type:<[type]>
        - flag <player> npc_edit.prev:<player.flag[npc_edit.path]>
        - flag <player> npc_edit.path:<[path]>
        - if <[click_type]> == left:
            - inventory open d:NPC_Edit_Menu_Main
        - if <[click_type]> == right:
            - if <[type]> == message:
                - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Message
                - adjust def:edit_book flag:type:message
                - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.<player.flag[npc_edit.path]>.message].if_null[]>
                - give <[edit_book]>
                - inventory close
            - if <[type]> == response:
                - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Response
                - adjust def:edit_book flag:type:response
                - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.<player.flag[npc_edit.path]>.response].if_null[]>
                - give <[edit_book]>
                - inventory close
        after player edits book:
        - if <context.old_book.script.name||null> == NPC_Edit_Book:
            - define type <context.old_book.flag[type]>
            - define contents <context.book.book_pages>
            - define id <player.flag[npc_edit.id]>
            - define path <player.flag[npc_edit.path]>
            - if <[type]> == message:
                - flag server npc.<[id]>.<[path]>.message:<[contents]>
                - narrate "<green>Saved Data to NPC!"
            - if <[type]> == response:
                - flag server npc.<[id]>.<[path]>.response:<[contents]>
                - narrate "<green>Saved Data to NPC!"
            - take item:NPC_Edit_Book
            - flag <player> npc_edit.path:<player.flag[npc_edit.prev]>
            - inventory open d:NPC_Edit_Menu_Main
        on player signs book:
        - if <player.item_in_hand.script.name||null> == NPC_Edit_Book:
            - narrate "<red>Please click <white>Done<red>, don't sign it!"
            - determine NOT_SIGNING
        on player drops item:
        - if <context.item.script.name||null> == NPC_Edit_Book:
            - determine cancelled

NPC_Edit_Menu_Main:
    type: inventory
    inventory: chest
    gui: true
    definitions:
        welcome: <item[paper].with_single[display=<yellow>Message].with_single[lore=<server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.message].if_null[<red>Empty]><n><green>Right<&sp>Click<&sp>to<&sp>Edit<n><aqua>Current Path<&co><n><white><&lb><gold><player.flag[npc_edit.path]><white><&rb>].with_single[flag=path:<player.flag[npc_edit.path].if_null[welcome]>].with_single[flag=type:message]>
        back_button: <item[GUIL].with_single[display=<yellow>Back].with_single[lore=<green>Left Click to go home].with_single[flag=type:GUIL]>
    procedural items:
    - define result <list>
    - foreach <list[option1|option2|option3|option4|option5|option6|option7|option8|option9]> as:option:
        - define item <item[red_concrete]>
        - define success:false
        - define data <server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.<[option]>].if_null[null]>
        - adjust def:item display:<yellow>Option<&sp><[option].after[option]>
        - if <[data].get[response].if_null[null]> != null:
            - adjust def:item material:green_concrete
            - adjust def:item flag:type:response
            - adjust def:item flag:path:<player.flag[npc_edit.path]>.<[option]>
            - adjust def:item "lore:<server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.<[option]>.response]><n><green>Right Click to Edit<n><yellow>Left Click to View Dialog Tree"
            - if <[data].get[message].if_null[null]> == null:
                - adjust def:item material:orange_concrete
                - adjust def:item flag:path:<player.flag[npc_edit.path]>.<[option]>
                - adjust def:item "lore:<server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.<[option]>.response]><n><green>Right Click to Edit<n><n><red>Message in dialog is empty.<n><yellow>Left Click to View Dialog Tree"
            - define success:true
        - else if <[success].not>:
            - adjust def:item material:red_concrete
            - adjust def:item flag:type:new_option
            - adjust def:item flag:path:<player.flag[npc_edit.path]>.<[option]>
            - adjust def:item "lore:<red>Response Option is empty.<n><green>Right Click to Add Response"
        - define result:->:<[item]>
    - determine <[result]>
    slots:
    - [back_button] [GUINULL] [GUINULL] [GUINULL] [welcome] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [] [] [] [] [] [] [] [] []
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

NPC_Edit_Book:
    type: item
    debug: false
    material: writable_book
    display name: <green>NPC Edit Book
    flags:
      type: null
    lore:
    - <green>Open to edit NPC details
    - <empty>