# This file stores the scripts and data that involve all the Races for the server.

# Recreated: 11/27/2024




Race_Menu_Event:
    type: world
    debug: false
    events:
        on player clicks item in race_select_inventory:
        - define item <context.item>
        - if <context.slot> in <list[29|30|31|32|33|34|35|38]>:
          - define selection <context.item.flag[race]>
          - inventory set o:<item[Race_<[selection]>_Head].with_single[display=<green>Selected Race<white><&co><&sp><gold><[selection].to_titlecase>]> slot:5 destination:<player.open_inventory>
          - if <[selection]> == human:
            - flag player race.name:Human
            - flag player stat.strength:5
            - flag player stat.agility:5
            - flag player stat.toughness:5
            - flag player stat.endurance:5
            - flag player stat.vitality:5
            - flag player stat.intelligence:5
            - flag player stat.wisdom:5
            - flag player race.bonus:!
            - adjust <player> attribute_base_values:<map[scale=1]>
          - else if <[selection]> == elf:
            - flag player race.name:Elf
            - flag player stat.strength:3
            - flag player stat.agility:6
            - flag player stat.toughness:7
            - flag player stat.endurance:4
            - flag player stat.vitality:6
            - flag player stat.intelligence:6
            - flag player stat.wisdom:7
            - flag player race.bonus:!
            - adjust <player> attribute_base_values:<map[scale=1.1]>
          - else if <[selection]> == dwarf:
            - flag player race.name:Dwarf
            - flag player stat.strength:6
            - flag player stat.agility:3
            - flag player stat.toughness:7
            - flag player stat.endurance:7
            - flag player stat.vitality:5
            - flag player stat.intelligence:4
            - flag player stat.wisdom:3
            - flag player race.bonus:!
            - adjust <player> attribute_base_values:<map[scale=0.75]>
          - else if <[selection]> == fairy:
            - flag player race.name:Fairy
            - flag player stat.strength:2
            - flag player stat.agility:7
            - flag player stat.toughness:2
            - flag player stat.endurance:4
            - flag player stat.vitality:3
            - flag player stat.intelligence:5
            - flag player stat.wisdom:7
            - adjust <player> attribute_base_values:<map[scale=0.5]>
            - flag player race.bonus:slow_flight
          - else if <[selection]> == orc:
            - flag player race.name:Orc
            - flag player stat.strength:7
            - flag player stat.agility:4
            - flag player stat.toughness:6
            - flag player stat.endurance:6
            - flag player stat.vitality:7
            - flag player stat.intelligence:3
            - flag player stat.wisdom:2
            - flag player race.bonus:!
            - adjust <player> attribute_base_values:<map[scale=1.33]>
          - else if <[selection]> == zoaki:
            - flag player race.name:Zoaki
            - flag player stat.strength:6
            - flag player stat.agility:6
            - flag player stat.toughness:5
            - flag player stat.endurance:6
            - flag player stat.vitality:5
            - flag player stat.intelligence:4
            - flag player stat.wisdom:3
            - flag player race.bonus:!
            - adjust <player> attribute_base_values:<map[scale=1.2]>
          - else if <[selection]> == finfolk:
            - flag player race.name:Finfolk
            - flag player stat.strength:4
            - flag player stat.agility:6
            - flag player stat.toughness:5
            - flag player stat.endurance:5
            - flag player stat.vitality:5
            - flag player stat.intelligence:6
            - flag player stat.wisdom:6
            - flag player race.bonus:!
            - adjust <player> attribute_base_values:<map[scale=0.9]>
            - flag player race.bonus:water_affinity
          - else if <[selection]> == goblin:
            - flag player race.name:Goblin
            - flag player stat.strength:4
            - flag player stat.agility:6
            - flag player stat.toughness:4
            - flag player stat.endurance:5
            - flag player stat.vitality:4
            - flag player stat.intelligence:6
            - flag player stat.wisdom:4
            - flag player race.bonus:!
            - adjust <player> attribute_base_values:<map[scale=0.65]>
          - inventory open d:race_select_inventory
        - if <context.slot> == 50:
          - define selection <player.open_inventory.slot[5].flag[race]>
          - narrate "<green>You are now a <player.flag[race.name].to_titlecase>!"
          - inventory close
          - execute as_player "npcchat 0 welcome.option1.option1"
        #on player opens Race_Select_Inventory:
        #- run Race_Menu_Update def:human

