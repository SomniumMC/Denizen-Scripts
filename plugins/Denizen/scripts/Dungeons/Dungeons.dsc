# This file contains the scripts and systems that are responsible for managing the dungeons for the server dubbed as Somni which are regenerating pocket locations available to be mined and broken once criteria is met.

# First Created: 10/03/2024

SomniReset:
    type: task
    debug: false
    definitions: somni
    script:
    - define pos1 <script[SomniData_<[somni]>].data_key[origin]>
    - define pos2 <script[SomniData_<[somni]>].data_key[pos2]>
    - define area <script[SomniData_<[somni]>].data_key[area]>

    # Chunk Loading Starts
    - define chunk_size:<script[SomniData_<[somni]>].data_key[chunks]>
    - define chunk_list:<list>
    - define corner1 <location[<[pos1]>].chunk>
    - define chunk_x 0
    - define chunk_y 0
    - define row 1
    - define column 0
    - repeat <[chunk_size].before[x].mul[<[chunk_size].after[x]>]>:
      - define current_chunk <[corner1].add[<[chunk_x]>,<[chunk_y]>]>
      - define chunk_map:->:<[current_chunk]>
      - define chunk_x:-:1
      - define column:+:1
      - if <[column]> == <[chunk_size].before_last[x]>:
        - define row:+:1
        - define column 0
        - define chunk_x 0
        - define chunk_y:-:1
    #- narrate <[chunk_map]>
    - foreach <[chunk_map]> as:chunk:
      - chunkload <[chunk]> duration:5m



    - flag <cuboid[<[area]>]> protection:enabled
    - foreach <cuboid[<[area]>].entities> as:entity:
      #- narrate <[entity]>
      - remove <[entity]>
    #- foreach <script[SomniData_<[somni]>].list_keys.exclude[origin|type|chunks|pos2|chunks]> as:key:
    #  - if <script[SomniData_<[somni]>].data_key[<[key]>.type]> == furniture:
    #    - define origin <location[<script[SomniData_<[somni]>].data_key[origin]>]>
    #    #- run Furniture_Faker_Cleanup def.location:<proc[SomniLocationProc].context[<script[SomniData_<[somni]>].data_key[<[key]>.pos1]>].unescaped.parsed>
    #- modifyblock air <cuboid[<script[SomniData_<[somni]>].data_key[area]>]> no_physics
    - wait 10t
    - define origin <location[<script[SomniData_<[somni]>].data_key[origin]>]>

    - flag server somni.<[somni]>.spawner_ids:!
    - flag server somni.<[somni]>.spawners:!
    - flag server somni.<[somni]>.broken_spawners:!

    - schematic load name:<[somni]>
    - schematic paste name:<[somni]> <[origin].with_yaw[!]>
    - foreach <script[SomniData_<[somni]>].list_keys.exclude[origin|type|pos2|area|chunks]> as:key:
      #- if <[key]> == origin || <[key]> == type:
      #  - foreach next
      - define map <script[SomniData_<[somni]>].data_key[<[key]>]>
      - define action <script[SomniData_<[somni]>].data_key[<[key]>.type]>
      - run Somni<[action]> defmap:<[map]> def.origin:<[origin]>
        #- case modicube:
        #  - run SomniModiCube defmap:<script[SomniData_<[somni]>].data_key[<[key]>]> def.origin:<location[<script[SomniData_<[somni]>].data_key[origin]>]>
        #- case furniture:
        #  - run SomniFurniture defmap:<script[SomniData_<[somni]>].data_key[<[key]>]> def.origin:<location[<script[SomniData_<[somni]>].data_key[origin]>]>
        #- case mob:
        #  - run SomniSpawnMob defmap:<script[SomniData_<[somni]>].data_key[<[key]>]> def.origin:<location[<script[SomniData_<[somni]>].data_key[origin]>]>
        #- case enablespawner:
        #  - run SomniEnableSpawner defmap:<script[SomniData_<[somni]>].data_key[<[key]>]> def.origin:<location[<script[SomniData_<[somni]>].data_key[origin]>]>
        #- case breakable:
        #  - run SomniBreakable defmap:<script[SomniData_<[somni]>].data_key[<[key]>]> def.origin:<location[<script[SomniData_<[somni]>].data_key[origin]>]>
        #- case chest:
        #  - run SomniChest defmap:<script[SomniData_<[somni]>].data_key[<[key]>]> def.origin:<location[<script[SomniData_<[somni]>].data_key[origin]>]>
        #- case dungeoncore:
        #  - run SomniDungeonCore defmap:<script[SomniData_<[somni]>].data_key[<[key]>]> def.origin:<location[<script[SomniData_<[somni]>].data_key[origin]>]>
        #- case returnportal:
        #  - run SomniReturnPortal defmap:<script[SomniData_<[somni]>].data_key[<[key]>]> def.origin:<location[<script[SomniData_<[somni]>].data_key[origin]>]>
        #- default:
        #  - foreach next
      - flag server somni.<[somni]>.status:ready

