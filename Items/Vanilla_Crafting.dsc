# This file has replacement recipes and items to change the balance of MC for the server.

# First Created: 6/13/2024

Remove_Vanilla_Recipes:
    type: task
    data:
      recipes:
          - minecraft:iron_block
          - minecraft:anvil
          - minecraft:hopper
          - minecraft:copper_block
          - minecraft:copper_ingot
          - minecraft:copper_ingot_from_waxed_copper_block
          - minecraft:iron_ingot_from_iron_block
          - minecraft:lantern
          - minecraft:soul_lantern
          - minecraft:chain
          - minecraft:bucket
          - minecraft:shears
          - minecraft:leather_helmet
          - minecraft:leather_chestplate
          - minecraft:leather_leggings
          - minecraft:leather_boots
          - minecraft:diamond_helmet
          - minecraft:diamond_chestplate
          - minecraft:diamond_leggings
          - minecraft:diamond_boots
          - minecraft:diamond_sword
          - minecraft:diamond_pickaxe
          - minecraft:diamond_axe
          - minecraft:diamond_shovel
          - minecraft:diamond_hoe
          - minecraft:paper
          - minecraft:bow
    script:
    #- define list <list[minecraft:iron_block|minecraft:anvil|minecraft:hopper|minecraft:copper_block|minecraft:copper_ingot|minecraft:copper_ingot_from_waxed_copper_block|minecraft:iron_ingot_from_iron_block|minecraft:lantern|minecraft:soul_lantern|minecraft:chain|minecraft:bucket|minecraft:shears|minecraft:leather_helmet|minecraft:leather_chestplate|minecraft:leather_leggings|minecraft:leather_boots|minecraft:diamond_helmet|minecraft:diamond_chestplate|minecraft:diamond_leggings|minecraft:diamond_boots|minecraft:diamond_sword|minecraft:diamond_pickaxe|minecraft:diamond_axe|minecraft:diamond_shovel|minecraft:diamond_hoe|minecraft:paper|minecraft:bow]>
    - adjust server remove_recipes:<script.data_key[data.recipes]>
    #- adjust <player> forget_recipe:<[list]>


Vanilla_Anvil:
    type: item
    material: anvil
    recipes:
      1:
        type: shaped
        input:
        - iron_block|Iron_Ingot|iron_block
        - air|Iron_Ingot|air
        - Iron_Ingot|Iron_Ingot|Iron_Ingot
    no_id: true

Vanilla_Iron_Block:
    type: item
    material: iron_block
    recipes:
      1:
        type: shaped
        input:
        - iron_ingot|iron_ingot
        - iron_ingot|iron_ingot
    no_id: true

Vanilla_Copper_Ingot:
    type: item
    material: copper_ingot
    recipes:
      1:
        type: shaped
        input:
        - Copper_Nugget|Copper_Nugget|Copper_Nugget
        - Copper_Nugget|Copper_Nugget|Copper_Nugget
        - Copper_Nugget|Copper_Nugget|Copper_Nugget
    no_id: true

Vanilla_Lantern:
    type: item
    material: lantern
    recipes:
      1:
        type: shaped
        input:
        - Copper_Nugget|Copper_Nugget|Copper_Nugget
        - Copper_Nugget|torch|Copper_Nugget
        - Copper_Nugget|Copper_Nugget|Copper_Nugget
        output_quantity: 3
    no_id: true

Vanilla_Soul_Lantern:
    type: item
    material: lantern
    recipes:
      1:
        type: shaped
        input:
        - Copper_Nugget|Copper_Nugget|Copper_Nugget
        - Copper_Nugget|soul_torch|Copper_Nugget
        - Copper_Nugget|Copper_Nugget|Copper_Nugget
        output_quantity: 3
    no_id: true

Vanilla_Bucket:
    type: item
    material: Bucket
    recipes:
      1:
        type: shaped
        input:
        - Copper_Ingot|air|Copper_Ingot
        - air|Copper_Ingot|air
      2:
        type: shaped
        input:
        - Iron_Ingot|air|Iron_Ingot
        - air|Iron_Ingot|air
        output_quantity: 2
    no_id: true

Vanilla_Chain:
    type: item
    material: chain
    recipes:
      1:
        type: shaped
        input:
        - Iron_Nugget
        - Iron_Ingot
        - Iron_Nugget
        output_quantity: 8
    no_id: true

Vanilla_Shears:
    type: item
    material: Shears
    recipes:
      1:
        type: shaped
        input:
        - Copper_Ingot|air
        - air|Copper_Ingot
      2:
        type: shaped
        input:
        - air|Copper_Ingot
        - Copper_Ingot|air
      3:
        type: shaped
        input:
        - air|Copper_Ingot
        - Copper_Ingot|air
      4:
        type: shaped
        input:
        - Iron_Ingot|air
        - air|Iron_Ingot
    no_id: true

