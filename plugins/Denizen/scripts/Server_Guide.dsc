# This file contains an interactive guide book that explains out mechanics that players may be unfamiliar with. There will be sections players can click on to get a page for info or a gui with examples.

Guide_Book_Update:
    type: world
    events:
      on player right clicks block with:Server_Guide:
      - define new_model <item[Server_Guide]>
      - inventory set o:<item[Server_Guide[quantity=<context.item.quantity>]]> destination:<context.hand> slot:<context.hand>
      on player drops Server_Guide:
      - playeffect at:<context.location> effect:smoke_large
      - remove <context.entity>

Server_Guide:
    type: item
    material: written_book
    display name: <light_purple><bold>Server Guide
    mechanisms:
      custom_model_data: 274
    lore:
    - <white>This book can give explanations to the systems of the world.
    - <n>
    - <gray><italic>It's pages seem to update and condense together as time passes by.
    book: Server_Guide_Bookscript

Server_Guide_Bookscript:
    type: book
    title: <gold><bold>Server Guide
    author: <gray><italic>Falsen Prophet
    signed: true
    text:
    - <n><n><n>         <light_purple><bold>Server                Guide<n><n>         <gray>for<n><n><red><bold>  Falsen Phantasm<n><n><n><n>          <white><black>by<n>         <gray><italic>Unknown
    - <gold><bold>     Foreword<&co><n><n><gray><black>Hello everyone, this book is here to explain out our custom systems our server uses. If you have any questions that aren't explained out very well then please ask in our <gold><bold><element[Discord].on_click[https://discord.gg/Ne8Dr4vNAk].type[open_url]><black>.
    - <gold><bold>     Paging<&co><n><n><gray><black>If you see words that are highlighted like <gold><bold><element[this].on_hover[Hello!]> <gray><black>then you can click on it in the book to change pages or open a GUI to a relevant section.
    - <gold><bold>     Contents<&co><n><n><gray><black><bold>⚫ <gold><bold><element[Mining and Smelting].on_hover[Page 6].on_click[6].type[change_page]><n><n><gray><black><bold>⚫ <gold><bold><element[Refinery].on_hover[Page 8].on_click[8].type[change_page]><n><n><gray><black><bold>⚫ <gold><bold><element[Carpentry].on_hover[Page 10].on_click[10].type[change_page]><n><n><gray><black><bold>⚫ <gold><bold><element[Tailoring].on_hover[Page 12].on_click[12].type[change_page]><n><n><gray><black><bold>⚫ <gold><bold><element[Smithing].on_hover[Page 13].on_click[13].type[change_page]>
    - <gray><black><bold>⚫ <gold><bold><element[Butchery].on_hover[Page 14].on_click[14].type[change_page]><n><n><gray><black><bold>⚫ <gold><bold><element[Cooking].on_hover[Page 16].on_click[16].type[change_page]><n><n><gray><black><bold>⚫ <gold><bold><element[Farming].on_hover[Page 18].on_click[18].type[change_page]><n><n><gray><black><bold>⚫ <gold><bold><element[Stewmaking].on_hover[Page 20].on_click[20].type[change_page]><n><n><gray><black><bold>⚫ <gold><bold><element[Brewing].on_hover[Page 25].on_click[25].type[change_page]><n><n><gray><black><bold>⚫ <gold><bold><element[Fishing].on_hover[Page 27].on_click[28].type[change_page]><n><n><gray><black><bold>⚫ <gold><bold><element[Furniture].on_hover[Page 29].on_click[28].type[change_page]>
    - <gold><bold>Mining and Smelting<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>After crafting a stone pickaxe you can mine copper and iron ore to get Raw ores which can smelted in a furnace. This won't result in full ingots, but instead 5 nuggets of the metal. This allows you to still use vanilla systems and-
    - <gray><black>get ingots, but if you want better results then you should use a <gold><bold><element[Refinery].on_hover[Page 8].on_click[8].type[change_page]><gray><black> Multiblock. However, you can still craft these nuggets into full ingots and use them to create tools or weapons. These items will just be at a disadvantage in durability to encourage players to use <gold><bold><element[Smithing].on_hover[Page 1].on_click[1].type[change_page]><black>.
    - <gold><bold>Refining<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>In order to get better results out of your ores, you need to assemble your first multiblock. First craft a Blast Furnace using your new Blast Iron ingots and place it down. Directly below it empty a bucket of lava. To finish it place a Cobble Stone Wall-
    - <gray><black>ontop of it. Now you need to interact with the Blast Furnace with a fuel source such as Coal or Charcoal to fuel it. Once it's fueled it will go out after some time so make sure to smelt what you need in the Refinery GUI before it goes out!
    - <gold><bold>Carpentry<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>In order to make certain resources or bows then you will need to craft a Fletching Table. Here you can craft things by selecting the category at the top of the GUI and then select an item. It will then travel back to the original-
    - <gray><black>GUI where if you have the ingredients in your inventory then click the craft button to get the output item. This system is very similar to others such as <gold><bold><element[Smithing].on_hover[Page 1].on_click[1].type[change_page]><black> and <gold><bold><element[Tailoring].on_hover[Page 11].on_click[11].type[change_page]><black>.
    - <gold><bold>Tailoring<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>This is very similar to others in that you have a workstation block, in this case, a Loom to interact with the skill. Here you can craft Leather goods such as armor, resources, and clothing items.
    - <gold><bold>Smithing<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>This is where the large majority of crafted items are with Metal Armor, Weapons, and lastly Tools. Players can use their Refined Ingots to craft equipment with custom durability and damage or mining speed.
    - <gold><bold>Butchery<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>Upon killing animals and certain monsters, they will drop a Corpse corresponding with what mob it is. You can butcher it to obtain increased meat and resources by placing an item with the <red>Cutting<gray><black>tag in your offhand-
    - <gray><black>and right clicking with the corpse. It will then cut it up and reward you with results. If you don't have an item with the <red>Cutting<gray><black>tag then you can easily craft a dagger out of flint or cobblestone which cannot be repaired, but easily replaceble.
    - <gold><bold>Cooking<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>Upon getting Raw Meat, you can eat it at the chance of getting food poisoning which prevents you from eating during the effect, or you can right click it onto a furnace to cook. After a few seconds it will spit out the cooked meat. However, -
    - <gray><black>that is not all you can do with cooking. If you place any kind of Pressure Plate ontop of a furnace and interact with it, you will open a GUI for cooking complex dishes. You can travel the different categories to see all of the currently possible recipes you have access to. <bold>Currently all recipes are unlocked.
    - <gold><bold>Farming<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>Farming has had a whole new overhaul by introducing a new system to get seeds and a convenient right click harvest system. In order to get seeds, you can break grass to get normal wheat seeds, however, you can also break grass blocks with a hoe-
    - <gray><black>to remove the grass layer. At a chance you can get seeds from a large variety to diverify your garden or orchards. By doing this you get also get new fully custom crops which have their own uses in cooking to create large possiblities of new food dishes!
    - <gold><bold>Stewmaking<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>Alongside <gold><bold><element[Cooking].on_hover[Page 1].on_click[1].type[change_page]><gray><black> players can also create unique stews by using a new system with Cauldrons. By first creating a Stew Base in Cooking, you have a few different types of base-<&gt>
    - <&color[#34e5eb]><bold>Alchemical<n><n><&color[#bf1752]><bold>Meat<n><n><&color[#bf7917]><bold>Veggie<n><n><&color[#7cff2b]><bold>Alcohol<n><n><gray><black>Each of these bases have their own recipes tied to them. First you fill the cauldron with water and then add one-
    - <gray><black> of the bases. The color of the water will then change and you can interact with it to see what stage of the process it is in. You can then add three ingredients into the cauldron by right clicking it in. Once three are added it will begin brewing. Once it finishes it will turn white. You can then interact with it using a bowl to scoop stew out.
    - <gray><black>If it was a failed recipe then you will just get Bad Soup, which is still edible, but has a chance of Food Poisoning. Each stew also has multiple portions listed on the description of the item. If you used Alcohol base then it will have a small layer of Mash at the bottom which can be scoop-
    - <gray><black>scooped out with a bucket used later in <gold><bold><element[Brewing].on_hover[Page 25].on_click[25].type[change_page]><black>.
    - <gold><bold>Brewing<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>Once you have Mash for alcohol you can build the Fermentation Barrel multiblock. Place a Barrel and place Two Wooden Stairs within a block of the barrel. Then place a Wooden Slab ontop of it. Once interacted it will be a valid multiblock.
    - <gray><black>When you insert the Alcohol Mash into the barrel, it will begin Fermenting. After some time it will be finished, at this point you can pull multiple servings out with bottles. Or you can use a Alcohol Cask made with <gold><bold><element[Carpentry].on_hover[Page 1].on_click[1].type[change_page]><gray><black> to get a portable storage of the alcohol.
    - <gray><black>If you place the cask, every hour the alcohol will age. Depending on the age and type of alcohol it is, you will get different results ranging from potion effects to chat changes. <bold>Not Implemented Yet
    - <gold><bold>Fishing<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>This has gotten an overhaul by introducing custom drop tables ranging from catching raw ores, equipment, to custom fish. Players can also craft custom durability rods with <gold><bold><element[Carpentry].on_hover[Page 1].on_click[1].type[change_page]><gray><black>
    - <gold><bold>Furniture<&co> <dark_green><element[★].on_hover[Contents].on_click[4].type[change_page]><n><n><gray><black>Upon the introduction of Carpentry and custom crops, players are now able to create Assembly Kits for different Furniture setups. Ranging from Chairs to Tables, players can setup these 3D modeled decorations.
    - <gray><black>An important tip for furniture like Tables is that they will always try to orient themselves to the right of the player's view. This is to ensure that furniture items are easier to place and predict how they look before you place it.

Server_Guide_Command:
    type: command
    name: guide
    description: Gives a guide book for the server!
    usage: /guide
    tab completions:
      default: <empty>
    script:
    - give item:Server_Guide quantity:1
    - narrate "<gold>If you have any questions that are not answered in this, then please ask in the discord!"