SomniModiCube:
    type: task
    definitions: pos1|pos2|replace|replacement|special|origin
    script:
    - define pos1 <proc[SomniLocationProc].context[<[pos1]>].unescaped.parsed>
    - define pos2 <proc[SomniLocationProc].context[<[pos2]>].unescaped.parsed>
    - define cube <[pos1].to_cuboid[<[pos2]>]>
    #- debugblock <[cube].corners>
    - if <[replacement]||null> == null:
      - foreach <[cube].blocks[<[replace]>]> as:block:
        - define block_table <script[SomniBlockReplacements].data_key[<[special]>]>
        - define replaced_block <proc[SomniWeight_Proc].context[<[block_table].parse_value_tag[<[parse_value].get[weight]>]>]>
        - modifyblock <[replaced_block]> <[block]>
    - else:
      - modifyblock <[cube]> <[replacement]>

SomniFurniture:
    type: task
    definitions: pos1|pos2|origin|furniture|yaw|chance
    script:
    - define pos1 <proc[SomniLocationProc].context[<[pos1]>].unescaped.parsed>
    - if <[pos1].material.name> == oak_sign:
      - modifyblock <[pos1]> air
    - run Assemble_<[furniture]> def.location:<[pos1]> def.item:<item[furniture_<[furniture]>]> def.player:f def.yaw:<[yaw]>
    - flag <[pos1]> furniture_chance:<[chance]>

SomniMob:
    type: task
    definitions: pos1|origin|mob|mythicmob
    script:
    - define pos1 <proc[SomniLocationProc].context[<[pos1]>].unescaped.parsed.center.below[0.5]>
    - if <[pos1].material.name> == oak_sign:
      - modifyblock <[pos1]> air
    - if <[mob]||null> != null:
      - spawn <[mob]> <[pos1]> save:mob
      - adjust <entry[mob].spawned_entity> force_no_persist:false
    - else:
      - mythicspawn <[mythicmob]> <[pos1]> save:mob
      - adjust <entry[mob].spawned_entity> force_no_persist:false

SomniMobSpawner:
    type: task
    debug: false
    definitions: pos1|origin|id|health|somni
    script:
    - define pos1 <proc[SomniLocationProc].context[<[pos1]>].unescaped.parsed>
    - if <[pos1].material.name> == oak_sign:
      - modifyblock <[pos1]> air
    - define spawner <mythicspawner[<[id]>]>
    #- narrate <[pos1]>
    - adjust <[spawner]> enable
    - adjust <[spawner]> spawn
    - spawn item_display[item=Dungeon_Spawner] <[pos1].center> save:spawner_entity
    - spawn dungeon_spawner_interaction <[pos1].center.below[0.5]> save:interaction_entity
    - flag <entry[interaction_entity].spawned_entity> spawner_entity:<entry[spawner_entity].spawned_entity>
    - flag <entry[interaction_entity].spawned_entity> health:<[health]>
    - flag <entry[interaction_entity].spawned_entity> somni:<[somni]>
    - flag <entry[interaction_entity].spawned_entity> id:<[id]>
    - if <[id]> !in <server.flag[somni.<[somni]>.spawner_ids]>:
      - flag server somni.<[somni]>.spawner_ids:->:<[id]>
    - flag server somni.<[somni]>.spawners:->:<entry[interaction_entity].spawned_entity>

