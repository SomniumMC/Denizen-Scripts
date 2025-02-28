# This file manages the currency system and conversion for currency automatically when needed for shops or banks.

# First Created 11/25/2024

Currency_Pickup_Event:
    type: world
    events:
        on player picks up item_flagged:currency:
        - define item <context.item>
        - define purse_slot <player.inventory.find_all_items[coinpurse].first.if_null[null]>
        - if <[purse_slot]> != null:
          - define purse_item <player.inventory.slot[<[purse_slot]>]>
          - define coin_type <[item].flag[currency]>
          - define coin_amount <[item].quantity>
          - playsound sound:BLOCK.CHAIN.STEP <player> sound_category:players volume:0.7
          - choose <[coin_type]>:
            - case 1:
              - define currency_adjust <player.inventory.slot[<[purse_slot]>].flag[currency1].add[<[coin_amount]>]>
            - case 2:
              - define currency_adjust <player.inventory.slot[<[purse_slot]>].flag[currency2].add[<[coin_amount]>]>
            - case 3:
              - define currency_adjust <player.inventory.slot[<[purse_slot]>].flag[currency3].add[<[coin_amount]>]>
            - case 4:
              - define currency_adjust <player.inventory.slot[<[purse_slot]>].flag[currency4].add[<[coin_amount]>]>
          #- define currency_adjust <[currencies].get[<[coin_type]>].add[<[coin_amount]>]>
          - if <[currency_adjust]> > 300:
            - define new_quantity <[currency_adjust].sub[300]>
            - define currency_adjust 300
            - adjust def:item quantity:<[new_quantity]>
            - determine item:<[item]> passively
          #<player.inventory.slot[<[purse_slot]>].flag[currency<[coin_type]>]>
          - inventory adjust slot:<[purse_slot]> destination:<player.inventory> flag:currency<[coin_type]>:<[currency_adjust]>
          - definemap currencies:
              currency1: <player.inventory.slot[<[purse_slot]>].flag[currency1]>
              currency2: <player.inventory.slot[<[purse_slot]>].flag[currency2]>
              currency3: <player.inventory.slot[<[purse_slot]>].flag[currency3]>
              currency4: <player.inventory.slot[<[purse_slot]>].flag[currency4]>
          - run CoinPurse_Update_Task defmap:<[currencies]> def.slot:<[purse_slot]>
          - if <[currency_adjust]> != 300:
            - determine item:air


