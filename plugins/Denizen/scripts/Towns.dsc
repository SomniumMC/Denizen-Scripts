# This file contains and controls the town system which piggybacks off of Towny or any relevant plugin.

# Each update to this will be broken into categories called, "Stages" to have better organization to large mechanics which are important to the system functioning.

# First Created: 10/18/2024

## Stage 1
# This will consist of basic Land Claiming, model spawning for the town center block, and flagging to connect player to town.

Town_Form_Event:
    type: world
    events:
        on player right clicks block with:Town_Deed:
        - ratelimit <player> 1t
        - if <player.location.world.name> == world:
          - narrate "<red>Cannot create a town in the Satus!"
          - stop
        - if !<player.is_sneaking>:
          - inventory open d:Town_Rename_GUI
        - else:
          - if <player.has_flag[temp_town_name]>:
            - define town_name <player.flag[temp_town_name].strip_color>
            #- narrate <[town_name]>
            - define location <context.location.above[1]>

            # Failure Block
            - if <[location].material.name> != air:
              - narrate "<red>Destination Obstructed!"
              - stop
            - if <[location].areas||null> != null:
              - define areas <[location].areas>
              - foreach <[areas]> as:area_name:
                - if <[area_name].starts_with[staff_]>:
                  - narrate "<red>Forbidden Area!"
                  - stop
            - if <[location].has_town>:
              - narrate "<red>Destination Already Claimed!"
              - stop
            ## Reminder to prevent in existing Area of influence.



            - run Town_Form_Task

            - take item:town_deed quantity:1

          # No Town Name
          - else:
            - narrate "<red>Please pick a Town Name first!"
        on player closes Town_Rename_GUI:
        - define inventory <context.inventory>
        - define town_name <[inventory].slot[3].display.strip_color||null>
        - if <[town_name]> != "Town Name" && <[town_name]> != null:
          - if <[town_name].contains[ ]>:
            - narrate "<red>Your town name contains invalid characters!"
            - stop

          - narrate "<yellow>Now <&lt>Sneak Right Click<&gt> with the Deed to place where the Pylon goes."
          - flag player temp_town_name:<[town_name]> expire:1m

Town_Pylon_Spawn:
# This script spawns in the item model and interaction point that players can interface with a town.
    type: task
    definitions: location
    # location refers to the <player.cursor_on> position
    script:
    - define pylon_location <[location]>
    - spawn Town_Pylon_Model <[pylon_location].above[0.5].left[0.5].forward[0.5]> save:model_entity
    - spawn Town_Pylon_Interaction <[pylon_location].left[0.5].forward[0.5]> save:interaction_entity
    - flag <entry[interaction_entity].spawned_entity> model_entity:<entry[model_entity].spawned_entity>

    #- flag server active_pylons:->:<entry[interaction_entity].spawned_entity>
    ## Town Tag
    - flag <entry[interaction_entity].spawned_entity> town.town_name:<[location].town.name>
    - flag server town.<[location].town.name>.pylon:<entry[interaction_entity].spawned_entity>

Town_Pylon_Model:
    type: entity
    entity_type: item_display
    mechanisms:
        item: dungeon_core
        scale: 2,2,2

Town_Pylon_Interaction:
    type: entity
    entity_type: interaction
    mechanisms:
        height: 3
        width: 1.5

Town_Form_Task:
    type: task
    script:
    - define location <player.cursor_on.above[1]>
    - define town_name <player.flag[temp_town_name]>
    - execute "town create <[town_name]>" as_op
    - run Town_Pylon_Spawn def:<[location]>

    - flag server total_town_ids:+:1
    - define new_town_id <server.flag[total_town_ids]>
    - flag server town.<[town_name]>.id:<[new_town_id]>

    - flag server town.<[town_name]>.name:<[town_name]>
    - flag server town.<[town_name]>.owner:<player.name>
    - flag server town.<[town_name]>.mayor:<empty>
    - flag server town.<[town_name]>.title:Freeholding
    - flag server town.<[town_name]>.residents:->:<player.name>
    - flag server town.<[town_name]>.current_claims:1
    - flag server town.<[town_name]>.middle_chunk:<[location].chunk>

    - flag player town.name:<[town_name]>
    - flag player town.<[town_name]>.position:owner

    - execute "town toggle open on" as_op
    - execute "town toggle pvp on" as_op


Town_Deed:
    type: item
    material: mojang_banner_pattern
    display name: <gold>Town Deed
    lore:
    - <light_purple>Use this in an unclaimed and unguarded chunk to place down a Pylon of Civilization.

Town_Rename_GUI:
    type: inventory
    inventory: anvil
    gui: true
    slots:
    - [Town_Rename_Placeholder_Item] [] []

Town_Rename_Placeholder_Item:
    type: item
    material: paper
    display name: Town Name

