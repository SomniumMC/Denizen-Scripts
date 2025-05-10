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

        - if <server.flag[npc.<[npc_id]>].if_null[null]> == null:
          - stop

        - run NPC_Dialog_Welcome def.npc_id:<[npc_id]>

NPC_Dialog_Welcome:
    type: task
    debug: false
    definitions: npc_id
    script:
        - define path welcome
        - define dialog_data <server.flag[npc.<[npc_id]>.<[path]>]>
        - define npc_display <npc[<[npc_id]>].name.parsed>

        - run NPC_Chat def.npc:<[npc_id]> def.type:chatting def.data:<[dialog_data]> def.npc_display:<[npc_display]> def.path:<[path]>

NPC_Chat:
    type: task
    debug: false
    definitions: data|type|npc|npc_display|path
    script:
    - flag <player> chatting:<[npc]> expire:1m

    - narrate <&sp.repeat[80].strikethrough>
    - narrate "<&lb><[npc_display]><&rb> <white>- <[data].get[message].separated_by[<n>].parsed>"
    - foreach <[data].keys.exclude[message|type|response]> as:option:
        - define option_data <[data].get[<[option]>]>

        - narrate "<[loop_index]><&co> <element[<[option_data].get[response].separated_by[<n>].parsed>].on_hover[<red>Click].on_click[/npcchat <[npc]> <[path]>.option<[loop_index]>].type[run_command]>"
    - narrate <&sp.repeat[80].strikethrough>
    #- foreach <[data].keys.exclude[dialog]> as:option:
        #  - define option_data <[data].get[<[option]>]>
        #  - define req_flag <[option_data].get[req_flag]||null>
        #  - define deny_flag <[option_data].get[deny_flag]||null>
        #  - define deny_has_flag <[option_data].get[deny_has_flag]||null>
        #  - define has_flag <[option_data].get[has_flag]||null>
        #  - if <[req_flag]> != null:
        #    - if <[req_flag].get[target]> == player:
        #      - if <player.flag[<[req_flag].get[flag]>]> != <[req_flag].get[value]>:
        #        - foreach next
        #  - if <[has_flag]> != null:
        #    - if <[has_flag].get[target]> == player:
        #      - choose <[has_flag].get[bool]>:
        #        - case true:
        #          - if <player.has_flag[<[has_flag].get[flag]>]>:
        #            - define success
        #          - else:
        #            - foreach next
        #        - case false:
        #          - if !<player.has_flag[<[has_flag].get[flag]>]>:
        #            - define success
        #          - else:
        #            - foreach next
        #  - if <[deny_flag]> != null:
        #    - if <[deny_flag].get[target]> == player:
        #      - if <player.flag[<[deny_flag].get[flag]>]> == <[deny_flag].get[value]>:
        #        - foreach next
        #  - if <[deny_has_flag]> != null:
        #    - if <[deny_flag].get[target]> == player:
        #      - if <player.has_flag[<[deny_has_flag].get[flag]>]>:
        #        - foreach next
            #
            #
            #- flag player chat_option<[loop_index]>:<[option_data]> expire:30s
            #- narrate "<[loop_index]><&co> <element[<[option_data].get[text].parsed>].on_hover[<red>Click].on_click[/npcchat <[npc]> chat_option<[loop_index]>].type[run_command]>"
        #  - case end:
        #    - flag <player> chatting:<empty>
        #    #- narrate <[data]>
        #    #- if <[data].get[key]>
        #    - narrate "<gray><italic>You have finished talking with them."
        #  - case quest_start:
        #    - flag <player> chatting:<empty>
        #    - narrate "<gold><italic>You have started the Quest: <script[quest_data_<[data]>].data_key[quest_name].parsed>!"
        #  - case quest_end:
        #    - flag <player> chatting:<empty>
        #    #- define quest_data 
        #    - narrate "<gold><italic>You have finished the Quest: <script[quest_data_<[data]>].data_key[quest_name].parsed>!"
        #  - case quest_progress:
        #    - flag <player> chatting:<empty>
        #    - narrate "<gold><italic>You have progressed in your current Quest."
        #  - case inventory:
        #    - inventory open d:<[data]>
        #  - case teleport:
        #    - teleport <player> <location[<[data]>]>
        #  - case shop:
        #    - flag <player> shop_data:<script[NPC_ShopData_<[npc]>]>
        #    - inventory open d:NPC_Shop_GUI

