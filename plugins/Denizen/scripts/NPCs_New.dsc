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
    - flag <player> chatting.npc:<[npc]> expire:1m
    - flag <player> chatting.path:<[path]> expire:1m

    - narrate <&sp.repeat[80].strikethrough>
    - narrate "<white><&lb><[npc_display]><white><&rb> <white>- <[data].get[message].separated_by[<n>].parsed.if_null[<red>ERROR - Please report to devs]>"
    - foreach <[data].keys.exclude[message|type|response|teleport|inventory|shop|task|flag]> as:option:
        - define option_data <[data].get[<[option]>]>
        - flag <player> chatting.option<[loop_index]>:<[option_data]> expire:1m

        - narrate "<[loop_index]><&co> <element[<[option_data].get[response].separated_by[<n>].parsed.if_null[<red>ERROR - Please report to devs]>].on_hover[<red>Click].on_click[/npcchat <[npc]> <[path]>.option<[loop_index]>].type[run_command]>"
    - narrate "9<&co> <element[<red>End Conversation].on_hover[<red>Click].on_click[/npcchat end].type[run_command]>"
    - narrate <&sp.repeat[80].strikethrough>

NPC_Hotbar_Chat:
    type: world
    debug: false
    events:
        on player holds item flagged:chatting:
        - if <player.flag[chatting.npc].if_null[null]> == null:
            - flag <player> chatting:!
            - stop

        - determine passively cancelled
        - define slot <context.new_slot>
        - define chatting_data <player.flag[chatting]>
        - define chatting_npc <player.flag[chatting.npc]>
        - if <[slot]> == 9:
            - execute as_player "npcchat end"
            - stop
        - if <[chatting_data].get[option<[slot]>].if_null[null]> == null:
            - narrate "<red>Invalid Option!"
            - stop
        - else:
            - execute as_player "npcchat <[chatting_npc]> <player.flag[chatting.path]>.option<[slot]>"
        #- narrate "<red>You cannot swap items while chatting with an NPC!"

