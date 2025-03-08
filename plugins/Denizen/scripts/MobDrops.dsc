# This file includes all of the mob drop chances and functions that encompass vanilla mobs and mythic mob overrides

# First Dropped: 4/29/2024

Vanilla_Drops:
    type: world
    events:
        on cow death:
        - determine passively NO_DROPS
        - drop item:Cow_Corpse <context.entity.location> quantity:1
        on mooshroom death:
        - determine passively NO_DROPS
        - drop item:mooshroom_Corpse <context.entity.location> quantity:1
        on pig death:
        - determine passively NO_DROPS
        - drop item:Pig_Corpse <context.entity.location> quantity:1
        - if <context.entity.saddle.material.name> != air:
          - drop item:saddle <context.entity.location> quantity:1
        on chicken death:
        - determine passively NO_DROPS
        - drop item:Chicken_Corpse <context.entity.location> quantity:1
        on sheep death:
        - determine passively NO_DROPS
        - drop item:Sheep_Corpse <context.entity.location> quantity:1
        on rabbit death:
        - determine passively NO_DROPS
        - drop item:Rabbit_Corpse <context.entity.location> quantity:1
        on horse death:
        - determine passively NO_DROPS
        - drop item:Horse_Corpse <context.entity.location> quantity:1
        - if <context.entity.saddle.material.name> != air:
          - drop item:saddle <context.entity.location> quantity:1
        on goat death:
        - determine passively NO_DROPS
        - drop item:Goat_Corpse <context.entity.location> quantity:1
        on hoglin death:
        - determine passively NO_DROPS
        - drop item:Hoglin_Corpse <context.entity.location> quantity:1
        on cod death:
        - determine passively NO_DROPS
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Fish]>]> <context.entity.location> quantity:1
        on salmon death:
        - determine passively NO_DROPS
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Fish]>]> <context.entity.location> quantity:1
        on tropical_fish death:
        - determine passively NO_DROPS
        - drop item:<proc[apply_info_proc].context[<item[Cooking_Raw_Fish]>]> <context.entity.location> quantity:1
        on zombie death:
        - drop item:currency1 quantity:<util.random.int[1].to[5]> <context.entity.location>
        on skeleton death:
        - drop item:currency1 quantity:<util.random.int[1].to[5]> <context.entity.location>
        on creeper death:
        - drop item:currency1 quantity:<util.random.int[1].to[5]> <context.entity.location>
        on spider death:
        - drop item:currency1 quantity:<util.random.int[1].to[5]> <context.entity.location>


Cow_Corpse:
  type: item
  material: brick
  display name: <red>Cow Corpse
  mechanisms:
    components_patch:
        item_model: string:materials:corpse/cow_corpse
  flags:
    mob: cow
  lore:
  - <red>An animal corpse that can be butchered for meat and hide.

Sheep_Corpse:
  type: item
  material: brick
  display name: <red>Sheep Corpse
  mechanisms:
    components_patch:
        item_model: string:materials:corpse/sheep_corpse
  flags:
    mob: sheep
  lore:
  - <red>An animal corpse that can be butchered for meat and hide.

Chicken_Corpse:
  type: item
  material: brick
  display name: <red>Chicken Corpse
  mechanisms:
    components_patch:
        item_model: string:materials:corpse/chicken_corpse
  flags:
    mob: chicken
  lore:
  - <red>An animal corpse that can be butchered for meat and hide.

Pig_Corpse:
  type: item
  material: brick
  display name: <red>Pig Corpse
  mechanisms:
    components_patch:
        item_model: string:materials:corpse/pig_corpse
  flags:
    mob: pig
  lore:
  - <red>An animal corpse that can be butchered for meat and hide.

Horse_Corpse:
  type: item
  material: brick
  display name: <red>Horse Corpse
  mechanisms:
    components_patch:
        item_model: string:materials:corpse/horse_corpse
  flags:
    mob: horse
  lore:
  - <red>An animal corpse that can be butchered for meat and hide.

Goat_Corpse:
  type: item
  material: brick
  display name: <red>Goat Corpse
  mechanisms:
    components_patch:
        item_model: string:materials:corpse/goat_corpse
  flags:
    mob: goat
  lore:
  - <red>An animal corpse that can be butchered for meat and hide.

Rabbit_Corpse:
  type: item
  material: brick
  display name: <red>Rabbit Corpse
  mechanisms:
    components_patch:
        item_model: string:materials:corpse/rabbit_corpse
  flags:
    mob: rabbit
  lore:
  - <red>An animal corpse that can be butchered for meat and hide.

Mooshroom_Corpse:
  type: item
  material: brick
  display name: <red>Mooshroom Cow Corpse
  mechanisms:
    components_patch:
        item_model: string:materials:corpse/mooshroom_corpse
  flags:
    mob: mooshroom
  lore:
  - <red>An animal corpse that can be butchered for meat and hide.

Hoglin_Corpse:
  type: item
  material: brick
  display name: <red>Hoglin Corpse
  mechanisms:
    components_patch:
        item_model: string:materials:corpse/hoglin_corpse
  flags:
    mob: hoglin
  lore:
  - <red>An animal corpse that can be butchered for meat and hide.
