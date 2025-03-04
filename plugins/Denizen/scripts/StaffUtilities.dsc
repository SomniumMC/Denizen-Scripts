players:
    type: command
    description: players
    name: players
    usage: /players
    aliases:
    - player
    tab completions:
      1: <util.notes[locations].replace_text[l<&at>].with[]>
    script:
    - foreach <server.players> as:player:
        - narrate <[player].name>
staff_warp:
    type: command
    description: Use this to warp between staff builds or waypoints.
    name: staffwarp
    usage: /staffwarp <&lt>Warp_Name<&gt>
    aliases:
    - sw
    tab completions:
      1: <util.notes[locations].replace_text[l<&at>].with[]>
    script:
    - teleport <player> <context.raw_args>
create_staff_warp:
    type: command
    description: Use this create new warps to staff builds or waypoints.
    name: createstaffwarp
    usage: /createstaffwarp <&lt>Warp_Name<&gt>
    aliases:
    - cresw
    tab completions:
      default: <empty>
    script:
    - note <player.location> as:<context.raw_args>
delete_staff_warp:
    type: command
    description: Use this remove waypoints or warps.
    name: deletestaffwarp
    usage: /deletestaffwarp <&lt>Warp_Name<&gt>
    aliases:
    - delsw
    tab completions:
      1: <util.notes[locations].replace_text[l<&at>].with[]>
    script:
    - note remove as:<context.raw_args>

# Staff Give - Gives items with info applied

Staff_Give_Command:
    type: command
    description: This gives the item to the Staff with all info applied
    name: staffgive
    usage: /staffgive <&lt>Item<&gt> <&lt>Player<&gt>
    aliases:
    - sgive
    script:
    - if <context.args.is_empty>:
      - narrate "<red>Empty Command"
    - define item <context.args.get[1]>
    - if <item[<[item]>]||null> == null:
      - narrate "<red>Invalid Item"
    - else:
      - give <proc[Apply_Info_Proc].context[<item[<[item]>]>]>

Staff_Model_Command:
    type: command
    description: This spawns an item or block with a custom model
    name: staffmodel
    usage: /staffmodel <&lt>NAMESPACE:MODELPATH<&gt>
    aliases:
    - smodel
    tab completions:
      1: NAMESPACE:MODELPATH
    script:
    - if <context.args.is_empty>:
      - narrate "<red>Empty Command"
      - stop
    - if <context.args.get[1]||null> == null:
      - narrate "<red>Missing Namespace"
      - stop
    - define item <item[brick]>
    - adjust def:item components_patch:[minecraft:item_model=string:<context.args.get[1]>]
    - narrate "<blue>Spawned Item"
    - give item:<[item]>

# Staff Storage - Menu to store created items

Staff_Storage_Command:
    type: command
    description: This is a menu for Staff to use to find any created items or add new items.
    name: staffstorage
    usage: /staffstorage <&lt>Category<&gt> <&lt>Add<&gt>
    aliases:
    - sstorage
    tab completions:
      1: Food|Materials|Tools|Weapons|Armor
      2: Add|Remove
    script:
    - if <context.args.is_empty>:
      - inventory open d:Staff_Storage_Main
    - else:
      - if <context.args.get[1]> in <list[Food|Materials|Tools|Weapons|Armor]>:
        - define category <context.args.get[1]>
        - if <context.args.get[2]> == add:
          - define item <player.item_in_hand>
          - adjust def:item quantity:1
          - if <[item]> in <server.flag[sg.<[category]>]>:
            - narrate "<red>This item is already in this category."
          - else:
            - flag server sg.<[category]>:->:<[item]>
        - if <context.args.get[2]> == remove:
          - define item <player.item_in_hand>
          - adjust def:item quantity:1
          - flag server sg.<[category]>:<-:<[item]>
      - else:
        - narrate targets:<player> "<red>This is not a proper category!"
      #- narrate <context.args.get[1]>
      #- narrate <context.args.get[2]>