New_Shield:
  type: item
  material: shield
  #no_id: true
  #recipes:
  #  1:
  #    type: shaped
  #    input:
  #    - *planks|iron_ingot|*planks
  #    - *planks|*planks|*planks
  #    - air|*planks|air
  flags:
    recipe: *planks_5|iron_ingot_1

New_Tripwire_Hook:
    type: item
    material: tripwire_hook
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Ingot
    #    - stick
    #    - *_planks
    #    output_quantity: 2
    #no_id: true
    flags:
      recipe: iron_ingot_1|stick_1|*planks_1

New_Smithing_Table:
    type: item
    material: smithing_table
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Ingot|Iron_Ingot
    #    - *_planks|*_planks
    #    - *_planks|*_planks
    #no_id: true
    flags:
      recipe: iron_ingot_2|*planks_4

New_Minecart:
    type: item
    material: minecart
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Ingot|air|Iron_Ingot
    #    - Iron_Ingot|Iron_Ingot|Iron_Ingot
    #no_id: true
    flags:
      recipe: iron_ingot_5

New_Iron_Trapdoor:
    type: item
    material: iron_trapdoor
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Ingot|Iron_Ingot
    #    - Iron_Ingot|Iron_Ingot
    #    output_quantity: 2
    #no_id: true
    flags:
      recipe: iron_ingot_4


New_Iron_Door:
    type: item
    material: iron_door
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Ingot|Iron_Ingot
    #    - Iron_Ingot|Iron_Ingot
    #    - Iron_Ingot|Iron_Ingot
    #    output_quantity: 3
    #no_id: true
    flags:
      recipe: iron_ingot_6

New_Iron_Bars:
    type: item
    material: iron_bars
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Ingot|Iron_Ingot|Iron_Ingot
    #    - Iron_Ingot|Iron_Ingot|Iron_Ingot
    #    output_quantity: 16
    #no_id: true
    flags:
      recipe: iron_ingot_6

New_Heavy_Weighted_Pressure_Plate:
    type: item
    material: heavy_weighted_pressure_plate
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Ingot|Iron_Ingot
    #    output_quantity: 2
    #no_id: true
    flags:
      recipe: iron_ingot_2

New_Stonecutter:
    type: item
    material: stonecutter
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - air|Iron_Ingot|air
    #    - smooth_stone/stone/deepslate/sandstone|smooth_stone/stone/deepslate/sandstone|smooth_stone/stone/deepslate/sandstone
    #no_id: true
    flags:
      recipe: iron_ingot_1|stone_3

New_Rail:
    type: item
    material: rail
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Nugget|stick|Iron_Nugget
    #    - Iron_Nugget|stick|Iron_Nugget
    #    - Iron_Nugget|stick|Iron_Nugget
    #    output_quantity: 6
    #no_id: true
    flags:
      recipe: iron_nugget_6|stick_3

New_Piston:
    type: item
    material: piston
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - *_planks|*_planks|*_planks
    #    - cobblestone/cobbled_deepslate|Iron_Ingot|cobblestone/cobbled_deepslate
    #    - cobblestone/cobbled_deepslate|redstone|cobblestone/cobbled_deepslate
    #    output_quantity: 2
    #no_id: true
    flags:
      recipe: *planks_3|cobblestone_4|iron_ingot_1|redstone_1

New_Detector_Rail:
    type: item
    material: Detector_Rail
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Nugget|stick|Iron_Nugget
    #    - Iron_Nugget|*pressure_plate|Iron_Nugget
    #    - Iron_Nugget|redstone|Iron_Nugget
    #    output_quantity: 3
    #no_id: true
    flags:
      recipe: iron_nugget_6|stick_1|stone_pressure_plate_1|redstone_1

New_Compass:
    type: item
    material: Compass
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - air|Iron_Ingot|air
    #    - Iron_Ingot|redstone|Iron_Ingot
    #    - air|Iron_Ingot|air
    #no_id: true
    flags:
      recipe: iron_ingot_4|redstone_1

New_Cauldron:
    type: item
    material: cauldron
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Nugget|air|Iron_Nugget
    #    - Iron_Ingot|air|Iron_Ingot
    #    - Iron_Ingot|Iron_Ingot|Iron_Ingot
    #no_id: true
    flags:
      recipe: iron_ingot_5|iron_nugget_2

New_Activator_Rail:
    type: item
    material: Activator_Rail
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Nugget|stick|Iron_Nugget
    #    - Iron_Nugget|redstone_torch|Iron_Nugget
    #    - Iron_Nugget|stick|Iron_Nugget
    #    output_quantity: 3
    #no_id: true
    flags:
      recipe: iron_nugget_6|stick_2|redstone_torch_1

#New_Furnace:
#    type: item
#    material: Furnace
#    recipes:
#      1:
#        type: shaped
#        input:
#        - Iron_Ingot|Iron_Ingot|Iron_Ingot
#        - Iron_Ingot|furnace|Iron_Ingot
#        - smooth_stone/stone/deepslate/sandstone|smooth_stone/stone/deepslate/sandstone|smooth_stone/stone/deepslate/sandstone
#    no_id: true