NPC_Chat_Command:
    type: command
    debug: false
    name: npcchat
    description: Does something
    usage: /npcchat npc chat_flag
    script:
    - define npc <context.args.get[1]>
    - if <[npc]> == end:
        - narrate "<gray><italic>You have finished talking with them."
        - flag <player> chatting:!
        - stop
    - if <player.flag[chatting.npc]> != <context.args.get[1]>:
        - narrate "<red>You are not currently chatting with that NPC!"
        - stop
    - define chat_data <server.flag[npc.<[npc]>.<context.args.get[2]>]>
    - define path <context.args.get[2]>
    - define type <[chat_data].get[type]>
    #- define key <[chat_data].get[key]>
    - define npc_display <npc[<[npc]>].name.parsed>
    - if <[chat_data]> == null:
        - narrate "<red>Options Expired!"
        - flag <player> chatting:!
        - stop
    - if <[type]> == end:
        - flag <player> chatting:!
        - narrate <&sp.repeat[80].strikethrough>
        - narrate "<&lb><[npc_display]><&rb> <white>- <[chat_data].get[message].separated_by[<n>].parsed.if_null[<red>ERROR - Please report to devs]>"
        - narrate "<gray><italic>You have finished talking with them."
        - narrate <&sp.repeat[80].strikethrough>
        - stop
    - if <[type]> == teleport:
        - teleport <player> <location[<[chat_data].get[location]>]>
        - narrate <[chat_data].get[message].separated_by[<n>].parsed.if_null[<empty>]>
        - flag <player> chatting:!
        - stop
    - if <[type]> == shop:
        - flag <player> shop_id:<[chat_data].deep_get[shop.id]>
        - inventory open d:NPC_Shop_GUI
        - flag <player> chatting:!
        - stop
    - if <[type]> == inventory:
        - inventory open d:<[chat_data].get[inventory]>
        #- if <[chat_data].get[message].if_null[null]> == null:
        #    - stop
        - stop
    - if <[type]> == task:
        - run <[chat_data].get[task]>
    - if <[type]> == flag:
        - define flag_name:<[chat_data].get[flag].before[&]>
        - define flag_value:<[chat_data].get[flag].after[&]>
        - flag <player> <[flag_name]>:<[flag_value]>
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
    debug: false
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
                    - flag server npc.<[npc_id]>.<[path]>.type:inventory
                    - narrate "<green>Changed to Inventory"
                    - inventory open d:NPC_Edit_Menu_Main
                - if <[chat_type]> == inventory:
                    - flag <player> npc_edit.path:<player.flag[npc_edit.path]>
                    - flag server npc.<[npc_id]>.<[path]>.type:Task
                    - narrate "<green>Changed to Task"
                    - inventory open d:NPC_Edit_Menu_Main
                - if <[chat_type]> == task:
                    - flag <player> npc_edit.path:<player.flag[npc_edit.path]>
                    - flag server npc.<[npc_id]>.<[path]>.type:flag
                    - narrate "<green>Changed to Flag"
                    - inventory open d:NPC_Edit_Menu_Main
                - if <[chat_type]> == flag:
                    - flag <player> npc_edit.path:<player.flag[npc_edit.path]>
                    - flag server npc.<[npc_id]>.<[path]>.type:chatting
                    - narrate "<green>Changed to Chatting"
                    - inventory open d:NPC_Edit_Menu_Main
            - if <[click_type]> == right:
                - if <[chat_type]> == shop:
                    - flag <player> npc_edit.path:<[path]>
                    - if <server.flag[npc.<[npc_id]>.<player.flag[npc_edit.path]>.shop.id].if_null[null]> == null:
                        - flag server npc_shop_total_ID:++
                        - flag server npc.<[npc_id]>.<[path]>.shop.id:<server.flag[npc_shop_total_ID]>
                        - inventory open d:Npc_Shop_Edit_Menu
                        - run npc_shop_update
                        - wait 1s
                        - narrate "<green>Generating Shop Menu..."
                        - inventory close
                        - wait 2s
                        - inventory open d:Npc_Shop_Edit_Menu
                    - else:
                        - inventory open d:Npc_Shop_Edit_Menu
                - if <[chat_type]> == teleport:
                    - define edit_book <item[NPC_Edit_Book]>
                    - flag <player> npc_edit.path:<[path]>
                    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Teleport<&sp>Location
                    - adjust def:edit_book flag:type:teleport
                    - adjust def:edit_book book_pages:<empty>
                    - give <[edit_book]>
                    - inventory close
                - if <[chat_type]> == inventory:
                    - define edit_book <item[NPC_Edit_Book]>
                    - flag <player> npc_edit.path:<[path]>
                    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Inventory<&sp>ID
                    - adjust def:edit_book flag:type:inventory
                    - adjust def:edit_book book_pages:<empty>
                    - give <[edit_book]>
                    - inventory close
                - if <[chat_type]> == task:
                    - define edit_book <item[NPC_Edit_Book]>
                    - flag <player> npc_edit.path:<[path]>
                    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Task
                    - adjust def:edit_book flag:type:task
                    - adjust def:edit_book book_pages:<empty>
                    - give <[edit_book]>
                    - inventory close
                - if <[chat_type]> == flag:
                    - define edit_book <item[NPC_Edit_Book]>
                    - flag <player> npc_edit.path:<[path]>
                    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Flag
                    - adjust def:edit_book flag:type:flag
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
            - if <[type]> == inventory:
                - flag server npc.<[id]>.<[path]>.inventory:<[contents].get[1].strip_color>
                - narrate "<green>Saved Data to NPC!"
            - if <[type]> == task:
                - flag server npc.<[id]>.<[path]>.task:<[contents].get[1].strip_color>
                - narrate "<green>Saved Data to NPC!"
            - if <[type]> == flag:
                - define line1 <[contents].get[1].strip_color.if_null[null]>
                - define line2 <[contents].get[2].strip_color.if_null[null]>
                - if <[line1]> == null || <[line2]> == null:
                    - narrate "<red>Requires a flag in the format: flag_name<n>value"
                    - stop
                - flag server npc.<[id]>.<[path]>.flag:<[line1]>&<[line2]>
                - narrate "<green>Saved Data to NPC!"

            - if <[type]> == quantity:
                - if !<[contents].get[1].strip_color.is_integer>:
                    - narrate "<red>Requires a number!"
                    - stop
                - if <[contents].get[1].strip_color> >= 1 && <[contents].get[1].strip_color> <= 64:
                    - flag <player.flag[npc_edit.shop.item]> shop.quantity:<[contents].get[1].strip_color>
                    - narrate "<green>Saved Data to NPC!"
                    - define editing:shop
                - else:
                    - narrate "<red>Requires a number between 1 and 64!"
                    - stop
            - if <[type]> == price:
                - if !<[contents].get[1].strip_color.is_integer>:
                    - narrate "<red>Requires a number!"
                    - stop
                - flag <player.flag[npc_edit.shop.item]> shop.price.value:<[contents].get[1].strip_color>
                - narrate "<green>Saved Data to NPC!"
                - define editing:shop
            - if <[type]> == sell_price:
                - if !<[contents].get[1].strip_color.is_integer>:
                    - narrate "<red>Requires a number!"
                    - stop
                - flag <player.flag[npc_edit.shop.item]> shop.sell_price.value:<[contents].get[1].strip_color>
                - narrate "<green>Saved Data to NPC!"
                - define editing:shop
            - if <[type]> == stock:
                - if !<[contents].get[1].strip_color.is_integer>:
                    - narrate "<red>Requires a number!"
                    - stop
                - flag <player.flag[npc_edit.shop.item]> shop.stock:<[contents].get[1].strip_color>
                - narrate "<green>Saved Data to NPC!"
                - define editing:shop

            - take item:NPC_Edit_Book
            - if <[editing]> == shop:
                - inventory open d:NPC_Shop_Data_Menu
            - else:
                - flag <player> npc_edit.path:<player.flag[npc_edit.prev]>
                - inventory open d:NPC_Edit_Menu_Main
        on player signs book:
        - if <player.item_in_hand.script.name||null> == NPC_Edit_Book:
            - narrate "<red>Please click <white>Done<red>, don't sign it!"
            - determine NOT_SIGNING
        on player drops item:
        - if <context.item.script.name||null> == NPC_Edit_Book:
            - playeffect at:<context.location> effect:smoke_large
            - remove <context.entity>

