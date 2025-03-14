# This file contains mobs and items and scripts related to Ogres.

# First Created: 3/10/2025

Ogre_Mob_Spawn:
    type: world
    events:
        after mythicmob Ogre_Arbalest spawns:
        #- disguise <context.entity> as
        - adjust <context.entity> item_in_hand:<item[crossbow]>