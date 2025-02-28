# This file includes all scripts and data for the TestSchem dungeon which is basically an example for our devs to work upon.

SomniData_TestSchem:
    type: data
    origin: testschempos3
    pos2: testschempos4
    area: schemtest2
    chunks: 3x3
    oregen:
      type: modicube
      pos1: 14|19|-18
      pos2: 10|23|-22
      replace: stone
      special: ore1
    chair1:
      type: furniture
      pos1: 19|17|-12
      furniture: Crude_Chair
      yaw: 90
      chance: 10
    table1:
      type: furniture
      pos1: 18|17|-11
      furniture: 1x2_Crude_Table
      yaw: 90
      chance: 10
    testmob:
      type: mob
      pos1: 29|17|-14
      mob: zombie
    #testmythicmob:
    #  type: mob
    #  pos1: 8|5|-7
    #  mythicmob: Goblin
    #testmythicspawner:
    #  type: enablespawner
    #  pos1: 5|5|-6
    #  id: testschemspawner
    breakablebarrel:
      type: breakable
      pos1: 25|21|-22
      model: barrel
      health: 5
      breakable_type: barrel
      table: test1
    lootchest1:
      type: chest
      pos1: 27|21|-22
      facing: north
      table: test1
    dungeon_core:
      type: dungeoncore
      pos:
        - 19|21|-20
        - 26|24|-26
        - 22|17|-11
        - 22|17|-18
      health: 10
      area: schemtest2
      somni: testschem
    exit:
      type: returnportal
      pos1: 20|21|-29
      somni: testschem
      #exit_override: testschempos3