# This file includes the mechanics of a locking and lockpicking system which allows players to protect their chests or doors inplace of simply preventing chest access in claimed chunks.
# Players will be able to lock a chest to prevent access aside from using a matching key.
# Other players will be able to lockpick this chest to bypass the lock via a minigame.

# First Created: 10/11/2024
Lock_Event_Main:
    type: world
    events:
        on player right clicks chest location_flagged:locked:
        - if <context.item.script.name||air> == lock_key && <context.item.flag[key_id]> == <context.location.flag[locked.id]>:
          - stop
        - if <context.item.script.name||air> != lockpick:
          - if <context.location.flag[locked.state]> == locked:
            - if <player.is_sneaking>:
              - determine passively cancelled
              - playsound sound:block_chest_locked <player.location> sound_category:blocks
              - narrate "<gold>Chest Id<&co><&sp><white><context.location.flag[locked.id]>"
            - determine passively cancelled
            - playsound sound:block_chest_locked <player.location> sound_category:blocks
        - else:
          - if <context.location.flag[locked.state]> == locked:
            - determine passively cancelled
            - flag player lockpicking_target:<context.location>
            - inventory open d:Lock_Picking_GUI
        on player right clicks chest:
        - define location <context.location>
        - if <context.item.script.name||air> == basic_lock:
          - if !<[location].has_flag[locked]> && <player.item_in_offhand.script.name||air> != lock_key:
            - run Lock_New def.lock:basic def.location:<[location]>
            - take item:basic_lock quantity:1
          - else if <player.item_in_offhand.script.name||air> == lock_key:
            - define id <player.item_in_offhand.flag[key_id]>
            - run Lock_Existing def.lock:basic def.id:<[id]> def.location:<[location]>
            - take item:basic_lock quantity:1
        - if <context.item.script.name||air> == advanced_lock:
          - if !<[location].has_flag[locked]> && <player.item_in_offhand.script.name||air> != lock_key:
            - run Lock_New def.lock:advanced def.location:<[location]>
            - take item:advanced_lock quantity:1
          - else if <player.item_in_offhand.script.name||air> == lock_key:
            - define id <player.item_in_offhand.flag[key_id]>
            - run Lock_Existing def.lock:advanced def.id:<[id]> def.location:<[location]>
            - take item:advanced_lock quantity:1
        - if <context.item.script.name||air> == blessed_lock:
          - if !<[location].has_flag[locked]> && <player.item_in_offhand.script.name||air> != lock_key:
            - run Lock_New def.lock:blessed def.location:<[location]>
            - take item:blessed_lock quantity:1
          - else if <player.item_in_offhand.script.name||air> == lock_key:
            - define id <player.item_in_offhand.flag[key_id]>
            - run Lock_Existing def.lock:blessed def.id:<[id]> def.location:<[location]>
            - take item:blessed_lock quantity:1
        on player breaks block location_flagged:locked:
        - define lock_data <context.location.flag[locked]>
        - if <player.item_in_hand.script.name> == lock_key && <player.item_in_hand.flag[key_id]> == <[lock_data].get[id]>:
          - drop item:<[lock_data].get[type]>_lock <context.location.center>
          - if <[lock_data].get[display].if_null[null]> != null:
            - remove <context.location.flag[locked].get[display]>
          - if <context.location.other_block||null> != null:
            - flag <context.location.other_block> locked:!
            - if <context.location.other_block.flag[locked].get[display].if_null[null]> != null:
              - remove <context.location.flag[locked].get[display]>
          - flag <context.location> locked:!
        - else if <[lock_data].get[state]> == broken:
          - flag <context.location> locked:!
          - if <[lock_data].get[display].if_null[null]> != null:
            - remove <context.location.flag[locked].get[display]>
          - if <context.location.other_block||null> != null:
            - flag <context.location.other_block> locked:!
            - if <context.location.other_block.flag[locked].get[display].if_null[null]> != null:
              - remove <context.location.flag[locked].get[display]>
          - flag server unlocked_blocks_broken:->:<context.location>
        - else:
          - determine cancelled
        on player places chest:
        - if <context.location.find_blocks_flagged[locked].within[1]>:
          - determine cancelled

