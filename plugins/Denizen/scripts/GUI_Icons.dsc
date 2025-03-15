# This file includes all the icons our server uses for GUIs in menus to be
# reused or referenced easily in an organized manner.

# Last Update: 09/19/2023

# Each icon will be seperated into categories according to their relative source that they were used for.

#Generic Icons

GUINull:
    type: item
    debug: false
    material: gray_stained_glass_pane
    display name: <green>
GUIReturn:
    type: item
    debug: false
    material: brick
    display name: <light_purple><bold>Return to Menu
    mechanisms:
      custom_model_data: 1
GUIL:
    type: item
    debug: false
    material: brick
    display name: <red>Previous Page
    mechanisms:
      custom_model_data: 3
GUIR:
    type: item
    debug: false
    material: brick
    display name: <green>Next Page
    mechanisms:
      custom_model_data: 2


#Skill Icons

HandcombatIcon:
    type: item
    debug: false
    material: orange_stained_glass_pane
    display name: <green>Hand Combat
    mechanisms:
      custom_model_data: 1
    lore:
    - <green>Increases Strength.
    flags:
      trait: Hand Combat
MiningIcon:
    type: item
    debug: false
    material: orange_stained_glass_pane
    display name: <green>Mining
    mechanisms:
      custom_model_data: 2
    lore:
    - <green>Chances of getting custom ores.
    - <green>Increases Strength.
    flags:
      trait: Mining
AgilityIcon:
    type: item
    debug: false
    material: orange_stained_glass_pane
    display name: <green>Agility
    mechanisms:
      custom_model_data: 3
    lore:
    - <green>Increases Dexterity.
    flags:
      trait: Agility
CraftingIcon:
    type: item
    debug: false
    material: orange_stained_glass_pane
    display name: <green>Crafting
    mechanisms:
      custom_model_data: 4
    lore:
    - <green>Increases Intelligence.
    flags:
      trait: Crafting
CookingIcon:
    type: item
    debug: false
    material: orange_stained_glass_pane
    display name: <green>Cooking
    mechanisms:
      custom_model_data: 5
    lore:
    - <green>Increases Wisdom.
    flags:
      trait: Cooking
FishingIcon:
    type: item
    debug: false
    material: orange_stained_glass_pane
    display name: <green>Fishing
    mechanisms:
      custom_model_data: 6
    lore:
    - <green>Increases ?.
    flags:
      trait: Fishing

CookingReturn:
    type: item
    debug: false
    material: brick
    display name: <light_purple><bold>Return to Index
    mechanisms:
      custom_model_data: 1

CookingButtonR:
    type: item
    debug: false
    material: brick
    display name: <green>Next Page
    mechanisms:
      custom_model_data: 2

CookingButtonL:
    type: item
    debug: false
    material: brick
    display name: <red>Previous Page
    mechanisms:
      custom_model_data: 3

CookingNull:
    type: item
    debug: false
    material: brick
    display name: <gray>
    mechanisms:
      custom_model_data: 4

CookingIndex:
    type: item
    debug: false
    material: brick
    display name: <light_purple><bold>Index
    mechanisms:
      custom_model_data: 5

CookingTool:
    type: item
    debug: false
    material: brick
    display name: <green><bold>Tools
    mechanisms:
      custom_model_data: 6

CookingDairy:
    type: item
    debug: false
    material: brick
    display name: <green><bold>Dairy
    mechanisms:
      custom_model_data: 7

CookingFruit:
    type: item
    debug: false
    material: brick
    display name: <green><bold>Fruits
    mechanisms:
      custom_model_data: 8

CookingGrain:
    type: item
    debug: false
    material: brick
    display name: <green><bold>Grains
    mechanisms:
      custom_model_data: 9

CookingProtein:
    type: item
    debug: false
    material: brick
    display name: <green><bold>Proteins
    mechanisms:
      custom_model_data: 10

CookingVegetable:
    type: item
    debug: false
    material: brick
    display name: <green><bold>Vegetables
    mechanisms:
      custom_model_data: 11

CookingSugar:
    type: item
    debug: false
    material: brick
    display name: <green><bold>Sugars
    mechanisms:
      custom_model_data: 12

CookingMisc:
    type: item
    debug: false
    material: brick
    display name: <green><bold>Miscellaneous
    mechanisms:
      custom_model_data: 13

CookingStorage:
    type: item
    debug: false
    material: brick
    display name: <green><bold>Storage
    mechanisms:
      custom_model_data: 14

CookingSeed:
    type: item
    debug: false
    material: brick
    display name: <green><bold>Seeds
    mechanisms:
      custom_model_data: 15

CookingNutrition:
    type: item
    debug: false
    material: brick
    display name: <Gold><bold>Nutrition
    mechanisms:
      custom_model_data: 16

CookingNutritionOpt:
    type: item
    debug: false
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
    debug: false
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
    debug: false
    material: brick
    display name: <green><bold>Dyes
    mechanisms:
      custom_model_data: 62
