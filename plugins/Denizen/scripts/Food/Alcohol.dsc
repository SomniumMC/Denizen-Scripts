# This file contains the relevant scripts and items for the Alcohol system.

# Created 3/26/2025

Alcohol_Station_Setup:
    type: world
    debug: true
    events:
        on player places alcohol_distillery:
        - define location <context.location>
        - modifyblock <[location]> air
        - spawn item_display[item=Alcohol_Distillery] <[location].center> save:distillery_model
        - spawn Alcohol_Distillery_Interaction <[location].center.below[0.5]> save:distillery_interaction
        - flag <entry[distillery_interaction].spawned_entity> distillery.model:<entry[distillery_model].spawned_entity>
        on player places Alcohol_Fermentation_Barrel:
        - define location <context.location>
        - modifyblock <[location]> cyan_stained_glass
        - spawn item_display[item=Alcohol_Fermentation_Barrel] <[location].center> save:Fermentation_Barrel_model
        - flag <[location]> fermenting.model:<entry[Fermentation_Barrel_model].spawned_entity>
        on player places Alcohol_Aging_Cask:
        - define location <context.location>
        - modifyblock <[location]> cyan_stained_glass
        - spawn item_display[item=Alcohol_Aging_Cask] <[location].center> save:Cask_model
        - flag <[location]> cask.model:<entry[Cask_model].spawned_entity>
        on player places Alcohol_Mixing_Tub:
        - define location <context.location>
        - define bottom <[location].below[1]>
        - if <[bottom].material.name> != campfire:
            - narrate "<red>This must be placed on a campfire!"
            - stop
        - modifyblock <[location]> air
        - spawn item_display[item=Alcohol_Mixing_Tub] <[location].center> save:mixer_model
        - spawn Alcohol_Mixing_Tub_Interaction <[location].center.below[0.5]> save:mixer_interaction
        - flag <entry[mixer_interaction].spawned_entity> mixer.model:<entry[mixer_model].spawned_entity>
        - flag <entry[mixer_interaction].spawned_entity> mixer.campfire:<[bottom]>
        - flag <[bottom]> mixer_fire.interaction:<entry[mixer_interaction].spawned_entity>
        - run Alcohol_Mixer_Setup def:<entry[mixer_interaction].spawned_entity>
        on player breaks campfire location_flagged:mixer_fire:
        - if <context.location.flag[mixer_fire.interaction].if_null[null]> == null:
            - flag <context.location> mixer_fire:!
        - else:
            - narrate "<red>Cannot break the campfire while the mixer is placed on it!"
            - determine cancelled

## Alcohol Mixing Tub

Alcohol_Mixer_Event:
    type: world
    debug: true
    events:
        on player right clicks Alcohol_Mixing_Tub_Interaction:
        - ratelimit <player> 5t
        - define mixer <context.entity>
        - define mixer_location <[mixer].location>
        - define item <context.item>
        - if <[mixer].flag[mixer.id].if_null[null]> == null:
            - run Alcohol_Mixer_Setup def:<[mixer]>
        - if <[item].material.name> == air:
            - flag player mixer.id:<[mixer].flag[mixer.id]>
            - flag player mixer.interaction:<[mixer]>
            - if <player.is_sneaking>:
                - foreach <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].list_contents> as:stored_item:
                    - drop item:<[stored_item]> <[mixer_location].center>
                - inventory clear destination:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                - stop
            - inventory open destination:Alcohol_Mixer_GUI
        - else:
            - if <[item].script.name.if_null[null]> in <script[Alcohol_Mixer_Ingredients].data_key[ingredients]>:
                - if <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].is_full>:
                    - narrate "<red>Storage is full!"
                    - stop
                - else:
                    - take item:<[item]> quantity:1
                    - give item:<[item]> quantity:1 to:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
        on player damages Alcohol_Mixing_Tub_Interaction:
        - define mixer <context.entity>
        - define mixer_location <[mixer].location>
        - narrate <[mixer]>
        - look <[mixer]> yaw:<[mixer].flag[mixer.model].location.yaw.add[90]>
        on player clicks item in Alcohol_Mixer_GUI:
        - define mixer <player.flag[mixer.interaction]>
        - define slot <context.slot>
        - if <[slot]> in <list[25|26]>:
            - if <[slot]> == 25:
                - if <[mixer].flag[mixer.state]> == brewing:
                    - narrate "<red>Already brewing!"
                    - stop
                - inventory open destination:Alcohol_Mixer_Recipe_GUI
            - if <[slot]> == 26:
                - if <[mixer].flag[mixer.recipe].if_null[null]> == null:
                    - narrate "<red>No recipe selected!"
                    - stop
                - if <[mixer].flag[mixer.state].if_null[null]> == brewing:
                    - narrate "<red>Already brewing!"
                    - stop
                - if <[mixer].flag[mixer.state].if_null[null]> == idle:
                    - flag <[mixer]> mixer.state:brewing
                    - flag <[mixer]> mixer.progress:0
                    - flag <[mixer]> mixer.stir:0
                #- flag <[mixer]> mixer.recipe.name:<[mixer].flag[mixer.recipe.name]>
                #- flag <[mixer]> mixer.recipe.data:<[mixer].flag[mixer.recipe.data]>
                    - inventory close
        on player clicks item in Alcohol_Mixer_Recipe_GUI:
        - define item <context.item>
        - if <[item].has_flag[recipe_data]>:
            #- narrate <[item].flag[recipe_data]>
            - flag <player> mixer.recipe.name:<[item].flag[recipe]>
            - flag <player> mixer.recipe.data:<[item].flag[recipe_data]>
            - flag <player.flag[mixer.interaction]> mixer.recipe.name:<[item].flag[recipe]>
            - flag <player.flag[mixer.interaction]> mixer.recipe.data:<[item].flag[recipe_data]>
            - inventory open destination:Alcohol_Mixer_GUI