New_Hopper:
    type: item
    material: hopper
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Iron_Ingot|air|Iron_Ingot
    #    - Iron_Ingot|chest|Iron_Ingot
    #    - air|Iron_Ingot|air
    #no_id: true
    flags:
      recipe: iron_ingot_5|chest_1

New_Flint_And_Steel:
    type: item
    material: flint_and_steel
    #recipes:
    #  1:
    #    type: shapeless
    #    input: Steel_Ingot|flint
    #no_id: true
    flags:
      recipe: steel_ingot|flint

New_Copper_Block:
    type: item
    material: copper_block
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Copper_Ingot|Copper_Ingot|Copper_Ingot
    #    - Copper_Ingot|Copper_Ingot|Copper_Ingot
    #    - Copper_Ingot|Copper_Ingot|Copper_Ingot
    #no_id: true
    flags:
      recipe: copper_ingot_4

New_Spyglass:
    type: item
    material: spyglass
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - amethyst_shard
    #    - Copper_Ingot
    #    - Copper_Ingot
    #no_id: true
    flags:
      recipe: copper_ingot_2|amethyst_shard_1

New_Lightning_Rod:
    type: item
    material: lightning_rod
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Copper_Ingot
    #    - Copper_Ingot
    #    - Copper_Ingot
    #no_id: true
    flags:
      recipe: copper_ingot_3

New_Brush:
    type: item
    material: brush
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - feather
    #    - Copper_Ingot
    #    - stick
    #no_id: true
    flags:
      recipe: copper_ingot_1|stick_1|feather_1

New_Grindstone:
    type: item
    material: grindstone
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - stick|stone_slab/smooth_stone_slab/polished_deepslate_slab|stick
    #    - *planks|air|*planks
    #no_id: true
    flags:
      recipe: stick_2|stone_slab_1|*planks_2

New_Soul_Lantern:
    type: item
    material: soul_lantern
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Copper_Nugget|Copper_Nugget|Copper_Nugget
    #    - Copper_Nugget|soul_torch|Copper_Nugget
    #    - Copper_Nugget|Copper_Nugget|Copper_Nugget
    #    output_quantity: 3
    #no_id: true
    flags:
      recipe: copper_nugget_8|soul_torch_1

Grass_String:
  type: item
  material: string
  no_id: true
  recipes:
    1:
      type: shapeless
      input: grass_fiber|grass_fiber|grass_fiber|grass_fiber

Bulk_Sticks:
  type: item
  material: stick
  no_id: true
  recipes:
    1:
      type: shaped
      input:
      - *log
      - *log
      output_quantity: 16

New_Paper:
  type: item
  material: paper
  no_id: true
  recipes:
    1:
      type: shapeless
      input: new_sugar_cane|new_sugar_cane|new_sugar_cane
      output_quantity: 3

Jellyfish_Slime:
  type: item
  material: slime_ball
  no_id: true
  recipes:
    1:
      type: campfire
      input: fish_jellyfish
      cook_time: 30s
    2:
      type: furnace
      input: fish_jellyfish
      cook_time: 10s


## Stone Cutter Wood Recipes

Stonecut_Bowl:
    type: item
    material: bowl
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: oak_planks
      3:
        type: stonecutting
        input: dark_oak_log/stripped_dark_oak_log
        output_quantity: 4
      4:
        type: stonecutting
        input: dark_oak_planks
      5:
        type: stonecutting
        input: spruce_log/stripped_spruce_log
        output_quantity: 4
      6:
        type: stonecutting
        input: spruce_planks
      7:
        type: stonecutting
        input: birch_log/stripped_birch_log
        output_quantity: 4
      8:
        type: stonecutting
        input: birch_planks
      9:
        type: stonecutting
        input: jungle_log/stripped_jungle_log
        output_quantity: 4
      10:
        type: stonecutting
        input: jungle_planks
      11:
        type: stonecutting
        input: acacia_log/stripped_acacia_log
        output_quantity: 4
      12:
        type: stonecutting
        input: acacia_planks
      13:
        type: stonecutting
        input: cherry_log/stripped_cherry_log
        output_quantity: 4
      14:
        type: stonecutting
        input: cherry_planks
      15:
        type: stonecutting
        input: mangrove_log/stripped_mangrove_log
        output_quantity: 4
      16:
        type: stonecutting
        input: mangrove_planks
      17:
        type: stonecutting
        input: bamboo_block/stripped_bamboo_block
        output_quantity: 4
      18:
        type: stonecutting
        input: bamboo_planks
      19:
        type: stonecutting
        input: crimson_stem/stripped_crimson_stem
        output_quantity: 4
      20:
        type: stonecutting
        input: crimson_planks
      21:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 4
      22:
        type: stonecutting
        input: warped_planks