#Pylon Interaction Block

Pylon_Interact_Event:
    type: world
    events:
        # opens the GUI
        on player right clicks Town_Pylon_Interaction:
        - ratelimit <player> 1t
        - run Pylon_Interact_Task def:<context.entity>
        on player clicks item in Pylon_Main_Inventory:
        - define item <context.item>
        ## Town Tag
        - define town_name <player.location.town.name>
        - if <[item].script.name> in <list[Pylon_Information_Icon|Pylon_Residents_Icon|Pylon_Notices_Icon|Pylon_Map_Icon|Pylon_Settings_Icon]>:
          - define category <[item].script.name.before[_Icon].after[Pylon_]>
          #- narrate <[category]>
          - if <[category]> == settings:
            - if <player.flag[town.<[town_name]>.position]> == mayor || <player.flag[town.<[town_name]>.position]> == owner:
              - inventory open d:Pylon_Settings_GUI
            - else:
              - stop
          - inventory open d:Pylon_<[category]>_GUI
        after player opens Pylon_Main_Inventory:
        ## Town Tag
        - inventory adjust slot:13 destination:<player.open_inventory> lore:<server.flag[town.<player.location.town.name>.residents].comma_separated>
        after player opens Pylon_Residents_GUI:
        ## Town Tag
        - inventory adjust slot:32 destination:<player.open_inventory> lore:<player.open_inventory.slot[32].lore.set[<player.open_inventory.slot[32].lore.get[1]><gold><server.flag[town.<player.location.town.name>.name]>].at[1]>
        ## Town Tag
        - inventory adjust flag:town:<player.location.town.name> slot:32 destination:<player.open_inventory>
        on player clicks item in Pylon_Residents_GUI:
        ## Town Tag
        - define town_name <player.location.town.name>
        - if <context.item.script.name> == Town_Invitation:
          - give item:<player.open_inventory.slot[32]>
          - stop
        - if <context.item.script.name> == Pylon_Residents_Skull:
          - define username <context.item.display.strip_color>
          - if <player.flag[town.<[town_name]>.position]> == mayor || <player.flag[town.<[town_name]>.position]> == owner:
            - if <player.flag[town.<[town_name]>.position]> == mayor && <[username]> == <server.flag[town.<[town_name]>.owner]>:
              - stop
            - if <[username]> == <player.name>:
              - stop
            - inventory set o:green_concrete slot:28 destination:<player.open_inventory>
            - inventory set o:red_concrete slot:29 destination:<player.open_inventory>
            - inventory set o:barrier slot:30 destination:<player.open_inventory>
            - inventory adjust slot:28 destination:<player.open_inventory> flag:username:<[username]>
        - else:
          - define selection <context.item>
          - define username <player.open_inventory.slot[28].flag[username]>
          - choose <[selection].material.name>:
            - case green_concrete:
              - if <[username]> == <player.name>:
                - stop
              - if <server.flag[town.<[town_name]>.mayor]> == <empty>:
                - flag server town.<[town_name]>.mayor:<[username]>
                - if <[username]> in <server.online_players>:
                  - flag <server.match_player[<[username]>]> town.<[town_name]>.position:mayor
                - else:
                  - flag <server.match_offline_player[<[username]>]> town.<[town_name]>.position:mayor
            - case red_concrete:
              ## Town Tag
              - execute "town kick <[username]>" as_op
              - flag server town.<[town_name]>.residents:<-:<[username]>
              - if <[username]> == <server.flag[town.<[town_name]>.mayor]>:
                - flag server town.<[town_name]>.mayor:<empty>
              - if <[username]> in <server.online_players>:
                - flag <server.match_player[<[username]>]> town:!
              - else:
                - flag <server.match_offline_player[<[username]>]> town:!
            - case barrier:
              - execute "town kick <[username]>" as_op
              - flag server town.<[town_name]>.residents:<-:<[username]>
              - if <[username]> == <server.flag[town.<[town_name]>.mayor]>:
                - flag server town.<[town_name]>.mayor:<empty>
              - if <[username]> in <server.online_players>:
                - flag <server.match_player[<[username]>]> town:!
                - flag <server.match_player[<[username]>]> town_banned:->:<[town_name]>
              - else:
                - flag <server.match_offline_player[<[username]>]> town:!
                - flag <server.match_offline_player[<[username]>]> town_banned:->:<[town_name]>

          - inventory open d:Pylon_Residents_GUI
        on player clicks item in Pylon_Map_GUI:
        - define item <context.item>
        ## Town Tag
        - define town_name <player.location.town.name>
        - if <[item].script.name> == Pylon_Map_Icon:
          - execute "towny map" as_op
        - if <[item].script.name> == Town_Claim_Flag:
          - if <player.flag[town.<[town_name]>.position]> == mayor || <player.flag[town.<[town_name]>.position]> == owner:
            # charge the player
            - give item:Town_Claim_Flag
          - else:
            - narrate "<red>You must be the Owner or Mayor to purchase this!"
        on player clicks item in Pylon_Settings_GUI:
        - define item <context.item>
        - define slot <context.raw_slot>
        ## Town Tag
        - define town_name <player.location.town.name>
        - define type <[item].flag[type]>
        - define state <[item].flag[state]||null>
        - choose <[type]>:
          - case spawn:
            #- define wand <item[Pylon_Settings_Wand]>
            #- adjust def:wand flag:setting:spawn
            #- adjust def:wand lore:<item[Pylon_Settings_Wand].lore.set[<item[Pylon_Settings_Wand].lore.get[3]>Moving<&sp>Spawn].at[3]>
            #- give item:<[wand]>
            #- inventory close
            - narrate "<red>Currently disabled as developing"
          - case pylon:
            #- define wand <item[Pylon_Settings_Wand]>
            #- adjust def:wand flag:setting:pylon
            #- adjust def:wand lore:<item[Pylon_Settings_Wand].lore.set[<item[Pylon_Settings_Wand].lore.get[3]>Moving<&sp>Pylon].at[3]>
            #- give item:<[wand]>
            #- inventory close
            - narrate "<red>Currently disabled as developing"
          - case message:
            - define book <item[Pylon_settings_message_book]>
            - adjust def:book flag:town_name:<[town_name]>
            - give item:<[book]>
            - inventory close
          - case name:
            - narrate "<red>Currently disabled as developing"
          - case build:
          ## Town Tag
            - choose <[state]>:
              - case all:
                - execute "town set perm build off" as_op
                - flag server town.<[town_name]>.permissions.build:off
                - narrate "<aqua>Build Permissions: Off"
              - case off:
                - execute "town set perm resident build on" as_op
                - flag server town.<[town_name]>.permissions.build:resident
                - narrate "<aqua>Build Permissions: Residents Only"
              - case resident:
                - execute "town set perm resident build on" as_op
                - execute "town set perm ally build on" as_op
                - flag server town.<[town_name]>.permissions.build:res+ally
                - narrate "<aqua>Build Permissions: Residents and Allies"
              - case res+ally:
                - execute "town set perm build on" as_op
                - flag server town.<[town_name]>.permissions.build:all
                - narrate "<aqua>Build Permissions: Everyone"
              - default:
                - execute "town set perm build off" as_op
                - flag server town.<[town_name]>.permissions.build:off
                - narrate "<aqua>Build Permissions: Off"
            - inventory open d:Pylon_Settings_GUI


          - case destroy:
            - choose <[state]>:
              - case all:
                - execute "town set perm destroy off" as_op
                - flag server town.<[town_name]>.permissions.destroy:off
                - narrate "<aqua>Destroy Permissions: Off"
              - case off:
                - execute "town set perm resident destroy on" as_op
                - flag server town.<[town_name]>.permissions.destroy:resident
                - narrate "<aqua>Destroy Permissions: Residents Only"
              - case resident:
                - execute "town set perm resident destroy on" as_op
                - execute "town set perm ally destroy on" as_op
                - flag server town.<[town_name]>.permissions.destroy:res+ally
                - narrate "<aqua>Destroy Permissions: Residents and Allies"
              - case res+ally:
                - execute "town set perm destroy on" as_op
                - flag server town.<[town_name]>.permissions.destroy:all
                - narrate "<aqua>Destroy Permissions: Everyone"
              - default:
                - execute "town set perm destroy off" as_op
                - flag server town.<[town_name]>.permissions.destroy:off
                - narrate "<aqua>Destroy Permissions: Off"
            - inventory open d:Pylon_Settings_GUI

