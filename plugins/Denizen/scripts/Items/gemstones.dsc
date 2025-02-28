# This file is the item storage location of the Gemstones used for the server.

# First Created: 8/7/2024

Geode:
    type: item
    material: brick
    display name: <gray>Geode
    mechanisms:
      components_patch:
        item_model: string:materials:ore/geode
    lore:
    - <gold>A solid rock with possible gemstones inside.

Ice_Gemstone:
    type: item
    material: brick
    display name: <aqua>Ice Gemstone
    mechanisms:
      custom_model_data: 30020
    flags:
      gem: ice
    lore:
    - <gold>This is a testing texture and stone.

Fire_Gemstone:
    type: item
    material: brick
    display name: <red>Fire Gemstone
    mechanisms:
      custom_model_data: 30021
    flags:
      gem: fire
    lore:
    - <gold>This is a testing texture and stone.

Earth_Gemstone:
    type: item
    material: brick
    display name: <&color[#704000]>Earth Gemstone
    mechanisms:
      custom_model_data: 30022
    flags:
      gem: earth
    lore:
    - <gold>This is a testing texture and stone.

Air_Gemstone:
    type: item
    material: brick
    display name: <&color[#eeff70]>Air Gemstone
    mechanisms:
      custom_model_data: 30023
    flags:
      gem: air
    lore:
    - <gold>This is a testing texture and stone.