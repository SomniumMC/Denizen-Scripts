# This file contains the main framework that manages NPCs on the server.

# First Created: 11/20/2024

NPC_Event_Main:
    type: world
    debug: false
    events:
        on player right clicks npc:
        - ratelimit <player> 5t
        - define npc_id <context.entity.id>
        - define npc_name <script[NPC_ID_Storage].data_key[<[npc_id]>]||null>
        #- narrate <[npc_name]>

        - if <[npc_name]> == null:
          - stop

        - run NPC_Dialog_Welcome def.npc_name:<[npc_name]> def.npc_id:<[npc_id]>


NPC_Dialog_Welcome:
    type: task
    debug: false
    definitions: npc_name|npc_id
    script:
    - define dialog_data <script[NPC_DialogTree_<[npc_name]>]>
    - define welcome_data <[dialog_data].data_key[welcome]>
    - define npc_display <[dialog_data].data_key[display].parsed.if_null[<[npc_name].replace[_].with[ ]>]>

    - run NPC_Chat def.npc:<[npc_name]> def.type:chatting def.data:<[welcome_data]> def.npc_display:<[npc_display]>


NPC_ID_Storage:
    type: data
    debug: false
    6: test_npc
    0: Nyomi
    1: Rhea
    43: Ferryman_Satus
    44: Ferryman_Mainland

    42: Bank_Satus
    27: Blacksmith_Satus
    28: Grocer_Satus
    29: Tailor_Satus
    30: Bank_Satus
    31: Lumberjack_Satus
    32: Glassblower_Satus
    33: Generalstore_Satus
    34: Leatherworker_Satus
    35: Arenaworker_Satus
    36: Jeweler_Satus
    37: Florist_Satus
    38: Baker_Satus
    39: Auctioneer_Satus
    40: Fairy_Renter_Satus

    41: Librarian_Satus

    45: Ayla
    46: Talfein_Satus
    47: Avalris

NPC_Chat:
    type: task
    debug: false
    definitions: data|type|npc|npc_display
    script:
    - flag <player> chatting:<[npc]> expire:1m

    - choose <[type]>:
      - case chatting:
        - narrate <&sp.repeat[40].strikethrough>

        - narrate "<&lb><[npc_display]><&rb> <white>- <[data].get[dialog].parsed>"
        - foreach <[data].keys.exclude[dialog]> as:option:
          - define option_data <[data].get[<[option]>]>
          - define req_flag <[option_data].get[req_flag]||null>
          - define deny_flag <[option_data].get[deny_flag]||null>
          - define deny_has_flag <[option_data].get[deny_has_flag]||null>
          - define has_flag <[option_data].get[has_flag]||null>
          - if <[req_flag]> != null:
            - if <[req_flag].get[target]> == player:
              - if <player.flag[<[req_flag].get[flag]>]> != <[req_flag].get[value]>:
                - foreach next
          - if <[has_flag]> != null:
            - if <[has_flag].get[target]> == player:
              - choose <[has_flag].get[bool]>:
                - case true:
                  - if <player.has_flag[<[has_flag].get[flag]>]>:
                    - define success
                  - else:
                    - foreach next
                - case false:
                  - if !<player.has_flag[<[has_flag].get[flag]>]>:
                    - define success
                  - else:
                    - foreach next
          - if <[deny_flag]> != null:
            - if <[deny_flag].get[target]> == player:
              - if <player.flag[<[deny_flag].get[flag]>]> == <[deny_flag].get[value]>:
                - foreach next
          - if <[deny_has_flag]> != null:
            - if <[deny_flag].get[target]> == player:
              - if <player.has_flag[<[deny_has_flag].get[flag]>]>:
                - foreach next

            #
            #
          - flag player chat_option<[loop_index]>:<[option_data]> expire:30s
          - narrate "<[loop_index]><&co> <element[<[option_data].get[text].parsed>].on_hover[<red>Click].on_click[/npcchat <[npc]> chat_option<[loop_index]>].type[run_command]>"

        - narrate <&sp.repeat[40].strikethrough>
      - case end:
        - flag <player> chatting:<empty>
        #- narrate <[data]>
        #- if <[data].get[key]>
        - narrate "<gray><italic>You have finished talking with them."
      - case quest_start:
        - flag <player> chatting:<empty>
        - narrate "<gold><italic>You have started the Quest: <script[quest_data_<[data]>].data_key[quest_name].parsed>!"
      - case quest_end:
        - flag <player> chatting:<empty>
        #- define quest_data 
        - narrate "<gold><italic>You have finished the Quest: <script[quest_data_<[data]>].data_key[quest_name].parsed>!"
      - case quest_progress:
        - flag <player> chatting:<empty>
        - narrate "<gold><italic>You have progressed in your current Quest."
      - case inventory:
        - inventory open d:<[data]>
      - case teleport:
        - teleport <player> <location[<[data]>]>
      - case shop:
        - flag <player> shop_data:<script[NPC_ShopData_<[npc]>]>
        - inventory open d:NPC_Shop_GUI


