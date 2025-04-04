# This file contains the relevant scripts and items for the Alcohol system.

# Created 3/26/2025

## Container Filling

Alcohol_Container_Fill:
    type: world
    debug: true
    events:
        on player right clicks block with:item_flagged:fluid:
        - ratelimit <player> 5t
        - if !<player.is_sneaking>:
          - stop
        - if <player.cursor_on[4.5].material.name.if_null[air]> == water:
            - define container <context.item>
            - define container_fluid <[container].flag[fluid]>
            - define container_level <[container].flag[level]>
            - define container_max_level <[container].flag[max_level]>
            - if <[container_fluid]> == empty || <[container_fluid]> == water:
                - if <[container_level]> == <[container_max_level]>:
                    - narrate "<red>Container is full!"
                    - stop
                - playsound <player.location> sound:item.bucket.fill sound_category:player
                - flag <[container]> fluid:water
                - flag <[container]> level:<[container_level].add[1]>
                - inventory adjust slot:hand flag:fluid:water
                - inventory adjust slot:hand flag:level:<[container_level].add[1]>
                - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<gold>Contents<white><&co><&sp><red><[container_level].add[1].mul[100]><white>/<blue><[container_max_level].mul[100]>mb].at[3]>
                - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<yellow>Fluid<white><&co><&sp><light_purple>Water].at[4]>

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
    debug: false
    events:
        on player right clicks Alcohol_Mixing_Tub_Interaction:
        - ratelimit <player> 5t
        - define mixer <context.entity>
        - define mixer_location <[mixer].location>
        - define item <context.item>
        - if <[mixer].flag[mixer.id].if_null[null]> == null:
            - run Alcohol_Mixer_Setup def:<[mixer]>
        - if <[item].has_flag[fluid]>:
            - define tool_fluid <[item].flag[fluid]>
            - define tool_level <[item].flag[level]>
            - define mixer_fluid <[mixer].flag[mixer.fluid]>
            - define mixer_fluid_level <[mixer].flag[mixer.fluid_level]>
            - if <player.is_sneaking>:
                - if <[mixer_fluid]> == empty:
                    - narrate "<red>Nothing to pour out!"
                    - stop
                - if <[mixer_fluid_level]> == 0:
                    - narrate "<red>Nothing to pour out!"
                    - stop
                - if <[tool_level]> == <[item].flag[max_level]>:
                    - narrate "<red>Tool is full!"
                    - stop
                - if <[tool_fluid]> == <[mixer_fluid]> || <[tool_fluid]> == empty:
                    - inventory adjust slot:hand flag:fluid:<[mixer_fluid]>
                    - inventory adjust slot:hand flag:level:<[item].flag[level].add[1]>
                    - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<gold>Contents<white><&co><&sp><red><[item].flag[level].add[1].mul[100]><white>/<blue><[item].flag[max_level].mul[100]>mb].at[3]>
                    - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<yellow>Fluid<white><&co><&sp><light_purple><[mixer_fluid].replace_text[_].with[ ].to_titlecase>].at[4]>
                    - flag <[mixer]> mixer.fluid_level:<[mixer_fluid_level].sub[1]>
                    - if <[mixer_fluid_level]> == 1:
                        - flag <[mixer]> mixer.fluid:empty
                        - flag <[mixer]> mixer.fluid_level:0
                    - stop
                - else:
                    - narrate "<red>Incompatible fluid!"
                    - stop
            - else:
                - if <[tool_fluid]> == empty:
                    - narrate "<red>Nothing to pour out!"
                    - stop
                - if <[mixer_fluid_level]> == 10:
                    - narrate "<red>Container is full!"
                    - stop
                - if <[tool_fluid]> == <[mixer_fluid]> || <[mixer_fluid]> == empty:
                  - flag <[mixer]> mixer.fluid:<[tool_fluid]>
                  - flag <[mixer]> mixer.fluid_level:<[mixer_fluid_level].add[1]>
                  - inventory adjust slot:hand flag:level:<[item].flag[level].sub[1]>
                  - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<gold>Contents<white><&co><&sp><red><[item].flag[level].sub[1].mul[100]><white>/<blue><[item].flag[max_level].mul[100]>mb].at[3]>
                  - if <[tool_level]> == 1:
                    - inventory adjust slot:hand flag:fluid:empty
                    - inventory adjust slot:hand flag:level:0
                    - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<gold>Contents<white><&co><&sp><red>0<white>/<blue>1000mb].at[3]>
                    - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<yellow>Fluid<white><&co><&sp><light_purple>Empty].at[4]>

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
        #- narrate <[mixer]>
        - run Alcohol_Mixer_Stir def:<[mixer]>
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
    debug: false
    slots:
    - [] [] [] [] []