Pylon_Interact_Task:
    type: task
    definitions: pylon
    script:
    - define town <[pylon].flag[town.name]>
    - inventory open d:Pylon_Main_Inventory
    #- narrate <[town]>

Pylon_Main_Inventory:
    type: inventory
    inventory: chest
    gui: true
    procedural items:
    - define result <list>
    # Add some logic!
    - determine <[result]>
    slots:
    - [GUINULL] [GUINULL] [GUINULL] [Pylon_GUINull] [GUINULL] [Pylon_GUINull] [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [Pylon_Information_Icon] [Pylon_GUINull] [Pylon_Residents_Icon] [Pylon_GUINull] [Pylon_Notices_Icon] [Pylon_GUINull] [Pylon_Map_Icon] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL] [Pylon_GUINull] [Pylon_Settings_Icon] [Pylon_GUINull] [GUINULL] [GUINULL] [GUINULL]


Pylon_GUINull:
    type: item
    material: light_blue_stained_glass_pane
    display name: <gray>

Pylon_Residents_Icon:
    type: item
    material: player_head
    display name: <blue>Town Residents

Pylon_Information_Icon:
    type: item
    material: brick
    display name: <gold>Town Information
    mechanisms:
      custom_model_data: 16

Pylon_Notices_Icon:
    type: item
    material: writable_book
    display name: <red>Notice Board