Currency_Purse_Event:
    type: world
    events:
        on player right clicks block with:Coinpurse:
        - inventory open d:Coinpurse_GUI
        on player clicks item in Coinpurse_GUI:
        - ratelimit <player> 1t
        - define item <context.item>
        - define coin_purse <player.item_in_hand>
        - define slot <context.slot>
        - define click_type <context.click>
        - determine cancelled passively
        - wait 1t
        - if <[item].has_flag[currency_button]>:
          - define currency_value <[item].flag[currency_button]>
          - define amount <[item].flag[stored]>
          - if <[click_type]> == left:
            - foreach <player.inventory.find_all_items[item_flagged:currency]> as:slot_id:
              - if <player.inventory.slot[<[slot_id]>].flag[currency]> == <[currency_value].after[currency]>:
                - define coin_slot:<[slot_id]>
                - foreach stop
            - if <[coin_slot]||null> == null:
              - stop
            - define mod:1
            - define mod_amount <[amount].add[<[mod]>]>
            - if <[amount]> >= 300:
              - stop
            - take item:currency<[currency_value].after[currency]> quantity:1
          - if <[click_type]> == right:
            - if <[amount]> == 0:
              - stop
            - define mod:-1
            - if <[amount]> >= 1:
              - define mod_amount <[amount].add[<[mod]>]>
              - give item:currency<[currency_value].after[currency]> quantity:1
          - if <[click_type]> == shift_left:
            - foreach <player.inventory.find_all_items[item_flagged:currency]> as:slot_id:
              - if <player.inventory.slot[<[slot_id]>].flag[currency]> == <[currency_value].after[currency]>:
                - define coin_slot:<[slot_id]>
                - foreach stop
            - if <[coin_slot]||null> == null:
              - stop
            - if <[amount]> >= 300:
              - stop
            - define mod:64
            - if <player.inventory.slot[<[coin_slot]>].quantity> < <[mod]>:
              - define mod_amount <[amount].add[<player.inventory.slot[<[coin_slot]>].quantity>]>
              - if <[mod_amount]> > 300:
                - define new_quantity <[mod_amount].sub[300].sub[64].abs>
                - define mod_amount 300
              - else:
                - define new_quantity <player.inventory.slot[<[coin_slot]>].quantity>
              - take item:currency<[currency_value].after[currency]> quantity:<[new_quantity]>
            - else:
              - define mod_amount <[amount].add[<[mod]>]>
              - if <[mod_amount]> > 300:
                - define new_quantity <[mod_amount].sub[300].sub[64].abs>
                - define mod_amount 300
              - else:
                - define new_quantity 64
              - take item:currency<[currency_value].after[currency]> quantity:<[new_quantity]>
          - if <[click_type]> == shift_right:
            - define mod:-64
            - if <[amount]> == 0:
              - stop
            - if <[amount]> >= 64:
              - define mod_amount <[amount].add[<[mod]>]>
              - give item:currency<[currency_value].after[currency]> quantity:64
            - else if <[amount]> >= 1:
              - define mod_amount 0
              - give item:currency<[currency_value].after[currency]> quantity:<[amount]>
          - if <[click_type]> == double_click:
            - stop
          - if <[click_type]> == middle:
            - define mod_amount 0
            - give item:currency<[currency_value].after[currency]> quantity:<[amount]>


          - if <[mod_amount]||null> == null:
            - narrate <red>Error!
            - define mod_amount <[amount]>
            - stop

          - playsound sound:BLOCK.CHAIN.STEP <player> sound_category:players volume:0.7
          - inventory adjust slot:<[currency_value].after[currency]> destination:<player.open_inventory> flag:stored:<[mod_amount]>
          - inventory adjust slot:<[currency_value].after[currency]> destination:<player.open_inventory> lore:<white><&lt><blue>Left<&sp>Click<white><&gt><&sp>to<&sp>deposit<&sp><gold>1<&sp><white>coin.<n><white><&lt><gold>Right<&sp>Click<white><&gt><&sp>to<&sp>withdraw<&sp><gold>1<&sp><white>coin.<n><red>Hold<&sp><white><&lt><light_purple>Shift<white><&gt><&sp><red>to<&sp>change<&sp>to<&sp><gold>64<n><gold>Current<&sp>Amount<&co><&sp><light_purple><[mod_amount]>/300
        #- else:
        on player closes Coinpurse_GUI:
        - define inventory <context.inventory>
        - definemap currencies:
            currency1: <[inventory].slot[1].flag[stored]>
            currency2: <[inventory].slot[2].flag[stored]>
            currency3: <[inventory].slot[3].flag[stored]>
            currency4: <[inventory].slot[4].flag[stored]>

        - run CoinPurse_Update_Task defmap:<[currencies]> def.slot:hand

