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
      table: test1
      yaw: 90
    SU_Pot1:
      type: breakable
      pos1: 37|7|-27
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: test1
    SU_Pot2:
      type: breakable
      pos1: 38|7|-24
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: test1
    SU_Pot3:
      type: breakable
      pos1: 37|7|-19
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: test1
    SU_Pot4:
      type: breakable
      pos1: 39|11|-12
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: test1
    SU_Pot5:
      type: breakable
      pos1: 44|11|-9
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: test1
    SU_Pot6:
      type: breakable
      pos1: 38|6|-3
      model: SU_Pot
      health: 5
      breakable_type: barrel
      table: test1
    SU_Coin_Pouch1:
      type: breakable
      pos1: 32|11|-8
      model: SU_Coin_Pouch
      health: 5
      breakable_type: leather
      table: test1
    SU_Coin_Pouch2:
      type: breakable
      pos1: 33|11|-18
      model: SU_Coin_Pouch
      health: 5
      breakable_type: leather
      table: test1
    SU_Coin_Pouch3:
      type: breakable
      pos1: 8|5|-40
      model: SU_Coin_Pouch
      health: 5
      breakable_type: leather
      table: test1
    SU_Coin_Pouch4:
      type: breakable
      pos1: 31|1|-18
      model: SU_Coin_Pouch
      health: 5
      breakable_type: leather
      table: test1
    SU_Coin_Pouch5:
      type: breakable
      pos1: 43|11|-18
      model: SU_Coin_Pouch
      health: 5
      breakable_type: leather
      table: test1
    SU_Skeleton_Hanging1:
      type: breakable
      pos1: 44|11|-19
      model: SU_Skeleton_Hanging
      health: 5
      breakable_type: bone
      table: test1
      yaw: 90
    lootchest1:
      type: chest
      pos1: 6|5|-41
      facing: west
      table: test1
    lootchest2:
      type: chest
      pos1: 2|11|-28
      facing: north
      table: test1
    lootchest3:
      type: chest
      pos1: 11|1|-14
      facing: south
      table: test1
    bosstele:
      type: teleporter
      pos1: 41|11|-40
      note: sentientundergrowthteleporter
    dungeon_core:
      type: dungeoncore
      pos:
        - 39|22|-21
      health: 10
      area: sentientundergrowth2
      somni: Sentient_Undergrowth
    exit1:
      type: returnportal
      pos1: 41|22|-22
      somni: Sentient_Undergrowth
    exit2:
      type: returnportal
      pos1: 3|9|-33
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
    #Spider x2
    spawner1:
      type: mobspawner
      pos1: 4|11|-23
      id: su_spawner1
      health: 10
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

SU_Coin_Pouch:
  type: item
  debug: false
  material: stick
  display name: <red>Sentient Undergrowth Coin Pouch
  mechanisms:
      components_patch:
        item_model: string:materials:currency/coinpurse
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
  debug: true
  events:
    on player enters sentientundergrowthteleporter:
    - define player <context.entity>
    - narrate "<light_purple><italic>You feel a chill run down your spine as you step into the teleporter."
    - teleport <player> <location[sentientundergrowthbosstele]>
    on player enters sentientundergrowth_intro_message:
    - define player <context.entity>
    - narrate "<green><italic>This place feels...<n><bold>Alive"
    on mythicmob su_spiderboss dies:
    - narrate "<red><bold>The spider boss has been defeated!<n><green>The gates have been opened for a stronger foe." targets:<cuboid[sentientundergrowth2].players>
    - modifyblock <cuboid[su_spiderboss_gate]> air
    on mythicmob su_spur spawns:
    - define entity <context.entity>
    - adjust <[entity]> item_in_hand:<item[air]>