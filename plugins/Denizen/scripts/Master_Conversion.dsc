# This file contains a master list of conversion items to change vanilla items into their Denizen verisons

# First Converted: 6/27/2024

Master_Pickup_Event:
    type: world
    debug: true
    events:
        on player picks up item:
        - define item <context.item>
        - define quantity <[item].quantity>
        - if <[item].material.name> == bow:
          - determine cancelled
        - if <[item].material.name> == trident:
          - determine cancelled
        - if <[item].material.name> in <script[Master_Pickup_Data].list_keys>:
          - if <[item].script.name||null> == null:
            #- narrate true
            - define enchants <[item].enchantment_map>
            - define item <proc[apply_info_proc].context[<item[<script[Master_Pickup_Data].data_key[<[item].material.name>]>]>]>
            #- narrate <[item]>
            - adjust def:item enchantments:<[enchants]>
            - adjust def:item quantity:<[quantity]>
            - foreach <script[Satchel_Storage_Data].data_key[satchels]> as:data key:category:
              - if <[item].material.name||null> in <[data]> || <[item].script.name||null> in <[data]>:
                - define satchel_slot <player.inventory.find_all_items[item_flagged:satchel].filter[item_flagged:type=<[category]>].first.if_null[null]>
                - narrate <[satchel_slot]>

                - determine item:air
            - else:
              - determine item:<[item]>

Master_Pickup_Data:
    type: data
    debug: false
    apple: new_apple
    melon_slice: new_melon_slice
    cocoa_beans: new_cocoa_beans
    wheat: new_wheat
    carrot: new_carrot
    potato: new_potato
    beetroot: new_beetroot
    sweet_berries: new_sweet_berries
    glow_berries: new_glow_berries
    brown_mushroom: new_brown_mushroom
    red_mushroom: new_red_mushroom
    crimson_fungus: new_crimson_fungus
    warped_fungus: new_warped_fungus
    #sugar_cane: new_sugar_cane
    cake: new_cake
    #kelp: new_kelp
    cod: cooking_raw_fish
    salmon: cooking_raw_fish
    tropical_fish: cooking_raw_fish
    porkchop: cooking_raw_pork
    beef: cooking_raw_beef
    chicken: cooking_raw_chicken
    rabbit: cooking_raw_rabbit
    mutton: cooking_raw_mutton

    wheat_seeds: seeds_wheat
    melon_seeds: seeds_melon
    pumpkin_seeds: seeds_pumpkin
    beetroot_seeds: seeds_beetroot

    hay_block: new_hayblock
    pumpkin: new_pumpkin
    melon: new_melon

    #egg: new_egg
    sugar: new_sugar

    #iron_pickaxe: crafted_blast_iron_pickaxe
    #iron_shovel: crafted_blast_iron_shovel
    #iron_axe: crafted_blast_iron_axe
    #iron_hoe: crafted_blast_iron_hoe

    #iron_helmet: blast_iron_helmet
    #iron_chestplate: blast_iron_chestplate
    #iron_leggings: blast_iron_leggings
    #iron_boots: blast_iron_boots

    #leather_helmet: crafted_leather_helmet
    #leather_chestplate: crafted_leather_chestplate
    #leather_leggings: crafted_leather_leggings
    #leather_boots: crafted_leather_boots

    #iron_ingot: primitive_iron_ingot
    #iron_nugget: blast_iron_nugget
    #copper_ingot: blast_copper_ingot

    fishing_rod: crafted_wooden_fishing_rod
    bow: crafted_bow

#Conversion_Exceptions:
#  type: world
#  events:
    #on player picks up iron_ingot:
    #- determine item:primitive_iron_ingot
    #- narrate "Nice <context.material>"
    #on player crafts blast_copper_ingot:
    #- determine <proc[Apply_Info_Proc].context[<context.item>]>