Stonecut_Stick:
    type: item
    material: stick
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 8
      2:
        type: stonecutting
        input: oak_planks
        output_quantity: 2
      3:
        type: stonecutting
        input: dark_oak_log/stripped_dark_oak_log
        output_quantity: 8
      4:
        type: stonecutting
        input: dark_oak_planks
        output_quantity: 2
      5:
        type: stonecutting
        input: spruce_log/stripped_spruce_log
        output_quantity: 8
      6:
        type: stonecutting
        input: spruce_planks
        output_quantity: 2
      7:
        type: stonecutting
        input: birch_log/stripped_birch_log
        output_quantity: 8
      8:
        type: stonecutting
        input: birch_planks
        output_quantity: 2
      9:
        type: stonecutting
        input: jungle_log/stripped_jungle_log
        output_quantity: 8
      10:
        type: stonecutting
        input: jungle_planks
        output_quantity: 2
      11:
        type: stonecutting
        input: acacia_log/stripped_acacia_log
        output_quantity: 8
      12:
        type: stonecutting
        input: acacia_planks
        output_quantity: 2
      13:
        type: stonecutting
        input: cherry_log/stripped_cherry_log
        output_quantity: 8
      14:
        type: stonecutting
        input: cherry_planks
        output_quantity: 2
      15:
        type: stonecutting
        input: mangrove_log/stripped_mangrove_log
        output_quantity: 8
      16:
        type: stonecutting
        input: mangrove_planks
        output_quantity: 2
      17:
        type: stonecutting
        input: bamboo_block/stripped_bamboo_block
        output_quantity: 8
      18:
        type: stonecutting
        input: bamboo_planks
        output_quantity: 2
      19:
        type: stonecutting
        input: crimson_stem/stripped_crimson_stem
        output_quantity: 8
      20:
        type: stonecutting
        input: crimson_planks
        output_quantity: 2
      21:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 8
      22:
        type: stonecutting
        input: warped_planks
        output_quantity: 2

Stonecut_Ladder:
    type: item
    material: ladder
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: oak_planks
      3:
        type: stonecutting
        input: dark_oak_log/stripped_dark_oak_log
        output_quantity: 4
      4:
        type: stonecutting
        input: dark_oak_planks
      5:
        type: stonecutting
        input: spruce_log/stripped_spruce_log
        output_quantity: 4
      6:
        type: stonecutting
        input: spruce_planks
      7:
        type: stonecutting
        input: birch_log/stripped_birch_log
        output_quantity: 4
      8:
        type: stonecutting
        input: birch_planks
      9:
        type: stonecutting
        input: jungle_log/stripped_jungle_log
        output_quantity: 4
      10:
        type: stonecutting
        input: jungle_planks
      11:
        type: stonecutting
        input: acacia_log/stripped_acacia_log
        output_quantity: 4
      12:
        type: stonecutting
        input: acacia_planks
      13:
        type: stonecutting
        input: cherry_log/stripped_cherry_log
        output_quantity: 4
      14:
        type: stonecutting
        input: cherry_planks
      15:
        type: stonecutting
        input: mangrove_log/stripped_mangrove_log
        output_quantity: 4
      16:
        type: stonecutting
        input: mangrove_planks
      17:
        type: stonecutting
        input: bamboo_block/stripped_bamboo_block
        output_quantity: 4
      18:
        type: stonecutting
        input: bamboo_planks
      19:
        type: stonecutting
        input: crimson_stem/stripped_crimson_stem
        output_quantity: 4
      20:
        type: stonecutting
        input: crimson_planks
      21:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 4
      22:
        type: stonecutting
        input: warped_planks

# Oak Wood

Stonecut_Stripped_Oak_Log:
    type: item
    material: stripped_oak_log
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log

Stonecut_Stripped_Oak_Wood:
    type: item
    material: stripped_oak_wood
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log

Stonecut_Oak_Boat:
    type: item
    material: oak_boat
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log

Stonecut_Oak_Button:
    type: item
    material: oak_button
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: oak_planks

Stonecut_Oak_Door:
    type: item
    material: oak_door
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: oak_planks

Stonecut_Oak_Fence:
    type: item
    material: oak_fence
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_planks
      2:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 4

Stonecut_Oak_Fence_Gate:
    type: item
    material: oak_fence_gate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
      2:
        type: stonecutting
        input: oak_planks

Stonecut_Oak_Planks:
    type: item
    material: oak_planks
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 4

Stonecut_Oak_Pressure_Plate:
    type: item
    material: oak_pressure_plate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: oak_planks

Stonecut_Oak_Sign:
    type: item
    material: oak_sign
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: oak_planks

Stonecut_Oak_Slab:
    type: item
    material: oak_slab
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 8
      2:
        type: stonecutting
        input: oak_planks
        output_quantity: 2

Stonecut_Oak_Stairs:
    type: item
    material: oak_stairs
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: oak_planks

Stonecut_Oak_Trapdoor:
    type: item
    material: oak_trapdoor
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: oak_log/stripped_oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: oak_planks

# Dark_Oak Wood