NPC_Edit_Menu_Main:
    type: inventory
    inventory: chest
    title: <white>NPC Editor
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
            - case inventory:
                - define item <item[chest]>
            - case task:
                - define item <item[book]>
            - case flag:
                - define item <item[target]>
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
                - adjust def:item "lore:<[item].lore><n><green>Right Click to Edit Teleport Location<n><gold>Teleport<&sp>Location<&co><white><&sp><server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.<[option]>].get[location].if_null[<red>Empty]>"
            - case inventory:
                - adjust def:item "lore:<[item].lore><n><green>Right Click to Edit Inventory<n><gold>Inventory<&sp>Location<&co><white><&sp><server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.<[option]>].get[inventory].if_null[<red>Empty]>"
            - case task:
                - adjust def:item "lore:<[item].lore><n><green>Right Click to Edit Task<n><gold>Task<&sp>Name<&co><white><&sp><server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.<[option]>].get[task].if_null[<red>Empty]>"
            - case flag:
                - adjust def:item "lore:<[item].lore><n><green>Right Click to Edit Flag<n><gold>Flag<&co><white><&sp><server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.<[option]>].get[flag].replace[&].with[:].if_null[<red>Empty]>"
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

NPC_Shop_Edit_Event:
    type: world
    events:
        on player clicks item in NPC_Shop_Edit_Menu:
        - define item <context.item>
        - define click_type <context.click>
        - define npc_id <player.flag[npc_edit.id]>
        - define path <player.flag[npc_edit.path]>
        - define type <[item].flag[type]||null>
        - define slot <context.slot||null>

        - if <[type]> == finish:
            - run NPC_Shop_Update
            - determine passively cancelled
            - stop

        - if <[item].script.name||null> == GUINULL || <[item].flag[type]||null> == blocked:
            - determine cancelled

        - if <context.clicked_inventory.script.name> == NPC_Shop_Edit_Menu:
            - if <[click_type]> == right:
                - if !<[item].has_flag[shop_lore]>:
                    - adjust def:item flag:shop_lore:<[item].lore.if_null[<empty>]>
                - if <[item].script.name.if_null[null]> != null:
                    - adjust def:item flag:script_name:<[item].script.name>
                - else:
                    - adjust def:item flag:material_name:<[item].material.name>
                - flag <player> npc_edit.shop.item:<[item]>
                - flag <player> npc_edit.shop.slot:<[slot]>
                - inventory open d:NPC_Shop_Data_Menu
        on player clicks item in NPC_Shop_Data_Menu:
        - define item <context.item>
        - define click_type <context.click>
        - define slot <context.slot||null>
        - if !<context.inventory.slot[1].has_flag[shop]>:
            - define edit_item <player.flag[npc_edit.shop.item]>
            - adjust def:edit_item flag:shop.quantity:<context.inventory.slot[2].flag[quantity]>
            - adjust def:edit_item flag:shop.sell_price:<context.inventory.slot[3].flag[sell_price]>
            - adjust def:edit_item flag:shop.price:<context.inventory.slot[4].flag[price]>
            - adjust def:edit_item flag:shop.stock:<context.inventory.slot[5].flag[stock]>
            - flag <player> npc_edit.shop.item:<[edit_item]>
            - wait 1t
            - inventory open d:NPC_Shop_Data_Menu
        - if <[item].script.name||null> == GUIReturn:
            - define edit_item <player.flag[npc_edit.shop.item]>
            - adjust def:edit_item flag:shop.quantity:<context.inventory.slot[2].flag[quantity]>
            - adjust def:edit_item flag:shop.sell_price:<context.inventory.slot[3].flag[sell_price]>
            - adjust def:edit_item flag:shop.price:<context.inventory.slot[4].flag[price]>
            - adjust def:edit_item flag:shop.stock:<context.inventory.slot[5].flag[stock]>
            - if <[item].has_flag[script_name]>:
                - adjust def:edit_item flag:script_name:<[item].flag[script_name]>
            - else if <[item].has_flag[material_name]>:
                - adjust def:edit_item flag:material_name:<[item].flag[material_name]>
            - wait 1t
            - inventory open d:NPC_Shop_Edit_Menu
            - inventory set o:<[edit_item]> slot:<player.flag[npc_edit.shop.slot]> destination:<player.open_inventory>
            - narrate "<green>Updating Menu..."
            - run NPC_Shop_Update
            - wait 1s
            - inventory open d:NPC_Shop_Edit_Menu
            - stop
        - if <[click_type]> == left:
            - choose <[slot]>:
                - case 2:
                    - define edit_book <item[NPC_Edit_Book]>
                    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Quantity
                    - adjust def:edit_book flag:type:quantity
                    - adjust def:edit_book book_pages:<empty>
                    - give <[edit_book]>
                    - inventory close
                - case 3:
                    - define edit_book <item[NPC_Edit_Book]>
                    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Sell<&sp>Price
                    - adjust def:edit_book flag:type:sell_price
                    - adjust def:edit_book book_pages:<empty>
                    - give <[edit_book]>
                    - inventory close
                - case 4:
                    - define edit_book <item[NPC_Edit_Book]>
                    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Price
                    - adjust def:edit_book flag:type:price
                    - adjust def:edit_book book_pages:<empty>
                    - give <[edit_book]>
                    - inventory close
                - case 5:
                    - define edit_book <item[NPC_Edit_Book]>
                    - adjust def:edit_book lore:<red>Editing<&co><&sp><gold>Stock
                    - adjust def:edit_book flag:type:stock
                    - adjust def:edit_book book_pages:<empty>
                    - give <[edit_book]>
                    - inventory close
        - if <[click_type]> == right:
            - choose <[slot]>:
                - case 3:
                    - if <player.flag[npc_edit.shop.item].flag[shop.sell_price.type]> == 1:
                        - flag <player.flag[npc_edit.shop.item]> shop.sell_price.type:2
                        - narrate "<green>Changed to Coin Type to Silver"
                    - else if <player.flag[npc_edit.shop.item].flag[shop.sell_price.type]> == 2:
                        - flag <player.flag[npc_edit.shop.item]> shop.sell_price.type:3
                        - narrate "<green>Changed to Coin Type to Gold"
                    - else if <player.flag[npc_edit.shop.item].flag[shop.sell_price.type]> == 3:
                        - flag <player.flag[npc_edit.shop.item]> shop.sell_price.type:4
                        - narrate "<green>Changed to Coin Type to Platinum"
                    - else if <player.flag[npc_edit.shop.item].flag[shop.sell_price.type]> == 4:
                        - flag <player.flag[npc_edit.shop.item]> shop.sell_price.type:1
                        - narrate "<green>Changed to Coin Type to Copper"
                    - inventory open d:NPC_Shop_Data_Menu
                - case 4:
                    - if <player.flag[npc_edit.shop.item].flag[shop.price.type]> == 1:
                        - flag <player.flag[npc_edit.shop.item]> shop.price.type:2
                        - narrate "<green>Changed to Coin Type to Silver"
                    - else if <player.flag[npc_edit.shop.item].flag[shop.price.type]> == 2:
                        - flag <player.flag[npc_edit.shop.item]> shop.price.type:3
                        - narrate "<green>Changed to Coin Type to Gold"
                    - else if <player.flag[npc_edit.shop.item].flag[shop.price.type]> == 3:
                        - flag <player.flag[npc_edit.shop.item]> shop.price.type:4
                        - narrate "<green>Changed to Coin Type to Platinum"
                    - else if <player.flag[npc_edit.shop.item].flag[shop.price.type]> == 4:
                        - flag <player.flag[npc_edit.shop.item]> shop.price.type:1
                        - narrate "<green>Changed to Coin Type to Copper"
                    - inventory open d:NPC_Shop_Data_Menu