Pylon_Map_Icon:
    type: item
    material: filled_map
    display name: <yellow>Town Map
    mechanisms:
      hides: all

Pylon_Settings_Icon:
    type: item
    material: command_block
    display name: <yellow>Town Settings

Pylon_Residents_GUI:
    type: inventory
    inventory: chest
    title: <blue><bold>Town Residents
    gui: true
    procedural items:
    - define result <list>
    ## Town Tag
    - define town_data <server.flag[town.<player.location.town.name>]>
    - define town_residents <[town_data].get[residents]>
    - foreach <[town_residents]> as:username:
      - define item <item[Pylon_Residents_Skull]>
      - adjust def:item skull_skin:<[username]>
      - if <[town_data].get[owner]> == <[username]>:
        - adjust def:item lore:<gold>Owner
      - if <[town_data].get[mayor]> == <[username]>:
        - adjust def:item lore:<red>Mayor
      - adjust def:item display:<[username]>
      - define result:->:<[item]>
    - determine <[result]>
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [Town_Invitation] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Town_Invitation_Accept:
    type: world
    events:
        on player right clicks block with:Town_Invitation:
        - define item <context.item>
        - if <player.has_flag[town]>:
          - narrate "<red>You are already in a town!"
          - stop
        - if <[item].flag[town]> in <player.flag[town_banned]>:
          - narrate "<red>You are banned from joining this town!"
          - stop
        - else:
          - run Town_Join def:<[item].flag[town]>
          - take item:Town_Invitation quantity:1

Town_Join:
    type: task
    definitions: town_name
    script:
    - execute "town join <[town_name]>" as_op
    - flag server town.<[town_name]>.residents:->:<player.name>
    - flag <player> town.<[town_name]>.position:resident
    - flag <player> town.name:<[town_name]>


Town_Invitation:
    type: item
    material: brick
    display name: <gold>Town Invitation
    lore:
    - <white>This is an invitation to the City named<&co><&sp>
    - <white><&lt><gold>Right Click<white><&gt> <light_purple>with this to accept it.

Pylon_Residents_Skull:
    type: item
    material: player_head
    display name: <empty>

Pylon_Information_GUI:
    type: inventory
    inventory: chest
    title: <gold><bold>City Information
    gui: true
    definitions:
      name: item
    procedural items:
    - define result <list>
    ## Town Tag
    - define town_name <player.location.town.name>
    - define title_data <script[Town_Tiers_Data].data_key[<server.flag[town.<[town_name]>.title]>]>
    - foreach <list[title|mayor|owner|resident_count|banner]> as:entry:
      - choose <[entry]>:
        - case title:
          - define item <item[paper]>
          - adjust def:item display:<red>City<&sp>Rank<white><&co><&sp><gold><[title_data].get[name].parsed>

        - case mayor:
          - define item <item[player_head]>
          - if <server.flag[town.<[town_name]>.mayor]> == <empty>:
            - adjust def:item skull_skin:e3RleHR1cmVzOntTS0lOOnt1cmw6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODBjYmRkNGY0NTRmM2U4MzU5YmNjMmI0Y2I4Njk1NWYwZDZkNmM1OGY5Y2E0ZDNjMGI2ZDkzNjRkMTAwYTljNiJ9fX0
            - adjust def:item display:<red>No<&sp>Mayor

          - else:
            - define mayor <server.flag[town.<[town_name]>.mayor]>
            - adjust def:item skull_skin:<[mayor]>
            - adjust def:item display:<red>Mayor<white><&co><&sp><red><[mayor]>

        - case owner:
          - define item <item[player_head]>
          - define owner <server.flag[town.<[town_name]>.owner]>
          - adjust def:item skull_skin:<[owner]>
          - adjust def:item display:<gold>Owner<white><&co><&sp><gold><[owner]>

        - case resident_count:
          - define item <item[birch_sign]>
          - adjust def:item display:<blue>Residents<&co>

          - adjust def:item lore:<server.flag[town.<[town_name]>.residents].comma_separated>

        - case banner:
          - define item <item[white_banner]>
          - adjust def:item display:<aqua>City<&sp>Banner

          # City Banner Placement
          #- if

          - if <player.flag[town.<[town_name]>.position]> == mayor || <player.flag[town.<[town_name]>.position]> == owner:
            - adjust def:item lore:<red>If<&sp>you<&sp>wish<&sp>to<&sp>update<&sp>your<&sp>banner,<&sp>hold<&sp>the<&sp>new<&sp>one<&sp>and<&sp>click<&sp>this.

      - define result:->:<[item]>
    - determine <[result]>
    slots:
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [] [GUINULL] [] [] [GUINULL] [] [] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Pylon_Map_GUI:
    type: inventory
    inventory: chest
    title: <yellow>Town Map
    gui: true
    procedural items:
    - define result <list>
    ## Town Tag
    - define town_name <player.location.town.name>
    - foreach <list[info|map|claim]> as:entry:
      - choose <[entry]>:
        - case info:
          - define item <item[Pylon_Information_Icon]>
          - define title_data <script[Town_Tiers_Data].data_key[<server.flag[town.<[town_name]>.title]>]>
          - adjust def:item lore:<gold>Title<&co><&sp><[title_data].get[name].parsed><n><white>Size<&co><&sp><[title_data].get[size]><n><blue>Current<&sp>Claims<&co><&sp><server.flag[town.<[town_name]>.current_claims]||null><n><yellow>Claim<&sp>Flag<&sp>Cost<&co><&sp>0
        - case map:
          - define item <item[pylon_map_icon]>
          - adjust def:item lore:<yellow>Press<&sp>this<&sp>to<&sp>view<&sp>the<&sp>map!
        - case claim:
          - define item <item[town_claim_flag]>
      - define result:->:<[item]>
    - determine <[result]>
    slots:
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [] [GUINULL] [GUINULL] [] [GUINULL] [GUINULL] [] [GUINULL]
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Town_Claim_Flag:
    type: item
    material: brick
    display name: <red>Claim Flag
    mechanisms:
      custom_model_data: 31001
    lore:
    - <white>Use this item in an unclaimed, unguarded, and influenced chunk to begin claiming.
    - <red>This process lasts for 30 minutes and can be interrupted! Protect it with your life!