SomniBreakable:
    type: task
    debug: true
    definitions: pos1|origin|model|health|breakable_type|table|yaw|scale|translation
    script:
    - define pos1 <proc[SomniLocationProc].context[<[pos1]>].unescaped.parsed>
    - if <[pos1].material.name> == oak_sign:
      - modifyblock <[pos1]> air
    - spawn item_display[item=<[model]>] <[pos1].center.add[<element[<[translation].if_null[0,0,0]>]>]> save:model_entity
    - spawn somni_breakable <[pos1].center.below[0.5]> save:interaction_entity
    - flag <entry[model_entity].spawned_entity> interaction_entity:<entry[interaction_entity].spawned_entity>
    - flag <entry[interaction_entity].spawned_entity> model_entity:<entry[model_entity].spawned_entity>
    - flag <entry[interaction_entity].spawned_entity> breakable:<[health]>
    - flag <entry[interaction_entity].spawned_entity> breakable_type:<[breakable_type]>
    - flag <entry[interaction_entity].spawned_entity> table:<[table]>
    - look <entry[model_entity].spawned_entity> yaw:<[yaw].if_null[0]>
    - adjust <entry[model_entity].spawned_entity> scale:<element[<[scale]>].if_null[1,1,1]>
    #- mount <entry[interaction_entity].spawned_entity>|<entry[model_entity].spawned_entity>

SomniChest:
    type: task
    debug: false
    definitions: pos1|origin|table|facing
    script:
    - define pos1 <proc[SomniLocationProc].context[<[pos1]>].unescaped.parsed>
    - if <[pos1].material.name> == oak_sign:
      - modifyblock <[pos1]> air
    #- narrate <[pos1]>
    - modifyblock <[pos1].center> chest[direction=<[facing]>]
    - if <[table]||null> == null:
      - stop
    - else:
      - define reward_table <script[SomniLoot_Table].data_key[<[table]>]>
      - repeat <proc[SomniQuantity_Proc].context[<[reward_table].get[quantity]>]>:
        - define selected_loot <proc[SomniWeight_Proc].context[<[reward_table].get[items].parse_value_tag[<[parse_value].get[weight]>]>]>
        - define selected_item <proc[apply_info_proc].context[<item[<[selected_loot]>]>]>
        - adjust def:selected_item quantity:<proc[SomniQuantity_Proc].context[<[reward_table].get[items].deep_get[<[selected_loot]>.quantity]>]>
        #- while <proc[SomniChestSlot_Proc].context[<[pos1].inventory>]>
        #- if <proc[SomniChestSlot_Proc].context[<[pos1].inventory>]> != failed:
        #  - define success
        #- else:
        #  -
        - define slot <proc[SomniChestSlot_Proc].context[<[pos1].inventory>]>
        - if <[slot]> == failed:
          - define slot <[pos1].inventory.first_empty>
        - if <[slot]> == -1:
          - repeat stop
        - inventory set o:<[selected_item]> destination:<[pos1]> slot:<[slot]>
        #- drop <[selected_loot]> <[location]> quantity:<proc[SomniQuantity_Proc].context[<[reward_table].get[items].deep_get[<[selected_loot]>.quantity]>]>