Alcohol_Mixer_Storage:
    type: inventory
    inventory: hopper
    slots:
    - [] [] [] [] []

Alcohol_Mixer_Setup:
    type: task
    debug: true
    definitions: mixer
    script:
    - define mixer_location <[mixer].location>
    - define mixer_id <server.flag[mixer.total_id].add[1]>
    - note <inventory[Alcohol_Mixer_Storage]> as:mixer_inventory_<[mixer_id]>
    - flag server mixer.total_id:<[mixer_id]>
    - flag <[mixer]> mixer.id:<[mixer_id]>

Alcohol_Mixer_GUI:
    type: inventory
    inventory: chest
    title: <white>七七七七七七七七こ
    gui: true
    definitions:
      status: <item[paper].with_single[display=<green>Status<white><&co> <gold><player.flag[mixer.interaction].flag[mixer.state].to_titlecase.if_null[<red>ERROR]>]>
      progress: <item[glass_bottle].with_single[display=<green>Progress<white><&co> <gold><player.flag[mixer.interaction].flag[mixer.progress].if_null[<red>ERROR]>%].with_single[lore=<yellow>Stir<white><&co> <gold><player.flag[mixer.interaction].flag[mixer.stir].if_null[<red>0]>/<player.flag[mixer.interaction].flag[mixer.recipe.data].get[stir].if_null[<red>0]>]>
      recipe: <item[knowledge_book].with_single[display=<green>Select a Recipe].with_single[lore=<yellow>Selected Recipe<white><&co> <gold><player.flag[mixer.interaction].flag[mixer.recipe.name].replace_text[_].with[ ].to_titlecase.if_null[<red>None]>]>
      confirm: <item[green_concrete].with_single[display=<green>Confirm Recipe]>
    procedural items:
    - define result <list>
    - define mixer_inv <inventory[mixer_inventory_<player.flag[mixer.id]>].list_contents>
    # Add some logic!
    - determine <[mixer_inv]>
    slots:
    - [air] [air] [] [] [] [] [] [air] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [status] [progress] [air] [Alcohol_Fluid_Test] [air] [recipe] [confirm] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]

Alcohol_Mixer_Recipe_GUI:
    type: inventory
    inventory: chest
    title: <gold>Select A Recipe
    gui: true
    procedural items:
    - define result <list>
    - define recipe_list <player.flag[recipe.alcohol].if_null[null]>
    - if <[recipe_list]> != null:
        - foreach <[recipe_list]> as:recipe_name:
            - define recipe_data <script[Alcohol_Mixer_Recipes].data_key[recipes.<[recipe_name]>]>
            - define item <item[paper]>
            - adjust def:item display:<gold><[recipe_name].replace_text[_].with[ ].to_titlecase>
            - adjust def:item flag:recipe:<[recipe_name]>
            - adjust def:item flag:recipe_data:<[recipe_data]>
            - adjust def:item "lore:<green>Click to select this recipe!"
            - define result:->:<[item]>
    - determine <[result]>
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

Alcohol_Mixer_Ingredients:
    type: data
    ingredients:
        - new_wheat

Alcohol_Mixer_Recipes:
    type: data
    recipes:
        potato_mash:
            ingredients:
                - potato-10
            stir: 12

Alcohol_Mixing_Tub:
    type: item
    debug: false
    material: string
    display name: <gold>Mixing Tub
    mechanisms:
      components_patch:
        item_model: string:alcohol:mix_barrel

Alcohol_Fluid_Test:
    type: item
    debug: false
    material: string
    display name: <gold>Fluid Test
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_test

## Alcohol Distillery

Alcohol_Distillery:
    type: item
    debug: false
    material: string
    display name: <gold>Distillery
    mechanisms:
      components_patch:
        item_model: string:alcohol:copper_distillery

Alcohol_Fermentation_Barrel:
    type: item
    debug: false
    material: string
    display name: <gold>Fermentation Barrel
    mechanisms:
      components_patch:
        item_model: string:alcohol:fermentation_barrel

Alcohol_Aging_Cask:
    type: item
    debug: false
    material: string
    display name: <gold>Aging Cask
    mechanisms:
      components_patch:
        item_model: string:alcohol:copper_distillery



Alcohol_Distillery_Interaction:
  type: entity
  debug: false
  entity_type: interaction
  mechanisms:
    width: 1
    height: 1

Alcohol_Mixing_Tub_Interaction:
  type: entity
  debug: false
  entity_type: interaction
  mechanisms:
    width: 1
    height: 1