Stonecut_Stripped_Dark_Oak_Log:
    type: item
    material: stripped_Dark_Oak_log
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log

Stonecut_Stripped_Dark_Oak_Wood:
    type: item
    material: stripped_Dark_Oak_wood
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log

Stonecut_Dark_Oak_Boat:
    type: item
    material: Dark_Oak_boat
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log/stripped_Dark_Oak_log

Stonecut_Dark_Oak_Button:
    type: item
    material: Dark_Oak_button
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log/stripped_Dark_Oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Dark_Oak_planks

Stonecut_Dark_Oak_Door:
    type: item
    material: Dark_Oak_door
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log/stripped_Dark_Oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Dark_Oak_planks

Stonecut_Dark_Oak_Fence:
    type: item
    material: Dark_Oak_fence
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_planks
      2:
        type: stonecutting
        input: Dark_Oak_log/stripped_Dark_Oak_log
        output_quantity: 4

Stonecut_Dark_Oak_Fence_Gate:
    type: item
    material: Dark_Oak_fence_gate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log/stripped_Dark_Oak_log
      2:
        type: stonecutting
        input: Dark_Oak_planks

Stonecut_Dark_Oak_Planks:
    type: item
    material: Dark_Oak_planks
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log/stripped_Dark_Oak_log
        output_quantity: 4

Stonecut_Dark_Oak_Pressure_Plate:
    type: item
    material: Dark_Oak_pressure_plate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log/stripped_Dark_Oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Dark_Oak_planks

Stonecut_Dark_Oak_Sign:
    type: item
    material: Dark_Oak_sign
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log/stripped_Dark_Oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Dark_Oak_planks

Stonecut_Dark_Oak_Slab:
    type: item
    material: Dark_Oak_slab
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log/stripped_Dark_Oak_log
        output_quantity: 8
      2:
        type: stonecutting
        input: Dark_Oak_planks
        output_quantity: 2

Stonecut_Dark_Oak_Stairs:
    type: item
    material: Dark_Oak_stairs
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log/stripped_Dark_Oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Dark_Oak_planks

Stonecut_Dark_Oak_Trapdoor:
    type: item
    material: Dark_Oak_trapdoor
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Dark_Oak_log/stripped_Dark_Oak_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Dark_Oak_planks

# Spruce Wood

Stonecut_Stripped_Spruce_Log:
    type: item
    material: stripped_Spruce_log
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log

Stonecut_Stripped_Spruce_Wood:
    type: item
    material: stripped_Spruce_wood
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log

Stonecut_Spruce_Boat:
    type: item
    material: Spruce_boat
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log/stripped_Spruce_log

Stonecut_Spruce_Button:
    type: item
    material: Spruce_button
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log/stripped_Spruce_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Spruce_planks

Stonecut_Spruce_Door:
    type: item
    material: Spruce_door
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log/stripped_Spruce_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Spruce_planks

Stonecut_Spruce_Fence:
    type: item
    material: Spruce_fence
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_planks
      2:
        type: stonecutting
        input: Spruce_log/stripped_Spruce_log
        output_quantity: 4

Stonecut_Spruce_Fence_Gate:
    type: item
    material: Spruce_fence_gate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log/stripped_Spruce_log
      2:
        type: stonecutting
        input: Spruce_planks

Stonecut_Spruce_Planks:
    type: item
    material: Spruce_planks
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log/stripped_Spruce_log
        output_quantity: 4

Stonecut_Spruce_Pressure_Plate:
    type: item
    material: Spruce_pressure_plate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log/stripped_Spruce_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Spruce_planks

Stonecut_Spruce_Sign:
    type: item
    material: Spruce_sign
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log/stripped_Spruce_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Spruce_planks

Stonecut_Spruce_Slab:
    type: item
    material: Spruce_slab
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log/stripped_Spruce_log
        output_quantity: 8
      2:
        type: stonecutting
        input: Spruce_planks
        output_quantity: 2

Stonecut_Spruce_Stairs:
    type: item
    material: Spruce_stairs
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log/stripped_Spruce_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Spruce_planks

Stonecut_Spruce_Trapdoor:
    type: item
    material: Spruce_trapdoor
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Spruce_log/stripped_Spruce_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Spruce_planks

# Jungle Wood

Stonecut_Stripped_Jungle_Log:
    type: item
    material: stripped_Jungle_log
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log

Stonecut_Stripped_Jungle_Wood:
    type: item
    material: stripped_Jungle_wood
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log

Stonecut_Jungle_Boat:
    type: item
    material: Jungle_boat
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log/stripped_Jungle_log

Stonecut_Jungle_Button:
    type: item
    material: Jungle_button
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log/stripped_Jungle_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Jungle_planks

Stonecut_Jungle_Door:
    type: item
    material: Jungle_door
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log/stripped_Jungle_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Jungle_planks

Stonecut_Jungle_Fence:
    type: item
    material: Jungle_fence
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_planks
      2:
        type: stonecutting
        input: Jungle_log/stripped_Jungle_log
        output_quantity: 4

