# This file houses the recipes for the aclohol system for the project.

# First Created 4/3/2025

## Mixer Recipes

Alcohol_Mixer_Ingredients:
    type: data
    ingredients:
        - new_wheat
        - new_potato
        - new_carrot
        - new_apple
        - new_sweet_berry
        - new_beetroot
        - new_melon_slice

Alcohol_Mixer_Recipes:
    type: data
    recipes:
        potato_mash:
            ingredients:
                - new_potato-10
            fluid: water-10
            stir: 12
            output: potato_mash-4
        wheat_wort:
            ingredients:
                - new_wheat-10
            fluid: water-10
            stir: 18
            output: wheat_wort-4
        apple_juice:
            ingredients:
                - new_apple-5
            fluid: water-1
            stir: 12
            output: apple_juice-2
        sweet_berry_juice:
            ingredients:
                - new_sweet_berry-5
            fluid: water-1
            stir: 12
            output: sweet_berry_juice-2
        melon_juice:
            ingredients:
                - new_melon_slice-10
            fluid: water-1
            stir: 12
            output: melon_juice-2
        ## Commented out until new crops are added
        #malt_wort:
        #    ingredients:
        #        - barley-10
        #    fluid: water-10
        #    stir: 12
        #    output: malt_wort-4
        #blueberry_juice:
        #    ingredients:
        #        - blueberry-5
        #    fluid: water-1
        #    stir: 12
        #    output: blueberry_juice-2
        #strawberry_juice:
        #    ingredients:
        #        - strawberry-10
        #    fluid: water-1
        #    stir: 12
        #    output: strawberry_juice-2
        #blackberry_juice:
        #    ingredients:
        #        - blackberry-10
        #    fluid: water-1
        #    stir: 12
        #    output: blackberry_juice-2
        #cranberry_juice:
        #    ingredients:
        #        - cranberry-10
        #    fluid: water-1
        #    stir: 12
        #    output: cranberry_juice-2
        #mulberry_juice:
        #    ingredients:
        #        - mulberry-10
        #    fluid: water-1
        #    stir: 12
        #    output: mulberry_juice-2
        #raspberry_juice:
        #    ingredients:
        #        - raspberry-10
        #    fluid: water-1
        #    stir: 12
        #    output: raspberry_juice-2
        #gooseberry_juice:
        #    ingredients:
        #        - gooseberry-10
        #    fluid: water-1
        #    stir: 12
        #    output: gooseberry_juice-2


## Fermenting Recipes

Alcohol_Fermenter_Conversions:
    type: data
    recipes:
        potato_mash: vodka
        wheat_wort: grain_beer