NPC_Shop_Update:
    type: task
    script:
    - define inventory <player.open_inventory>
    - define npc_id <player.flag[npc_edit.id]>
    - define path <player.flag[npc_edit.path]>
    - definemap shop_contents:
        slot1:
            item: <[inventory].slot[13].if_null[<item[air]>]>
            price: <[inventory].slot[13].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[13].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[13].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[13].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[13].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[13].flag[script_name].if_null[null]>
        slot2:
            item: <[inventory].slot[14].if_null[<item[air]>]>
            price: <[inventory].slot[14].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[14].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[14].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[14].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[14].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[14].flag[script_name].if_null[null]>
        slot3:
            item: <[inventory].slot[15].if_null[<item[air]>]>
            price: <[inventory].slot[15].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[15].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[15].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[15].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[15].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[15].flag[script_name].if_null[null]>
        slot4:
            item: <[inventory].slot[16].if_null[<item[air]>]>
            price: <[inventory].slot[16].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[16].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[16].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[16].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[16].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[16].flag[script_name].if_null[null]>
        slot5:
            item: <[inventory].slot[17].if_null[<item[air]>]>
            price: <[inventory].slot[17].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[17].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[17].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[17].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[17].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[17].flag[script_name].if_null[null]>
        slot6:
            item: <[inventory].slot[22].if_null[<item[air]>]>
            price: <[inventory].slot[22].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[22].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[22].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[22].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[22].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[22].flag[script_name].if_null[null]>
        slot7:
            item: <[inventory].slot[23].if_null[<item[air]>]>
            price: <[inventory].slot[23].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[23].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[23].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[23].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[23].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[23].flag[script_name].if_null[null]>
        slot8:
            item: <[inventory].slot[24].if_null[<item[air]>]>
            price: <[inventory].slot[24].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[24].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[24].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[24].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[24].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[24].flag[script_name].if_null[null]>
        slot9:
            item: <[inventory].slot[25].if_null[<item[air]>]>
            price: <[inventory].slot[25].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[25].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[25].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[25].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[25].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[25].flag[script_name].if_null[null]>
        slot10:
            item: <[inventory].slot[26].if_null[<item[air]>]>
            price: <[inventory].slot[26].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[26].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[26].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[26].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[26].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[26].flag[script_name].if_null[null]>
        slot11:
            item: <[inventory].slot[31].if_null[<item[air]>]>
            price: <[inventory].slot[31].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[31].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[31].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[31].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[31].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[31].flag[script_name].if_null[null]>
        slot12:
            item: <[inventory].slot[32].if_null[<item[air]>]>
            price: <[inventory].slot[32].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[32].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[32].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[32].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[32].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[32].flag[script_name].if_null[null]>
        slot13:
            item: <[inventory].slot[33].if_null[<item[air]>]>
            price: <[inventory].slot[33].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[33].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[33].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[33].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[33].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[33].flag[script_name].if_null[null]>
        slot14:
            item: <[inventory].slot[34].if_null[<item[air]>]>
            price: <[inventory].slot[34].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[34].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[34].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[34].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[34].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[34].flag[script_name].if_null[null]>
        slot15:
            item: <[inventory].slot[35].if_null[<item[air]>]>
            price: <[inventory].slot[35].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[35].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[35].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[35].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[35].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[35].flag[script_name].if_null[null]>
        slot16:
            item: <[inventory].slot[40].if_null[<item[air]>]>
            price: <[inventory].slot[40].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[40].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[40].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[40].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[40].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[40].flag[script_name].if_null[null]>
        slot17:
            item: <[inventory].slot[41].if_null[<item[air]>]>
            price: <[inventory].slot[41].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[41].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[41].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[41].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[41].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[41].flag[script_name].if_null[null]>
        slot18:
            item: <[inventory].slot[42].if_null[<item[air]>]>
            price: <[inventory].slot[42].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[42].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[42].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[42].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[42].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[42].flag[script_name].if_null[null]>
        slot19:
            item: <[inventory].slot[43].if_null[<item[air]>]>
            price: <[inventory].slot[43].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[43].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[43].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[43].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[43].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[43].flag[script_name].if_null[null]>
        slot20:
            item: <[inventory].slot[44].if_null[<item[air]>]>
            price: <[inventory].slot[44].flag[shop.price].if_null[null]>
            sell_price: <[inventory].slot[44].flag[shop.sell_price].if_null[null]>
            quantity: <[inventory].slot[44].flag[shop.quantity].if_null[null]>
            stock: <[inventory].slot[44].flag[shop.stock].if_null[null]>
            shop_lore: <[inventory].slot[44].flag[shop_lore].if_null[null]>
            script_name: <[inventory].slot[44].flag[script_name].if_null[null]>
    - flag server npc_shop.<server.flag[npc.<[npc_id]>.<[path]>.shop.id]>.contents:<[shop_contents]>

