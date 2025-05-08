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
        - define npc_id <player.target.id>
        - if <[npc_id]> == null:
          - narrate "<red>You must be looking at an NPC to edit it."
          - stop
        - flag <player> npc_edit.id:<[npc_id]>
        - flag <player> npc_edit.path:welcome
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
        - if <[path]> == null:
            - stop
        - flag <player> npc_edit.task:<[type]>
        - define edit_book <item[NPC_Edit_Book]>
        #- adjust def:edit_book flag:type:<[type]>
        - flag <player> npc_edit.path:<[path]>
        - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Message
        - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.<player.flag[npc_edit.path]>.message].if_null[]>
        - give <[edit_book]>
            #- case option1:
            #    - define edit_book <item[NPC_Edit_Book]>
            #    - adjust def:edit_book flag:type:option1
            #    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Option<&sp>1
            #    - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.option1].if_null[]>
            #    - give <[edit_book]>
            #- case option2:
            #    - define edit_book <item[NPC_Edit_Book]>
            #    - adjust def:edit_book flag:type:option2
            #    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Option<&sp>2
            #    - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.option2].if_null[]>
            #    - give <[edit_book]>
            #- case option3:
            #    - define edit_book <item[NPC_Edit_Book]>
            #    - adjust def:edit_book flag:type:option3
            #    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Option<&sp>3
            #    - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.option3].if_null[]>
            #    - give <[edit_book]>
            #- case option4:
            #    - define edit_book <item[NPC_Edit_Book]>
            #    - adjust def:edit_book flag:type:option4
            #    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Option<&sp>4
            #    - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.option4].if_null[]>
            #    - give <[edit_book]>
            #- case option5:
            #    - define edit_book <item[NPC_Edit_Book]>
            #    - adjust def:edit_book flag:type:option5
            #    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Option<&sp>5
            #    - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.option5].if_null[]>
            #    - give <[edit_book]>
            #- case option6:
            #    - define edit_book <item[NPC_Edit_Book]>
            #    - adjust def:edit_book flag:type:option6
            #    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Option<&sp>6
            #    - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.option6].if_null[]>
            #    - give <[edit_book]>
            #- case option7:
            #    - define edit_book <item[NPC_Edit_Book]>
            #    - adjust def:edit_book flag:type:option7
            #    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Option<&sp>7
            #    - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.option7].if_null[]>
            #    - give <[edit_book]>
            #- case option8:
            #    - define edit_book <item[NPC_Edit_Book]>
            #    - adjust def:edit_book flag:type:option8
            #    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Option<&sp>8
            #    - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.option8]>
            #    - give <[edit_book]>
            #- case option9:
            #    - define edit_book <item[NPC_Edit_Book]>
            #    - adjust def:edit_book flag:type:option9
            #    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Option<&sp>9
            #    - adjust def:edit_book book_pages:<server.flag[npc.<[npc_id]>.option9]>
            #    - give <[edit_book]>
        - inventory close
        on player edits book:
        - if <context.old_book.script.name||null> == NPC_Edit_Book:
            - define type <context.old_book.flag[type]>
            - define contents <context.book.book_pages>
            - define id <player.flag[npc_edit.id]>
            - define path <player.flag[npc_edit.path]>
            - flag server npc.<[id]>.<[path]>:<[contents]>
            - inventory set o:air slot:hand destination:<player.inventory>
            - narrate "<green>Saved Data to NPC!"
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
        welcome: <item[paper].with_single[display=<yellow>Message].with_single[lore=<server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.message].if_null[<red>Empty]><n><green>Left<&sp>Click<&sp>to<&sp>Edit].with_single[flag=path:<player.flag[npc_edit.path].if_null[welcome]>]>
    procedural items:
    - define result <list>
    - foreach <list[option1|option2|option3|option4|option5|option6|option7|option8|option9]> as:option:
        - define item <item[red_concrete]>
        - adjust def:item display:<yellow>Option<&sp><[option].after[option]>
        - if <server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.<[option]>].if_null[null]> != null:
            - adjust def:item material:green_concrete
            - adjust def:item flag:type:<[option]>
            - adjust def:item flag:path:<player.flag[npc_edit.path]>.<[option]>
            - adjust def:item lore:<server.flag[npc.<player.flag[npc_edit.id]>.<[option]>.message]><n><green>Left<&sp>Click<&sp>to<&sp>Edit
        - else:
            - adjust def:item flag:type:<[option]>
            - adjust def:item lore:<red>Option<&sp><&sp>is<&sp>empty.
        - define result:->:<[item]>
    - determine <[result]>
    slots:
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [welcome] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
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