Staff_Storage_Event:
    type: world
    events:
      on player clicks SStorage_Food in Staff_Storage_*:
      - flag <player> temp_inventory_page:0
      - flag <player> temp_inventory_tag:sg.food
      - inventory open d:Staff_Storage_Food
      on player clicks SStorage_Materials in Staff_Storage_*:
      - flag <player> temp_inventory_page:0
      - flag <player> temp_inventory_tag:sg.materials
      - inventory open d:Staff_Storage_Materials
      on player clicks SStorage_Tools in Staff_Storage_*:
      - flag <player> temp_inventory_page:0
      - flag <player> temp_inventory_tag:sg.tools
      - inventory open d:Staff_Storage_Tools
      on player clicks SStorage_Weapons in Staff_Storage_*:
      - flag <player> temp_inventory_page:0
      - flag <player> temp_inventory_tag:sg.weapons
      - inventory open d:Staff_Storage_Weapons
      on player clicks SStorage_Armor in Staff_Storage_*:
      - flag <player> temp_inventory_page:0
      - flag <player> temp_inventory_tag:sg.armor
      - inventory open d:Staff_Storage_Armor
      on player clicks red_terracotta in Staff_Storage_*:
      - define item <player.flag[temp_inventory_item]>
      - flag server <player.flag[temp_inventory_tag]>:<-:<[item]>
      - inventory open d:<player.open_inventory.script.name>
      on player clicks orange_terracotta in Staff_Storage_*:
      - define item <player.flag[temp_inventory_item]>
      - flag server <player.flag[temp_inventory_tag]>:<server.flag[<player.flag[temp_inventory_tag]>].set[<player.item_in_hand>].at[<player.flag[temp_inventory_item_placement]>]>
      - inventory open d:<player.open_inventory.script.name>
      on player clicks item in Staff_Storage_*:
      - define item <context.item.script.name>
      - if <context.item.script.name> !in <list[SStorage_Food|SStorage_Materials|SStorage_Tools|SStorage_Weapons|SStorage_Armor|GUINull|GUIL|GUIR]>:
        - choose <context.click>:
          - case right:
            - give <context.item> quantity:64
          - default:
            - give <context.item> quantity:1
          - case middle:
            - inventory set o:red_terracotta destination:<player.open_inventory> slot:8
            - inventory set o:orange_terracotta destination:<player.open_inventory> slot:9
            - flag <player> temp_inventory_item:<context.item>
            - flag <player> temp_inventory_item_placement:<context.slot.sub[9].add[<player.flag[temp_inventory_page].mul[36]>]>
      - else:
        - if <player.open_inventory.script.name> in <list[Staff_Storage_Food|Staff_Storage_Materials|Staff_Storage_Tools|Staff_Storage_Weapons|Staff_Storage_Armor]>:
          - define inventory <player.open_inventory.script.name>
          - define inventory_flag <[inventory].replace_text[Staff_Storage_].with[sg.]>
          #- narrate <[inventory]>
          #- narrate <[item]>
          - if <[item]> == GUIR:
            - flag <player> temp_inventory_page:+:1
            - narrate <player.flag[temp_inventory_page]>
            - inventory open destination:<[inventory]>
          - if <[item]> == GUIL:
            - if <player.flag[temp_inventory_page]> >= 1:
              - flag <player> temp_inventory_page:-:1
              - narrate <player.flag[temp_inventory_page]>
              - inventory open destination:<[inventory]>
      #on player clicks GUIR in Staff_Storage_*:
      #- if <player.open_inventory.script.name> in <list[SStorage_Food|SStorage_Materials|SStorage_Tools|SStorage_Weapons|SStorage_Armor]>:
      #  - define inventory <player.open_inventory.script.name>
      #  - narrate <[inventory]>


Staff_Storage_Main:
    type: inventory
    inventory: chest
    title: <light_purple>Staff Storage
    size: 54
    gui: true
    slots:
    - [SStorage_Food] [GUINull] [GUINull] [SStorage_Materials] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [SStorage_Tools] [SStorage_Weapons] [SStorage_Armor] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]

Staff_Storage_Food:
    type: inventory
    inventory: chest
    title: <green>Foodstuffs
    size: 54
    gui: true
    procedural items:
    - define page <player.flag[temp_inventory_page]>
    - define inventory_flag <player.flag[temp_inventory_tag]>
    - choose <[page]>:
      - case 0:
        - determine <server.flag[<[inventory_flag]>].first[36]>
      - case 1:
        - determine <server.flag[<[inventory_flag]>].get[37].to[72]>
      - case 2:
        - determine <server.flag[<[inventory_flag]>].get[73].to[108]>
      - default:
        - determine air
    slots:
    - [SStorage_Food] [GUINull] [GUINull] [SStorage_Materials] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [SStorage_Tools] [SStorage_Weapons] [SStorage_Armor] [GUINull] [GUINull] [GUINull] [GUINull] [GUIL] [GUIR]