Alcohol_Mixer_Setup:
    type: task
    debug: false
    definitions: mixer
    script:
    - define mixer_location <[mixer].location>
    - define mixer_id <server.flag[mixer.total_id].add[1]>
    - note <inventory[Alcohol_Mixer_Storage]> as:mixer_inventory_<[mixer_id]>
    - flag server mixer.total_id:<[mixer_id]>
    - flag <[mixer]> mixer.id:<[mixer_id]>

Alcohol_Mixer_Stir:
    type: task
    debug: false
    definitions: mixer
    script:
    - look <[mixer].flag[mixer.model]> yaw:<[mixer].flag[mixer.model].location.yaw.add[90]>
    - define state <[mixer].flag[mixer.state]>
    - if <[state]> == brewing:
        - flag <[mixer]> mixer.stir:+:1
        - flag <[mixer]> mixer.progress:<[mixer].flag[mixer.stir].div[<[mixer].flag[mixer.recipe.data].get[stir]>]>
    - if <[mixer].flag[mixer.progress].mul[100]> >= 100:
        - define recipe <[mixer].flag[mixer.recipe.data]>
        - define fluid <[mixer].flag[mixer.fluid]>
        - define fluid_level <[mixer].flag[mixer.fluid_level]>
        - define recipe_ingredients <[recipe].get[ingredients]>
        - define recipe_amount <[recipe_ingredients].size>
        - foreach <[recipe_ingredients]> as:item:
          - define quantity<[loop_index]> <[item].after_last[-]>
          - define ingredient<[loop_index]> <[item].before_last[-]>
        - choose <[recipe_amount]>:
            - case 1:
                - if <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <[fluid]> == <[recipe].get[fluid].before_last[-]> && <[fluid_level]> == <[recipe].get[fluid].after_last[-]>:
                    - define success 1
                    - take item:<[ingredient1]> quantity:<[quantity1]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
            - case 2:
                - if <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <[fluid]> == <[recipe].get[fluid].before_last[-]> && <[fluid_level]> == <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].after_last[-]>:
                    - define success 1
                    - take item:<[ingredient1]> quantity:<[quantity1]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient2]> quantity:<[quantity2]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
            - case 3:
                - if <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient3]>].quantity[<[quantity3]>]> && <[fluid]> == <[recipe].get[fluid].before_last[-]> && <[fluid_level]> == <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].after_last[-]>:
                    - define success 1
                    - take item:<[ingredient1]> quantity:<[quantity1]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient2]> quantity:<[quantity2]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient3]> quantity:<[quantity3]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
            - case 4:
                - if <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient3]>].quantity[<[quantity3]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient4]>].quantity[<[quantity4]>]> && <[fluid]> == <[recipe].get[fluid].before_last[-]> && <[fluid_level]> == <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].after_last[-]>:
                    - define success 1
                    - take item:<[ingredient1]> quantity:<[quantity1]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient2]> quantity:<[quantity2]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient3]> quantity:<[quantity3]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient4]> quantity:<[quantity4]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
            - case 5:
                - if <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient3]>].quantity[<[quantity3]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient4]>].quantity[<[quantity4]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient5]>].quantity[<[quantity5]>]> && <[fluid]> == <[recipe].get[fluid].before_last[-]> && <[fluid_level]> == <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].after_last[-]>:
                    - define success 1
                    - take item:<[ingredient1]> quantity:<[quantity1]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient2]> quantity:<[quantity2]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient3]> quantity:<[quantity3]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient4]> quantity:<[quantity4]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient5]> quantity:<[quantity5]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
            - case 6:
                - if <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient1]>].quantity[<[quantity1]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient2]>].quantity[<[quantity2]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient3]>].quantity[<[quantity3]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient4]>].quantity[<[quantity4]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient5]>].quantity[<[quantity5]>]> && <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].contains_item[<[ingredient6]>].quantity[<[quantity6]>]> && <[fluid]> == <[recipe].get[fluid].before_last[-]> && <[fluid_level]> == <inventory[mixer_inventory_<[mixer].flag[mixer.id]>].after_last[-]>:
                    - define success 1
                    - take item:<[ingredient1]> quantity:<[quantity1]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient2]> quantity:<[quantity2]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient3]> quantity:<[quantity3]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient4]> quantity:<[quantity4]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient5]> quantity:<[quantity5]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
                    - take item:<[ingredient6]> quantity:<[quantity6]> from:<inventory[mixer_inventory_<[mixer].flag[mixer.id]>]>
        - if <[success]||0> == 1:
          - narrate "<green>Finished brewing!"
          - flag <[mixer]> mixer.state:idle
          - flag <[mixer]> mixer.progress:0
          - flag <[mixer]> mixer.stir:0
          - flag <[mixer]> mixer.fluid_level:<[mixer].flag[mixer.recipe.data].get[output].after_last[-]>
          - flag <[mixer]> mixer.fluid:<[mixer].flag[mixer.recipe.data].get[output].before_last[-]>
        - if <[success]||0> == 0:
            - narrate "<red>Failed to brew!"
            - flag <[mixer]> mixer.state:idle
            - flag <[mixer]> mixer.progress:0
            - flag <[mixer]> mixer.stir:0
            - flag <[mixer]> mixer.fluid_level:0
            - flag <[mixer]> mixer.fluid:empty