Stonecut_Jungle_Fence_Gate:
    type: item
    material: Jungle_fence_gate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log/stripped_Jungle_log
      2:
        type: stonecutting
        input: Jungle_planks

Stonecut_Jungle_Planks:
    type: item
    material: Jungle_planks
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log/stripped_Jungle_log
        output_quantity: 4

Stonecut_Jungle_Pressure_Plate:
    type: item
    material: Jungle_pressure_plate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log/stripped_Jungle_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Jungle_planks

Stonecut_Jungle_Sign:
    type: item
    material: Jungle_sign
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log/stripped_Jungle_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Jungle_planks

Stonecut_Jungle_Slab:
    type: item
    material: Jungle_slab
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log/stripped_Jungle_log
        output_quantity: 8
      2:
        type: stonecutting
        input: Jungle_planks
        output_quantity: 2

Stonecut_Jungle_Stairs:
    type: item
    material: Jungle_stairs
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log/stripped_Jungle_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Jungle_planks

Stonecut_Jungle_Trapdoor:
    type: item
    material: Jungle_trapdoor
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Jungle_log/stripped_Jungle_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Jungle_planks

# Birch Wood

Stonecut_Stripped_Birch_Log:
    type: item
    material: stripped_Birch_log
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log

Stonecut_Stripped_Birch_Wood:
    type: item
    material: stripped_Birch_wood
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log

Stonecut_Birch_Boat:
    type: item
    material: Birch_boat
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log/stripped_Birch_log

Stonecut_Birch_Button:
    type: item
    material: Birch_button
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log/stripped_Birch_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Birch_planks

Stonecut_Birch_Door:
    type: item
    material: Birch_door
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log/stripped_Birch_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Birch_planks

Stonecut_Birch_Fence:
    type: item
    material: Birch_fence
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_planks
      2:
        type: stonecutting
        input: Birch_log/stripped_Birch_log
        output_quantity: 4

Stonecut_Birch_Fence_Gate:
    type: item
    material: Birch_fence_gate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log/stripped_Birch_log
      2:
        type: stonecutting
        input: Birch_planks

Stonecut_Birch_Planks:
    type: item
    material: Birch_planks
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log/stripped_Birch_log
        output_quantity: 4

Stonecut_Birch_Pressure_Plate:
    type: item
    material: Birch_pressure_plate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log/stripped_Birch_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Birch_planks

Stonecut_Birch_Sign:
    type: item
    material: Birch_sign
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log/stripped_Birch_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Birch_planks

Stonecut_Birch_Slab:
    type: item
    material: Birch_slab
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log/stripped_Birch_log
        output_quantity: 8
      2:
        type: stonecutting
        input: Birch_planks
        output_quantity: 2

Stonecut_Birch_Stairs:
    type: item
    material: Birch_stairs
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log/stripped_Birch_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Birch_planks

Stonecut_Birch_Trapdoor:
    type: item
    material: Birch_trapdoor
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Birch_log/stripped_Birch_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Birch_planks

# Acacia Wood

Stonecut_Stripped_Acacia_Log:
    type: item
    material: stripped_Acacia_log
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log

Stonecut_Stripped_Acacia_Wood:
    type: item
    material: stripped_Acacia_wood
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log

Stonecut_Acacia_Boat:
    type: item
    material: Acacia_boat
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log/stripped_Acacia_log

Stonecut_Acacia_Button:
    type: item
    material: Acacia_button
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log/stripped_Acacia_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Acacia_planks

Stonecut_Acacia_Door:
    type: item
    material: Acacia_door
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log/stripped_Acacia_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Acacia_planks

Stonecut_Acacia_Fence:
    type: item
    material: Acacia_fence
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_planks
      2:
        type: stonecutting
        input: Acacia_log/stripped_Acacia_log
        output_quantity: 4

Stonecut_Acacia_Fence_Gate:
    type: item
    material: Acacia_fence_gate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log/stripped_Acacia_log
      2:
        type: stonecutting
        input: Acacia_planks

Stonecut_Acacia_Planks:
    type: item
    material: Acacia_planks
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log/stripped_Acacia_log
        output_quantity: 4

Stonecut_Acacia_Pressure_Plate:
    type: item
    material: Acacia_pressure_plate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log/stripped_Acacia_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Acacia_planks

Stonecut_Acacia_Sign:
    type: item
    material: Acacia_sign
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log/stripped_Acacia_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Acacia_planks

Stonecut_Acacia_Slab:
    type: item
    material: Acacia_slab
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log/stripped_Acacia_log
        output_quantity: 8
      2:
        type: stonecutting
        input: Acacia_planks
        output_quantity: 2

Stonecut_Acacia_Stairs:
    type: item
    material: Acacia_stairs
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log/stripped_Acacia_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Acacia_planks

Stonecut_Acacia_Trapdoor:
    type: item
    material: Acacia_trapdoor
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Acacia_log/stripped_Acacia_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Acacia_planks