NPC_Shop_Data_Menu:
    type: inventory
    inventory: chest
    title: <white>Item Data
    gui: true
    definitions:
        itempreview: <player.flag[npc_edit.shop.item].with_single[lore=<player.flag[npc_edit.shop.item].flag[shop_lore]>].if_null[<item[red_concrete].with_single[display=<red>ERROR]>]>
        #<player.flag[npc_edit.shop.item].with_single[lore=<player.flag[npc_edit.shop.item].flag[shop_lore]>].if_null[<item[red_concrete].with_single[display=<red>ERROR]>]>
        quantity: <item[paper].with_single[display=<yellow>Quantity].with_single[lore=<green>Left Click to Edit<n><gold>Current<&sp>Amount<&co><&sp><light_purple><player.flag[npc_edit.shop.item].flag[shop.quantity].if_null[1]>].with_single[flag=quantity:<player.flag[npc_edit.shop.item].flag[shop.quantity].if_null[1]>]>
        sellprice: <item[paper].with_single[display=<yellow>Sell Price].with_single[lore=<green>Left Click to Edit<n><gold>Current<&sp>Amount<&co><&sp><light_purple><player.flag[npc_edit.shop.item].flag[shop.sell_price.value].if_null[0]><&sp><item[currency<player.flag[npc_edit.shop.item].flag[shop.sell_price.type].if_null[1]>].display><n><red>Right Click to swap Coin Type].with_single[flag=sell_price:<map[value=<player.flag[npc_edit.shop.item].flag[shop.sell_price.value].if_null[0]>;type=<player.flag[npc_edit.shop.item].flag[shop.sell_price.type].if_null[1]>]>]>
        buyprice: <item[paper].with_single[display=<yellow>Buy Price].with_single[lore=<green>Left Click to Edit<n><gold>Current<&sp>Amount<&co><&sp><light_purple><player.flag[npc_edit.shop.item].flag[shop.price.value].if_null[0]><&sp><item[currency<player.flag[npc_edit.shop.item].flag[shop.price.type].if_null[1]>].display><n><red>Right Click to swap Coin Type].with_single[flag=price:<map[value=<player.flag[npc_edit.shop.item].flag[shop.price.value].if_null[0]>;type=<player.flag[npc_edit.shop.item].flag[shop.price.type].if_null[1]>]>]>
        stock: <item[paper].with_single[display=<yellow>Stock].with_single[lore=<green>Left Click to Edit<n><gold>Current<&sp>Amount<&co><&sp><light_purple><player.flag[npc_edit.shop.item].flag[shop.stock].if_null[-1]><n><red>If set to -1, stock is infinite].with_single[flag=stock:<player.flag[npc_edit.shop.item].flag[shop.stock].if_null[-1]>]>
    slots:
    - [itempreview] [quantity] [sellprice] [buyprice] [stock] [GuiNull] [GuiNull] [GuiNull] [GUIReturn]
    - [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull]