Alcohol_Mixer_GUI:
    type: inventory
    inventory: chest
    title: <white>七七七七七七七七こ
    debug: false
    gui: true
    definitions:
      status: <item[paper].with_single[display=<green>Status<white><&co> <gold><player.flag[mixer.interaction].flag[mixer.state].to_titlecase.if_null[<red>ERROR]>]>
      progress: <item[glass_bottle].with_single[display=<green>Progress<white><&co> <gold><player.flag[mixer.interaction].flag[mixer.progress].mul[100].round_to[1].if_null[<red>ERROR]>%].with_single[lore=<yellow>Stir<white><&co> <gold><player.flag[mixer.interaction].flag[mixer.stir].if_null[<red>0]>/<player.flag[mixer.interaction].flag[mixer.recipe.data].get[stir].if_null[<red>0]>]>
      recipe: <item[knowledge_book].with_single[display=<green>Select a Recipe].with_single[lore=<yellow>Selected Recipe<white><&co> <gold><player.flag[mixer.interaction].flag[mixer.recipe.name].replace_text[_].with[ ].to_titlecase.if_null[<red>None]>]>
      confirm: <item[green_concrete].with_single[display=<green>Confirm Recipe]>
      fluid: <item[Alcohol_Fluid_GUI_<player.flag[mixer.interaction].flag[mixer.fluid_level]>].with_single[display=<blue><player.flag[mixer.interaction].flag[mixer.fluid].replace_text[_].with[ ].to_titlecase.if_null[<red>NULL]>]>
      fluid_level: <item[cyan_stained_glass_pane].with_single[display=<green><player.flag[mixer.interaction].flag[mixer.fluid_level].mul[100].if_null[<red>NULL]><white>/<red>1000mb]>
    procedural items:
    - define result <list>
    - define mixer_inv <inventory[mixer_inventory_<player.flag[mixer.id]>].list_contents>
    # Add some logic!
    - determine <[mixer_inv]>
    slots:
    - [air] [air] [] [] [] [] [] [air] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [status] [progress] [air] [fluid] [air] [recipe] [confirm] [air]
    - [air] [air] [air] [air] [fluid_level] [air] [air] [air] [air]

Alcohol_Mixer_Recipe_GUI:
    type: inventory
    inventory: chest
    title: <gold>Select A Recipe
    debug: false
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

Alcohol_Mixing_Tub:
    type: item
    debug: false
    material: string
    display name: <gold>Mixing Tub
    mechanisms:
      components_patch:
        item_model: string:alcohol:mix_barrel