SomniDungeonCore:
    type: task
    definitions: pos|origin|health|area|somni
    script:
    - define random_position <[pos].random>
    - define pos1 <proc[SomniLocationProc].context[<[random_position]>].unescaped.parsed>
    #- narrate <[pos1].simple>
    - spawn item_display[item=dungeon_core] <[pos1].center> save:core_entity
    - spawn item_display[item=Dungeon_Core_Stabilizer] <[pos1].center.above[0.01]> save:stabilizer_entity
    - spawn Dungeon_Core_Interaction <[pos1].center.below[0.5]> save:interaction_entity
    - modifyblock <[pos1]> end_rod
    - modifyblock <[pos1].above[1]> end_rod[direction=down]
    - rotate <entry[core_entity].spawned_entity> infinite yaw:5
    #- flag <entry[core_entity].spawned_entity> interaction_entity:<entry[interaction_entity].spawned_entity>
    - flag <entry[interaction_entity].spawned_entity> core_entity:<entry[core_entity].spawned_entity>
    - flag <entry[interaction_entity].spawned_entity> stabilizer_entity:<entry[stabilizer_entity].spawned_entity>
    - flag <entry[interaction_entity].spawned_entity> dungeon_core:<[health]>
    - flag <entry[interaction_entity].spawned_entity> area:<[area]>
    - flag <entry[interaction_entity].spawned_entity> somni:<[somni]>
    #- flag <entry[interaction_entity].spawned_entity> breakable:<[health]>
    #- flag <entry[interaction_entity].spawned_entity> breakable_type:<[breakable_type]>
    #- flag <entry[interaction_entity].spawned_entity> table:<[table]>

SomniReturnPortal:
    type: task
    definitions: pos1|origin|somni
    script:
    - define pos1 <proc[SomniLocationProc].context[<[pos1]>].unescaped.parsed>
    - modifyblock <[pos1].below[1].to_cuboid[<[pos1].below[1].forward[1]>]> shroomlight
    - modifyblock <[pos1].forward[1]> barrier
    #- run Furniture_Faker def.location:<[pos1]> def.unbreakable:true def.player:f
    #- modifyblock <[pos1].below[1]> barrier
    - spawn item_display[item=Dungeon_Return_Portal;scale=2,2,2] <[pos1].center.backward[1].above[0.5]> save:Portal_Model
    - look <entry[Portal_model].spawned_entity> yaw:0
    - note <[pos1].forward[1].above[1].to_cuboid[<[pos1].forward[1].above[2]>]> as:<[somni]>_exit


SomniLocationProc:
    type: procedure
    definitions: x|y|z
    script:
    #- narrate <location[testschempos3].right[<[x]>].up[<[y]>].backward[<[z]>].block>
    - determine <&lt>[origin].add[<[x]>,<[y]>,<[z]>]<&gt>
    #- determine <&lt>[origin].right[<[x]>].up[<[y]>].backward[<[z]>].with_yaw[<&lt>[origin].yaw<&gt>]<&gt>

SomniBlockReplacements:
  type: data
  ore1:
    coal_ore:
      weight: 100
    iron_ore:
      weight: 50
    copper_ore:
      weight: 50
    stone:
      weight: 800
  ore2:
    lapis_ore:
      weight: 100
    iron_ore:
      weight: 50
    infested_stone:
      weight: 725
    gold_ore:
      weight: 50
    coal_ore:
      weight: 50
    raw_iron_block:
      weight: 25


SomniWeight_Proc:
    type: procedure
    debug: false
    definitions: map
    script:
    # get a random number between 0 and the total weight of every entry combined
    - define total_weight <[map].values.sum>
    - define random_const <util.random.decimal[0].to[<[total_weight]>]>

    # loop through each entry and subtract random_const by that entry's weight until random_const becomes
    # less than or equal to 0, for then that last-looped-through entry's key will be the final result of the proc
    - foreach <[map]>:
        - define random_const:-:<[value]>
        - if <[random_const]> <= 0:
            - determine <[key]>

SomniQuantity_Proc:
    type: procedure
    debug: false
    definitions: value
    script:
    - determine <util.random.int[<[value].before_last[-]>].to[<[value].after_last[-]>]>

SomniChestSlot_Proc:
    type: procedure
    debug: false
    definitions: inventory
    script:
    - define random_slot <util.random.int[1].to[27]>
    - if <[inventory].slot[<[random_slot]>].material.name> == air:
      - define result <[random_slot]>
    - else:
      - define result failed
    - determine <[result]>

