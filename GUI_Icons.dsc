# This file includes all the icons our server uses for GUIs in menus to be 
# reused or referenced easily in an organized manner.

# Last Update: 09/19/2023

# Each icon will be seperated into categories according to their relative source that they were used for.

#Generic Icons

GUINull:
    type: item
    material: gray_stained_glass_pane
    display name: <green>
GUIReturn:
    type: item
    material: brick
    display name: <light_purple><bold>Return to Menu
    mechanisms:
      custom_model_data: 1
GUIL:
    type: item
    material: brick
    display name: <red>Previous Page
    mechanisms:
      custom_model_data: 3
GUIR:
    type: item
    material: brick
    display name: <green>Next Page
    mechanisms:
      custom_model_data: 2

#Character GUI Icons
charactericon:
    type: item
    material: Player_Head
    display name: <green>Character
traitsicon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Traits
    flags:
      inventory1: customizer
    lore:
    - "<green>As you gain traits they will appear here."
skillsicon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Skills
    flags:
      inventory1: skills1
    lore:
    - "<green>As you discover skills they will appear here."
spellsicon1:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Spells
    flags:
      inventory1: spell5
    lore:
    - "<green>As you discover spells they will appear here."
attributesicon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Attributes
    flags:
      inventory1: attributes
    lore:
    - "<green>Attributes appear here."
customcomplete:
    type: item
    material: green_stained_glass_pane
    display name: <green>Complete
    flags:
      complete: 1

heritagespellsicon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Heritage Spells
    flags:
      inventory1: heritage
    lore:
    - "<blue>Spells you inherited with your race."
godspellsicon:
    type: item
    material: yellow_stained_glass_pane
    display name: <green>Divine Spells
    flags:
      inventory1: god
    lore:
    - "<blue>Spells you recieved from your god."
classspellsicon:
    type: item
    material: green_stained_glass_pane
    display name: <green>Class Spells
    flags:
      inventory1: class
    lore:
    - "<blue>Spells earned from your class."


#Skill Icons

HandcombatIcon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Hand Combat
    mechanisms:
      custom_model_data: 1
    lore:
    - "<green>Increases Strength."
    flags:
      trait: Hand Combat
MiningIcon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Mining
    mechanisms:
      custom_model_data: 2
    lore:
    - "<green>Chances of getting custom ores."
    - "<green>Increases Strength."
    flags:
      trait: Mining
AgilityIcon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Agility
    mechanisms:
      custom_model_data: 3
    lore:
    - "<green>Increases Dexterity."
    flags:
      trait: Agility
CraftingIcon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Crafting
    mechanisms:
      custom_model_data: 4
    lore:
    - "<green>Increases Intelligence."
    flags:
      trait: Crafting
CookingIcon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Cooking
    mechanisms:
      custom_model_data: 5
    lore:
    - "<green>Increases Wisdom."
    flags:
      trait: Cooking
FishingIcon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Fishing
    mechanisms:
      custom_model_data: 6
    lore:
    - "<green>Increases ?."
    flags:
      trait: Fishing

#Class Icons

#Trait Icons

clarity_icon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Clarity
    lore:
    - "<green>Cannot gain potion effects."
    flags:
      trait: trait_clarity
forestfolk_icon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Forest Folk
    lore:
    - "<green>Walk faster in hot biomes."
    flags:
      trait: speedbonus_hot
hardworking_icon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>EXP Bonus
    lore:
    - "<green>Gain more EXP from skill tasks."
    flags:
      trait: expgain
frailtyicon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Frailty
    lore:
    - "<green>Take more damage from physical attacks."
    flags:
      trait: vulnerable
magic_resicon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Magic Resistance
    lore:
    - "<green>Take more damage from physical attacks."
    flags:
      trait: vulnerable
ATTK_icon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Arrow to the Knee
    lore:
    - "<green>Lower maximum stamina."
    flags:
      trait: ATTK
heat_res_icon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Heat Resistance
    lore:
    - "<green>Resistance to heat."
    flags:
      trait: heatres
cold_res_icon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Heat Resistance
    lore:
    - "<green>Resistance to cold."
    flags:
      trait: coldres
flight_icon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Flight
    lore:
    - "<green>Double jump to enable flight for 5 stamina."
    - "<green>Use left click to boost while flying for 10 stamina."
    flags:
      trait: flight
FaeFlight_icon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Fae Flight
    lore:
    - "<green>Double jump to enable flight for 5 mana."
    - "<green>Use left click to boost while flying for 10 mana."
    flags:
      trait: Fae Flight
reach_icon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Maximum Reach
    lore:
    - "<green>How far away you can interact with blocks and entities."
    flags:
      trait: reach
