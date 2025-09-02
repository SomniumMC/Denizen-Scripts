#These ancient ruins haven't been explored in what would seem like hundreds of years.  However..  One never quite feels alone while trapped inside these 
SomniData_Sentient_Undergrowth:
    type: data
    origin: sentientunderpos3
    pos2: sentientunderpos4
    area: sentientundergrowth2
    chunks: 3x3
    oregen:
      type: modicube
      pos1: 0|0|0
      pos2: 45|45|-45
      replace: raw_gold_block
      special: ore2
    skull:
      type: breakable
      pos1: 1|11|-6
      model: skeleton_skull
      health: 5
      breakable_type: bone
      table: skeleton_body
      yaw: 90
    SU_Pot1:
      type: breakable
      pos1: 37|7|-27
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: trash
    SU_Pot2:
      type: breakable
      pos1: 38|7|-24
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: trash
    SU_Pot3:
      type: breakable
      pos1: 37|7|-19
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: trash
    SU_Pot4:
      type: breakable
      pos1: 39|11|-12
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: trash
    SU_Pot5:
      type: breakable
      pos1: 44|11|-9
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: trash
    SU_Pot6:
      type: breakable
      pos1: 38|6|-3
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: currency
    SU_Coin_Stack1:
      type: breakable
      pos1: 32|11|-8
      model: SU_Coin_Stack
      scale: 2,2,2
      health: 5
      breakable_type: valuable
      table: currency
    SU_Coin_Stack2:
      type: breakable
      pos1: 31|1|-18
      model: SU_Coin_Stack
      scale: 2,2,2
      health: 5
      breakable_type: valuable
      table: currency
    SU_Coin_Stack3:
      type: breakable
      pos1: 8|5|-40
      model: SU_Coin_Stack
      scale: 2,2,2
      health: 5
      breakable_type: valuable
      table: currency
    SU_Coin_Stack5:
      type: breakable
      pos1: 43|11|-18
      model: SU_Coin_Stack
      scale: 2,2,2
      health: 5
      breakable_type: valuable
      table: currency
    SU_Skeleton_Hanging1:
      type: breakable
      pos1: 44|11|-19
      model: SU_Skeleton_Hanging
      health: 5
      breakable_type: bone
      table: skeleton_body
      yaw: 90
    lootchestgear1:
      type: chest
      pos1: 6|5|-41
      facing: west
      table: su_gear
    lootchestgear2:
      type: chest
      pos1: 2|11|-28
      facing: north
      table: su_gear
    lootchestgear3:
      type: chest
      pos1: 11|1|-14
      facing: south
      table: su_gear
    lootchestgear4:
      type: chest
      pos1: 29|4|-2
      facing: south
      table: su_gear
    lootchestgear5:
      type: chest
      pos1: 39|22|-24
      facing: south
      table: su_gear
    lootchesttrash1:
      type: chest
      pos1: 11|12|-1
      facing: west
      table: trash
    lootchesttrash2:
      type: chest
      pos1: 27|11|-12
      facing: south
      table: trash
    lootchestfood1:
      type: chest
      pos1: 24|13|-21
      facing: south
      table: food
    lootchestfood2:
      type: chest
      pos1: 1|11|-11
      facing: west
      table: food
    lootchestfood3:
      type: chest
      pos1: 3|4|-5
      facing: west
      table: food
    lootchestmaterials1:
      type: chest
      pos1: 33|7|-25
      facing: west
      table: materials
    lootchestmaterials2:
      type: chest
      pos1: 44|1|-43
      facing: west
      table: materials
    lootchestmaterials3:
      type: chest
      pos1: 24|3|-24
      facing: west
      table: materials
    lootchestmaterials4:
      type: chest
      pos1: 42|2|-31
      facing: west
      table: materials
    lootchestvaluables1:
      type: chest
      pos1: 40|8|-39
      facing: west
      table: su_valuables
    lootchestvaluables2:
      type: chest
      pos1: 22|9|-26
      facing: west
      table: su_valuables
    lootchestvaluables3:
      type: chest
      pos1: 29|1|-26
      facing: west
      table: su_valuables
    lootchestvaluables4:
      type: chest
      pos1: 1|1|-34
      facing: west
      table: su_valuables
    lootchestvaluables5:
      type: chest
      pos1: 38|22|-24
      facing: west
      table: su_valuables
    lootchestvaluables6:
      type: chest
      pos1: 12|5|-13
      facing: west
      table: su_valuables
    lootchestvaluables7:
      type: chest
      pos1: 12|5|-9
      facing: west
      table: su_valuables
    lootchestblocks1:
      type: chest
      pos1: 37|9|-33
      facing: west
      table: blocks
    lootchestblocks2:
      type: chest
      pos1: 31|1|-24
      facing: west
      table: blocks
    lootchestblocks3:
      type: chest
      pos1: 44|3|-10
      facing: west
      table: blocks
    bosstele:
      type: teleporter
      pos1: 41|11|-40
      note: sentientundergrowthteleporter
      yaw: 90
    dungeon_core:
      type: dungeoncore
      pos:
        - 39|22|-21
      health: 10
      area: sentientundergrowth2
      somni: Sentient_Undergrowth
    #exit1:
    #  type: returnportal
    #  pos1: 41|22|-22
    #  somni: Sentient_Undergrowth
    exit2:
      type: returnportal
      pos1: 3|9|-32
      somni: Sentient_Undergrowth
    crawl1:
      type: crawl
      pos1: 30|1|-16
      yaw: 90
    crawl2:
      type: crawl
      pos1: 34|11|-18
      yaw: 0
    crawl3:
      type: crawl
      pos1: 17|1|-25
      yaw: 0
    crawl4:
      type: crawl
      pos1: 16|1|-30
      yaw: 90
    crawl5:
      type: crawl
      pos1: 11|1|-25
      yaw: 0
    crawl6:
      type: crawl
      pos1: 8|1|-8
      yaw: 90
    crawl7:
      type: crawl
      pos1: 40|1|-26
      yaw: 90
    #Spider x2
    spawner1:
      type: mobspawner
      pos1: 4|11|-23
      id: su_spawner1
      health: 10
      somni: sentient_undergrowth
    #Spur x3
    spawner2:
      type: mobspawner
      pos1: 12|11|-9
      id: su_spawner2
      health: 10
      somni: sentient_undergrowth
    #Bogged x2
    spawner3:
      type: mobspawner
      pos1: 43|1|-36
      id: su_spawner3
      health: 10
      somni: sentient_undergrowth
    #Spur x3
    spawner4:
      type: mobspawner
      pos1: 40|3|-42
      id: su_spawner4
      health: 10
      somni: sentient_undergrowth
    #Bogged x3
    spawner5:
      type: mobspawner
      pos1: 7|5|-30
      id: su_spawner5
      health: 10
      somni: sentient_undergrowth
    #Spider x1
    spawner6:
      type: mobspawner
      pos1: 27|7|-27
      id: su_spawner6
      health: 10
      somni: sentient_undergrowth
    #Spider x1
    spawner7:
      type: mobspawner
      pos1: 29|7|-20
      id: su_spawner7
      health: 10
      somni: sentient_undergrowth
    #Spur x3
    spawner8:
      type: mobspawner
      pos1: 17|3|-11
      id: su_spawner8
      health: 10
      somni: sentient_undergrowth
    #Spider Mini-Boss
    spawner9:
      type: mobspawner
      pos1: 18|1|-20
      id: su_spawner9
      health: 50
      somni: sentient_undergrowth
    #Spur x4
    spawner10:
      type: mobspawner
      pos1: 10|1|-35
      id: su_spawner10
      health: 10
      somni: sentient_undergrowth
    #Dungeon Boss
    spawner11:
      type: mobspawner
      pos1: 23|22|-22
      id: su_spawner11
      health: 50
      somni: sentient_undergrowth