NPC_Chat_Command:
    type: command
    debug: false
    name: npcchat
    description: Does something
    usage: /npcchat npc chat_flag
    script:
    - define npc <context.args.get[1]>
    - define chat_data <player.flag[<context.args.get[2]>]||null>
    - define type <[chat_data].get[type]>
    - define key <[chat_data].get[key]>
    - if <[chat_data]> == null:
      - narrate "<red>Options Expired!"
      - flag <player> chatting:<empty>
      - stop
    - if <player.flag[chatting]> != <[npc]>:
      - narrate "<red>You are not talking to this npc!"
      - stop

    - if <[chat_data].get[flag]||null> != null:
      - flag <[chat_data].get[flag].get[target]> <[chat_data].get[flag].get[flag]>:<[chat_data].get[flag].get[value]>

    - if <[chat_data].get[task]||null> != null:
      - run <[chat_data].get[task].get[key]>

    - if <[chat_data].get[give]||null> != null:
      - give item:<[chat_data].get[give].get[item]> quantity:<[chat_data].get[give].get[quantity]>

    - define data <script[NPC_DialogTree_<[npc]>].data_key[<[key]>]||null>
    - define npc_display <script[NPC_DialogTree_<[npc]>].data_key[display].parsed.if_null[<[npc].replace[_].with[ ]>]>
    - if <[data]||null> == null:
      - define data <[key]>
    - run NPC_Chat def.npc:<[npc]> def.type:<[type]> def.data:<[data]> def.npc_display:<[npc_display]>




NPC_Shop_GUI:
  type: inventory
  debug: false
  inventory: chest
  title: <green>Shop
  gui: true
  procedural items:
  - define result <list>
  - define shop_data <player.flag[shop_data].data_key[shop]>
  - foreach <[shop_data].keys> as:entry:
    - define entry_data <player.flag[shop_data].data_key[shop.<[entry]>]>
    - define reference_item <item[<[entry]>]>

    - define construct_item <item[<[reference_item].material>].with_single[custom_model_data=<[reference_item].custom_model_data>]>

    - adjust def:construct_item flag:reference_item:<[entry]>
    - adjust def:construct_item flag:entry_data:<[entry_data]>
    - adjust def:construct_item flag:price:<[entry_data].get[value]>
    - adjust def:construct_item quantity:<[entry_data].get[quantity]||1>
    - if <[entry_data].get[markup]||null> != null:
      - adjust def:construct_item flag:sell_price:<[entry_data].get[value].before[$].mul[0.<[entry_data].get[markup]>].round_to[1]>$<[entry_data].get[value].after[$]>

    - adjust def:construct_item display:<[reference_item].display>
    - adjust def:construct_item lore:<proc[NPC_Shop_PriceDisplay_Proc].context[<[construct_item]>]>



    - define result:->:<[construct_item]>
  - determine <[result]>
  slots:
  - [GuiNull] [GuiNull] [GuiNull] [GuiL] [GuiNull] [GuiNull] [GuiNull] [GuiR] [GuiNull]
  - [GuiNull] [currency1] [GuiNull] [] [] [] [] [] [GuiNull]
  - [GuiNull] [currency2] [GuiNull] [] [] [] [] [] [GuiNull]
  - [GuiNull] [currency3] [GuiNull] [] [] [] [] [] [GuiNull]
  - [GuiNull] [currency4] [GuiNull] [] [] [] [] [] [GuiNull]
  - [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull] [GuiNull]