# Cherry Wood

Stonecut_Stripped_Cherry_Log:
    type: item
    material: stripped_Cherry_log
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log

Stonecut_Stripped_Cherry_Wood:
    type: item
    material: stripped_Cherry_wood
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log

Stonecut_Cherry_Boat:
    type: item
    material: Cherry_boat
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log/stripped_Cherry_log

Stonecut_Cherry_Button:
    type: item
    material: Cherry_button
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log/stripped_Cherry_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Cherry_planks

Stonecut_Cherry_Door:
    type: item
    material: Cherry_door
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log/stripped_Cherry_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Cherry_planks

Stonecut_Cherry_Fence:
    type: item
    material: Cherry_fence
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_planks
      2:
        type: stonecutting
        input: Cherry_log/stripped_Cherry_log
        output_quantity: 4

Stonecut_Cherry_Fence_Gate:
    type: item
    material: Cherry_fence_gate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log/stripped_Cherry_log
      2:
        type: stonecutting
        input: Cherry_planks

Stonecut_Cherry_Planks:
    type: item
    material: Cherry_planks
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log/stripped_Cherry_log
        output_quantity: 4

Stonecut_Cherry_Pressure_Plate:
    type: item
    material: Cherry_pressure_plate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log/stripped_Cherry_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Cherry_planks

Stonecut_Cherry_Sign:
    type: item
    material: Cherry_sign
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log/stripped_Cherry_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Cherry_planks

Stonecut_Cherry_Slab:
    type: item
    material: Cherry_slab
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log/stripped_Cherry_log
        output_quantity: 8
      2:
        type: stonecutting
        input: Cherry_planks
        output_quantity: 2

Stonecut_Cherry_Stairs:
    type: item
    material: Cherry_stairs
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log/stripped_Cherry_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Cherry_planks

Stonecut_Cherry_Trapdoor:
    type: item
    material: Cherry_trapdoor
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Cherry_log/stripped_Cherry_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Cherry_planks

# Mangrove Wood

Stonecut_Stripped_Mangrove_Log:
    type: item
    material: stripped_Mangrove_log
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log

Stonecut_Stripped_Mangrove_Wood:
    type: item
    material: stripped_Mangrove_wood
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log

Stonecut_Mangrove_Boat:
    type: item
    material: Mangrove_boat
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log

Stonecut_Mangrove_Button:
    type: item
    material: Mangrove_button
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Mangrove_planks

Stonecut_Mangrove_Door:
    type: item
    material: Mangrove_door
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Mangrove_planks

Stonecut_Mangrove_Fence:
    type: item
    material: Mangrove_fence
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_planks
      2:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log
        output_quantity: 4

Stonecut_Mangrove_Fence_Gate:
    type: item
    material: Mangrove_fence_gate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log
      2:
        type: stonecutting
        input: Mangrove_planks

Stonecut_Mangrove_Planks:
    type: item
    material: Mangrove_planks
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log
        output_quantity: 4

Stonecut_Mangrove_Pressure_Plate:
    type: item
    material: Mangrove_pressure_plate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Mangrove_planks

Stonecut_Mangrove_Sign:
    type: item
    material: Mangrove_sign
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Mangrove_planks

Stonecut_Mangrove_Slab:
    type: item
    material: Mangrove_slab
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log
        output_quantity: 8
      2:
        type: stonecutting
        input: Mangrove_planks
        output_quantity: 2

Stonecut_Mangrove_Stairs:
    type: item
    material: Mangrove_stairs
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Mangrove_planks

Stonecut_Mangrove_Trapdoor:
    type: item
    material: Mangrove_trapdoor
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Mangrove_log/stripped_mangrove_log
        output_quantity: 4
      2:
        type: stonecutting
        input: Mangrove_planks

# Warped Wood

Stonecut_Stripped_warped_stem:
    type: item
    material: stripped_warped_stem
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: warped_stem/stripped_warped_stem

Stonecut_Stripped_Warped_Wood:
    type: item
    material: stripped_warped_hyphae
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: warped_stem/stripped_warped_stem

Stonecut_Warped_Button:
    type: item
    material: Warped_button
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Warped_planks

Stonecut_Warped_Door:
    type: item
    material: Warped_door
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Warped_planks

Stonecut_Warped_Fence:
    type: item
    material: Warped_fence
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Warped_planks
      2:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 4

Stonecut_Warped_Fence_Gate:
    type: item
    material: Warped_fence_gate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
      2:
        type: stonecutting
        input: Warped_planks

Stonecut_Warped_Planks:
    type: item
    material: Warped_planks
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 4

Stonecut_Warped_Pressure_Plate:
    type: item
    material: Warped_pressure_plate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Warped_planks

Stonecut_Warped_Sign:
    type: item
    material: Warped_sign
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Warped_planks

Stonecut_Warped_Slab:
    type: item
    material: Warped_slab
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 8
      2:
        type: stonecutting
        input: Warped_planks
        output_quantity: 2

