Satchel_Digger_Tier1:
    type: item
    material: brick
    display name: <green><bold>Digging Satchel
    mechanisms:
      custom_model_data: 10001
    flags:
      type: digger
      tier: 1
      Satchel: true
    lore:
    - <gold>Stores the following materials<&co>
    - <green>- Stone
    - <green>- Dirt
    - <green>- Gravel
    - <green>- Sand

Satchel_Miner_Tier1:
    type: item
    material: brick
    display name: <green><bold>Mining Satchel
    mechanisms:
      custom_model_data: 10001
    flags:
      type: miner
      tier: 1
      Satchel: true
    lore:
    - <gold>Stores the following materials<&co>
    - <green>- Block Ores
    - <green>- Raw Ores

Satchel_Woodcutter_Tier1:
    type: item
    material: brick
    display name: <green><bold>Woodcutting Satchel
    mechanisms:
      custom_model_data: 10001
    flags:
      type: woodcutter
      tier: 1
      Satchel: true
    lore:
    - <gold>Stores the following materials<&co>
    - <green>- Logs
    - <green>- Saplings

Satchel_Fisher_Tier1:
    type: item
    material: brick
    display name: <green><bold>Fishing Satchel
    mechanisms:
      custom_model_data: 10001
    flags:
      type: fisher
      tier: 1
      Satchel: true
    lore:
    - <gold>Stores the following materials<&co>
    - <green>- Fish
    - <green>- Fishing Rods


Satchel_Open:
    type: world
    events:
        on player right clicks block with:Satchel*:
        #- narrate "Nice <context.material>"
        - define item <player.item_in_hand>
        - define tier <[item].flag[tier]>
        - define type <[item].flag[type]>
        - define id <[item].flag[id]>
        - if <[item].has_flag[satchel]>:
          - if !<[item].has_flag[id]>:
            - flag server satchel.total_id:+:1
            - inventory adjust slot:hand flag:id:<server.flag[satchel.total_id]> destination:<player.inventory>
          - inventory open d:Satchel_Inventory_Tier<[tier]>


Satchel_Interact:
    type: world
    events:
        on player clicks item in Satchel*:
        - define inventory_item <context.item>
        - define cursor_item <context.cursor_item>
        - define Satchel <player.item_in_hand>
        - if <[inventory_item].has_flag[Satchel]>:
          - determine passively cancelled
        - if <context.hotbar_button> != 0:
          - determine passively cancelled
        - define list <script[satchel_storage_data].data_key[satchels.<[Satchel].flag[type]>].if_null[null]>
        - if <[list]> == null:
          - determine passively cancelled
        - if <[inventory_item].material.name> in <[list]> || <[inventory_item].script.name> in <[list]> && <context.slot> != -998:
          - playsound <player> sound_category:blocks sound:item_bundle_insert
          - stop
        - else:
          - determine passively cancelled
        on player closes Satchel_Inventory_*:
        - define inventory <context.inventory>
        - define item <player.item_in_hand>
        - if <[item].has_flag[satchel]>:
          - define id <player.item_in_hand.flag[id]>
          - flag server satchel.<[id]>.storage:<[inventory].list_contents>

## Note to self: Make a backup system for satchels to save the last 3 inventory opens just incase something goes fucky we can pull it up.


Satchel_Inventory_Tier1:
    type: inventory
    inventory: chest
    title: <yellow>Satchel
    procedural items:
    - define result <list>

    #- foreach <server.flag[satchel.<player.item_in_hand.flag[id]>.storage]> as:item:
    - define result:<server.flag[satchel.<player.item_in_hand.flag[id]>.storage]>

    - determine <[result]>
    slots:
    - [] [] [] [] [] [] [] [] []

Satchel_Storage_Data:
    type: data
    satchels:
      digger:
        - air
        - dirt
        - gravel
        - sand
        - grass_block
        - coarse_dirt
        - mycelium
        - cobblestone
        - sandstone
        - clay
        - clay_ball
        - flint
        - stone
      miner:
        - air
        - raw_copper
        - raw_iron
        - raw_gold
        - copper_ore
        - iron_ore
        - gold_ore
        - deepslate_copper_ore
        - deepslate_iron_ore
        - deepslate_gold_ore
        - diamond_ore
        - deepslate_diamond_ore
        - coal
        - coal_ore
        - deepslate_coal_ore
        - raw_silver
        - high_carbon_raw_iron
      woodcutter:
        - air
        - oak_log
        - birch_log
        - acacia_log
        - spruce_log
        - jungle_log
        - mangrove_log
        - cherry_log
        - dark_oak_log
        - pale_oak_log
        - oak_sapling
        - birch_sapling
        - acacia_sapling
        - spruce_sapling
        - jungle_sapling
        - mangrove_sapling
        - cherry_sapling
        - dark_oak_sapling
        - pale_oak_sapling
      fisher:
        - air
        - cooking_raw_fish
        - Fish_Anchovy
        - Fish_Bass
        - Fish_Carp
        - Fish_Catfish
        - Fish_Charr
        - Fish_Crab
        - Fish_Crayfish
        - Fish_Eel
        - Fish_Grouper
        - Fish_Herring
        - Fish_Jellyfish
        - Fish_Octopus
        - Fish_Perch
        - Fish_Sardine
        - Fish_Shrimp
        - Fish_Snapper
        - Fish_Tilapia
        - Fish_Trout
        - Fish_Tuna
        - Fish_Walleye
        - Fish_Clam
        - Fish_Scallop
        - Crafted_Fishing_Rod
        - Wooden_Fishing_Rod