SU_Pot:
  type: item
  debug: false
  material: stick
  display name: <red>Sentient Undergrowth Pot
  mechanisms:
      components_patch:
        item_model: string:furniture:clay_jug
  lore:
  - <red>Players should not have this item!
  - <green>This is just used as a model

SU_Coin_Stack:
  type: item
  debug: false
  material: stick
  display name: <red>Sentient Undergrowth Coin Stack
  mechanisms:
      components_patch:
        item_model: string:materials:currency/coin_stack_small
  lore:
  - <red>Players should not have this item!
  - <green>This is just used as a model

SU_Skeleton_Hanging:
    type: item
    debug: false
    material: string
    display name: <red>Sentient Undergrowth Hanging Skeleton
    mechanisms:
      components_patch:
        item_model: string:dungeons:hanging_skelly
    lore:
    - <red>Players should not have this item!
    - <green>This is just used as a model

Sentient_Undergrowth_Events:
  type: world
  debug: false
  events:
    on player enters sentientundergrowthteleporter:
    - define player <context.entity>
    - narrate "<light_purple><italic>You feel a chill run down your spine as you step into the teleporter."
    - teleport <player> <location[sentientundergrowthbosstele]>
    on player enters sentientundergrowth_intro_message:
    - define player <context.entity>
    - narrate "<green><italic>This place feels...<n><bold>Alive"
    on mythicmob su_spiderboss dies:
    - if !<server.has_flag[su_spiderboss_dead]>:
      - narrate "<red><bold>The spider boss has been defeated!<n><green>The gates have been opened for a stronger foe." targets:<cuboid[sentientundergrowth2].players>
      - modifyblock <cuboid[su_spiderboss_gate]> air
      - flag server su_spiderboss_dead:true expire:2h
    on mythicmob su_dungeonboss dies:
    - if !<server.has_flag[su_dungeonboss_dead]>:
      - narrate "<dark_purple><italic>Metal bars screech as they rise behind where the boss lies dead." targets:<cuboid[sentientundergrowth2].players>
      - modifyblock <cuboid[su_dungeonboss_gate]> air
      - flag server su_dungeonboss_dead:true expire:2h
    on mythicmob su_spur spawns:
    - define entity <context.entity>
    - adjust <[entity]> item_in_hand:<item[air]>
    on mythicmob su_dungeonboss spawns:
    - define entity <context.entity>
    - equip <[entity]> head:<item[steel_helmet]>
    - equip <[entity]> chest:<item[steel_chestplate]>
    - equip <[entity]> legs:<item[steel_leggings]>
    - equip <[entity]> boots:<item[steel_boots]>