NPC_Shop_Event:
  type: world
  debug: false
  events:
    on player clicks item in NPC_Shop_GUI:
    - define item <context.item>
    - define click_type <context.click>
    - if <context.slot> !in <list[13|14|15|16|17|22|23|24|25|26|31|32|33|34|35|40|41|42|43|44]>:
      - determine cancelled
    - define item_price <[item].flag[price]>
    - define sell_price <[item].flag[sell_price]||null>
    - define quantity <[item].quantity>
    - choose <[item_price].after[$]>:
      - case 1:
        - define currency_slot 11
      - case 2:
        - define currency_slot 20
      - case 3:
        - define currency_slot 29
      - case 4:
        - define currency_slot 38
    - if <[click_type]> == left:
      - if <player.open_inventory.slot[<[currency_slot]>].flag[stored]> >= <[item_price].before[$]>:
        - inventory adjust slot:<[currency_slot]> destination:<player.open_inventory> flag:stored:<player.open_inventory.slot[<[currency_slot]>].flag[stored].sub[<[item_price].before[$]>]>
        - inventory adjust slot:<[currency_slot]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[<player.open_inventory.slot[<[currency_slot]>].script.name>].display.before[<item[<player.open_inventory.slot[<[currency_slot]>].script.name>].display.strip_color>]><player.open_inventory.slot[<[currency_slot]>].flag[stored]><white>/<light_purple>300
        - playsound sound:BLOCK.CHAIN.STEP <player> sound_category:players volume:0.7

        - give item:<proc[Apply_Info_Proc].context[<item[<context.item.flag[reference_item]>]>]> quantity:<[quantity]>
      - else:
        - narrate "<red>You don't have enough of this currency!"
    - else if <[click_type]> == right:
      - if <[sell_price]> == null:
        - narrate "<red>You cannot sell this item!"
        - stop
      - if <player.inventory.contains_item[<[item].flag[reference_item]>].quantity[<[quantity]>]>:
        - inventory adjust slot:<[currency_slot]> destination:<player.open_inventory> flag:stored:<player.open_inventory.slot[<[currency_slot]>].flag[stored].add[<[sell_price].before[$]>]>
        - inventory adjust slot:<[currency_slot]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[<player.open_inventory.slot[<[currency_slot]>].script.name>].display.before[<item[<player.open_inventory.slot[<[currency_slot]>].script.name>].display.strip_color>]><player.open_inventory.slot[<[currency_slot]>].flag[stored]><white>/<light_purple>300
        - playsound sound:BLOCK.CHAIN.STEP <player> sound_category:players volume:0.7

        - take item:<[item].flag[reference_item]> quantity:<[quantity]>
      - else:
        - narrate "<red>You are missing this item!"
    after player opens NPC_Shop_GUI:
    - define slot1 11
    - define slot2 20
    - define slot3 29
    - define slot4 38

    - define purse_slot <player.inventory.find_all_items[coinpurse].first.if_null[null]>
    - inventory adjust slot:11 destination:<player.open_inventory> flag:purse_slot:<[purse_slot]>
    - definemap currencies:
        currency1: <player.inventory.slot[<[purse_slot]>].flag[currency1]>
        currency2: <player.inventory.slot[<[purse_slot]>].flag[currency2]>
        currency3: <player.inventory.slot[<[purse_slot]>].flag[currency3]>
        currency4: <player.inventory.slot[<[purse_slot]>].flag[currency4]>

    - inventory adjust slot:<[slot1]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[currency1].display.before[<item[currency1].display.strip_color>]><[currencies].get[currency1]><white>/<light_purple>300
    - inventory adjust slot:<[slot1]> destination:<player.open_inventory> flag:stored:<[currencies].get[currency1]>
    - inventory adjust slot:<[slot2]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[currency2].display.before[<item[currency2].display.strip_color>]><[currencies].get[currency2]><white>/<light_purple>300
    - inventory adjust slot:<[slot2]> destination:<player.open_inventory> flag:stored:<[currencies].get[currency2]>
    - inventory adjust slot:<[slot3]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[currency3].display.before[<item[currency3].display.strip_color>]><[currencies].get[currency3]><white>/<light_purple>300
    - inventory adjust slot:<[slot3]> destination:<player.open_inventory> flag:stored:<[currencies].get[currency3]>
    - inventory adjust slot:<[slot4]> destination:<player.open_inventory> lore:<gold>Current<&sp>Amount<&co><&sp><light_purple><item[currency4].display.before[<item[currency4].display.strip_color>]><[currencies].get[currency4]><white>/<light_purple>300
    - inventory adjust slot:<[slot4]> destination:<player.open_inventory> flag:stored:<[currencies].get[currency4]>
    on player closes NPC_Shop_GUI:
    - definemap currencies:
        currency1: <context.inventory.slot[11].flag[stored]>
        currency2: <context.inventory.slot[20].flag[stored]>
        currency3: <context.inventory.slot[29].flag[stored]>
        currency4: <context.inventory.slot[38].flag[stored]>
    - define purse_slot <context.inventory.slot[11].flag[purse_slot]>
    - run CoinPurse_Update_Task defmap:<[currencies]> def.slot:<[purse_slot]>

NPC_Shop_PriceDisplay_Proc:
  type: procedure
  debug: false
  definitions: item
  script:
  - define entry_data <[item].flag[entry_data]>

  - define price <[entry_data].get[value]>

  - if <[entry_data].get[markup]||null> != null:
    - define sell_price <[item].flag[sell_price].before[$]>
    - define sell_check <white><&lt><gold>Right<&sp>Click<white><&gt><&sp>to<&sp>sell<&sp><gold>1<n>
    - define sell_text  <n><red>Sell<&sp>Price<&co><&sp><item[currency<[price].after[$]>].display.before[<item[currency<[price].after[$]>].display.strip_color>]><[sell_price]><&sp><item[currency<[price].after[$]>].display.strip_color>


  - define buttons <white><&lt><blue>Left<&sp>Click<white><&gt><&sp>to<&sp>purchase<&sp><gold>1<n><[sell_check].if_null[]><white><&lt><light_purple>Middle<&sp>Click<white><&gt><&sp><white>to<&sp>toggle<&sp><white><&lb><green>Description<white><&rb>
  - define break <n><&sp.repeat[40].strikethrough>


  - define buy_text <aqua>Price<&co><&sp><item[currency<[price].after[$]>].display.before[<item[currency<[price].after[$]>].display.strip_color>]><[price].before[$]><&sp><item[currency<[price].after[$]>].display.strip_color>
  - define price_info <n><[buy_text]><[sell_text].if_null[ ]>

  - define lore <[buttons]><[break]><[price_info]>

  - determine <[lore]>