SomniData_Ruined_City:
  type: data
  origin: ruinedcitypos3
  pos2: ruinedcitypos4
  area: ruinedcity2
  chunks: 7x7
  dungeon_core:
    type: dungeoncore
    pos:
      - 95|2|-72
      - 78|19|-58
      - 101|11|-21
      - 18|12|-37
      - 95|17|-58
    health: 10
    area: ruinedcity2
    somni: Ruined_City
  exit_portal:
    type: returnportal
    pos1: 66|2|-101
    somni: Ruined_City
  #Ruined Skeleton
  spawner1:
    type: mobspawner
    pos1: 63|14|-50
    id: ruinedcity1
    health: 10
    somni: ruined_city
  #Ruined Zombie
  spawner2:
    type: mobspawner
    pos1: 45|13|-26
    id: ruinedcity2
    health: 10
    somni: ruined_city
  #Ruined Zombie
  spawner3:
    type: mobspawner
    pos1: 39|13|-48
    id: ruinedcity3
    health: 10
    somni: ruined_city
  #Ruined Zombie
  spawner4:
    type: mobspawner
    pos1: 51|13|-64
    id: ruinedcity4
    health: 10
    somni: ruined_city
  #Ruined Zombie
  spawner5:
    type: mobspawner
    pos1: 50|17|-63
    id: ruinedcity5
    health: 10
    somni: ruined_city
  #Ruined Zombie
  spawner6:
    type: mobspawner
    pos1: 78|13|-76
    id: ruinedcity6
    health: 10
    somni: ruined_city
  #Ruined Skeleton
  spawner7:
    type: mobspawner
    pos1: 93|16|-73
    id: ruinedcity7
    health: 10
    somni: ruined_city
  #Ruined Witch
  spawner8:
    type: mobspawner
    pos1: 75|13|-86
    id: ruinedcity8
    health: 10
    somni: ruined_city
  #Ruined Skeleton
  spawner9:
    type: mobspawner
    pos1: 88|13|-87
    id: ruinedcity9
    health: 10
    somni: ruined_city
  #Ruined Vindicator
  spawner10:
      type: mobspawner
      pos1: 63|2|-61
      id: ruinedcity10
      health: 10
      somni: ruined_city
  #Ruined Pillager
  spawner11:
      type: mobspawner
      pos1: 90|2|-88
      id: ruinedcity11
      health: 10
      somni: ruined_city
  #Ruined Zombie
  spawner12:
      type: mobspawner
      pos1: 53|16|-89
      id: ruinedcity12
      health: 10
      somni: ruined_city
  #Ruined Zombie
  spawner13:
      type: mobspawner
      pos1: 74|2|-24
      id: ruinedcity13
      health: 10
      somni: ruined_city
  horsespawn1:
    type: mob
    pos1: 105|11|-81
    mob: horse
  horsespawn2:
    type: mob
    pos1: 106|11|-77
    mob: horse
  lootchestgear1:
    type: chest
    pos1: 21|13|-38
    facing: east
    table: ruinedcitygear
  lootchestgear2:
    type: chest
    pos1: 46|23|-29
    facing: east
    table: ruinedcitygear
  lootchestgear3:
    type: chest
    pos1: 76|2|-25
    facing: west
    table: ruinedcitygear
  lootchestfood1:
    type: chest
    pos1: 70|11|-53
    facing: east
    table: ruinedcityfood
  lootchestfood2:
    type: chest
    pos1: 76|16|-82
    facing: north
    table: ruinedcityfood
  lootchestfood3:
    type: chest
    pos1: 62|10|-38
    facing: north
    table: ruinedcityfood
  lootchestfood4:
    type: chest
    pos1: 73|9|-14
    facing: north
    table: ruinedcityfood
  lootchestblocks1:
    type: chest
    pos1: 72|13|-66
    facing: north
    table: ruinedcityblocks
  lootchestblocks2:
    type: chest
    pos1: 68|11|-98
    facing: south
    table: ruinedcityblocks
  lootchestmaterials1:
    type: chest
    pos1: 33|11|-53
    facing: west
    table: ruinedcitymaterials
  lootchestmaterials2:
    type: chest
    pos1: 85|13|-39
    facing: south
    table: ruinedcitymaterials
  lootchestmaterials3:
    type: chest
    pos1: 68|2|-98
    facing: west
    table: ruinedcitymaterials
  lootchesttrash1:
    type: chest
    pos1: 29|11|-59
    facing: east
    table: ruinedcitytrash
  lootchestvaluables1:
    type: chest
    pos1: 109|3|-57
    facing: west
    table: ruinedcityvaluables
  lootchestvaluables2:
    type: chest
    pos1: 97|2|-74
    facing: west
    table: ruinedcityvaluables
  lootchestvaluables3:
    type: chest
    pos1: 97|2|-70
    facing: west
    table: ruinedcityvaluables
  breakablechalice:
    type: breakable
    pos1: 96|3|-73
    health: 5
    model: Ruined_City_Chalice
    breakable_type: valuable
    table: ruinedcitychalice
  breakablebundle:
    type: breakable
    pos1: 96|3|-71
    health: 5
    model: bundle
    breakable_type: leather
    table: ruinedcitybundle
  breakableskeleton1:
    type: breakable
    pos1: 65|11|-101
    health: 5
    model: Ruined_City_Skeleton_Sitting
    breakable_type: bone
    table: ruinedcityskeleton
  breakableskeleton2:
    type: breakable
    pos1: 55|18|-49
    health: 5
    model: Ruined_City_Skeleton_Hanging
    breakable_type: bone
    table: ruinedcityskeleton
  breakableskeleton3:
    type: breakable
    pos1: 65|3|-61
    health: 5
    model: Ruined_City_Skeleton_Sitting
    breakable_type: bone
    table: ruinedcityskeleton
    yaw: 90
  breakablecannon1:
    type: breakable
    pos1: 56|17|-98
    health: 20
    model: Ruined_City_Cannon
    breakable_type: iron
    table: ruinedcitycannon
  breakablecannon2:
    type: breakable
    pos1: 72|17|-98
    health: 20
    model: Ruined_City_Cannon
    breakable_type: iron
    table: ruinedcitycannon
  breakablehorse:
    type: breakable
    pos1: 104|11|-85
    health: 5
    model: Ruined_City_Horse
    breakable_type: flesh
    table: ruinedcityhorse
  breakablegoat:
    type: breakable
    pos1: 39|13|-55
    health: 5
    model: Ruined_City_Goat
    breakable_type: flesh
    table: ruinedcitygoat