NPC_Shop_Edit_Menu:
    type: inventory
    inventory: chest
    gui: false
    definitions:
      GUIBLOCK: <item[red_concrete].with_single[display=<yellow>Currency Slot].with_single[flag=type:blocked]>
      GUIFinish: <item[green_concrete].with_single[display=<yellow>Finish].with_single[lore=<green>Left Click to Finish].with_single[flag=type:finish]>
    procedural items:
    - define result <list>
    - define shop_data <server.flag[npc_shop.<server.flag[npc.<player.flag[npc_edit.id]>.<player.flag[npc_edit.path]>.shop.id]>.contents]>
    - foreach <[shop_data]> as:data key:slotname:
        - if <[data].get[item].material.name> == air:
            - foreach next
        - define item <[data].get[item]>
        - define quantity_text <aqua>Quantity<White><&co><&sp><[data].get[quantity].if_null[1]>
        - if <[data].deep_get[price.value]> == 0:
            - define price <red>Unpurchasable
        - else:
            - define price <item[currency<[data].deep_get[price.type]>].display.before[<item[currency<[data].deep_get[price.type]>].display.strip_color>]><[data].deep_get[price.value]><&sp><item[currency<[data].deep_get[price.type]>].display.strip_color>
        - define price_text <red>Buy<&sp>Price<White><&co><&sp><[price]>
        - if <[data].deep_get[sell_price.value]> == 0:
            - define sell_price <red>Unsellable
        - else:
            - define sell_price <item[currency<[data].deep_get[sell_price.type]>].display.before[<item[currency<[data].deep_get[sell_price.type]>].display.strip_color>].if_null[<red>N/A]><[data].deep_get[sell_price.value].if_null[<empty>]><&sp><item[currency<[data].deep_get[sell_price.type]>].display.strip_color.if_null[<empty>]>
        - define sell_text <blue>Sell<&sp>Price<White><&co><&sp><[sell_price]>
        - if <[data].get[stock]> == -1:
            - define stock_amount <red>Infinite
        - else:
            - define stock_amount:<[data].get[stock]>
        - define stock_text <gold>Available<&sp>Stock<White><&co><&sp><[stock_amount]>
        - adjust def:item "lore:<[data].get[shop_lore].if_null[<&sp>]><n><yellow><&sp.repeat[40].strikethrough><n><[quantity_text]><n><[price_text]><n><[sell_text]><n><[stock_text]><n><red>Right Click to open Edit Menu"
        - define result:->:<[item]>
    - determine <[result]>
    slots:
    - [GuiNull] [GuiNull] [GuiNull] [GuiL] [GuiNull] [GuiNull] [GuiNull] [GuiR] [GUIFinish]
    - [GuiNull] [GUIBLOCK] [GuiNull] [] [] [] [] [] [GuiNull]
    - [GuiNull] [GUIBLOCK] [GuiNull] [] [] [] [] [] [GuiNull]
    - [GuiNull] [GUIBLOCK] [GuiNull] [] [] [] [] [] [GuiNull]
    - [GuiNull] [GUIBLOCK] [GuiNull] [] [] [] [] [] [GuiNull]
    - [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull]