SomniCoordTool:
    type: item
    material: light_blue_stained_glass
    display name: <gold><bold>Somni Tape Measurer
    flags:
      origin: <empty>
    lore:
    - <green>Punch <gold><bold>Pos1 <white>to select the Origin Point
    - <red>Place <gold><bold>Pos2 <white>to measure the new point from the Origin Point.
    - <blue>Sneak Punch <white>to reset the Origin Point

SomniTapeMeasurer:
    type: world
    events:
        on player breaks block with:SomniCoordTool:
        - determine passively cancelled
        - if <player.item_in_hand.flag[origin]> == <empty>:
          - inventory adjust flag:origin:<context.location> slot:hand
          - inventory adjust lore:<player.item_in_hand.lore><n><light_purple><context.location.simple> slot:hand
        - else:
          - if <player.is_sneaking>:
            - inventory adjust flag:origin:<empty> slot:hand
            - inventory adjust lore:<item[<player.item_in_hand.script.name>].lore> slot:hand
        on player places SomniCoordTool:
        - determine passively cancelled
        - if <player.item_in_hand.flag[origin]> != <empty>:
          - define pos1 <player.item_in_hand.flag[origin].simple.before_last[,].split[,]>
          - define pos2 <context.location.simple.before_last[,].split[,]>
          - define x <[pos2].get[1].sub[<[pos1].get[1]>]>
          - define y <[pos2].get[2].sub[<[pos1].get[2]>]>
          - define z <[pos2].get[3].sub[<[pos1].get[3]>]>
          - narrate <[x]>|<[y]>|<[z]>


SomniBreakable_Handler:
    type: world
    events:
        on player damages Somni_Breakable:
        - if <context.entity.has_flag[breakable]>:
          - define entity <context.entity>
          - define health <[entity].flag[breakable]>
          #- narrate <[entity].list_flags>
          - if <[health].sub[<context.damage>]> <= 0:
            - choose <[entity].flag[breakable_type]>:
              - case barrel:
                - playsound sound:entity.zombie.break.wooden.door sound_category:blocks <[entity].location>
                - playeffect effect:block at:<[entity].location> special_data:oak_planks quantity:5
              - case valuable:
                - playsound sound:block.nether_gold_ore.break sound_category:blocks <[entity].location>
                - playeffect effect:block at:<[entity].location> special_data:gold_block quantity:5
              - case leather:
                - playsound sound:block.wool.break sound_category:blocks <[entity].location>
                - playeffect effect:block at:<[entity].location> special_data:brown_wool quantity:5
              - case iron:
                - playsound sound:block.iron.break sound_category:blocks <[entity].location>
                - playeffect effect:block at:<[entity].location> special_data:iron_block quantity:5
              - case flesh:
                - playsound sound:item.honeycomb.wax_on sound_category:blocks <[entity].location>
                - playeffect effect:block at:<[entity].location> special_data:red_wool quantity:5
            - if <[entity].flag[table]> != noloot:
              - run SomniBreakable_Loot def.location:<[entity].location> def.table:<[entity].flag[table]||null>
            - foreach <[entity].flag[model_entity]> as:model:
              - remove <[model]>
            - remove <[entity]>
          - else:
            - define newhealth <[health].sub[<context.damage>]>
            - flag <[entity]> breakable:<[newhealth]>
            #- narrate <[newhealth]>
            - choose <[entity].flag[breakable_type]>:
              - case barrel:
                - playsound sound:block.wood.hit sound_category:blocks <[entity].location>
                - playeffect effect:block at:<[entity].location> special_data:oak_planks quantity:5
              - case valuable:
                - playsound sound:block.nether_gold_ore.hit sound_category:blocks <[entity].location>
                - playeffect effect:block at:<[entity].location> special_data:gold_block quantity:5
              - case leather:
                - playsound sound:block.wool.hit sound_category:blocks <[entity].location>
                - playeffect effect:block at:<[entity].location> special_data:brown_wool quantity:5
              - case iron:
                - playsound sound:block.iron.hit sound_category:blocks <[entity].location>
                - playeffect effect:block at:<[entity].location> special_data:iron_block quantity:5
              - case flesh:
                - playsound sound:item.honeycomb.wax_on sound_category:blocks <[entity].location>
                - playeffect effect:block at:<[entity].location> special_data:red_wool quantity:5
          #- debugblock <[entity].location>
        #- if <context.entity.has_flag[dungeon_core]>