CoinPurse_Update_Task:
    type: task
    definitions: currency1|currency2|currency3|currency4|slot|inventory
    script:
    #- narrate <[currency1]>
    - inventory adjust slot:<[slot]> destination:<[inventory].if_null[<player.inventory>]> flag:currency1:<[currency1]>
    - inventory adjust slot:<[slot]> destination:<[inventory].if_null[<player.inventory>]> flag:currency2:<[currency2]>
    - inventory adjust slot:<[slot]> destination:<[inventory].if_null[<player.inventory>]> flag:currency3:<[currency3]>
    - inventory adjust slot:<[slot]> destination:<[inventory].if_null[<player.inventory>]> flag:currency4:<[currency4]>
    - inventory adjust slot:<[slot]> destination:<[inventory].if_null[<player.inventory>]> lore:<[inventory].if_null[<player.inventory>].slot[<[slot]>].lore.set[<green>Stored Amount<white><&co><&sp><element[C].color[#f2963a]><gray><[currency1]><&sp><element[S].color[#918c87]><gray><[currency2]><&sp><element[G].color[#c2ae00]><gray><[currency3]><&sp><element[P].color[#93dbda]><gray><[currency4]>].at[3]>

CoinPurse_Max_Check:
  type: procedure
  definitions: current
  script:
  - determine true


Currency_Data:
    type: data
    1:
      base_value: 1
    2:
      base_value: 64
      1-2: 64
    3:
      base_value: 4096
      1-3: 4096
      2-3: 100
    4:
      base_value: 262144
      1-4: 262144
      2-4: 4096
      3-4: 64


Currency1:
    type: item
    material: brick
    display name: <element[Copper Crus].color[#f2963a]>
    mechanisms:
      custom_model_data: 35001
    flags:
      value: 1
      currency: 1
Currency2:
    type: item
    material: brick
    display name: <element[Silver Crus].color[#918c87]>
    mechanisms:
      custom_model_data: 35002
    flags:
      value: 100
      currency: 2
Currency3:
    type: item
    material: brick
    display name: <element[Gold Crus].color[#c2ae00]>
    mechanisms:
      custom_model_data: 35003
    flags:
      value: 1000
      currency: 3
Currency4:
    type: item
    material: brick
    display name: <element[Platinum Crus].color[#93dbda]>
    mechanisms:
      custom_model_data: 35004
    flags:
      value: 1000
      currency: 4


Coinpurse_GUI:
    type: inventory
    inventory: hopper
    title: <green>Coin Purse
    gui: true
    procedural items:
    - define purse_item <player.item_in_hand>
    - definemap contents:
        currency1: <[purse_item].flag[currency1]>
        currency2: <[purse_item].flag[currency2]>
        currency3: <[purse_item].flag[currency3]>
        currency4: <[purse_item].flag[currency4]>
    - define result <list>
    - foreach <list[currency1|currency2|currency3|currency4]> as:currency:
      - define item <item[brick]>
      - adjust def:item custom_model_data:<item[<[currency]>].custom_model_data>
      - adjust def:item display:<item[<[currency]>].display>
      - adjust def:item flag:currency_button:<[currency]>
      - adjust def:item flag:stored:<[contents].get[<[currency]>]>

      - adjust def:item lore:<white><&lt><blue>Left<&sp>Click<white><&gt><&sp>to<&sp>deposit<&sp><gold>1<&sp><white>coin.<n><white><&lt><gold>Right<&sp>Click<white><&gt><&sp>to<&sp>withdraw<&sp><gold>1<&sp><white>coin.<n><red>Hold<&sp><white><&lt><light_purple>Shift<white><&gt><&sp><red>to<&sp>change<&sp>to<&sp><gold>64<n><gold>Current<&sp>Amount<&co><&sp><light_purple><[contents].get[<[currency]>]>/300

      - define result:->:<[item]>

    #- define result:->:<item[brick]>
    - determine <[result]>
    slots:
    - [] [] [] [] [GUINull]

Coinpurse:
    type: item
    material: piglin_banner_pattern
    display name: <green>Coin Purse
    mechanisms:
      components_patch:
        item_model: string:materials:currency/coinpurse
    flags:
      currency1: 0
      currency2: 0
      currency3: 0
      currency4: 0
      total: 0
    lore:
    - <yellow>Can hold 300 of each coin type
    - <yellow>Automatically collects any coins that you pickup
    - <green>Stored Amount<white><&co><&sp><element[C].color[#f2963a]><gray>0<&sp><element[S].color[#918c87]><gray>0<&sp><element[G].color[#c2ae00]><gray>0<&sp><element[P].color[#93dbda]><gray>0


## Banking Scripts

Bank_GUI:
  type: inventory
  inventory: chest
  title: <green>Bank
  gui: true
  procedural items:
  - define result <list>
  - define bank_location <player.flag[bank_location]>
  - foreach <player.flag[bank.<[bank_location]>.vaults].keys> as:vault:
    - define item <item[Bank_Vault]>
    - define vault_data <player.flag[bank.<[bank_location]>.vaults].get[<[vault]>]>

    - adjust def:item flag:vault_id:<[vault]>
    - adjust def:item flag:bank_location:<[bank_location]>
    - adjust def:item display:<[vault_data].get[display]>

    - adjust def:item lore:<yellow>Contents<white><&co><&sp><yellow><bold><[vault_data].get[contents].size>/27

    - define result:->:<[item]>

  - determine <[result]>
  slots:
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [Bank_Coinpurse] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
  - [GUINULL] [] [] [] [] [] [] [] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]

Bank_Coinpurse:
  type: item
  material: piglin_banner_pattern
  display name: <green>Currency Storage & Exchange
  mechanisms:
    components_patch:
        item_model: string:materials:currency/coinpurse
  lore:
  - <white>Press this to open the currency menu

Bank_Vault:
  type: item
  material: chest
  display name: <light_purple>Bank Vault<white><&co><&sp><gold>

Bank_Account_Create:
  type: task
  script:
  - define bank_location <player.flag[bank_location]>
  - definemap vault_data:
      display: <light_purple>Bank Vault<white><&co><&sp><gold>1
      contents: <list[<empty>]>
  - flag <player> bank.<[bank_location]>.vaults.vault1:<[vault_data]>
  - if <player.flag[bank.currency]||null> == null:
    - flag <player> bank.currency:0

  - narrate "<gold><italic>Your bank account has been created at<white>: <green><[bank_location].to_titlecase>"

Bank_Vault_Storage:
  type: inventory
  inventory: chest
  procedural items:
  - define result <list>
  - foreach <player.flag[bank.<player.flag[bank_location]>.vaults.<player.flag[bank_selected_vault]>.contents]> as:item:
    - define result:->:<[item]>
  - determine <[result]>
  slots:
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUIReturn] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []

Bank_Currency_Storage:
  type: inventory
  inventory: chest
  gui: true
  definitions:
    player_purse: <player.inventory.slot[<player.inventory.find_all_items[coinpurse].first.if_null[null]>]>
  procedural items:
  - define result <list>
  - define purse_slot <player.inventory.find_all_items[coinpurse].first.if_null[null]>
  - foreach <list[currency1|currency2|currency3|currency4]> as:currency:
    - define item <item[brick]>

    - adjust def:item custom_model_data:<item[<[currency]>].custom_model_data>
    - adjust def:item display:<item[<[currency]>].display>
    - adjust def:item flag:currency_type:<[currency]>

    #- adjust def:item lore:



    - define result:->:<[item]>
  - determine <[result]>
  slots:
  - [GUIL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]
  - [GUINULL] [GUINULL] [] [] [] [] [player_purse] [GUINULL] [GUINULL]
  - [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL] [GUINULL]



Bank_Event:
  type: world
  events:
    on player clicks item in Bank_GUI:
    - define item <context.item>
    - if <[item].script.name> == Bank_Coinpurse:
      #currency
      - inventory open d:Bank_Currency_Storage
    - if <[item].script.name> == Bank_Vault:
      - flag <player> bank_selected_vault:<[item].flag[vault_id]>
      - inventory open d:Bank_Vault_Storage
    on player clicks item in Bank_Vault_Storage:
    - define item <context.item>
    - if <[item].script.name> == GUIReturn:
      - inventory open d:Bank_GUI
    - if <[item].script.name> == GUINULL:
      - determine cancelled
    on player closes Bank_Vault_Storage:
    - define inventory <context.inventory>
    - define bank_location <player.flag[bank_location]>
    - define bank_selected_vault <player.flag[bank_selected_vault]>
    - define contents <[inventory].list_contents.get[10].to[36]>


    - flag <player> bank.<[bank_location]>.vaults.<[bank_selected_vault]>.contents:<[contents]>
    after player opens Bank_Currency_Storage:
    - define total_stored <player.flag[bank.currency]>
    - wait 1t
    - run bank_currency_update def:<[total_stored]>
    on player clicks item in Bank_Currency_Storage:
    - define item <context.item>
    - define slot <context.slot>
    - define click_type <context.click>
    - define coinpurse <player.open_inventory.slot[16]>
    - define total_stored <player.open_inventory.slot[5].flag[total_stored]>
    - definemap currencies:
        currency1: <[coinpurse].flag[currency1]>
        currency2: <[coinpurse].flag[currency2]>
        currency3: <[coinpurse].flag[currency3]>
        currency4: <[coinpurse].flag[currency4]>
    - definemap currency_slots:
        currency1: 12
        currency2: 13
        currency3: 14
        currency4: 15
    - determine cancelled passively
    - if <[slot]> !in <list[1|12|13|14|15]>:
      - determine cancelled
    - if <[item].script.name> == guil:
      - inventory open d:Bank_GUI
    - if <[slot]> in <list[12|13|14|15]>:
      - define currency_type <[item].flag[currency_type]>
      - choose <[click_type]>:
        - case left:
          - if <[currencies].get[<[currency_type]>]> >= 1:
            - define currencies.<[currency_type]>:<[currencies].get[<[currency_type]>].sub[1]>
            - inventory adjust slot:5 destination:<player.open_inventory> flag:total_stored:+:<script[currency_data].data_key[<[currency_type].after[currency]>].get[base_value]>
        - case right:
          - if <[total_stored]> >= <script[currency_data].data_key[<[currency_type].after[currency]>].get[base_value]>:
            - define currencies.<[currency_type]>:<[currencies].get[<[currency_type]>].add[1]>
            - inventory adjust slot:5 destination:<player.open_inventory> flag:total_stored:-:<script[currency_data].data_key[<[currency_type].after[currency]>].get[base_value]>

        - case shift_left:
          - if <[currencies].get[<[currency_type]>]> >= 64:
            - define currencies.<[currency_type]>:<[currencies].get[<[currency_type]>].sub[64]>
            - inventory adjust slot:5 destination:<player.open_inventory> flag:total_stored:+:<script[currency_data].data_key[<[currency_type].after[currency]>].get[base_value].mul[64]>
        - case shift_right:
          - if <[total_stored]> >= <script[currency_data].data_key[<[currency_type].after[currency]>].get[base_value].mul[64]>:
            - define currencies.<[currency_type]>:<[currencies].get[<[currency_type]>].add[64]>
            - inventory adjust slot:5 destination:<player.open_inventory> flag:total_stored:-:<script[currency_data].data_key[<[currency_type].after[currency]>].get[base_value].mul[64]>
        - case middle:
          - if <[currencies].get[<[currency_type]>]> >= 1:
            - inventory adjust slot:5 destination:<player.open_inventory> flag:total_stored:+:<script[currency_data].data_key[<[currency_type].after[currency]>].get[base_value].mul[<[currencies].get[<[currency_type]>]>]>
            - define currencies.<[currency_type]>:0
        - default:
          - narrate <red>Error!
          - stop
      - inventory adjust slot:16 flag_map:<[currencies]> destination:<player.open_inventory>
      - run CoinPurse_Update_Task defmap:<[currencies]> def.slot:16 def.inventory:<player.open_inventory>
      - run Bank_Currency_Update def:<player.open_inventory.slot[5].flag[total_stored]>
    on player closes Bank_Currency_Storage:
    - define purse_slot <player.inventory.find_all_items[coinpurse].first.if_null[null]>
    - definemap currencies:
        currency1: <player.open_inventory.slot[16].flag[currency1]>
        currency2: <player.open_inventory.slot[16].flag[currency2]>
        currency3: <player.open_inventory.slot[16].flag[currency3]>
        currency4: <player.open_inventory.slot[16].flag[currency4]>
    - run CoinPurse_Update_Task defmap:<[currencies]> def.slot:<[purse_slot]>
    - flag player bank.currency:<context.inventory.slot[5].flag[total_stored]>

Bank_Currency_Update:
  type: task
  definitions: total_stored
  script:
  - define totals_item <item[gold_ingot]>
  - adjust def:totals_item display:<yellow>Total<&sp>Stored<white><&co><&sp><gold><bold><[total_stored]>
  - adjust def:totals_item flag:total_stored:<[total_stored]>
  - inventory set o:<[totals_item]> slot:5 destination:<player.open_inventory>

  - definemap currency_slots:
      currency1: 12
      currency2: 13
      currency3: 14
      currency4: 15
  - definemap currency_amounts:
      currency1: <script[currency_data].data_key[1].get[base_value]>
      currency2: <script[currency_data].data_key[2].get[base_value]>
      currency3: <script[currency_data].data_key[3].get[base_value]>
      currency4: <script[currency_data].data_key[4].get[base_value]>

  - define mod_amount <[total_stored]>
  - foreach <list[currency4|currency3|currency2|currency1]> as:currency:
    - if <[mod_amount]> >= <[currency_amounts].get[<[currency]>]>:
      - define div_amount <[mod_amount].div[<[currency_amounts].get[<[currency]>]>].round_down_to_precision[1]>
      - define mod_amount <[mod_amount].mod[<[currency_amounts].get[<[currency]>]>]>
      - inventory adjust slot:<[currency_slots].get[<[currency]>]> destination:<player.open_inventory> quantity:<[div_amount]>
      - inventory adjust slot:<[currency_slots].get[<[currency]>]> destination:<player.open_inventory> flag:stored:<[div_amount]>
      - inventory adjust slot:<[currency_slots].get[<[currency]>]> destination:<player.open_inventory> lore:<white>Current<&sp>Balance<&co><&sp><yellow><[div_amount]><n><white><&lt><blue>Left<&sp>Click<white><&gt><&sp>to<&sp>deposit<&sp><gold>1<&sp><white>coin.<n><white><&lt><gold>Right<&sp>Click<white><&gt><&sp>to<&sp>withdraw<&sp><gold>1<&sp><white>coin.<n><red>Hold<&sp><white><&lt><light_purple>Shift<white><&gt><&sp><red>to<&sp>change<&sp>to<&sp><gold>64
    - else:
      - inventory adjust slot:<[currency_slots].get[<[currency]>]> destination:<player.open_inventory> quantity:1
      - inventory adjust slot:<[currency_slots].get[<[currency]>]> destination:<player.open_inventory> lore:<white>Current<&sp>Balance<&co><&sp><yellow>0<n><white><&lt><blue>Left<&sp>Click<white><&gt><&sp>to<&sp>deposit<&sp><gold>1<&sp><white>coin.<n><white><&lt><gold>Right<&sp>Click<white><&gt><&sp>to<&sp>withdraw<&sp><gold>1<&sp><white>coin.<n><red>Hold<&sp><white><&lt><light_purple>Shift<white><&gt><&sp><red>to<&sp>change<&sp>to<&sp><gold>64

  #- if <[total_stored]> >= <[currency_amounts].get[currency4]>:
  #  - define div_amount <[total_stored].div[<[currency_amounts].get[currency4]>].round_down_to_precision[1]>
  #  - define mod_amount <[total_stored].mod[<[currency_amounts].get[currency4]>]>
  #

  #- else if <[total_stored]> >= <script[currency_data].data_key[3].get[base_value]>:
#
  #- else if <[total_stored]> >= <script[currency_data].data_key[2].get[base_value]>:

