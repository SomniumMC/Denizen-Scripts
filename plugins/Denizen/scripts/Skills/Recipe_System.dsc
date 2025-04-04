# This file houses the scripts and items used in the recipe system for Cooking and other skills.

# First Created 3/19/2025

Recipe_Event:
    type: world
    debug: false
    events:
        on player right clicks block with:Recipe:
        - if !<player.has_flag[recipe_cooldown]>:
            - define item <context.item>
            - define recipe <[item].flag[Recipe]>
            - define skill <[item].flag[skill]>
            - if <[Recipe]> !in <player.flag[Recipe.<[skill]>]>:
                - take slot:hand quantity:1
                - flag player recipe.<[skill]>:->:<[Recipe]>
                - define Recipe_Name:<[Recipe].replace_text[_].with[ ].to_titlecase>
                - narrate targets:<player> "<aqua>You have unlocked the recipe for <gold><[Recipe_Name]><white>!"
                - playsound <player> sound:entity.arrow.hit.player sound_category:blocks
            - else if <[Recipe]> in <player.flag[recipe.<[skill]>]>:
                - narrate targets:<player> "<red>You already have this recipe unlocked."
        on player right clicks block with:Recipe_Pack:
        - take item:Recipe_Pack quantity:1
        - define recipe_item:<proc[recipe_generator]>
        - give item:<[recipe_item]>
        - flag player recipe_cooldown expire:5t

Recipe_Creator:
    type: command
    debug: false
    description: This allows for the basic creation of recipes that unlock a flag to allow players to craft certain items.
    name: genrecipe
    usage: /genrecipe <&lt>Skill<&gt> <&lt>Recipe_ID<&gt>
    permission: dscript.recipe
    tab completions:
      default: Skill Recipe_ID
    script:
    - give item:<item[Recipe].with_flag[Recipe:<context.args.get[2]>].with_flag[Skill:<context.args.get[1]>].with_map[lore=<White>This unlocks the knowledge of the <aqua><context.raw_args.replace_text[_].with[ ].to_titlecase> <white>Recipe.<n><green>This recipe is for the <gold><context.args.get[1].to_titlecase> <white>skill.]>
    - narrate targets:<player> "<white>Created a recipe for <aqua><context.args.get[2].replace_text[_].with[ ].to_titlecase> <white>with an ID flag of <aqua><context.args.get[1]>.<context.args.get[2]>"

Recipe_Forget:
    type: command
    debug: false
    description: This allows you to forget(remove the flag) of a recipe your character has stored.
    name: forgetrecipe
    usage: /forgetrecipe <&lt>Skill<&gt> <&lt>Recipe_ID<&gt>
    permission: dscript.recipe
    tab completions:
      default: Skill Recipe_ID
    script:
    - flag <player> recipe.<context.args.get[1]>:<-:<context.args.get[2]>
    - narrate targets:<player> "<white>Forgotten recipe for <red><context.args.get[2].replace_text[_].with[ ].to_titlecase> <white>with an ID flag of <red><context.args.get[1]>.<context.args.get[2]>"

Recipe_Mob_Drop:
    type: world
    debug: false
    events:
      on player kills entity:
      - if <context.entity.entity_type> in <list[zombie|skeleton|creeper|enderman|witch|spider]>:
        - if <util.random_chance[5]>:
          - drop item:Recipe_Pack quantity:1 <context.entity.location>

Recipe_Generator:
    type: procedure
    debug: false
    script:
    - if <util.random_chance[85]>:
        - define chosen cooking
    - else:
        - define chosen alcohol
    - choose <[chosen]>:
        - case cooking:
            - define skill cooking
            - define categories <list[fruit|dairy|grain|protein|sugar]>
            - define recipe_name <script[cooking_master_data].data_key[<[categories].random>].keys.random.before_last[-]>
        - case alcohol:
            - define skill alcohol
            - define recipe_name <script[Alcohol_Mixer_Recipes].data_key[recipes].keys.random>
    - define recipe <item[Recipe].with_flag[Recipe:<[recipe_name]>].with_flag[skill:<[skill]>].with_map[lore=<White>This unlocks the knowledge of the <aqua><[recipe_name].replace_text[_].with[ ].to_titlecase> <white>Recipe.<n><green>This recipe is for the <gold><[skill].to_titlecase> <white>skill.]>
    - determine <[recipe]>

Recipe_Pack:
    type: item
    debug: false
    material: brick
    display name: <gold>Wrapped Recipe Pack
    lore:
    - <blue>Open this up to reveal a recipe!
    #recipes:
    #  1:
    #    type: shaped
    #    input:
    #    - Cooking_Recipe_Fragment|Cooking_Recipe_Fragment|Cooking_Recipe_Fragment
    #    - Cooking_Recipe_Fragment|Cooking_Recipe_Fragment|Cooking_Recipe_Fragment
    #    - Cooking_Recipe_Fragment|Cooking_Recipe_Fragment|Cooking_Recipe_Fragment

Recipe:
    type: item
    debug: false
    material: flower_banner_pattern
    display name: <green>Recipe
    mechanisms:
      custom_model_data: 57

Recipe_Fragment:
    type: item
    debug: false
    material: brick
    display name: <blue>Cooking Recipe Fragment
    lore:
    - <gold>Combine this together to create an Unopened Recipe Pack
    #recipes:
    #  1:
    #    type: shapeless
    #    input: CookingRecipe