MagicTheoryGUIIcon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Magic Theory
    lore:
    - "<green>The knowledge you have of magic theory."
    - "<green>Can be useful to learn spells."
    flags:
      trait: Magic Theory
FireResIcon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Fire Resistance
    lore:
    - "<green>You take less damage from fire damage."
    flags:
      trait: Fire_res
Burden_Manaicon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Mana Burden
    lore:
    - "<green>The ability to control mana."
    - "<green>(Mana Regeneration)"
    flags:
      trait: burden_mana
CommonGUIIcon:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Common
    lore:
    - "<green>The ability to read and write in common."
    flags:
      trait: Common
ElvishGUIIcon:
    type: item
    material: green_stained_glass_pane
    display name: <green>Elvish
    lore:
    - "<green>The ability to read and write in Elvish."
    flags:
      trait: Elvish
hunterinsighttrait:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Hunters Insight
    flags:
      trait: Hunters Insight
    lore:
    - "<green>When aiming with a bow zoom in further."
heartystomachtrait:
    type: item
    material: orange_stained_glass_pane
    display name: <green>Hearty Stomach
    flags:
      trait: Hearty Stomach
    lore:
    - "<green>Gain 1 additional food value when consuming anything."

#Cooking Icons

CookingReturn:
    type: item
    material: brick
    display name: <light_purple><bold>Return to Index
    mechanisms:
      custom_model_data: 1

CookingButtonR:
    type: item
    material: brick
    display name: <green>Next Page
    mechanisms:
      custom_model_data: 2

CookingButtonL:
    type: item
    material: brick
    display name: <red>Previous Page
    mechanisms:
      custom_model_data: 3

CookingNull:
    type: item
    material: brick
    display name: <gray>
    mechanisms:
      custom_model_data: 4

CookingIndex:
    type: item
    material: brick
    display name: <light_purple><bold>Index
    mechanisms:
      custom_model_data: 5

CookingTool:
    type: item
    material: brick
    display name: <green><bold>Tools
    mechanisms:
      custom_model_data: 6

CookingDairy:
    type: item
    material: brick
    display name: <green><bold>Dairy
    mechanisms:
      custom_model_data: 7

CookingFruit:
    type: item
    material: brick
    display name: <green><bold>Fruits
    mechanisms:
      custom_model_data: 8

CookingGrain:
    type: item
    material: brick
    display name: <green><bold>Grains
    mechanisms:
      custom_model_data: 9

CookingProtein:
    type: item
    material: brick
    display name: <green><bold>Proteins
    mechanisms:
      custom_model_data: 10

CookingVegetable:
    type: item
    material: brick
    display name: <green><bold>Vegetables
    mechanisms:
      custom_model_data: 11

CookingSugar:
    type: item
    material: brick
    display name: <green><bold>Sugars
    mechanisms:
      custom_model_data: 12

CookingMisc:
    type: item
    material: brick
    display name: <green><bold>Miscellaneous
    mechanisms:
      custom_model_data: 13

CookingStorage:
    type: item
    material: brick
    display name: <green><bold>Storage
    mechanisms:
      custom_model_data: 14

CookingSeed:
    type: item
    material: brick
    display name: <green><bold>Seeds
    mechanisms:
      custom_model_data: 15

CookingNutrition:
    type: item
    material: brick
    display name: <Gold><bold>Nutrition
    mechanisms:
      custom_model_data: 16

CookingNutritionOpt:
    type: item
    material: brick
    display name: <white>Opt In Status: <red><bold>FALSE
    mechanisms:
      custom_model_data: 17
    lore:
    - <white>You have not opted into the nutrition system.
    - <white>You will <red>not <white>recieve boons or negatives to your nutritional habits.
    - <empty>
    - <white>If you use the command <green><bold>/nutritionopt <white>then you will opt into the system.
    - <light_purple>You can also just click this button!
    - <empty>
    - <white>This is not mandatory to play the game and is only a voluntary addition to the experience.
CookingNutritionTier:
    type: item
    material: brick
    display name: <White>Nutrition Tier<&co> <Red><bold>DISABLED
    mechanisms:
      custom_model_data: 18
    lore:
    - <white>You have not opted into the nutrition system.
    - <white>You will <red>not <white>recieve boons or negatives to your nutritional habits.
    - <empty>
    - <white>If you use the command <green><bold>/nutritionopt <white>then you will opt into the system.
    - <light_purple>You can also just click this button!
    - <empty>
    - <white>This is not mandatory to play the game and is only a voluntary addition to the experience.

CookingDye:
    type: item
    material: brick
    display name: <green><bold>Dyes
    mechanisms:
      custom_model_data: 62