Pylon_Settings_GUI:
    type: inventory
    inventory: chest
    title: <yellow>Town Settings
    gui: true
    procedural items:
    - define result <list>
    ## Town Tag
    - define town_name <player.location.town.name>
    - foreach <list[spawn|pylon|message|name|build|destroy]> as:entry:
      - choose <[entry]>:
        - case spawn:
          - define item <item[oak_door]>
          - adjust def:item display:<aqua>Home<&sp>Location
          - adjust def:item flag:type:spawn
        - case pylon:
          - define item <item[beacon]>
          - adjust def:item display:<blue>Pylon<&sp>Location
          - adjust def:item flag:type:pylon
        - case message:
          - define item <item[birch_sign]>
          - adjust def:item display:<gold>Message<&sp>Of<&sp>The<&sp>Day
          - adjust def:item flag:type:message
        - case name:
          - define item <item[name_tag]>
          - adjust def:item display:<light_purple>City<&sp>Name
          - adjust def:item flag:type:name
        - case build:
          - define item <item[oak_planks]>
          - adjust def:item display:<green>Build<&sp>Permission
          - adjust def:item flag:type:build
          - adjust def:item flag:state:<server.flag[town.<[town_name]>.permissions.build]>
          - choose <server.flag[town.<[town_name]>.permissions.build]>:
            - case off:
              - define lore "<aqua>Build Permissions: Off"
            - case resident:
              - define lore "<aqua>Build Permissions: Residents Only"
            - case res+ally:
              - define lore "<aqua>Build Permissions: Residents and Allies"
            - case all:
              - define lore "<aqua>Build Permissions: Everyone"
            - default:
              - define lore "<aqua>Build Permissions: Off"
          - adjust def:item lore:<[lore]>
        - case destroy:
          - define item <item[iron_pickaxe]>
          - adjust def:item display:<red>Destroy<&sp>Permission
          - adjust def:item flag:type:destroy
          - adjust def:item flag:state:<server.flag[town.<[town_name]>.permissions.destroy]>
          - choose <server.flag[town.<[town_name]>.permissions.destroy]>:
            - case off:
              - define lore "<aqua>Destroy Permissions: Off"
            - case resident:
              - define lore "<aqua>Destroy Permissions: Residents Only"
            - case res+ally:
              - define lore "<aqua>Destroy Permissions: Residents and Allies"
            - case all:
              - define lore "<aqua>Destroy Permissions: Everyone"
            - default:
              - define lore "<aqua>Destroy Permissions: Off"
          - adjust def:item lore:<[lore]>
      - define result:->:<[item]>
    - determine <[result]>
    slots:
    - [GUINULL] [] [] [] [] [] [] [] [GUINULL]
    - [GUINULL] [] [] [] [] [] [] [] [GUINULL]
    - [GUINULL] [] [] [] [] [] [] [] [GUINULL]