Keyring_Event:
    type: world
    events:
        on player right clicks block with:Key_Ring:
        - if <context.hand> == hand:
          - determine passively cancelled
          - inventory open d:Keyring_Inv
        on player closes Keyring_Inv:
        - define inventory <context.inventory>
        - inventory adjust slot:hand flag:stored_keys:<[inventory].list_contents>
        on player clicks item in Keyring_Inv:
        - if !<context.item.has_flag[key_id]> && <context.item.material.name> != air:
          - determine cancelled
        on player swaps items offhand:Key_Ring:
        - determine passively cancelled
        - define stored_list <player.item_in_hand.flag[stored_keys]||<empty>>
        - if <player.item_in_offhand.material.name> == copper_ingot:
          - if <[stored_list].get[1].has_flag[copy]>:
            - narrate "<red>This key has already been copied."
            - stop
          - define key <item[lock_key].with_flag[key_id]>
          - adjust def:key flag:key_id:<[stored_list].get[1].flag[key_id]>
          - adjust def:key lore:<yellow>Key<&sp>Id<&co><&sp><white><bold><[stored_list].get[1].flag[key_id]>
          - adjust def:key lore:<[key].lore><n><gray><italic>Copy
          - adjust def:key flag:copy
          - give item:<[key]>
          - take item:copper_ingot quantity:1
          - stop
        - if <[stored_list].is_empty>:
          - stop
        - else:
          - define key <[stored_list].get[1]>
          - give item:<[key]>
          - define new_list <[stored_list].remove[1]>
          - inventory adjust flag:stored_keys:<[new_list]> slot:hand
        #- define key <[stored_list].get>

Lock_Facer_Proc:
  type: procedure
  definitions: direction
  script:
  - if <[direction]> == north:
    - determine 180
  - else if <[direction]> == east:
    - determine 270
  - else if <[direction]> == south:
    - determine 0
  - else if <[direction]> == west:
    - determine 90

Lock_New:
    type: task
    definitions: lock|location
    script:
    - define id <server.flag[total_lock_id].add[1]>
    - flag server total_lock_id:<[id]>
    - definemap lock_data:
        type: <[lock]>
        id: <[id]>
        state: locked
        combo: <proc[Lock_Combo_Scramble].context[<[lock]>]>
    - foreach <[lock_data].keys> as:key:
      - flag <[location]> locked.<[key]>:<[lock_data].get[<[key]>]>
    #- flag <[location]> locked.type:<[lock]>
    #- flag <[location]> locked.id:<[id]>
    #- if <[location].custom_name||null> == null || <[location].custom_name.to_list.last> == 八:
    #  - adjust <[location]> custom_name:Chest<&sp.repeat[19]><white>入
    #  - define yep

    - spawn item_display[item=<[lock]>_lock] <[location].center.with_yaw[<proc[lock_facer_proc].context[<[location].material.direction>]>].forward[0.5]> save:lock_display
    - flag <[location]> locked.display:<entry[lock_display].spawned_entity>
    - if <[location].other_block||null> != null:
      - define location <[location].other_block>
      #- if <[yep]>:
      #  - adjust <[location]> custom_name:Chest<&sp.repeat[19]><white>入
      - foreach <[lock_data].keys> as:key:
        - flag <[location]> locked.<[key]>:<[lock_data].get[<[key]>]>
    - define key <item[lock_key].with_flag[key_id]>
    - adjust def:key flag:key_id:<[id]>
    - adjust def:key lore:<yellow>Key<&sp>Id<&co><&sp><white><bold><[id]>
    - give item:<[key]>