Stonecut_Warped_Stairs:
    type: item
    material: Warped_stairs
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Warped_planks

Stonecut_Warped_Trapdoor:
    type: item
    material: Warped_trapdoor
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: warped_stem/stripped_warped_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Warped_planks

# Crimson Wood

Stonecut_Stripped_Crimson_Stem:
    type: item
    material: stripped_Crimson_Stem
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: crimson_stem

Stonecut_stripped_crimson_hyphae:
    type: item
    material: stripped_crimson_hyphae
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: crimson_stem

Stonecut_Crimson_Button:
    type: item
    material: Crimson_button
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Crimson_stem/stripped_crimson_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Crimson_planks

Stonecut_Crimson_Door:
    type: item
    material: Crimson_door
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Crimson_stem/stripped_crimson_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Crimson_planks

Stonecut_Crimson_Fence:
    type: item
    material: Crimson_fence
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Crimson_planks
      2:
        type: stonecutting
        input: Crimson_stem/stripped_crimson_stem
        output_quantity: 4

Stonecut_Crimson_Fence_Gate:
    type: item
    material: Crimson_fence_gate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Crimson_stem/stripped_crimson_stem
      2:
        type: stonecutting
        input: Crimson_planks

Stonecut_Crimson_Planks:
    type: item
    material: Crimson_planks
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Crimson_stem/stripped_crimson_stem
        output_quantity: 4

Stonecut_Crimson_Pressure_Plate:
    type: item
    material: Crimson_pressure_plate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Crimson_stem/stripped_crimson_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Crimson_planks

Stonecut_Crimson_Sign:
    type: item
    material: Crimson_sign
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Crimson_stem/stripped_crimson_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Crimson_planks

Stonecut_Crimson_Slab:
    type: item
    material: Crimson_slab
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Crimson_stem/stripped_crimson_stem
        output_quantity: 8
      2:
        type: stonecutting
        input: Crimson_planks
        output_quantity: 2

Stonecut_Crimson_Stairs:
    type: item
    material: Crimson_stairs
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Crimson_stem/stripped_crimson_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Crimson_planks

Stonecut_Crimson_Trapdoor:
    type: item
    material: Crimson_trapdoor
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Crimson_stem/stripped_crimson_stem
        output_quantity: 4
      2:
        type: stonecutting
        input: Crimson_planks

# Bamboo Wood

Stonecut_Stripped_Bamboo_Block:
    type: item
    material: stripped_Bamboo_Block
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_Block

Stonecut_Bamboo_Raft:
    type: item
    material: bamboo_raft
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_Block/Stripped_Bamboo_Block

Stonecut_Bamboo_Button:
    type: item
    material: Bamboo_button
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_Block/Stripped_Bamboo_Block
        output_quantity: 4
      2:
        type: stonecutting
        input: Bamboo_planks

Stonecut_Bamboo_Door:
    type: item
    material: Bamboo_door
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_Block/Stripped_Bamboo_Block
        output_quantity: 4
      2:
        type: stonecutting
        input: Bamboo_planks

Stonecut_Bamboo_Fence:
    type: item
    material: Bamboo_fence
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_planks
      2:
        type: stonecutting
        input: Bamboo_Block/Stripped_Bamboo_Block
        output_quantity: 4

Stonecut_Bamboo_Fence_Gate:
    type: item
    material: Bamboo_fence_gate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_Block/Stripped_Bamboo_Block
      2:
        type: stonecutting
        input: Bamboo_planks

Stonecut_Bamboo_Planks:
    type: item
    material: Bamboo_planks
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_Block/Stripped_Bamboo_Block
        output_quantity: 4

Stonecut_Bamboo_Pressure_Plate:
    type: item
    material: Bamboo_pressure_plate
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_Block/Stripped_Bamboo_Block
        output_quantity: 4
      2:
        type: stonecutting
        input: Bamboo_planks

Stonecut_Bamboo_Sign:
    type: item
    material: Bamboo_sign
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_Block/Stripped_Bamboo_Block
        output_quantity: 4
      2:
        type: stonecutting
        input: Bamboo_planks

Stonecut_Bamboo_Slab:
    type: item
    material: Bamboo_slab
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_Block/Stripped_Bamboo_Block
        output_quantity: 8
      2:
        type: stonecutting
        input: Bamboo_planks
        output_quantity: 2

Stonecut_Bamboo_Stairs:
    type: item
    material: Bamboo_stairs
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_Block/Stripped_Bamboo_Block
        output_quantity: 4
      2:
        type: stonecutting
        input: Bamboo_planks

Stonecut_Bamboo_Trapdoor:
    type: item
    material: Bamboo_trapdoor
    no_id: true
    recipes:
      1:
        type: stonecutting
        input: Bamboo_Block/Stripped_Bamboo_Block
        output_quantity: 4
      2:
        type: stonecutting
        input: Bamboo_planks