Pylon_Settings_Event:
    type: world
    events:
        after player edits book:
        - if <context.old_book.script.name> == Pylon_Settings_Message_Book:
          - define town_name <context.old_book.flag[town_name]>
          #- narrate <context.book.book_pages.get[1]>
          - if <context.book.book_pages.get[1].to_list.size> > 50:
            - narrate "<red>Max Characters 50!"
            - take slot:hand
            - stop
          - if <player.flag[town.<[town_name]>.position]> == mayor || <player.flag[town.<[town_name]>.position]> == owner:
            - execute "town set board <context.book.book_pages.get[1].strip_color>" as_op
          - take slot:hand
        on player drops Pylon_Settings_Wand:
        - playeffect at:<context.location> effect:smoke_large
        - remove <context.entity>

Pylon_Settings_Wand:
    type: item
    material: blaze_rod
    display name: <red>Pylon Settings Wand
    lore:
    - <gold>This wand is inherently linked to a nearby Pylon of Civilization
    - <white>Dropping this will fissel out the energy borrowed from the Pylon
    - <aqua>Current Task<&co><&sp>

Pylon_Settings_Message_Book:
    type: item
    material: writable_book
    display name: <white>Town Message Of The Day Book
    lore:
    - <white>Write in this to change the message of the day
    - <red>50 Characters Max

Pylon_Notice_Event:
  type: world
  events:
    on player right clicks block with:Pylon_Notice_Message_Book:
    - if <player.flag[town.name]> != <player.item_in_hand.flag[town_name]>:
      - narrate "<red>You are not apart of this town!"
      - determine cancelled
    after player signs book:
    - if <context.old_book.script.name> == Pylon_Notice_Message_Book:
      - define town_name <context.old_book.flag[town_name]>
      - define mode <context.old_book.flag[mode]>
      - define new_book <player.item_in_hand>
      - define title <context.title>
      - define time <util.time_now>
      - narrate <[title]>
      - narrate <[new_book].book_pages.get[1]>

      - define new_id <server.flag[town_notice_total].add[1]>
      - flag server town_notice_total:++

      - adjust def:new_book flag:id:<[new_id]>
      - adjust def:new_book flag:time:<[time]>
      - adjust def:new_book flag:author:<player.name>
      - adjust def:new_book flag:author:<[mode]>

      - adjust def:new_book hides:all
      - adjust def:new_book display:<[title]>

      - adjust def:new_book lore:<light_purple>Author<white><&co><&sp><player.name><n><gold>Time<&sp>Written<white><&co><&sp><yellow><[time].month_name.to_sentence_case>,<&sp><[time].day><n><aqua>ID<white><&co><&sp><dark_purple><bold><[new_id]><n><blue>Type<white><&co><&sp><green><[mode].to_titlecase>
      - define notice <[new_book]>

      - flag server town.<[town_name]>.notices:->:<[notice]>

      - wait 1t
      - take slot:hand
    after player edits book:
    - if <context.old_book.script.name> == Pylon_Notice_Message_Book:
      - define town_name <context.old_book.flag[town_name]>
      #- if <context.book.book_pages.get[1].before[┠].strip_color> == <&sp><&sp><&sp><&sp><&sp><&sp><&sp><&sp>:
      #  - narrate invalid

      #- narrate <context.book.book_pages.get[1]>
      #- if <context.book.book_pages.get[1].to_list.size> > 50:
      #  - narrate "<red>Max Characters 50!"
      #  - take slot:hand
      #  - stop
    on player drops Pylon_Notice_Message_Book:
    - playeffect at:<context.location> effect:smoke_large
    - remove <context.entity>
    on player clicks item in Pylon_Notices_GUI:
    - define item <context.item>
    ## Town Tag
    - define town_name <player.location.town.name>
    - if <[item].script.name> == Pylon_Notice_Message_Book_GUI:
      - define mode <[item].flag[mode]>
      - if <context.click> == left:
        - define book <item[Pylon_Notice_Message_Book]>
        - adjust def:book flag:town_name:<player.flag[town.name]>
        - adjust def:book book_pages:<&sp><&sp><&sp><&sp><&sp><&sp><&sp><&sp><red><bold>┠<light_purple><bold><[mode].to_titlecase><red><bold>┨<n><n><dark_gray>Contents<black><&co><&sp><reset>
        - adjust def:book flag:mode:<[mode]>
        - give item:<[book]>
      - if <context.click> == right:
        - if <[mode]> == notice:
          - inventory adjust slot:5 destination:<player.open_inventory> flag:mode:request
          - inventory adjust slot:5 destination:<player.open_inventory> display:<white>Request<&sp>Mode
        - if <[mode]> == request:
          - inventory adjust slot:5 destination:<player.open_inventory> flag:mode:Notice
          - inventory adjust slot:5 destination:<player.open_inventory> display:<white>Notice<&sp>Mode
    - else:
      - if <context.item.material.name> == written_book:
        - if <player.flag[town.<[town_name]>.position]> == mayor || <player.flag[town.<[town_name]>.position]> == owner:
          - give <context.item>

