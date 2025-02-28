# This file contains the items and mechanics tied to eating and placing down meal platters.

# First Created: 12/23/2024

Platters_Event:
    type: world
    events:
        on player right clicks block with:item_flagged:platter:
        - define location <context.location.above[1]>
        - if <[location].material.name> != air:
          - narrate "<red>Area Blocked!"
          - stop
        - define platter_type <context.item.flag[platter]>
        - take item:<context.item> quantity:1
        - spawn item_display[item=<item[brick].with_single[custom_model_data=32002]>] <[location].center.with_yaw[<player.location.yaw.round_to_precision[45]>]> save:platter_model
        - spawn Platter_Interaction <[location].center.below[0.5]> save:platter_interaction

        # <script[Platter_Data].data_key[<[platter_type]>].get[model]>

        - definemap platter_flags:
            platter_model: <entry[platter_model].spawned_entity>
            platter_interaction: <entry[platter_interaction].spawned_entity>
            state: closed
            type: <[platter_type]>
            item: <context.item>
            stage: 0
            model: <script[Platter_Data].data_key[<[platter_type]>].get[model]>
            food: <script[Platter_Data].data_key[<[platter_type]>].get[food]>

        - flag <[location]> platter_data:<[platter_flags]>
        - flag <entry[platter_interaction].spawned_entity> health:5
        - flag <entry[platter_interaction].spawned_entity> location:<[location]>
        on player damages Platter_Interaction:
        - define entity <context.entity>
        - define health <[entity].flag[health]>
        - if <[health].sub[<context.damage>]> <= 0:
          - define platter_data <[entity].flag[location].flag[platter_data]>
          - if <[platter_data].get[state]> == closed:
            - drop item:<[platter_data].get[item]>
          - remove <[platter_data].get[platter_model]>
          - remove <[platter_data].get[platter_interaction]>
          - flag <[entity].flag[location]> platter_data:!
        - else:
          - define newhealth <[health].sub[<context.damage>]>
          - flag <[entity]> health:<[newhealth]>
          - playeffect effect:block at:<[entity].location.above[1]> special_data:iron_block quantity:10
          - playsound sound:block.chain.hit <[entity].location> sound_category:blocks
        on player right clicks Platter_Interaction:
        - ratelimit <player> 20t
        - define entity <context.entity>
        - define location <[entity].flag[location]>
        - define platter_data <[location].flag[platter_data]>
        - if <[platter_data].get[state]> == closed:
          - playsound sound:block.iron_door.open <[entity].location> sound_category:blocks
          - adjust <[platter_data].get[platter_model]> item:<item[brick].with_single[custom_model_data=<script[Platter_Data].data_key[<[platter_data].get[type]>].get[model]>]>
          - flag <[location]> platter_data.state:open
          - stop
        - else:
          - define stage:<[platter_data].get[stage]>
          - if <[stage]> < <script[Platter_Data].data_key[<[platter_data].get[type]>].get[food].size>:
            - define food_list <[platter_data].get[food]>
            - define item <item[<[food_list].first>]>
            - if <[item].has_flag[drink]>:
              - repeat 3:
                - playsound sound:entity.generic.drink <player.location> sound_category:players
                - wait 5t
            - else:
              - repeat 3:
                - playsound sound:entity.generic.eat <player.location> sound_category:players
                - playeffect effect:block at:<player.eye_location.below[0.5]> special_data:sand quantity:5
                - wait 5t
            - feed <player> amount:<[item].flag[food].sub[1].mul[1.25]> saturation:<[item].flag[food].mul[1.5].sub[0.2].mul[1.25]>
            - playsound sound:entity.player.burp <player.location> sound_category::players
            - flag <[location]> platter_data.food:<[food_list].exclude[<[food_list].first>]>
            - flag <[location]> platter_data.stage:+:1
            - adjust <[platter_data].get[platter_model]> item:<item[brick].with_single[custom_model_data=<[platter_data].get[model].add[<[stage].add[1]>]>]>
          - else:
            - playsound sound:entity.item.break <[entity].location> sound_category::blocks
            - remove <[platter_data].get[platter_model]>
            - remove <[platter_data].get[platter_interaction]>
            - flag <[entity].flag[location]> platter_data:!



Platter_Data:
    type: data
    empty:
      model: 32001
      food:
        - <empty>
    covered:
      model: 32002
    vegetarian:
      model: 32003
      food:
        - fruit_salad
        - new_baked_potato
        - new_beetroot_soup
        - fruit_punch
    carnivore:
      model: 32014
      food:
        - pot_roast
        - cooking_cooked_pork
        - sweet_berry_juice
        - hamburger
    dessert:
      model: 32025
      food:
        - jelly_donut
        - caramel_ice_cream
        - cookies_and_milk
        - chocolate_cake

Platter_Interaction:
    type: entity
    entity_type: interaction
    mechanisms:
        height: 0.5


Empty_Platter:
    type: item
    material: brick
    display name: <green>Empty Platter
    mechanisms:
      custom_model_data: 32001
    flags:
      platter: empty

Vegetarian_Platter:
    type: item
    material: brick
    display name: <green>Vegetarian Platter
    mechanisms:
      custom_model_data: 32002
    flags:
      platter: vegetarian

Carnivore_Platter:
    type: item
    material: brick
    display name: <green>Carnivore Platter
    mechanisms:
      custom_model_data: 32002
    flags:
      platter: carnivore

Dessert_Platter:
    type: item
    material: brick
    display name: <green>Dessert Platter
    mechanisms:
      custom_model_data: 32002
    flags:
      platter: dessert