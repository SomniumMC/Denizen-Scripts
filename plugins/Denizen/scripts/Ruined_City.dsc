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
  spawner1:
    type: mobspawner
    pos1: 63|14|-50
    id: ruinedcity1
    health: 10
    somni: ruined_city
  horsespawn1:
    type: mob
    pos1: 105|11|-81
  horsespawn2:
    type: mob
    pos1: 106|11|-77
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

Ruined_City_Mob_Spawns:
    type: world
    events:
        on mythicmob RuinedVindicator spawns:
        - define entity <context.entity>
        - adjust <[entity]> item_in_hand:<item[steel_sword]>
        on mythicmob RuinedSkeleton spawns:
        - define entity <context.entity>
        - adjust <[entity]> item_in_hand:<item[bow]>
        on mythicmob RuinedZombie spawns:
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