Alcohol_Fluid_GUI_0:
    type: item
    debug: false
    material: string
    display name: <gold>Default Fluid
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_level_0
Alcohol_Fluid_GUI_1:
    type: item
    debug: false
    material: string
    display name: <gold>Default Fluid
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_level_1
Alcohol_Fluid_GUI_2:
    type: item
    debug: false
    material: string
    display name: <gold>Default Fluid
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_level_2
Alcohol_Fluid_GUI_3:
    type: item
    debug: false
    material: string
    display name: <gold>Default Fluid
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_level_3
Alcohol_Fluid_GUI_4:
    type: item
    debug: false
    material: string
    display name: <gold>Default Fluid
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_level_4
Alcohol_Fluid_GUI_5:
    type: item
    debug: false
    material: string
    display name: <gold>Default Fluid
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_level_5
Alcohol_Fluid_GUI_6:
    type: item
    debug: false
    material: string
    display name: <gold>Default Fluid
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_level_6
Alcohol_Fluid_GUI_7:
    type: item
    debug: false
    material: string
    display name: <gold>Default Fluid
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_level_7
Alcohol_Fluid_GUI_8:
    type: item
    debug: false
    material: string
    display name: <gold>Default Fluid
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_level_8
Alcohol_Fluid_GUI_9:
    type: item
    debug: false
    material: string
    display name: <gold>Default Fluid
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_level_9
Alcohol_Fluid_GUI_10:
    type: item
    debug: false
    material: string
    display name: <gold>Default Fluid
    mechanisms:
      components_patch:
        item_model: string:alcohol:fluid_level_10

Alcohol_Mixing_Tub_Interaction:
  type: entity
  debug: false
  entity_type: interaction
  mechanisms:
    width: 1
    height: 1
## Alcohol Distillery

Alcohol_Distillery:
    type: item
    debug: false
    material: string
    display name: <gold>Distillery
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

## Alcohol Fermenter

Alcohol_Fermenter_Event:
    type: world
    debug: true
    events:
        on player right clicks block location_flagged:fermenting:
        - ratelimit <player> 5t
        - define location <context.location>
        - define item <context.item>
        - define fermenter_fluid <[location].flag[fermenting.fluid].if_null[null]>
        - if <[fermenter_fluid]> == null:
            - run Alcohol_Fermenter_Setup def:<[location]>
            - stop
        - else:
            - define state <[location].flag[fermenting.state]>
            - if <[state]> == idle:
                - if <[item].material.name> == air:
                    - flag player fermenter:<[location]>
                    - inventory open d:Alcohol_Fermenter_GUI
                - if <[fermenter_fluid]> != empty && <[item].script.name||null> == yeast:
                    - take item:yeast quantity:1
                    - flag <[location]> fermenting.state:fermenting
                    - flag server fermenters:->:<[location]>
                - if <[item].has_flag[fluid]>:
                    - define tool_fluid <[item].flag[fluid]>
                    - define tool_level <[item].flag[level]>
                    - define fermenter_fluid_level <[location].flag[fermenting.fluid_level]>
                    - if <player.is_sneaking>:
                        - if <[fermenter_fluid]> == empty:
                            - narrate "<red>Nothing to pour out!"
                            - stop
                        - if <[fermenter_fluid_level]> == 0:
                            - narrate "<red>Nothing to pour out!"
                            - stop
                        - if <[tool_level]> == <[item].flag[max_level]>:
                            - narrate "<red>Tool is full!"
                            - stop
                        - if <[tool_fluid]> == <[fermenter_fluid]> || <[tool_fluid]> == empty:
                            - inventory adjust slot:hand flag:fluid:<[fermenter_fluid]>
                            - inventory adjust slot:hand flag:level:<[item].flag[level].add[1]>
                            - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<gold>Contents<white><&co><&sp><red><[item].flag[level].add[1].mul[100]><white>/<blue><[item].flag[max_level].mul[100]>mb].at[3]>
                            - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<yellow>Fluid<white><&co><&sp><light_purple><[fermenter_fluid].replace_text[_].with[ ].to_titlecase>].at[4]>
                            - flag <[location]> fermenting.fluid_level:<[fermenter_fluid_level].sub[1]>
                            - if <[fermenter_fluid_level]> == 1:
                                - flag <[location]> fermenting.fluid:empty
                                - flag <[location]> fermenting.fluid_level:0
                            - stop
                        - else:
                            - narrate "<red>Incompatible fluid!"
                            - stop
                    - else:
                        - if <[tool_fluid]> == empty:
                            - narrate "<red>Nothing to pour out!"
                            - stop
                        - if <[fermenter_fluid_level]> == 10:
                            - narrate "<red>Container is full!"
                            - stop
                        - if <[tool_fluid]> == <[fermenter_fluid_level]> || <[fermenter_fluid]> == empty:
                          - flag <[location]> fermenting.fluid:<[tool_fluid]>
                          - flag <[location]> fermenting.fluid_level:<[fermenter_fluid_level].add[1]>
                          - inventory adjust slot:hand flag:level:<[item].flag[level].sub[1]>
                          - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<gold>Contents<white><&co><&sp><red><[item].flag[level].sub[1].mul[100]><white>/<blue><[item].flag[max_level].mul[100]>mb].at[3]>
                          - if <[tool_level]> == 1:
                            - inventory adjust slot:hand flag:fluid:empty
                            - inventory adjust slot:hand flag:level:0
                            - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<gold>Contents<white><&co><&sp><red>0<white>/<blue>1000mb].at[3]>
                            - inventory adjust slot:hand lore:<player.item_in_hand.lore.set[<yellow>Fluid<white><&co><&sp><light_purple>Empty].at[4]>
        on player breaks block location_flagged:fermenting:
        - define location <context.location>
        - if <[location].flag[fermenting.fluid].if_null[null]> != null:
            - define fluid <[location].flag[fermenting.fluid]>
            - if <[fluid]> == empty:
                - flag <[location]> fermenting:!
                - drop item:Alcohol_Fermentation_Barrel <[location].center>
            - else:
                - narrate "<red>Cannot break the fermenter while it is in use!"
                - determine cancelled
        - else:
            - drop item:Alcohol_Fermentation_Barrel <[location].center>
            - flag <[location]> fermenting:!