SomniBreakable_Loot:
    type: task
    definitions: location|table
    script:
    - if <[table]||null> == null:
      - stop
    - else:
      - define reward_table <script[SomniLoot_Table].data_key[<[table]>]>
      - repeat <proc[SomniQuantity_Proc].context[<[reward_table].get[quantity]>]>:
        - define selected_loot <proc[SomniWeight_Proc].context[<[reward_table].get[items].parse_value_tag[<[parse_value].get[weight]>]>]>
        - if <[reward_table].get[items].deep_get[<[selected_loot]>.info]||null> == apply:
          - define selected_item <proc[apply_info_proc].context[<item[<[selected_loot]>]>]>
        - else:
          - define selected_item <item[<[selected_loot]>]>
        - adjust def:selected_item quantity:<proc[SomniQuantity_Proc].context[<[reward_table].get[items].deep_get[<[selected_loot]>.quantity]>]>
        - drop <[selected_item]> <[location]>
        #quantity:<proc[SomniQuantity_Proc].context[<[reward_table].get[items].deep_get[<[selected_loot]>.quantity]>]>
        #- drop <[selected_loot]> <[location]> quantity:<util.random.int[<[reward_table].deep_get[items.<[selected_loot]>.quantity].to_list.exclude[-].get[1]>].to[<[reward_table].deep_get[items.<[selected_loot]>.quantity].to_list.exclude[-].get[2]>]>

Somni_Breakable:
  type: entity
  entity_type: interaction

#testproc:
#    type: procedure
#    definitions: low|high
#    script:
#    - narrate <[low]>
#    - narrate <[high]>
#    - determine "<[low]> and <[high]>"


SomniProtection:
    type: world
    debug: false
    events:
        on player breaks block priority:-20:
        - if <context.material.name> in <list[short_grass|tall_grass|fern|cobweb|vine|ladder]>:
          - stop
        - foreach <context.location.areas> as:area_name:
          - if <cuboid[<[area_name]>].flag[protection]||null> == enabled:
            - flag <player> protection_warn:+:1 expire:5s
            - if <player.flag[protection_warn]> >= 5:
              - narrate "<light_purple><bold>Defeat the core to lift restrictions."
            - else:
              - narrate "<light_purple><italic>A strange protection is present."
            - determine cancelled
          - else:
            - foreach next
        on player places block priority:-20:
        - if <context.item_in_hand.material.name> == ladder:
          - stop
        - foreach <context.location.areas> as:area_name:
          - if <cuboid[<[area_name]>].flag[protection]||null> == enabled:
            - flag <player> protection_warn:+:1 expire:5s
            - if <player.flag[protection_warn]> >= 5:
              - narrate "<light_purple><bold>Defeat the core to lift restrictions."
            - else:
              - narrate "<light_purple><italic>A strange protection is present."
            - determine cancelled
          - else:
            - foreach next
        on player damages Dungeon_Core_Interaction:
        - define entity <context.entity>
        - define health <[entity].flag[dungeon_core]>
        - if <[health].sub[<context.damage>]> <= 0:
          - definemap data:
              area: <[entity].flag[area]>
              location: <[entity].location>
              core: <[entity].flag[core_entity]>
              stabilizer: <[entity].flag[stabilizer_entity]>
              interaction: <[entity]>
              somni: <[entity].flag[somni]>
          - run SomniProtectionClear defmap:<[data]>
        - else:
          - define newhealth <[health].sub[<context.damage>]>
          - flag <[entity]> dungeon_core:<[newhealth]>
          - playeffect effect:block at:<[entity].location.above[1]> special_data:light_blue_stained_glass quantity:10
          - playsound sound:block.glass.place <[entity].location> sound_category:blocks

