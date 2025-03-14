# This file contains mobs and items and scripts related to Ogres.

# First Created: 3/10/2025

Ogre_Mob_Spawn:
    type: world
    events:
        after mythicmob Ogre_Arbalest spawns:
        #- disguise <context.entity> as
        - adjust <context.entity> item_in_hand:<item[crossbow]>
        after mythicmob Ogre_Brute spawns:
        - define entity <context.entity>
        - adjust <context.entity> item_in_hand:<item[iron_axe]>
        - equip <[entity]> head:<item[crafted_leather_helmet]>
        - equip <[entity]> chest:<item[iron_chestplate]>
        - equip <[entity]> legs:<item[crafted_leather_leggings]>
        - equip <[entity]> boots:<item[crafted_leather_boots]>
        after mythicmob Ogre spawns:
        - define entity <context.entity>
        - adjust <context.entity> item_in_hand:<item[wooden_axe]>
        - if <util.random_chance[50]>:
          - adjust <context.entity> item_in_hand:<item[stone_axe]>
        - if <util.random_chance[50]>:
          - equip <[entity]> head:<item[crafted_leather_helmet]>
        - equip <[entity]> legs:<item[crafted_leather_leggings]>
        - equip <[entity]> boots:<item[crafted_leather_boots]>
#        after mythicmob Ogre spawns:
#        - disguise <context.entity> as:player[skin=<script[Ogre_Skins].data_key[skins].random>]
#
#Ogre_Skins:
#    type: data
#    skins:
#    - bMuX1M3nDjCAEpa39VwYZUGYIl4k0p3Z2Nh3n3Ktc39F2pt1n3Eqde7aFY7O01bgMHU0z6qFSK8CpEcTaV5seFiZ7ukC8+MIDQyP8qlsYMD+cBxcVMVGdfUYGYnMPf3l5c09XCea90mEGOpGYOQxMgns6oXANkk8rNAewwCuCjUEc9oCvTjdpiduzrnZrsS6wGfiU/6Ef3TK7g1r9PYsBn7M3z46u12pOnZzDBo78GaZSdDbmPiIHdaBVx08Adghz+O4e4xL7igWaxHG712lPhMF/Usw8irg1sXSnO72gyXPu8Uw1d5SFxHYUWlbwMkE/HJNe8yFuymiQxkQQMtIDRVEUz83xKMBT5ogv9polwvh+zvElJkrMKDEq4RuhLhqgR+W0SbEHoTKCNKgxxbIC7cY9KCo0kSXEHjo0LZ41Y/xSga703Lb2/aQJv59J+lePUzqp/kqjszhhhvJLLFT41tSuviAiMgHmnfYUC6dYbt33frxFBapk0ciHVWSYTIbod+hEWYakJqXEB8I++s+OMCPsnL/smxtjcroL1YJRKCGo/2AsGoy0qWSVMnxcqzuQZ9Tv9+xObtlkJYMYCAhBvLKYvKV/u8BdQQw9L996938DcJKwIBQlUDS/J7vfPYqAkGy8+SIx+iKRZ/EgCk7qo/jY09lCZe3Q6FCTjN3Rt8=