Staff_Storage_Materials:
    type: inventory
    inventory: chest
    title: <green>Materials
    size: 54
    gui: true
    procedural items:
    - define page <player.flag[temp_inventory_page]>
    - define inventory_flag <player.flag[temp_inventory_tag]>
    - choose <[page]>:
      - case 0:
        - determine <server.flag[<[inventory_flag]>].first[36]>
      - case 1:
        - determine <server.flag[<[inventory_flag]>].get[37].to[72]>
      - case 2:
        - determine <server.flag[<[inventory_flag]>].get[73].to[108]>
      - default:
        - determine air
    slots:
    - [SStorage_Food] [GUINull] [GUINull] [SStorage_Materials] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [SStorage_Tools] [SStorage_Weapons] [SStorage_Armor] [GUINull] [GUINull] [GUINull] [GUINull] [GUIL] [GUIR]

Staff_Storage_Tools:
    type: inventory
    inventory: chest
    title: <green>Tools
    size: 54
    gui: true
    procedural items:
    - define page <player.flag[temp_inventory_page]>
    - define inventory_flag <player.flag[temp_inventory_tag]>
    - choose <[page]>:
      - case 0:
        - determine <server.flag[<[inventory_flag]>].first[36]>
      - case 1:
        - determine <server.flag[<[inventory_flag]>].get[37].to[72]>
      - case 2:
        - determine <server.flag[<[inventory_flag]>].get[73].to[108]>
      - default:
        - determine air
    slots:
    - [SStorage_Food] [GUINull] [GUINull] [SStorage_Materials] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [SStorage_Tools] [SStorage_Weapons] [SStorage_Armor] [GUINull] [GUINull] [GUINull] [GUINull] [GUIL] [GUIR]

Staff_Storage_Armor:
    type: inventory
    inventory: chest
    title: <green>Armor
    size: 54
    gui: true
    procedural items:
    - define page <player.flag[temp_inventory_page]>
    - define inventory_flag <player.flag[temp_inventory_tag]>
    - choose <[page]>:
      - case 0:
        - determine <server.flag[<[inventory_flag]>].first[36]>
      - case 1:
        - determine <server.flag[<[inventory_flag]>].get[37].to[72]>
      - case 2:
        - determine <server.flag[<[inventory_flag]>].get[73].to[108]>
      - default:
        - determine air
    slots:
    - [SStorage_Food] [GUINull] [GUINull] [SStorage_Materials] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [SStorage_Tools] [SStorage_Weapons] [SStorage_Armor] [GUINull] [GUINull] [GUINull] [GUINull] [GUIL] [GUIR]

Staff_Storage_Weapons:
    type: inventory
    inventory: chest
    title: <green>Weapons
    size: 54
    gui: true
    procedural items:
    - define page <player.flag[temp_inventory_page]>
    - define inventory_flag <player.flag[temp_inventory_tag]>
    - choose <[page]>:
      - case 0:
        - determine <server.flag[<[inventory_flag]>].first[36]>
      - case 1:
        - determine <server.flag[<[inventory_flag]>].get[37].to[72]>
      - case 2:
        - determine <server.flag[<[inventory_flag]>].get[73].to[108]>
      - default:
        - determine air
    slots:
    - [SStorage_Food] [GUINull] [GUINull] [SStorage_Materials] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [SStorage_Tools] [SStorage_Weapons] [SStorage_Armor] [GUINull] [GUINull] [GUINull] [GUINull] [GUIL] [GUIR]

SStorage_Food:
    type: item
    material: Apple
    display name: <green>Food
SStorage_Tools:
    type: item
    material: iron_pickaxe
    display name: <green>Tools
SStorage_Weapons:
    type: item
    material: iron_sword
    display name: <green>Weapons
SStorage_Armor:
    type: item
    material: iron_chestplate
    display name: <green>Armor
SStorage_Materials:
    type: item
    material: Leather
    display name: <green>Materials



Staff_Switch:
    type: command
    description: This script is for staff to switch from player mode to staff mode and vice versa
    name: staffswitch
    usage: /staffswitch
    permission: dscript.staffswitch
    aliases:
    - sswitch
    script:
      - define primarygroup <player.luckperms_primary_group>
      - if primarygroup.haspermission[dscript.staffswitch.dev]:
        - execute as_server "lp user <player.name> parent remove <[primarygroup]>"
        - execute as_server "lp user <player.name> parent add default"