Lock_Existing:
    type: task
    definitions: lock|location|id
    script:
    - definemap lock_data:
        type: <[lock]>
        id: <[id]>
        state: locked
        combo: <proc[Lock_Combo_Scramble].context[<[lock]>]>
    - foreach <[lock_data].keys> as:key:
      - flag <[location]> locked.<[key]>:<[lock_data].get[<[key]>]>
    #- if <[location].custom_name||null> == null || <[location].custom_name.to_list.last> == 八:
    #  - adjust <[location]> custom_name:Chest<&sp.repeat[19]><white>入
    #  - define yep

    - spawn item_display[item=<[lock]>_lock] <[location].center.with_yaw[<proc[lock_facer_proc].context[<[location].material.direction>]>].forward[0.5]> save:lock_display
    - flag <[location]> locked.display:<entry[lock_display].spawned_entity>

    - if <[location].other_block||null> != null:
      - define location <[location].other_block>
      #- if <[yep]>:
      #  - adjust <[location]> custom_name:Chest<&sp.repeat[19]><white>入
      - foreach <[lock_data].keys> as:key:
        - flag <[location]> locked.<[key]>:<[lock_data].get[<[key]>]>

Lock_Combo_Scramble:
    type: procedure
    definitions: lock
    script:
    - choose <[lock]>:
      - case basic:
        - define pin_amount 3
      - case advanced:
        - define pin_amount 5
      - case blessed:
        - define pin_amount <util.random.int[5].to[7]>
    - define combo_list <util.list_numbers_to[<[pin_amount]>]>
    - determine <[combo_list].random[<[pin_amount]>]>


Lock_Picking_Event:
    type: world
    events:
        after player opens Lock_Picking_GUI:
        - foreach <player.flag[lockpicking_target].flag[locked].keys> as:key:
          - inventory adjust slot:36 flag:<[key]>:<player.flag[lockpicking_target].flag[locked].get[<[key]>]> destination:<player.open_inventory>
        - inventory adjust slot:36 flag:current_combo:<empty> destination:<player.open_inventory>
        - inventory adjust slot:32 flag:uses:3 destination:<player.open_inventory>
        on player closes Lock_Picking_GUI:
        - adjust <player> item_on_cursor:air
        - flag player lockpicking_target:!
        - if <context.inventory.slot[32].flag[uses]> < 3:
          - take slot:hand quantity:1
          - playsound sound:entity_item_break <player.location> sound_category:players
        on player clicks item in Lock_Picking_GUI:
        #- narrate <context.clicked_inventory>
        - if <context.clicked_inventory.script.name||null> != Lock_Picking_GUI:
          - determine cancelled
        - if <context.item.script.name||null> == lockpick:
          - define uses <player.open_inventory.slot[32].quantity>
          #- define lockpick_item <item[lockpick_gui].with[quantity=3]>
          - adjust <player> item_on_cursor:<item[lockpick_gui]>
        - if <context.cursor_item.script.name||null> == lockpick_gui:
          - if <context.item.script.name> !in <list[lock_pin|lock_securitypin]>:
            - adjust <player> item_on_cursor:air
          - else:
            - define combo <context.inventory.slot[36].flag[combo]>
            - define selected_pin <context.item.flag[pin_number]>
            - define current_position:<context.inventory.slot[36].flag[current_position]>
            - define current_position:+:1
            - choose <[current_position]>:
              - case 1:
                - if <[selected_pin]> == <[combo].get[1]>:
                  - define success:true
              - case 2:
                - if <[selected_pin]> == <[combo].get[2]>:
                  - define success:true
              - case 3:
                - if <[selected_pin]> == <[combo].get[3]>:
                  - define success:true
              - case 4:
                - if <[selected_pin]> == <[combo].get[4]>:
                  - define success:true
              - case 5:
                - if <[selected_pin]> == <[combo].get[5]>:
                  - define success:true
              - case 6:
                - if <[selected_pin]> == <[combo].get[6]>:
                  - define success:true
              - case 7:
                - if <[selected_pin]> == <[combo].get[7]>:
                  - define success:true
            - if <[success]||null> != null:
              - if <context.item.script.name> == lock_securitypin && <context.item.flag[security]> == enabled && <[current_position]> != <[combo].size>:
                - if <util.random_chance[70]>:
                  - run Lock_Picking_Reset
                  - stop
                - else:
                  - inventory adjust slot:<context.raw_slot> flag:security:disabled destination:<player.open_inventory>
              - define current_combo:<context.inventory.slot[36].flag[current_combo]>
              - define current_combo:->:<[selected_pin]>
              - inventory adjust slot:36 flag:current_combo:<[current_combo]> destination:<player.open_inventory>
              - inventory adjust slot:36 flag:current_position:<[current_position]> destination:<player.open_inventory>
              - inventory adjust slot:<context.raw_slot> flag:state:up destination:<player.open_inventory>
              - inventory adjust slot:<context.raw_slot> components_patch:[minecraft:item_model=string:lockpicking:lock_pin_up] destination:<player.open_inventory>
              - playsound sound:BLOCK_CHAIN_STEP <player.flag[lockpicking_target]> sound_category:players
              - if <[current_combo]> == <[combo]>:
                - narrate success
                - run Lock_Picking_Success
            - else:
              - run Lock_Picking_Reset


