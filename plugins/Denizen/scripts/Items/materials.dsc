# This file includes all of the crafting resources that players can obtain.

# First Collected: 04/18/2024

Tool_Rod:
    type: item
    material: brick
    display name: <gray>Tool Rod
    mechanisms:
      components_patch:
        item_model: string:materials:wooden/tool_rod
    #flags:
    #  lore: <gold>Used to craft tools and weapons
    lore:
    - <gold>Used to craft tools and weapons

## Ores

Raw_Tin:
    type: item
    material: brick
    display name: <gray>Tin Ore
    mechanisms:
      components_patch:
        item_model: string:materials:ore/tin_ore
    #flags:
    #  lore: <gold>An unrefined chunk of dull colored ore.
    lore:
    - <gold>An unrefined chunk of dull colored ore.

Raw_Silver:
    type: item
    material: brick
    display name: <gray>Silver Ore
    mechanisms:
      components_patch:
        item_model: string:materials:ore/silver_ore
    #flags:
    #  lore: <gold>An unrefined chunk of unpolished and gritty ore.
    lore:
    - <gold>An unrefined chunk of unpolished and gritty ore.

Raw_Adamantine:
    type: item
    material: brick
    display name: <gray>Adamantine Ore
    mechanisms:
      components_patch:
        item_model: string:materials:ore/adamantine_ore
    #flags:
    #  lore: <gold>An unrefined chunk of tough red splotched ore. It has an extreme melting point.
    lore:
    - <gold>An unrefined chunk of tough red splotched ore. It has an extreme melting point.

Raw_Mythril:
    type: item
    material: brick
    display name: <gray>Mythril Ore
    mechanisms:
      components_patch:
        item_model: string:materials:ore/mythril_ore
    #flags:
    #  lore: <gold>An unrefined chunk of magical metal. You can feel the potential in the ore.
    lore:
    - <gold>An unrefined chunk of magical metal. You can feel the potential in the ore.

high_carbon_raw_iron:
    type: item
    material: brick
    display name: <gray>High Carbon Raw Iron
    mechanisms:
      components_patch:
        item_model: string:materials:ore/high_carbon_raw_iron
    #flags:
    #  lore: <gold>An unrefined chunk of iron with a high carbon content.
    lore:
    - <gold>An unrefined chunk of iron with a high carbon content.

## Metals

Silver_Ingot:
    type: item
    material: brick
    mechanisms:
      components_patch:
        item_model: string:materials:ingot/silver_ingot
    display name: <gold>Silver Ingot
    #flags:
    #  lore: <gold>A roughly made ingot of solid silver.
    lore:
    - <gold>A roughly made ingot of solid silver.

Adamantine_Ingot:
    type: item
    material: brick
    mechanisms:
      components_patch:
        item_model: string:materials:ingot/adamantine_ingot
    display name: <gold>Adamantine Ingot
    #flags:
    #  lore: <gold>A bright red ingot made of a extremely tough metal.
    lore:
    - <gold>A bright red ingot made of a extremely tough metal.

Mythril_Ingot:
    type: item
    material: brick
    mechanisms:
      components_patch:
        item_model: string:materials:ingot/mythril_ingot
    display name: <gold>Mythril Ingot
    #flags:
    #  lore: <gold>A bar of strange to the touch metal. It has an elemental strength to it.
    lore:
    - <gold>A bar of strange to the touch metal. It has an elemental strength to it.

## Alloys

Bronze_Ingot:
    type: item
    material: brick
    mechanisms:
      components_patch:
        item_model: string:materials:ingot/bronze_ingot
    display name: <gold>Bronze Ingot
    #flags:
    #  lore: <gold>An alloyed ingot composed of tin and copper.
    lore:
    - <gold>An alloyed ingot composed of tin and copper.

Slate_Silver_Ingot:
    type: item
    material: brick
    mechanisms:
      components_patch:
        item_model: string:materials:ingot/slate_silver_ingot
    display name: <gold>Slate Silver Ingot
    #flags:
    #  lore: <gold>An alloyed ingot made of silver and steel.
    lore:
    - <gold>An alloyed ingot made of silver and steel.

Steel_Ingot:
    type: item
    material: brick
    mechanisms:
      components_patch:
        item_model: string:materials:ingot/steel_ingot
    display name: <gold>Steel Ingot
    #flags:
    #  lore: <gold>An alloyed ingot made of iron and carbon.
    lore:
    - <gold>An alloyed ingot made of iron and carbon.

## Nuggets

Copper_Nugget:
  type: item
  material: brick
  display name: <gold>Copper Nugget
  mechanisms:
      components_patch:
        item_model: string:materials:nugget/copper_nugget
  recipes:
    1:
      type: shapeless
      input: copper_ingot
      output_quantity: 9

## Threads

Grass_Fiber:
  type: item
  material: brick
  display name: <white>Grass Fiber
  mechanisms:
      components_patch:
        item_model: string:materials:thread/grass_fiber
  lore:
    - <gold>A clump of grass clippings which can be woven into string.

## Leathers

Flesh_Bound_Leather:
  type: item
  material: brick
  display name: <white>Flesh Bound Leather
  mechanisms:
      components_patch:
        item_model: string:materials:leather/flesh_leather
  lore:
    - <gold>A patchwork of rotten flesh bound together by string which can be smelted into leather.
  recipes:
    1:
      type: shaped
      input:
      - air|rotten_flesh|air
      - rotten_flesh|string|rotten_flesh
      - air|rotten_flesh|air

Flesh_Smelted_Leather:
  type: item
  material: leather
  no_id: true
  recipes:
    1:
      type: furnace
      input: flesh_bound_leather
      cook_time: 10s

## Leather Straps

## Plates

## Bars