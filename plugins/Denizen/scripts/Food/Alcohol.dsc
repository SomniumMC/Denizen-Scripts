# This file contains the relevant scripts and items for the Alcohol system.

# Created 3/26/2025

Alcohol_Station_Setup:
    type: world
    debug: true
    events:
      on player places alcohol_distillery:
      - define location <context.location>
      - spawn item_display[item=Alcohol_Distillery] <[location].center> save:distillery_model
      - spawn Alcohol_Distillery_Interaction <[location].center.below[0.5]> save:distillery_interaction
      - flag <entry[distillery_interaction].spawned_entity> distillery.model:<entry[distillery_model].spawned_entity>
      on player places Alcohol_Fermentation_Barrel:
      - define location <context.location>
      - spawn item_display[item=Alcohol_Fermentation_Barrel] <[location].center> save:Fermentation_Barrel_model
      - flag <[location]> fermenting.model:<entry[Fermentation_Barrel_model].spawned_entity>
      on player places Alcohol_Aging_Cask:
      - define location <context.location>
      - spawn item_display[item=Alcohol_Aging_Cask] <[location].center> save:Cask_model
      - flag <[location]> cask.model:<entry[Cask_model].spawned_entity>
      on player places Alcohol_Mixing_Tub:
      - define location <context.location>
      - define bottom <[location].below[1]>
      - if <[bottom].material.name> != campfire:
        - narrate "<red>This must be placed on a campfire!"
        - stop
      - spawn item_display[item=Alcohol_Mixing_Tub] <[location].center> save:mixer_model
      - spawn Alcohol_Mixing_Tub_Interaction <[location].center.below[0.5]> save:mixer_interaction
      - flag <entry[mixer_interaction].spawned_entity> mixer.model:<entry[mixer_model].spawned_entity>
      - flag <entry[mixer_interaction].spawned_entity> mixer.campfire:<[bottom]>
      - flag <[bottom]> mixer_fire.interaction:<entry[mixer_interaction].spawned_entity>
      on player breaks campfire location_flagged:mixer_fire:
      - if <context.location.flag[mixer_fire.interaction].if_null[null]> == null:
        - flag <context.location> mixer_fire:!
      - else:
        - narrate "<red>Cannot break the campfire while the mixer is placed on it!"
        - determine cancelled





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

Alcohol_Mixing_Tub:
    type: item
    debug: false
    material: string
    display name: <gold>Mixing Tub
    mechanisms:
      components_patch:
        item_model: string:alcohol:mix_barrel

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