Alcohol_Fermenter_Delta_Time:
    type: world
    debug: false
    events:
        on delta time secondly:
        - if <server.flag[fermenters].is_empty>:
            - stop
        - foreach <server.flag[fermenters]> as:location:
            - if <[location].chunk.is_loaded>:
                - flag <[location]> fermenting.time:<[location].flag[fermenting.time].add[1].if_null[1]>
                - if <[location].flag[fermenting.time].add[1]> >= 30:
                    - define fluid <[location].flag[fermenting.fluid]>
                    - define conversion <script[alcohol_fermenter_conversions].data_key[recipes.<[fluid]>].if_null[disgusting_fluid]>
                    - flag <[location]> fermenting.time:0
                    - flag <[location]> fermenting.fluid:<[conversion]>
                    - flag <[location]> fermenting.state:idle
                    - flag server fermenters:<-:<[location]>

Alcohol_Fermenter_Setup:
    type: task
    debug: true
    definitions: location
    script:
    - flag <[location]> fermenting.fluid:empty
    - flag <[location]> fermenting.fluid_level:0
    - flag <[location]> fermenting.state:idle

Alcohol_Fermenter_GUI:
    type: inventory
    inventory: dispenser
    title: <gold>Fermenter
    gui: true
    definitions:
      fluid: <item[Alcohol_Fluid_GUI_<player.flag[fermenter].flag[fermenting.fluid_level]>].with_single[display=<blue><player.flag[fermenter].flag[fermenting.fluid].replace_text[_].with[ ].to_titlecase.if_null[<red>NULL]>]>
      fluid_level: <item[cyan_stained_glass_pane].with_single[display=<green><player.flag[fermenter].flag[fermenting.fluid_level].mul[100].if_null[<red>NULL]><white>/<red>1000mb]>
    slots:
    - [GUINULL] [GUINULL] [GUINULL]
    - [GUINULL] [fluid] [GUINULL]
    - [GUINULL] [fluid_level] [GUINULL]

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


## Alcohol Tools

Alcohol_Clay_Jug:
    type: item
    debug: false
    material: clay_ball
    display name: <gold>Clay Jug
    flags:
      fluid: empty
      max_level: 5
      level: 0
    mechanisms:
      components_patch:
        item_model: string:furniture:clay_jug
    lore:
    - <green>Used to transfer liquids.
    - <white><element[ ].strikethrough.repeat[10]>
    - <gold>Contents<white><&co><red>0<white>/<blue>500mb
    - <yellow>Fluid<white><&co><light_purple>Empty
    - <white><element[ ].strikethrough.repeat[10]>
    - <blue>Shift-right click to fill with liquid.
    - <red>Right click to pour out liquid.

Alcohol_Wineskin:
    type: item
    debug: false
    material: rabbit_hide
    display name: <gold>Wineskin
    flags:
      fluid: empty
      max_level: 3
      level: 0
    mechanisms:
      components_patch:
        item_model: string:alcohol:wineskin
    lore:
    - <green>Can be drank from.
    - <white><element[ ].strikethrough.repeat[10]>
    - <gold>Contents<white><&co><red>0<white>/<blue>300mb
    - <yellow>Fluid<white><&co><light_purple>Empty
    - <white><element[ ].strikethrough.repeat[10]>
    - <blue>Shift-right click to fill with liquid.
    - <red>Right click to pour out liquid.