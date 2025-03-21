#These ancient ruins haven't been explored in what would seem like hundreds of years.  However..  One never quite feels alone while trapped inside these 
SomniData_Sentient_Undergrowth:
    type: data
    debug: false
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
      yaw: 270
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
      pos1: 33|1|-8
      model: SU_Coin_Pouch
      health: 5
      breakable_type: barrel
      table: test1
    SU_Coin_Pouch2:
      type: breakable
      pos1: 33|1|-18
      model: SU_Coin_Pouch
      health: 5
      breakable_type: barrel
      table: test1
    SU_Coin_Pouch3:
      type: breakable
      pos1: 8|5|-40
      model: SU_Coin_Pouch
      health: 5
      breakable_type: barrel
      table: test1
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
    bosstele:
      type: teleporter
      pos1: 41|11|-40
      destination: sentientundergrowthbosstele
    dungeon_core:
      type: dungeoncore
      pos:
        - 39|22|-21
      health: 10
      area: sentientundergrowth2
      somni: Sentient_Undergrowth
    exit:
      type: returnportal
      pos1: 41|22|-22
      somni: Sentient_Undergrowth


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
        item_model: string:furniture:coin_pouch
  lore:
  - <red>Players should not have this item!
  - <green>This is just used as a model