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
      breakable_type: barrel
      table: test1
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
    lootchest1:
      type: chest
      pos1: 6|5|-41
      facing: west
      table: test1
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