Race_Select_Inventory:
    type: inventory
    debug: false
    title: <light_purple>Pick a Race!
    inventory: chest
    gui: true
    slots:
    - [GUINull] [GUINull] [GUINull] [GUINull] [<item[Race_<player.flag[race.name]>_Head].with_single[display=<green>Selected Race<white><&co><&sp><gold><player.flag[race.name]>]>] [GUINull] [GUINull] [GUINull] [GUINull]
    - [GUINull] [Stat_Strength] [Stat_Agility] [Stat_Toughness] [Stat_Endurance] [Stat_Vitality] [Stat_Wisdom] [Stat_Intelligence] [GUINull]
    - [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [GUINull] [Race_Human_Head] [Race_Elf_Head] [Race_Dwarf_Head] [Race_Fairy_Head] [Race_Orc_Head] [Race_Finfolk_Head] [Race_Zoaki_Head] [GUINull]
    - [GUINull] [Race_Goblin_Head] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull] [GUINull]
    - [GUINull] [GUINull] [GUINull] [GUINull] [GUIReturn[display=<aqua><bold>Confirm Selection]] [GUINull] [GUINull] [GUINull] [GUINull]


Race_Menu_Update:
    type: task
    debug: false
    definitions: race
    script:
    - narrate "Hello, world!"