Pylon_Notices_GUI:
    type: inventory
    inventory: chest
    title: <red>Notice Board
    gui: true
    procedural items:
    ## Town Tag
    - define town_name <player.location.town.name>
    - define result <list>
    - foreach <server.flag[town.<[town_name]>.notices]> as:item:
      - define result:->:<[item]>
    - determine <[result]>
    slots:
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [Pylon_Notice_Message_Book_GUI] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Pylon_Notice_Message_Book_GUI:
  type: item
  material: writable_book
  display name: <white>Notice Mode
  flags:
    mode: notice
  lore:
    - <aqua>Use this to write a book for your town managers to read and know what's going on in town.
    - <gray><bold><&sp>
    - <white><&lt><gold>Right Click<white><&gt> to change modes.
    - <white><&lt><blue>Left Click<white><&gt> to obtain the writing book.


Pylon_Notice_Message_Book:
  type: item
  material: writable_book
  display name: <white>Notice Board Book
  lore:
    - <white>Write in this to input a notice into your town's noticeboard.

Notice_Book_Script_Notice:
  type: book
  title: Title
  author: Town Name
  signed: false
  text:
  - ┠Notice┨

Notice_Book_Script_Request:
  type: book
  title: Title
  author: Town Name
  signed: false
  text:
  - ┠Request┨


Town_Tiers_Data:
    type: data
    Freeholding:
      name: <white>Freeholding
      size: 3x3
    Lordship: value
    Viscountcy: value
    Earldom: value
    Barony: value


# Claiming System

Town_Claim_Event:
  type: world
  events:
    on player right clicks block with:Town_Claim_Flag:
    - define location <context.location>
    - define chunk <[location].chunk>
    - define player_town <player.flag[town.name]>
    - define town_title <server.flag[town.<[player_town]>.title]>
    - define max_size <script[Town_Tiers_Data].data_key[<[town_title]>.size]>
    - define town_center_chunk <server.flag[town.<[player_town]>.middle_chunk]>
    - if <server.has_flag[town.<[player_town]>.claiming]>:
      - narrate "<red>Your town is already claiming a chunk!"
      - stop

    - if <[location].town.name||null> != null:
      - narrate "<red>This chunk is already claimed!"
      - stop

    - if <[location].above[1].light.sky> < 15:
      - narrate "<red>This spot must have direct sky access!"
      - stop

    - choose <[max_size]>:
      - case 3x3:
        - define total_chunks 9
        - define range 1
    - define x <element[1].mul[<[range]>]>
    - define y <element[1].mul[<[range]>]>
    - define corner1 <[town_center_chunk].add[<[x]>,<[y]>]>
    - define corner2 <[town_center_chunk].add[<[x].mul[-1]>,<[y].mul[-1]>]>
    - define chunk_x 0
    - define chunk_y 0
    - define row 1
    - define column 0
    #- narrate <[corner2]>
    - repeat <[total_chunks]>:
      - define current_chunk <[corner1].add[<[chunk_x]>,<[chunk_y]>]>
      - define chunk_map:->:<[current_chunk]>
      - define chunk_x:-:1
      - define column:+:1
      - if <[column]> == <[max_size].before_last[x]>:
        - define row:+:1
        - define column 0
        - define chunk_x 0
        - define chunk_y:-:1

    - if <[chunk]> !in <[chunk_map]>:
      - narrate "<red>This chunk is not within your town's <blue>Area of Influence<white><&co><&sp><gold><[max_size]><red>!"
      - stop
    - take item:Town_Claim_Flag
    - spawn item_display[item=white_concrete;scale=0.25,20,0.25] <[location].above[14].left[0.5].forward[0.5]> save:beacon_beam
    - adjust <entry[beacon_beam].spawned_entity> glowing:true
    - adjust <entry[beacon_beam].spawned_entity> glow_color:aqua
    - rotate <entry[beacon_beam].spawned_entity> duration:infinite yaw:3
    - spawn item_display[item=Town_Claim_Flag;scale=1,1.5,1] <[location].above[1.5].left[0.5].forward[0.5]> save:Flag_Model
    - spawn Town_Claim_Interaction <[location].above[1].left[0.5].forward[0.5]> save:Flag_Interaction
    - flag <entry[Flag_Interaction].spawned_entity> models:->:<entry[beacon_beam].spawned_entity>
    - flag <entry[Flag_Interaction].spawned_entity> models:->:<entry[Flag_Model].spawned_entity>

    - flag <entry[Flag_Interaction].spawned_entity> town_name:<[player_town]>
    - flag <entry[Flag_Interaction].spawned_entity> max_size:<[max_size]>
    - flag <entry[Flag_Interaction].spawned_entity> current_chunks:<server.flag[town.<[player_town]>.current_claims]>
    - flag <entry[Flag_Interaction].spawned_entity> price:<red>Unimplemented

    - flag <entry[Flag_Interaction].spawned_entity> current_chunk:<[chunk]>
    - flag <entry[Flag_Interaction].spawned_entity> holder:<player.name>
    - flag server town.<player.flag[town.name]>.claiming:ongoing

    - flag server town_active_flags:->:<entry[Flag_Interaction].spawned_entity>

    - narrate targets:<player.location.find_players_within[100]> "<gold><bold><player.flag[town.name]><aqua>, has initiated a claim!<n><red>Defend or Fight them to influence the claim!"

