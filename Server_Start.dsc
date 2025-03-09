# This file has the basic server start up scripts.

# First Created: 03/04/2025

Server_Start_Event:
    type: world
    events:
        after server start:
        - wait 1m
        - foreach <server.flag[somni].keys> as:somni_name:
          - foreach <server.flag[somni.<[somni_name]>.broken_spawners]> as:spawner_id:
            - adjust <mythicspawner[<[spawner_id]>]> disable
          - if <server.flag[somni.<[somni_name]>].get[status]> == cleared:
            - foreach <server.flag[somni.<[somni_name]>.spawner_ids]> as:spawner_id:
              - adjust <mythicspawner[<[spawner_id]>]> disable
        - run REMOVE_VANILLA_RECIPES