Lock_Picking_Reset:
    type: task
    script:
    - define pin_list <list[11|12|13|14|15|16|17]>
    - foreach <[pin_list]> as:pin_slot:
      - if <player.open_inventory.slot[<[pin_slot]>].material.name> == air:
        - foreach next
      - else:
        - inventory adjust slot:<[pin_slot]> flag:state:down destination:<player.open_inventory>
        - inventory adjust slot:<[pin_slot]> components_patch:[minecraft:item_model=string:lockpicking:lock_pin_down] destination:<player.open_inventory>
    - inventory adjust slot:36 flag:current_combo:<empty> destination:<player.open_inventory>
    - inventory adjust slot:36 flag:current_position:<empty> destination:<player.open_inventory>
    - adjust <player> item_on_cursor:air
    - define uses <player.open_inventory.slot[32].flag[uses]>
    - define new_uses <[uses].sub[1]>
    - if <[new_uses]> <= 0:
      - playsound sound:entity_item_break <player.flag[lockpicking_target]> sound_category:players
      - inventory set o:air slot:32 destination:<player.open_inventory>
      - take slot:hand quantity:1
      - wait 5t
      - if <player.item_in_hand.script.name> == lockpick:
        - inventory set o:lockpick slot:32 destination:<player.open_inventory>
        - inventory adjust slot:32 destination:<player.open_inventory> flag:uses:3
        - inventory adjust slot:32 destination:<player.open_inventory> quantity:3
      - else:
        - inventory close
    - else:
      - inventory adjust slot:32 destination:<player.open_inventory> flag:uses:<[new_uses]>
      - inventory adjust slot:32 destination:<player.open_inventory> quantity:<[new_uses]>
    - playsound sound:block_chain_break <player.flag[lockpicking_target]> sound_category:players

Lock_Picking_Success:
    type: task
    script:
    - flag <player.flag[lockpicking_target]> locked.state:broken
    - flag <player.flag[lockpicking_target]> locked.picked_by:->:<player.nameplate><&sp><util.time_now>
    - if <player.flag[lockpicking_target].flag[locked].get[display].if_null[null]> == null:
      - remove <player.flag[lockpicking_target].other_block.flag[locked].get[display]>
      - flag <player.flag[lockpicking_target].other_block> locked.display:!
    - else:
      - remove <player.flag[lockpicking_target].flag[locked].get[display]>
      - flag <player.flag[lockpicking_target]> locked.display:!
    - if <player.flag[lockpicking_target].other_block||null> != null:
      - define location <player.flag[lockpicking_target].other_block>
      - adjust <[location]> custom_name:Chest<&sp.repeat[19]><white>八
      - flag <[location]> locked.state:broken
      - flag <[location]> locked.picked_by:->:<player.nameplate><&sp><util.time_now>
    - playsound sound:block_comparator_click <player.flag[lockpicking_target]> sound_category:players
    - adjust <player.flag[lockpicking_target]> custom_name:Chest<&sp.repeat[19]><white>八
    - inventory close