Town_Flag_Finisher:
  type: world
  debug: false
  events:
    on delta time secondly:
    - if <server.flag[town_active_flags]||null> == null || <server.flag[town_active_flags].is_empty>:
      - stop
    - foreach <server.flag[town_active_flags]> as:entry:
      - flag <[entry]> time:++
      - if <[entry].flag[time]> >= 30:
        - run Town_Flag_Claim def:<[entry]> player:<server.match_player[<[entry].flag[holder]>]>

    on player right clicks Town_Claim_Interaction:
    - ratelimit <player> 1t
    - flag player temp_flag_data:<context.entity> expire:3s
    - inventory open destination:Town_Flag_Inventory
    #- narrate <context.entity>
    #- run Town_Flag_Cleanup def:<context.entity>
    on player clicks Town_Claim_Abort in Town_Flag_Inventory:
    - define flag <player.open_inventory.slot[11].flag[flag_data]>
    - run Town_Flag_Cleanup def:<[flag]>
    - inventory close
    - narrate targets:<player.location.find_players_within[100]> "<gold><bold><player.flag[town.name]><aqua>, has aborted the claim!"


Town_Flag_Inventory:
  type: inventory
  inventory: chest
  title: <red>Claim Flag Info
  gui: true
  procedural items:
  - define result <list>
  - define flag_data <player.flag[temp_flag_data]>
  - foreach <list[flag|timer]> as:item:
    - choose <[item]>:
      - case flag:
        - define item <item[Town_Claim_Flag_GUI]>
        - adjust def:item lore:<gray>Town<&sp>Name<white><&co><&sp><gold><[flag_data].flag[town_name]><n><blue>Max<&sp>Claim<&sp>Size<white><&co><&sp><[flag_data].flag[max_size]><n><gold>Current<&sp>Claims<white><&co><&sp><light_purple><[flag_data].flag[current_chunks]><n><red>Claim<&sp>Price<white><&co><&sp><[flag_data].flag[price]>
        - adjust def:item flag:flag_data:<[flag_data]>
      - case timer:
        - define item <item[Town_Claim_Timer]>
        - adjust def:item lore:<white><bold>Current<&sp>Time<&co><&sp><[flag_data].flag[time]><&sp><white>seconds<n><gray><bold><&sp><n><red>Time<&sp>Remaining<&co><&sp><element[1800].sub[<[flag_data].flag[time]>].div[60].round_to[1]><&sp>Minutes
    - define result:->:<[item]>
  - determine <[result]>
  slots:
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
  - [GUINULL] [] [GUINULL] [GUINULL] [Town_Claim_Abort] [GUINULL] [GUINULL] [] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Town_Flag_Cleanup:
  type: task
  definitions: flag
  script:
  - foreach <[flag].flag[models]> as:entity:
    - remove <[entity]>
  - remove <[flag]>
  - flag server town_active_flags:<-:<[flag]>

Town_Flag_Claim:
  type: task
  definitions: flag
  script:
  - teleport <player> <[flag].location>
  - narrate "<light_purple>The magic of the flag whisks you back!"
  - wait 0.5s
  - execute "town claim" as_op
  - flag server town.<[flag].flag[town_name]>.current_claims:++
  - run Town_Flag_Cleanup def:<[flag]>
  - narrate targets:<player.location.find_players_within[100]> "<gold><bold><player.flag[town.name]><aqua>, has claimed a chunk!"


Town_Claim_Interaction:
  type: entity
  entity_type: interaction
  mechanisms:
    height: 3
    width: 1

Town_Claim_Flag_GUI:
  type: item
  material: brick
  display name: <red>Flag Info
  mechanisms:
    custom_model_data: 31001

Town_Claim_Abort:
  type: item
  material: red_concrete
  display name: <red><bold>Abort The Claim?
  lore:
  - <white><bold>This will cancel the claiming process and remove the flag!
  - <gray><bold><&sp>
  - <red>If this is an outsider, use this button to prevent them from successfully claiming this land!

Town_Claim_Timer:
  type: item
  material: clock
  display name: <blue>Timer