Stat_Strength:
    type: item
    debug: false
    material: orange_concrete
    display name: <element[Strength].color[#ff9838]>
    lore:
    - <white><player.flag[stat.Strength]||null>

Stat_Agility:
    type: item
    debug: false
    material: lime_concrete
    display name: <element[Agility].color[#a8ff36]>
    lore:
    - <white><player.flag[stat.Agility]||null>

Stat_Toughness:
    type: item
    debug: false
    material: Black_concrete
    display name: <element[Toughness].color[#5e523d]>
    lore:
    - <white><player.flag[stat.Toughness]||null>

Stat_Endurance:
    type: item
    debug: false
    material: Yellow_concrete
    display name: <element[Endurance].color[#bfb119]>
    lore:
    - <white><player.flag[stat.Endurance]||null>

Stat_Vitality:
    type: item
    debug: false
    material: red_concrete
    display name: <element[Vitality].color[#e85723]>
    lore:
    - <white><player.flag[stat.Vitality]||null>

Stat_Wisdom:
    type: item
    debug: false
    material: blue_concrete
    display name: <element[Wisdom].color[#1447b5]>
    lore:
    - <white><player.flag[stat.Wisdom]||null>

Stat_Intelligence:
    type: item
    debug: false
    material: light_blue_concrete
    display name: <element[Intelligence].color[#24c3e3]>
    lore:
    - <white><player.flag[stat.Intelligence]||null>

Race_Human_Head:
    type: item
    debug: false
    material: player_head
    display name: <gold>Human
    mechanisms:
      skull_skin: e3RleHR1cmVzOntTS0lOOnt1cmw6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTBkMmFhZTVhOGQxZmJiZDUyOTE3MzMwYjg1MDBhMDgyZjQzOTdlY2M5NWQyYTBkNGIzNjA0YThkMjExNWRhZiJ9fX0
    flags:
      race: human
    lore:
    - <white>Base Stats<&co>
    - <white><&sp.repeat[40].strikethrough>
    - <element[Strength].color[#ff9838]><&co> <white><bold>5
    - <element[Agility].color[#a8ff36]><&co> <white><bold>5
    - <element[Toughness].color[#5e523d]><&co> <white><bold>5
    - <element[Endurance].color[#bfb119]><&co> <white><bold>5
    - <element[Vitality].color[#e85723]><&co> <white><bold>5
    - <element[Wisdom].color[#1447b5]><&co> <white><bold>5
    - <element[Intelligence].color[#24c3e3]><&co> <white><bold>5

Race_Elf_Head:
    type: item
    debug: false
    material: player_head
    display name: <gold>Elf
    mechanisms:
      skull_skin: ewogICJ0aW1lc3RhbXAiIDogMTU5NjU1NTA2MjU0MiwKICAicHJvZmlsZUlkIiA6ICJlZDUzZGQ4MTRmOWQ0YTNjYjRlYjY1MWRjYmE3N2U2NiIsCiAgInByb2ZpbGVOYW1lIiA6ICIwMTAwMDExMDAxMDAwMDExIiwKICAic2lnbmF0dXJlUmVxdWlyZWQiIDogdHJ1ZSwKICAidGV4dHVyZXMiIDogewogICAgIlNLSU4iIDogewogICAgICAidXJsIiA6ICJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzM5ZGRjNTM0ZTQ5MjIwZTQ1M2RhZWY4ODNkMDhiNTVlZjg2MjQ4YTUwZDc4MzM0ZjQ2NGU2NmZjYzQ4ZmU3NWMiCiAgICB9CiAgfQp9
    flags:
      race: elf
    lore:
    - <white>Base Stats<&co>
    - <white><&sp.repeat[40].strikethrough>
    - <element[Strength].color[#ff9838]><&co> <white><bold>3
    - <element[Agility].color[#a8ff36]><&co> <white><bold>6
    - <element[Toughness].color[#5e523d]><&co> <white><bold>7
    - <element[Endurance].color[#bfb119]><&co> <white><bold>4
    - <element[Vitality].color[#e85723]><&co> <white><bold>6
    - <element[Wisdom].color[#1447b5]><&co> <white><bold>7
    - <element[Intelligence].color[#24c3e3]><&co> <white><bold>6

Race_Dwarf_Head:
    type: item
    debug: false
    material: player_head
    display name: <gold>Dwarf
    mechanisms:
      skull_skin: ewogICJ0aW1lc3RhbXAiIDogMTczMjc3OTQ0OTE1MiwKICAicHJvZmlsZUlkIiA6ICI5NDdiM2JmNjE4NGM0ZmFhYmRhYWJlNzdlZDAyODRlMCIsCiAgInByb2ZpbGVOYW1lIiA6ICJrZGlkc29hbyIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kYzY2MTJmOGJiYTg1ZDJmM2JjMjYxMjA5OTMzYzVkYTcyZGU1MWUyZmJjOTdkYjZlNzQ2NWFiMzgwZThiNDY0IgogICAgfQogIH0KfQ==
    flags:
      race: dwarf
    lore:
    - <white>Base Stats<&co>
    - <white><&sp.repeat[40].strikethrough>
    - <element[Strength].color[#ff9838]><&co> <white><bold>6
    - <element[Agility].color[#a8ff36]><&co> <white><bold>3
    - <element[Toughness].color[#5e523d]><&co> <white><bold>7
    - <element[Endurance].color[#bfb119]><&co> <white><bold>7
    - <element[Vitality].color[#e85723]><&co> <white><bold>5
    - <element[Wisdom].color[#1447b5]><&co> <white><bold>4
    - <element[Intelligence].color[#24c3e3]><&co> <white><bold>3

Race_Fairy_Head:
    type: item
    debug: false
    material: player_head
    display name: <gold>Fairy
    mechanisms:
      skull_skin: ewogICJ0aW1lc3RhbXAiIDogMTczMjc3OTU5NDIwMSwKICAicHJvZmlsZUlkIiA6ICI3MGQzMzg2YzU5NzA0NmU1YWM4OTNhYmZlYTQ5N2IxMCIsCiAgInByb2ZpbGVOYW1lIiA6ICJST1lMRUU1NDYwIiwKICAic2lnbmF0dXJlUmVxdWlyZWQiIDogdHJ1ZSwKICAidGV4dHVyZXMiIDogewogICAgIlNLSU4iIDogewogICAgICAidXJsIiA6ICJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2NlN2NiMzJiMTgyMDY4MzVlNjBjZWVmZWM1NjdhMDQ4NmI2ZDE0ZDMxNDU1Nzg3M2U4MGQ5Y2U1YzI4YWJlYjIiCiAgICB9CiAgfQp9
    flags:
      race: Fairy
    lore:
    - <white>Base Stats<&co>
    - <white><&sp.repeat[40].strikethrough>
    - <element[Strength].color[#ff9838]><&co> <white><bold>2
    - <element[Agility].color[#a8ff36]><&co> <white><bold>7
    - <element[Toughness].color[#5e523d]><&co> <white><bold>2
    - <element[Endurance].color[#bfb119]><&co> <white><bold>4
    - <element[Vitality].color[#e85723]><&co> <white><bold>3
    - <element[Wisdom].color[#1447b5]><&co> <white><bold>5
    - <element[Intelligence].color[#24c3e3]><&co> <white><bold>7

Race_Orc_Head:
    type: item
    debug: false
    material: player_head
    display name: <gold>Orc
    mechanisms:
      skull_skin: ewogICJ0aW1lc3RhbXAiIDogMTczMjc3OTcyMzE4NiwKICAicHJvZmlsZUlkIiA6ICIxNzRjZmRiNGEzY2I0M2I1YmZjZGU0MjRjM2JiMmM2ZSIsCiAgInByb2ZpbGVOYW1lIiA6ICJtYXJhZWwxOCIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lYWI0OTVkMjJmZTViOWQyYjI0NGFjNWYwYTdmN2I5ZTRmMGIwZmIwOWYxOGM5ZmVjNTBiZWNhZmI1NzRkMmYzIgogICAgfQogIH0KfQ==
    flags:
      race: orc
    lore:
    - <white>Base Stats<&co>
    - <white><&sp.repeat[40].strikethrough>
    - <element[Strength].color[#ff9838]><&co> <white><bold>7
    - <element[Agility].color[#a8ff36]><&co> <white><bold>4
    - <element[Toughness].color[#5e523d]><&co> <white><bold>6
    - <element[Endurance].color[#bfb119]><&co> <white><bold>6
    - <element[Vitality].color[#e85723]><&co> <white><bold>7
    - <element[Wisdom].color[#1447b5]><&co> <white><bold>3
    - <element[Intelligence].color[#24c3e3]><&co> <white><bold>2

Race_Finfolk_Head:
    type: item
    debug: false
    material: player_head
    display name: <gold>Finfolk
    mechanisms:
      skull_skin: ewogICJ0aW1lc3RhbXAiIDogMTY1OTU3NDgzNjk1MSwKICAicHJvZmlsZUlkIiA6ICJmMTkyZGU3MDUzMTQ0ODcxOTAwMjQ1MmIzZWE3MzA3NCIsCiAgInByb2ZpbGVOYW1lIiA6ICJOZVhvU2V0IiwKICAic2lnbmF0dXJlUmVxdWlyZWQiIDogdHJ1ZSwKICAidGV4dHVyZXMiIDogewogICAgIlNLSU4iIDogewogICAgICAidXJsIiA6ICJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQwMzcwNTY3NDc2Njg0YzY2ODkwYmJkMjAyZDllYzdhNzE4ODllZjkzN2YxZGVhOGVlNmE2MWM2NmYzMWI0NmUiCiAgICB9CiAgfQp9
    flags:
      race: finfolk
    lore:
    - <white>Base Stats<&co>
    - <white><&sp.repeat[40].strikethrough>
    - <element[Strength].color[#ff9838]><&co> <white><bold>4
    - <element[Agility].color[#a8ff36]><&co> <white><bold>6
    - <element[Toughness].color[#5e523d]><&co> <white><bold>5
    - <element[Endurance].color[#bfb119]><&co> <white><bold>5
    - <element[Vitality].color[#e85723]><&co> <white><bold>5
    - <element[Wisdom].color[#1447b5]><&co> <white><bold>6
    - <element[Intelligence].color[#24c3e3]><&co> <white><bold>6

Race_Zoaki_Head:
    type: item
    debug: false
    material: player_head
    display name: <gold>Zoaki
    mechanisms:
      skull_skin: ewogICJ0aW1lc3RhbXAiIDogMTYxMzg2NTM3ODg0NiwKICAicHJvZmlsZUlkIiA6ICJmMjc0YzRkNjI1MDQ0ZTQxOGVmYmYwNmM3NWIyMDIxMyIsCiAgInByb2ZpbGVOYW1lIiA6ICJIeXBpZ3NlbCIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9mNDdkYTMyNGRiODBmMTViZjc0NzJiYjIxNDk1MTMzZTA5NjFhOTk2YWFhM2U5YWQ0ZDM1NWE1ZDA5YTgxMGQ4IgogICAgfQogIH0KfQ==
    flags:
      race: zoaki
    lore:
    - <white>Base Stats<&co>
    - <white><&sp.repeat[40].strikethrough>
    - <element[Strength].color[#ff9838]><&co> <white><bold>6
    - <element[Agility].color[#a8ff36]><&co> <white><bold>6
    - <element[Toughness].color[#5e523d]><&co> <white><bold>5
    - <element[Endurance].color[#bfb119]><&co> <white><bold>6
    - <element[Vitality].color[#e85723]><&co> <white><bold>5
    - <element[Wisdom].color[#1447b5]><&co> <white><bold>4
    - <element[Intelligence].color[#24c3e3]><&co> <white><bold>3

Race_Goblin_Head:
  type: item
  debug: false
  material: player_head
  display name: <gold>Goblin
  mechanisms:
    skull_skin: ewogICJ0aW1lc3RhbXAiIDogMTczNzYxMjU5MzI2NSwKICAicHJvZmlsZUlkIiA6ICJkODBlMGYyNjU2M2U0NzI3YWNiZDNlMmRlNDkxYzFiZSIsCiAgInByb2ZpbGVOYW1lIiA6ICJCZWxvemVyb3ZrYSIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8zOGJkZDE2ZTY0ZDA4OGJlYmM3Nzc5ZmVkZGNlMzhhMTc5MDBkZjZlYmVmYTI5YjZmMzUwYjg2MTM0N2EyMzMyIgogICAgfQogIH0KfQ==
  flags:
    race: goblin
  lore:
  - <white>Base Stats<&co>
  - <white><&sp.repeat[40].strikethrough>
  - <element[Strength].color[#ff9838]><&co> <white><bold>4
  - <element[Agility].color[#a8ff36]><&co> <white><bold>6
  - <element[Toughness].color[#5e523d]><&co> <white><bold>4
  - <element[Endurance].color[#bfb119]><&co> <white><bold>5
  - <element[Vitality].color[#e85723]><&co> <white><bold>4
  - <element[Wisdom].color[#1447b5]><&co> <white><bold>6
  - <element[Intelligence].color[#24c3e3]><&co> <white><bold>4

#Human_Book:
#    type: book
#    title: Human
#    author: custom name
#    text:
#    - Human:<n><green>agility: <black>5<gray>/<black>100<n><red>Strength: <black>5<gray>/<black>100<n><gold>vitality: <black>5<gray>/<black>100<n><light_purple>Wisdom: <black>5<gray>/<black>100<n><blue>Intelligence: <black>5<gray>/<black>100<n><aqua>Charisma: <black>5<gray>/<black>100
#
#Elf_Book:
#    type: book
#    title: Elf
#    author: custom name
#    text:
#    - Elf:<n><green>agility: <black>10<gray>/<black>100<n><red>Strength: <black>5<gray>/<black>100<n><gold>vitality: <black>3<gray>/<black>100<n><light_purple>Wisdom: <black>7<gray>/<black>100<n><blue>Intelligence: <black>15<gray>/<black>100<n><aqua>Charisma: <black>0<gray>/<black>100
#
#Avian_Book:
#    type: book
#    title: Avian
#    author: custom name
#    text:
#    - Avian:<n><green>agility: <black>20<gray>/<black>100<n><red>Strength: <black>0<gray>/<black>100<n><gold>vitality: <black>3<gray>/<black>100<n><light_purple>Wisdom: <black>5<gray>/<black>100<n><blue>Intelligence: <black>2<gray>/<black>100<n><aqua>Charisma: <black>15<gray>/<black>100

Race_Bonus_Event:
    type: world
    debug: false
    events:
        after player joins:
        - wait 1t
        - if <player.has_flag[race.bonus]>:
          - run Race_Bonus_Task
        after player changes world:
        - wait 1t
        - if <player.has_flag[race.bonus]>:
          - run Race_Bonus_Task
        after player respawns:
        - wait 1t
        - if <player.has_flag[race.bonus]>:
          - run Race_Bonus_Task
        on player damaged:
        - if <context.entity.flag[race.bonus].if_null[null]> == slow_flight:
          - adjust <context.entity> can_fly:false
          - flag <context.entity> flight_blocked expire:2s
          - wait 2s
          - adjust <context.entity> can_fly:true
Race_Bonus_Task:
  type: task
  debug: false
  script:
  - define race_bonus <player.flag[race.bonus]>
  - choose <[race_bonus]>:
    - case slow_flight:
      - adjust <player> can_fly:true
      - adjust <player> fly_speed:0.03
      - adjust <player> flying_fall_damage:true
    - case water_affinity:
      - cast conduit_power <player> duration:infinite hide_particles amplifier:-1