SomniProtectionClear:
    type: task
    debug: true
    definitions: area|location|core|stabilizer|interaction|somni
    script:
    - remove <[interaction]>
    - narrate "<white><bold>The core shatters upon your touch releasing its protection of the Somni."
    - playsound sound:block.glass.break <[location]> sound_category:blocks
    - remove <[core]>
    - adjust <[stabilizer]> glow_color:red
    - adjust <[stabilizer]> glowing:true
    - playsound sound:block.portal.trigger <[location]> sound_category:blocks
    - wait 4s
    - remove <[stabilizer]>
    - modifyblock <[location].to_cuboid[<[location].above[1]>]> air
    - playeffect effect:explosion data:10 at:<[location]>
    - playsound sound:entity.generic.explode <[location]> sound_category:blocks
    - flag <cuboid[<[area]>]> protection:disabled
    - flag server somni.<[somni]>.status:cleared
    #- foreach <script[SomniData_<[somni]>].list_keys.exclude[type|origin]> as:entry:
    #  - if <script[SomniData_<[somni]>].data_key[<[entry]>.type]> == enablespawner:
    #    - adjust <mythicspawner[<script[SomniData_<[somni]>].data_key[<[entry]>].get[id]>]> disable
    - foreach <server.flag[somni.<[somni]>.spawners]> as:spawner:
      - remove <[spawner].flag[spawner_entity]>
      - remove <[spawner]>
      - flag server somni.<[somni]>.spawners:<-:<[spawner]>
    - foreach <server.flag[somni.<[somni]>.spawner_ids]> as:id:
      - adjust <mythicspawner[<[id]>]> disable
    - flag server somni.<[somni]>.broken_spawners:!

SomniReturnPortal_Event:
  type: world
  debug: false
  events:
    on player enters Testschem_Exit:
    - define exit_location <script[SomniData_TestSchem].data_key[exit.exit_override]||null>
    - if <[exit_location]> == null:
      - define exit_location SomniDungeon_Stone_Warp
    - teleport <player> <location[<[exit_location]>]>
    - narrate "<light_purple><italic>A strange portal whisks you away through realms."
    on player enters Sentient_Undergrowth_Exit:
    - define exit_location <script[SomniData_Sentient_Undergrowth].data_key[exit.exit_override]||null>
    - if <[exit_location]> == null:
      - define exit_location SomniDungeon_Stone_Warp
    - teleport <player> <location[<[exit_location]>]>
    - narrate "<light_purple><italic>You can once again hear your own thoughts as the spiritual haze fades from your mind."
    on player enters Ruined_City_Exit:
    - define exit_location <script[Ruined_City_Undergrowth].data_key[exit.exit_override]||null>
    - if <[exit_location]> == null:
      - define exit_location SomniDungeon_Stone_Warp
    - teleport <player> <location[<[exit_location]>]>
    - narrate "<light_purple><italic>You can once again hear your own thoughts as the spiritual haze fades from your mind."

SomniMob_Spawner_Event:
  type: world
  #debug: false
  events:
    on player damages Dungeon_Spawner_Interaction:
    - define entity <context.entity>
    - define health <[entity].flag[health]>
    - if <[health].sub[<context.damage>]> <= 0:
      - define spawner <[entity].flag[spawner_entity]>
      - adjust <mythicspawner[<[entity].flag[id]>]> disable
      - playsound sound:block.spawner.break <[entity].location> sound_category:blocks
      - flag server somni.<[entity].flag[somni]>.spawners:<-:<[entity]>
      - remove <[entity]>
      - remove <[spawner]>
      - flag server somni.<[entity].flag[somni]>.broken_spawners:->:<[entity].flag[id]>
    - else:
      - define newhealth <[health].sub[<context.damage>]>
      - flag <[entity]> health:<[newhealth]>
      - playeffect effect:block at:<[entity].location.above[1]> special_data:iron_block quantity:10
      - playsound sound:block.spawner.hit <[entity].location> sound_category:blocks
    after reload scripts:
    - foreach <server.flag[somni].keys> as:somni_name:
      - foreach <server.flag[somni.<[somni_name]>.broken_spawners]||null> as:spawner_id:
        - adjust <mythicspawner[<[spawner_id]>]> disable