NPC_Chat_Command:
    type: command
    debug: false
    name: npcchat
    description: Does something
    usage: /npcchat npc chat_flag
    script:
    - define npc <context.args.get[1]>
    - define chat_data <server.flag[npc.<[npc]>.<context.args.get[2]>]>
    - define path <context.args.get[2]>
    - define type <[chat_data].get[type]>
    - define key <[chat_data].get[key]>
    - define npc_display <npc[<[npc]>].name.parsed>
    - if <[chat_data]> == null:
        - narrate "<red>Options Expired!"
        - flag <player> chatting:<empty>
        - stop
    - if <[type]> == end:
        - flag <player> chatting:<empty>
        - narrate <&sp.repeat[80].strikethrough>
        - narrate "<&lb><[npc_display]><&rb> <white>- <[chat_data].get[message].separated_by[<n>].parsed>"
        - narrate "<gray><italic>You have finished talking with them."
        - narrate <&sp.repeat[80].strikethrough>
        - stop
    - if <[type]> == teleport:
        - teleport <player> <location[<[chat_data].get[location]>]>
        - narrate <[chat_data].separated_by[<n>].get[message].parsed>
        - flag <player> chatting:<empty>
        - stop
    - run NPC_Chat def.npc:<[npc]> def.type:<[type]> def.data:<[chat_data]> def.npc_display:<[npc_display]> def.path:<[path]>

## NPC Editor Block

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
        - if <[item].has_flag[chat_type]>:
            - define chat_type <[item].flag[chat_type]>
            - if <[click_type]> == left:
                - if <[chat_type]> == chatting:
                    - flag <player> npc_edit.path:<player.flag[npc_edit.path]>
                    - flag server npc.<[npc_id]>.<[path]>.type:end
                    - narrate "<green>Changed to End"
                    - inventory open d:NPC_Edit_Menu_Main
                - if <[chat_type]> == end:
                    - flag <player> npc_edit.path:<player.flag[npc_edit.path]>
                    - flag server npc.<[npc_id]>.<[path]>.type:shop
                    - narrate "<green>Changed to Shop"
                    - inventory open d:NPC_Edit_Menu_Main
                - if <[chat_type]> == shop:
                    - flag <player> npc_edit.path:<player.flag[npc_edit.path]>
                    - flag server npc.<[npc_id]>.<[path]>.type:teleport
                    - narrate "<green>Changed to Teleport"
                    - inventory open d:NPC_Edit_Menu_Main
                - if <[chat_type]> == teleport:
                    - flag <player> npc_edit.path:<player.flag[npc_edit.path]>
                    - flag server npc.<[npc_id]>.<[path]>.type:chatting
                    - narrate "<green>Changed to Chatting"
                    - inventory open d:NPC_Edit_Menu_Main
            - if <[click_type]> == right:
                - if <[chat_type]> == shop:
                    - stop
                - if <[chat_type]> == teleport:
                    - define edit_book <item[NPC_Edit_Book]>
                    - flag <player> npc_edit.path:<[path]>
                    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Teleport<&sp>Location
                    - adjust def:edit_book flag:type:teleport
                    - adjust def:edit_book book_pages:<empty>
                    - give <[edit_book]>
                    - inventory close
            - stop
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
        - if <[click_type]> == middle && <[type]> == response:
            - flag server npc.<[npc_id]>.<[path]>:!
            - flag <player> npc_edit.path:<player.flag[npc_edit.prev]>
            - inventory open d:NPC_Edit_Menu_Main
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
                - if <server.flag[npc.<[id]>.<[path]>.type].if_null[null]> == null:
                    - flag server npc.<[id]>.<[path]>.type:chatting
                - narrate "<green>Saved Data to NPC!"
            - if <[type]> == teleport:
                - flag server npc.<[id]>.<[path]>.location:<[contents].get[1].strip_color>
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
        back_button: <item[GUIL].with_single[display=<yellow>Back to Welcome].with_single[lore=<green>Left Click to go home].with_single[flag=type:GUIL]>
    procedural items:
    - define result <list>
    - foreach <list[option1|option2|option3|option4|option5|option6|option7|option8|option9]> as:option:
        - define item <item[red_concrete]>
        - define success:false
        - define data <server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.<[option]>].if_null[null]>
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
        - adjust def:item display:<yellow>Option<&sp><[option].after[option]>
        - define result:->:<[item]>

    - foreach <list[option1|option2|option3|option4|option5|option6|option7|option8|option9]> as:option:
        - define data <server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.<[option]>].if_null[null]>
        - choose <[data].get[type].if_null[null]>:
            - case chatting:
                - define item <item[player_head]>
            - case shop:
                - define item <item[emerald]>
            - case end:
                - define item <item[oak_door]>
            - case teleport:
                - define item <item[ender_pearl]>
            - default:
                - define item <item[guinull]>
                - define result:->:<[item]>
                - foreach next
        - adjust def:item display:<yellow><[data].get[type].to_titlecase>
        - adjust def:item "lore:<yellow>Left Click to cycle Chat Type"
        - choose <[data].get[type]>:
            - case shop:
                - adjust def:item "lore:<[item].lore><n><green>Right Click to Edit Shop"
            - case teleport:
                - adjust def:item "lore:<[item].lore><n><green>Right Click to Edit Teleport Location<n><server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.<[option]>].location>"
        - adjust def:item flag:chat_type:<[data].get[type]>
        - adjust def:item flag:path:<player.flag[npc_edit.path]>.<[option]>
        - define result:->:<[item]>
    - determine <[result]>
    slots:
    - [back_button] [GUINULL] [GUINULL] [GUINULL] [welcome] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

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