NPC_Shop_GUI:
    type: inventory
    debug: false
    inventory: chest
    title: <green>Shop
    gui: true
    procedural items:
    - define result <list>
    - define shop_data <server.flag[npc_shop.<player.flag[shop_id]>.contents]>
    - foreach <[shop_data]> as:data key:slotname:
        - if <[data].get[item].material.name> == air:
            - foreach next
        - define item <[data].get[item]>
        - if <[data].get[script_name].if_null[null]> != null:
            - adjust def:item flag:script_name:<[data].get[script_name]>
        - else:
            - adjust def:item flag:material_name:<[data].get[item].material.name>
        - define quantity_text <aqua>Quantity<White><&co><&sp><[data].get[quantity].if_null[1]>
        - if <[data].deep_get[price.value]> == 0:
            - define price <red>Unpurchasable
        - else:
            - define price <item[currency<[data].deep_get[price.type]>].display.before[<item[currency<[data].deep_get[price.type]>].display.strip_color>]><[data].deep_get[price.value]><&sp><item[currency<[data].deep_get[price.type]>].display.strip_color>
        - define price_text <red>Buy<&sp>Price<White><&co><&sp><[price]>
        - if <[data].deep_get[sell_price.value]> == 0:
            - define sell_price <red>Unsellable
        - else:
            - define sell_price <item[currency<[data].deep_get[sell_price.type]>].display.before[<item[currency<[data].deep_get[sell_price.type]>].display.strip_color>].if_null[<red>N/A]><[data].deep_get[sell_price.value].if_null[<empty>]><&sp><item[currency<[data].deep_get[sell_price.type]>].display.strip_color.if_null[<empty>]>
        - define sell_text <blue>Sell<&sp>Price<White><&co><&sp><[sell_price]>
        - if <[data].get[stock]> == -1:
            - define stock_amount <red>Infinite
        - else:
            - define stock_amount:<[data].get[stock]>
        - define stock_text <gold>Available<&sp>Stock<White><&co><&sp><[stock_amount]>
        - adjust def:item "lore:<[data].get[shop_lore].if_null[<&sp>]><n><yellow><&sp.repeat[40].strikethrough><n><[quantity_text]><n><[price_text]><n><[sell_text]><n><[stock_text]><n><gold>Left Click to Purchase<n><red>Right Click to Sell"
        - define result:->:<[item]>



    - determine <[result]>
    slots:
    - [GuiNull] [GuiNull] [GuiNull] [GuiL] [GuiNull] [GuiNull] [GuiNull] [GuiR] [GuiNull]
    - [GuiNull] [currency1] [GuiNull] [] [] [] [] [] [GuiNull]
    - [GuiNull] [currency2] [GuiNull] [] [] [] [] [] [GuiNull]
    - [GuiNull] [currency3] [GuiNull] [] [] [] [] [] [GuiNull]
    - [GuiNull] [currency4] [GuiNull] [] [] [] [] [] [GuiNull]
    - [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull]

