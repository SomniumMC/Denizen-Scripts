# This file contains the scripts and effects for the Storm mechanic. It triggers every Sunday. If a player is stuck outside a bunker when the storm starts, then the player will encounter negative effects.

# First Created: 02/04/2025

Storm_Scheduler:
  type: world
  debug: false
  events:
    # This will start the storm at 12:00(Noon) for PST, as PST is -7 from UTC(Server Time)
    on system time 19:00:
    - if <util.time_now.day_of_week> == 7:
      - run Storm_Starter

Storm_Player_Check:
    type: world
    debug: false
    events:
      on player joins:
      - if <server.flag[storm.stage]> == warning:
        - narrate targets:<player> "<red><bold>Bells can be heard ringing in the distance while the skys start turning for the worst."
      - if <server.flag[storm.stage]> in <list[warning|finished]>:
        - flag <player> storm:!
      on delta time secondly:
      - if <server.flag[storm.stage]> in <list[started|danger]>:
        - foreach <server.online_players> as:__player:
          - run Storm_Check def.player:<player>
      on player respawns:
      - if <server.flag[storm.stage]> in <list[started|danger]>:
        - determine <location[Satus_Bunker_Respawn]>

Storm_Starter:
  type: task
  debug: false
  script:
  - announce "<red><bold>Bells can be heard ringing in the distance while the skys start turning for the worst."
  - repeat 5:
    - foreach <server.online_players> as:__player:
      - playsound sound:block.bell.use <player> sound_category:blocks pitch:0.7
    - wait 1s
  - flag server storm.stage:warning
  - modifyblock <cuboid[bunker_door_satus]> air
  - wait 10m
  - flag server storm.stage:started
  - wait 3m
  - flag server storm.stage:danger
  - wait 4m
  - foreach <server.flag[somni].keys> as:somni_name:
    - if <server.flag[somni.<[somni_name]>].get[status]> == cleared:
      - define eligible_list:->:<[somni_name]>
  - if !<[eligible_list].is_empty>:
    - foreach <[eligible_list]> as:somni:
      - run SomniReset def:<[somni]>
      - wait 1m
  - flag server storm.stage:finished
  - announce "<gold>The world is once more bathed in cleansing energy as the Storm has ended."
  - wait 20m
  - modifyblock <cuboid[bunker_door_satus]> oak_fence[faces=north|south]

Storm_Check:
    type: task
    debug: false
    definitions: player
    script:
    - if <player.has_flag[storm]>:
      - if <player.location.is_in[area_flagged:bunker]>:
        - flag <player> storm:!
      - else if <server.flag[storm.stage]> == started:
        - run Storm_Effect def:<player>
      - else if <server.flag[storm.stage]> == danger:
        - if <[player].gamemode> == survival:
          - hurt 10 <[player]> cause:SUICIDE
    - else if !<player.location.is_in[area_flagged:bunker]>:
      - flag <player> storm

Storm_Effect:
    type: task
    debug: false
    definitions: player
    script:
    - define storm_data <[player].flag[storm]>
    - repeat 4:
      - playeffect effect:dust special_data:5|white at:<[player].eye_location> quantity:20 targets:<[player]> offset:2.0
      - wait 5t
    - hurt <[player]> 1 cause:SUICIDE