Ruined_City_Mob_Spawns:
    type: world
    debug: false
    events:
        after mythicmob RuinedPillager spawns:
        - define entity <context.entity>
        - adjust <[entity]> item_in_hand:<item[crossbow]>
        after mythicmob RuinedVindicator spawns:
        - define entity <context.entity>
        - adjust <[entity]> item_in_hand:<item[steel_sword]>
        after mythicmob RuinedSkeleton spawns:
        - define entity <context.entity>
        - adjust <[entity]> item_in_hand:<item[bow]>
        - if <util.random_chance[15]>:
          - adjust <[entity]> item_in_hand:<item[stone_sword]>
        after mythicmob RuinedZombie spawns:
        - define entity <context.entity>
        - adjust <[entity]> item_in_hand:<item[stick]>
        - if <util.random_chance[50]>:
          - equip <[entity]> head:<item[crafted_leather_helmet]>
        - if <util.random_chance[50]>:
          - equip <[entity]> chest:<item[crafted_leather_chestplate]>
        - if <util.random_chance[50]>:
          - equip <[entity]> legs:<item[crafted_leather_leggings]>
        - if <util.random_chance[50]>:
          - equip <[entity]> boots:<item[crafted_leather_boots]>


Ruined_City_Chalice:
    type: item
    material: stick
    display name: <gold>Chalice of the Ruined City
    mechanisms:
      components_patch:
        item_model: string:utensils:chalice3
    lore:
    - <red>Drop this chalice to summon the Ruined City's guardian.
    - <red>Be prepared for a fight!

Ruined_City_Skeleton_Sitting:
    type: item
    material: string
    display name: <red>Ruined Skeleton
    mechanisms:
      components_patch:
        item_model: string:dungeons:skelly
    lore:
    - <red>Once a mighty warrior, now a guardian of the Ruined City.

Ruined_City_Skeleton_Hanging:
    type: item
    material: string
    display name: <red>Ruined Skeleton
    mechanisms:
      components_patch:
        item_model: string:dungeons:hanging_skelly
    lore:
    - <red>Once a mighty warrior, now a guardian of the Ruined City.

Ruined_City_Cannon:
    type: item
    material: stick
    display name: <red>Ruined City Cannon
    mechanisms:
      components_patch:
        item_model: string:furniture:cannon
    lore:
    - <red>This cannon was used to protect the Ruined City's defenses.

Ruined_City_Goat:
    type: item
    material: stick
    display name: <red>Ruined City Goat
    mechanisms:
      components_patch:
        item_model: string:materials:corpse/goat_corpse
    lore:
    - <red>This goat was once a part of the Ruined City's livestock.

Ruined_City_Horse:
    type: item
    material: stick
    display name: <red>Ruined City Horse
    mechanisms:
      components_patch:
        item_model: string:materials:corpse/horse_corpse
    lore:
    - <red>This horse was once a part of the Ruined City's cavalry.