Lock_Picking_GUI:
    type: inventory
    inventory: chest
    title: <white>七七七七七七七七ㇺ
    gui: true
    procedural items:
    - define result <list>
    - define lock_map <player.flag[lockpicking_target].flag[locked]>
    - choose <[lock_map].get[type]>:
      - case basic:
        - define pin_amount 3
      - case advanced:
        - define pin_amount 5
        - define security_pins 1
      - case blessed:
        - define pin_amount <[lock_map].get[combo].size>
        - define security_pins 2
        - define blanked:flame
    - define pin_number:0
    - repeat <[pin_amount]>:
      - define pin_number:+:1
      - define pin_item <item[lock_pin]>
      - adjust def:pin_item flag:pin_number:<[pin_number]>
      - define pin_list:->:<[pin_item]>
    - if <[security_pins]||null> != null:
      - define security_pin_list:<[pin_list].random[<[security_pins]>]>
      - foreach <[security_pin_list]> as:selected_pin:
        - define pin_number <[selected_pin].flag[pin_number]>
        - define edited_pin <item[lock_securitypin]>
        - adjust def:edited_pin flag:pin_number:<[pin_number]>
        - define pin_list:<[pin_list].set[<[edited_pin]>].at[<[pin_number]>]>
    - determine <[pin_list]>
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [] [] [] [] [] [] [] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [air] [air] [air] [Lockpick[quantity=3;lore=<red>Select this to begin picking the lock]] [air] [air] [air] [barrier[display=<gray>]]

Lock_Cleanup:
  type: command
  name: lock_cleanup
  description: Cleans up locked blocks from where the player is looking
  usage: /lock_cleanup
  script:
  - define location <player.cursor_on>
  - if !<[location].has_flag[locked]>:
    - narrate "<light_purple>The block you are looking at is not locked."
    - stop
  - flag <[location]> locked:!
  - define locks:+:1
  - if <[location].other_block||null> != null:
    - flag <[location].other_block> locked:!
    - define locks:+:1
  - narrate "<light_purple>Cleaned up <[locks]> locked blocks!"


Keyring_Inv:
    type: inventory
    inventory: chest
    title: <white>Key Ring
    procedural items:
    - define result <list>
    - foreach <player.item_in_hand.flag[stored_keys]> as:key:
      - define result:->:<[key]>
    - determine <[result]>
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

Basic_Lock:
    type: item
    material: brick
    display name: <white>Basic Lock
    mechanisms:
      components_patch:
        item_model: string:lockpicking:alock
    lore:
    - <red>Right click a chest to lock it.
    - <gold>Hold a key in the offhand to sync the new lock id.

Advanced_Lock:
    type: item
    material: brick
    display name: <white>Advanced Lock
    mechanisms:
      components_patch:
        item_model: string:lockpicking:hlock
    lore:
    - <red>Right click a chest to lock it.
    - <gold>Hold a key in the offhand to sync the new lock id.

Blessed_Lock:
    type: item
    material: brick
    display name: <white>Blessed Lock
    mechanisms:
      components_patch:
        item_model: string:lockpicking:dlock
    lore:
    - <red>Right click a chest to lock it.
    - <gold>Hold a key in the offhand to sync the new lock id.

Lock_Key:
    type: item
    material: brick
    display name: <gold>Key
    mechanisms:
      components_patch:
        item_model: string:lockpicking:akey

Key_Ring:
    type: item
    material: skull_banner_pattern
    display name: <aqua>Key Ring
    mechanisms:
      custom_model_data: 30003
      hides: enchants|item_data
    flags:
      stored_keys: <empty>

Lockpick:
    type: item
    material: brick
    display name: <dark_gray>Lock Pick
    mechanisms:
      components_patch:
        item_model: string:lockpicking:lockpick
    lore:
    - <red>Right click a locked chest to attempt to pick the lock.

Lockpick_GUI:
    type: item
    material: skull_banner_pattern
    display name: <dark_gray>Lock Pick
    mechanisms:
      components_patch:
        item_model: string:lockpicking:lockpick_gui
      hides: enchants|item_data


Lock_Pin:
    type: item
    material: skull_banner_pattern
    display name: <gray>
    mechanisms:
      components_patch:
        item_model: string:lockpicking:lock_pin_down
      hides: enchants|item_data
    flags:
      state: down

Lock_SecurityPin:
    type: item
    material: skull_banner_pattern
    display name: <gray>
    mechanisms:
      components_patch:
        item_model: string:lockpicking:lock_pin_down
      hides: enchants|item_data
    flags:
      state: down
      security: enabled