NPC_Shop_Event:
    type: world
    debug: false
    events:
        on player clicks item in NPC_Shop_GUI:
        - define item <context.item>
        - define click_type <context.click>
        - if <context.slot> !in <list[13|14|15|16|17|22|23|24|25|26|31|32|33|34|35|40|41|42|43|44]>:
            - determine cancelled
        - define item_price <[item].flag[shop.price]>
        - define sell_price <[item].flag[shop.sell_price]||null>
        - define quantity <[item].flag[shop.quantity]>
        - choose <[item_price].get[type]>:
            - case 1:
                - define currency_slot 11
            - case 2:
                - define currency_slot 20
            - case 3:
                - define currency_slot 29
            - case 4:
                - define currency_slot 38
        - if <[click_type]> == left:
            - if <[item_price].get[value]> == 0:
                - narrate "<red>This item is not purchasable!"
                - stop
            - if <player.open_inventory.slot[<[currency_slot]>].flag[stored]> >= <[item_price].get[value]>:
                - inventory adjust slot:<[currency_slot]> destination:<player.open_inventory> flag:stored:<player.open_inventory.slot[<[currency_slot]>].flag[stored].sub[<[item_price].get[value]>]>
                - inventory adjust slot:<[currency_slot]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[<player.open_inventory.slot[<[currency_slot]>].script.name>].display.before[<item[<player.open_inventory.slot[<[currency_slot]>].script.name>].display.strip_color>]><player.open_inventory.slot[<[currency_slot]>].flag[stored]><white>/<light_purple>300
                - playsound sound:BLOCK.CHAIN.STEP <player> sound_category:players volume:0.7
                - adjust def:item flag:shop:!
                - adjust def:item lore:<[item].flag[shop_lore]>
                - adjust def:item flag:Shop_lore:!

                - if <[item].has_flag[script_name]>:
                    - define sold_item <item[<[item].flag[script_name]>]>
                    - give item:<proc[apply_info_proc].context[<[sold_item]>]> quantity:<[quantity]>
                - else:
                    - give item:<item[<[item].flag[material_name]>]> quantity:<[quantity]>
            - else:
                - narrate "<red>You don't have enough of this currency!"
        - else if <[click_type]> == right:
            - if <[sell_price].get[value]> == 0:
                - narrate "<red>You cannot sell this item!"
                - stop
            - if <[item].has_flag[script_name]>:
                - if <player.inventory.contains_item[<[item].flag[script_name]>].quantity[<[quantity]>]>:
                    - inventory adjust slot:<[currency_slot]> destination:<player.open_inventory> flag:stored:<player.open_inventory.slot[<[currency_slot]>].flag[stored].add[<[sell_price].get[value]>]>
                    - inventory adjust slot:<[currency_slot]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[<player.open_inventory.slot[<[currency_slot]>].script.name>].display.before[<item[<player.open_inventory.slot[<[currency_slot]>].script.name>].display.strip_color>]><player.open_inventory.slot[<[currency_slot]>].flag[stored]><white>/<light_purple>300
                    - playsound sound:BLOCK.CHAIN.STEP <player> sound_category:players volume:0.7

                    - take item:<[item].flag[script_name]> quantity:<[quantity]>

                - else:
                    - narrate "<red>You are missing this item!"
            - else:
                - if <player.inventory.contains_item[<[item].flag[material_name]>].quantity[<[quantity]>]>:
                    - inventory adjust slot:<[currency_slot]> destination:<player.open_inventory> flag:stored:<player.open_inventory.slot[<[currency_slot]>].flag[stored].add[<[sell_price].get[value]>]>
                    - inventory adjust slot:<[currency_slot]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[<player.open_inventory.slot[<[currency_slot]>].script.name>].display.before[<item[<player.open_inventory.slot[<[currency_slot]>].script.name>].display.strip_color>]><player.open_inventory.slot[<[currency_slot]>].flag[stored]><white>/<light_purple>300
                    - playsound sound:BLOCK.CHAIN.STEP <player> sound_category:players volume:0.7

                    - take item:<[item].flag[material_name]> quantity:<[quantity]>
                - else:
                    - narrate "<red>You are missing this item!"

        after player opens NPC_Shop_GUI:
        - define slot1 11
        - define slot2 20
        - define slot3 29
        - define slot4 38

        - define purse_slot <player.inventory.find_all_items[coinpurse].first.if_null[null]>
        - inventory adjust slot:11 destination:<player.open_inventory> flag:purse_slot:<[purse_slot]>
        - definemap currencies:
            currency1: <player.inventory.slot[<[purse_slot]>].flag[currency1]>
            currency2: <player.inventory.slot[<[purse_slot]>].flag[currency2]>
            currency3: <player.inventory.slot[<[purse_slot]>].flag[currency3]>
            currency4: <player.inventory.slot[<[purse_slot]>].flag[currency4]>

        - inventory adjust slot:<[slot1]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[currency1].display.before[<item[currency1].display.strip_color>]><[currencies].get[currency1]><white>/<light_purple>300
        - inventory adjust slot:<[slot1]> destination:<player.open_inventory> flag:stored:<[currencies].get[currency1]>
        - inventory adjust slot:<[slot2]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[currency2].display.before[<item[currency2].display.strip_color>]><[currencies].get[currency2]><white>/<light_purple>300
        - inventory adjust slot:<[slot2]> destination:<player.open_inventory> flag:stored:<[currencies].get[currency2]>
        - inventory adjust slot:<[slot3]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[currency3].display.before[<item[currency3].display.strip_color>]><[currencies].get[currency3]><white>/<light_purple>300
        - inventory adjust slot:<[slot3]> destination:<player.open_inventory> flag:stored:<[currencies].get[currency3]>
        - inventory adjust slot:<[slot4]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[currency4].display.before[<item[currency4].display.strip_color>]><[currencies].get[currency4]><white>/<light_purple>300
        - inventory adjust slot:<[slot4]> destination:<player.open_inventory> flag:stored:<[currencies].get[currency4]>
        on player closes NPC_Shop_GUI:
        - definemap currencies:
            currency1: <context.inventory.slot[11].flag[stored]>
            currency2: <context.inventory.slot[20].flag[stored]>
            currency3: <context.inventory.slot[29].flag[stored]>
            currency4: <context.inventory.slot[38].flag[stored]>
        - define purse_slot <context.inventory.slot[11].flag[purse_slot]>
        - run CoinPurse_Update_Task defmap:<[currencies]> def.slot:<[purse_slot]>

NPC_Shop_PriceDisplay_Proc:
    type: procedure
    debug: false
    definitions: item
    script:
    - define entry_data <[item].flag[entry_data]>

    - define price <[entry_data].get[value]>

    - if <[entry_data].get[markup]||null> != null:
        - define sell_price <[item].flag[sell_price].before[$]>
        - define sell_check <white><&lt><gold>Right<&sp>Click<white><&gt><&sp>to<&sp>sell<&sp><gold>1<n>
        - define sell_text  <n><red>Sell<&sp>Price<&co><&sp><item[currency<[price].after[$]>].display.before[<item[currency<[price].after[$]>].display.strip_color>]><[sell_price]><&sp><item[currency<[price].after[$]>].display.strip_color>


    - define buttons <white><&lt><blue>Left<&sp>Click<white><&gt><&sp>to<&sp>purchase<&sp><gold>1<n><[sell_check].if_null[]><white><&lt><light_purple>Middle<&sp>Click<white><&gt><&sp><white>to<&sp>toggle<&sp><white><&lb><green>Description<white><&rb>
    - define break <n><&sp.repeat[40].strikethrough>


    - define buy_text <aqua>Price<&co><&sp><item[currency<[price].after[$]>].display.before[<item[currency<[price].after[$]>].display.strip_color>]><[price].before[$]><&sp><item[currency<[price].after[$]>].display.strip_color>
    - define price_info <n><[buy_text]><[sell_text].if_null[ ]>

    - define lore <[buttons]><[break]><[price_info]>

    - determine <[lore]>