Dungeon_Core_Interaction:
    type: entity
    entity_type: interaction
    mechanisms:
        #is_aware: true
        height: 2


Dungeon_Core:
    type: item
    material: rabbit_foot
    display name: <red><bold>Dungeon Core
    mechanisms:
      custom_model_data: 301

Dungeon_Core_Stabilizer:
    type: item
    material: rabbit_foot
    display name: <red><bold>Dungeon Core Stabilizer
    mechanisms:
      custom_model_data: 302

Dungeon_Return_Portal:
    type: item
    material: rabbit_foot
    display name: <red><bold>Dungeon Return Portal
    mechanisms:
      custom_model_data: 303

Dungeon_Spawner:
    type: item
    material: string
    display name: <red><bold>Dungeon Spawner
    mechanisms:
      components_patch:
        item_model: string:dungeons:fountain

Dungeon_Spawner_Interaction:
    type: entity
    entity_type: interaction
    mechanisms:
        height: 1
        width: 1

Dungeon_Stone:
    type: item
    material: rabbit_foot
    display name: <red><bold>Dungeon Stone
    mechanisms:
      custom_model_data: 304

Dungeon_Stone_Interaction:
    type: entity
    entity_type: interaction
    mechanisms:
        #is_aware: true
        height: 3
        width: 1.5

Somni_Stone_Interaction:
  type: world
  events:
    on player right clicks Dungeon_Stone_Interaction:
    - ratelimit <player> 1t
    - inventory open d:SomniMenu_Inventory
    on player clicks item in SomniMenu_Inventory:
    - define somni_item <context.item>
    - if <context.slot> != -998:
      - teleport <player> <location[<[somni_item].flag[entrance]>]>

SomniMenu_Inventory:
  type: inventory
  inventory: chest
  gui: true
  title: <gold>Dungeon Stone Network
  procedural items:
  - define result <list>
  # Add some logic!
  - foreach <script[SomniMenu_Data].list_keys.exclude[type]> as:somni:
    - if !<script[SomniMenu_Data].data_key[<[somni]>.enabled]>:
      - foreach next
    - else:
      - define somni_map <script[SomniMenu_Data].data_key[<[somni]>]>
      - define item <item[<[somni_map].get[icon]>]>
      - foreach <[somni_map].keys> as:key:
        - adjust def:item flag:<[key]>:<[somni_map].get[<[key]>]>
      - adjust def:item display:<[somni_map].get[name].parsed>
      - adjust def:item lore:<[somni_map].get[description].parsed><n><red>Danger<white><&co><&sp><blue><[somni_map].get[danger].to_titlecase><n><gold><bold>Status<white><&co><&sp><gold><server.flag[somni.<[somni]>.status].to_titlecase><n><yellow>Cost<white><&co><&sp><gold><[somni_map].get[cost]>
      - define result:->:<[item]>
  - determine <[result]>
  slots:
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []

SomniMenu_Data:
  type: data
  testschem:
    name: <white>Test Schematic Cell
    cost: 0
    description: <light_purple>A staging ground for testing new mechanics.
    danger: minimal
    enabled: false
    entrance: testschementrance
    exit: testschemexit
    icon: barrier
  sentient_undergrowth:
    name: <dark_green>Sentient Undergrowth
    cost: 0
    description: <light_purple>Ancient overgrown ruins with a story to tell.
    danger: moderate
    enabled: false
    entrance: sentient_undergrowthentrance
    exit: sentient_undergrowthexit
    icon: vine
  ruined_city:
    name: <dark_red>Ruined City
    cost: 0
    description: <light_purple>A once great city now in ruins.
    danger: high
    enabled: true
    entrance: ruined_cityentrance
    exit: ruined_cityexit
    icon: cobblestone

