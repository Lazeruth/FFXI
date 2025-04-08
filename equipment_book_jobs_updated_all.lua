-- Area: Lower Jeuno
-- Artifact | Relic | Empyrean
-- Job Specific Gear
------------------------------------------
require('modules/module_utils')
require('scripts/zones/Lower_Jeuno/Zone')
require('scripts/globals/shop')
------------------------------------------
local m = Module:new('equipmentbook_jobs_updated')

local menu = {
    title = 'Job Specific Equipment',
    options = {},
    currentPage = 1,
    pages = {},
}

local delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

local gearData = {
    {
        name = 'Artifact',
        jobs = {
            { name = 'Warrior', stock = { 16678, 10000, 14089, 10000, 13961, 10000, 12511, 10000, 14214, 10000, 12638, 10000 } }, -- (Weapon, Lvl)
            { name = 'Monk', stock = { 17478, 10000, 14090, 10000, 13962, 10000, 12512, 10000, 12639, 10000, 14215, 10000 } },
            { name = 'White Mage', stock = { 17422, 10000, 14091, 10000, 13855, 10000, 14216, 10000, 12640, 10000, 13963, 10000 } },
            { name = 'Black Mage', stock = { 17423, 10000, 14092, 10000, 13964, 10000, 14217, 10000, 12641, 10000, 13856, 10000 } },
            { name = 'Red Mage', stock = { 16829, 10000, 14093, 10000, 13965, 10000, 14218, 10000, 12642, 10000, 12513, 10000 } },
            { name = 'Thief', stock = { 16764, 10000, 13966, 10000, 12514, 10000, 14219, 10000, 12643, 10000, 14094, 10000 } },
            { name = 'Paladin', stock = { 17643, 10000, 14095, 10000, 13967, 10000, 12515, 10000, 14220, 10000, 12644, 10000 } },
            { name = 'Dark Knight', stock = { 16798, 10000, 14096, 10000, 13968, 10000, 14221, 10000, 12645, 10000, 12516, 10000 } },
            { name = 'Beastmaster', stock = { 16680, 10000, 14097, 10000, 13969, 10000, 12517, 10000, 12646, 10000, 14222, 10000 } },
            { name = 'Bard', stock = { 16766, 10000, 14098, 10000, 13857, 10000, 14223, 10000, 12647, 10000, 13970, 10000 } },
            { name = 'Ranger', stock = { 17188, 10000, 13971, 10000, 12518, 10000, 14224, 10000, 12648, 10000, 14099, 10000 } },
            { name = 'Samurai', stock = { 17812, 10000, 14100, 10000, 14225, 10000, 13972, 10000, 13781, 10000, 13868, 10000 } },
            { name = 'Ninja', stock = { 17771, 5000, 17772, 5000, 14226, 10000, 14101, 10000, 13869, 10000, 13782, 10000, 13973, 10000 } },
            { name = 'Dragoon', stock = { 16887, 10000, 14227, 10000, 14102, 10000, 13974, 10000, 12649, 10000, 12519, 10000 } },
            { name = 'Summoner', stock = { 17532, 10000, 14228, 10000, 13975, 10000, 14103, 10000, 12650, 10000, 12520, 10000 } },
            { name = 'Blue Mage', stock = { 17717, 10000, 15684, 10000, 15600, 10000, 14928, 10000, 14521, 10000, 15265, 10000 } },
            { name = 'Corsair', stock = { 18702, 10000, 15601, 10000, 14929, 10000, 15685, 10000, 14522, 10000, 15266, 10000 } },
            { name = 'Puppetmaster', stock = { 17858, 10000, 15602, 10000, 15686, 10000, 14930, 10000, 14523, 10000, 15267, 10000 } },
            { name = 'Dancer', stock = { 19203, 10000, 15002, 10000, 15003, 10000, 16138, 10000, 16139, 10000, 15746, 10000, 
                                         15747, 10000, 15659, 10000, 15660, 10000, 14578, 10000, 14579, 10000 } },
            { name = 'Scholar', stock = { 6058, 10000, 15004, 10000, 15748, 10000, 16311, 10000, 14580, 10000, 16140, 10000 } },
        },
    },
    {
        name = 'Artifact +1', 
        jobs = {
            { name = 'Warrior*', stock = { 14473, 20000, 14890, 20000, 15225, 20000, 15352, 20000, 15561, 20000 } }, -- (Head, Body, Hands, Legs, Feet)
            { name = 'Monk', stock = {} },
            { name = 'White Mage', stock = {} },
            { name = 'Black Mage', stock = {} },
            { name = 'Red Mage', stock = {} },
            { name = 'Thief', stock = {} },
            { name = 'Paladin', stock = {} },
            { name = 'Dark Knight', stock = {} },
            { name = 'Beastmaster', stock = {} },
            { name = 'Bard', stock = {} },
            { name = 'Ranger', stock = {} },
            { name = 'Samurai', stock = {} },
            { name = 'Ninja', stock = {} },
            { name = 'Dragoon', stock = {} },
            { name = 'Summoner', stock = {} },
            { name = 'Blue Mage*', stock = { 11464, 20000, 11291, 20000, 16345, 20000, 11381, 20000 } }, -- TODO: missing Bazubands +1 (hands)
            { name = 'Corsair*', stock = { 15916, 20000, 11294, 20000, 15027, 20000 } }, -- TODO
            { name = 'Puppetmaster*', stock = { 11470, 20000, 11297, 20000, 15030, 20000, 16351, 20000, 11387, 20000 } },
            { name = 'Dancer*', stock = { 11475, 20000, 11476, 20000, 16357, 20000, 16358, 20000, 11393, 20000, 11394, 20000 } }, -- TODO
            { name = 'Scholar*', stock = { 11304, 20000, 16359, 20000 } }, -- TODO
        },
    },
    {
        name = 'Relic +1',
        jobs = {
            { name = 'Warrior*', stock = { 15245, 20000, 14500, 20000, 14909, 20000, 15580, 20000, 15665, 20000, 15087, 20000 } }, -- (Accessory, Head, Body, Hands, Legs, Feet)
            { name = 'Monk', stock = {} },
            { name = 'White Mage', stock = {} },
            { name = 'Black Mage', stock = {} },
            { name = 'Red Mage', stock = {} },
            { name = 'Thief', stock = {} },
            { name = 'Paladin', stock = {} },
            { name = 'Dark Knight', stock = {} },
            { name = 'Beastmaster', stock = {} },
            { name = 'Bard', stock = {} },
            { name = 'Ranger', stock = {} },
            { name = 'Samurai', stock = {} },
            { name = 'Ninja', stock = {} },
            { name = 'Dragoon', stock = {} },
            { name = 'Summoner', stock = {} },
            { name = 'Blue Mage', stock = {} },
            { name = 'Corsair', stock = {} },
            { name = 'Puppetmaster', stock = {} },
            { name = 'Dancer', stock = {} },
            { name = 'Scholar', stock = {} },
        },
    },
    {
        name = 'Empyrean',
        jobs = {
            { name = 'Warrior*', stock = { 11064, 30000, 12028, 30000, 12048, 30000, 12068, 30000, 12088, 30000, 11591, 30000, 19253, 30000, 11703, 30000 } }, -- (Accessory, Accessory, Head, Body, Hands, Legs, Feet)
            { name = 'Monk', stock = {} },
            { name = 'White Mage', stock = {} },
            { name = 'Black Mage', stock = {} },
            { name = 'Red Mage', stock = {} },
            { name = 'Thief', stock = {} },
            { name = 'Paladin', stock = {} },
            { name = 'Dark Knight', stock = {} },
            { name = 'Beastmaster', stock = {} },
            { name = 'Bard', stock = {} },
            { name = 'Ranger', stock = {} },
            { name = 'Samurai', stock = {} },
            { name = 'Ninja', stock = {} },
            { name = 'Dragoon', stock = {} },
            { name = 'Summoner', stock = {} },
            { name = 'Blue Mage', stock = {} },
            { name = 'Corsair', stock = {} },
            { name = 'Puppetmaster', stock = {} },
            { name = 'Dancer', stock = {} },
            { name = 'Scholar', stock = {} },
        },
    },
    {
        name = 'Relic +2',
        jobs = {
            { name = 'Warrior*', stock = { 10650, 40000, 10670, 40000, 10690, 40000, 10710, 40000, 10730, 40000 } }, -- (Head, Body, Hands, Legs, Feet)
            { name = 'Monk', stock = {} },
            { name = 'White Mage', stock = {} },
            { name = 'Black Mage', stock = {} },
            { name = 'Red Mage', stock = {} },
            { name = 'Thief', stock = {} },
            { name = 'Paladin', stock = {} },
            { name = 'Dark Knight', stock = {} },
            { name = 'Beastmaster', stock = {} },
            { name = 'Bard', stock = {} },
            { name = 'Ranger', stock = {} },
            { name = 'Samurai', stock = {} },
            { name = 'Ninja', stock = {} },
            { name = 'Dragoon', stock = {} },
            { name = 'Summoner', stock = {} },
            { name = 'Blue Mage', stock = {} },
            { name = 'Corsair', stock = {} },
            { name = 'Puppetmaster', stock = {} },
            { name = 'Dancer', stock = {} },
            { name = 'Scholar', stock = {} },
        },
    },
    {
        name = 'iL119 Artifact',
        jobs = {
            { name = 'Warrior*', stock = { 23375, 50000, 27807, 50000 } }, --TODO Add +3 -- (Head, Body, Hands, Legs, Feet)
            { name = 'Monk', stock = {} },
            { name = 'White Mage', stock = {} },
            { name = 'Black Mage', stock = {} },
            { name = 'Red Mage', stock = {} },
            { name = 'Thief', stock = {} },
            { name = 'Paladin', stock = {} },
            { name = 'Dark Knight', stock = {} },
            { name = 'Beastmaster', stock = {} },
            { name = 'Bard*', stock = { 23384, 5440000, 23451, 6660000, 23518, 5620000, 23585, 6440000, 23652, 5020000 } },
            { name = 'Ranger*', stock = { 23385, 5440000, 23452, 6660000, 23519, 5620000, 23586, 6440000, 23653, 5020000 } },
            { name = 'Samurai*', stock = { 23386, 5440000, 23453, 6660000, 23520, 5620000, 23587, 6440000, 23654, 5020000 } },
            { name = 'Ninja*', stock = { 23387, 5440000, 23454, 6660000, 23521, 5620000, 23588, 6440000, 23655, 5020000 } },
            { name = 'Dragoon', stock = {} },
            { name = 'Summoner', stock = {} },
            { name = 'Blue Mage', stock = {} },
            { name = 'Corsair', stock = {} },
            { name = 'Puppetmaster*', stock = { 23392, 5440000, 23459, 6660000, 23526, 5620000, 23593, 6440000, 23660, 5020000 } },
            { name = 'Dancer*', stock = { 23393, 5440000, 23460, 6660000, 23527, 5620000, 23594, 6440000, 23661, 5020000 } },
            { name = 'Scholar', stock = {} },
            { name = 'Geomancer', stock = {} },
            { name = 'Rune Fencer', stock = {} },
        },
    },
    {
        name = 'iL119 Relic',
        jobs = {
            { name = 'Warrior*', stock = { 23398, 8970000, 23465, 7500000, 23532, 9300000, 23599, 7740000, 23666, 9900000 } }, -- (Head, Body, Hands, Legs, Feet)
            { name = 'Monk', stock = {} },
            { name = 'White Mage*', stock = { 23400, 8970000, 23467, 7500000, 23534, 9300000, 23601, 7740000, 23668, 9900000 } },
            { name = 'Black Mage', stock = {} },
            { name = 'Red Mage', stock = {} },
            { name = 'Thief', stock = {} },
            { name = 'Paladin', stock = {} },
            { name = 'Dark Knight', stock = {} },
            { name = 'Beastmaster', stock = {} },
            { name = 'Bard*', stock = { 23407, 8970000, 23474, 7500000, 23541, 9300000, 23608, 7740000, 23675, 9900000 } },
            { name = 'Ranger', stock = {} },
            { name = 'Samurai', stock = {} },
            { name = 'Ninja', stock = {} },
            { name = 'Dragoon', stock = {} },
            { name = 'Summoner', stock = {} },
            { name = 'Blue Mage', stock = {} },
            { name = 'Corsair*', stock = { 23414, 8970000, 23481, 7500000, 23548, 9300000, 23615, 7740000, 23682, 9900000 } },
            { name = 'Puppetmaster*', stock = { 23415, 8970000, 23482, 7500000, 23549, 9300000, 23616, 7740000, 23683, 9900000 } },
            { name = 'Dancer*', stock = { 23416, 8970000, 23483, 7500000, 23550, 93000000, 23617, 7740000, 23684, 9900000 } },
            { name = 'Scholar', stock = {} },
            { name = 'Geomancer*', stock = { 23418, 8970000, 23485, 7500000, 23552, 9300000, 23619, 7740000, 23686, 9900000 } },                
            { name = 'Rune Fencer', stock = {} },
        },
    },
    {
        name = 'iL119 Empyrean',
        jobs = {
            { name = 'Warrior*', stock = { 26741, 270000, 26899, 830000, 27053, 350000, 27238, 300000, 27412, 200000, 25422, 10000 } }, -- (Head, Body, Hands, Legs, Feet, Earring)
            { name = 'Monk*', stock = { 26743, 270000, 26901, 830000, 27055, 350000, 27240, 300000, 27414, 200000, 25428, 10000 } },
            { name = 'White Mage*', stock = { 26745, 270000, 26903, 830000, 27057, 350000, 27242, 300000, 27416, 200000, 25434, 10000 } },
            { name = 'Black Mage*', stock = { 26747, 270000, 26905, 830000, 27059, 350000, 27244, 300000, 27418, 200000, 25440, 10000 } },
            { name = 'Red Mage', stock = {} },
            { name = 'Thief', stock = {} },
            { name = 'Paladin', stock = {} },
            { name = 'Dark Knight', stock = {} },
            { name = 'Beastmaster*', stock = { 26756, 270000, 26915, 830000, 27069, 350000, 27254, 300000, 27428, 200000, 25470, 10000 } },
            { name = 'Bard*', stock = { 26759, 270000, 26917, 830000, 27071, 350000, 27256, 300000, 27430, 200000, 25476, 10000 } },
            { name = 'Ranger*', stock = { 26761, 270000, 26919, 830000, 27073, 350000,  27258, 300000, 27432, 200000, 25482, 10000 } },
            { name = 'Samurai*', stock = { 26763, 270000, 26921, 830000, 27075, 350000, 27260, 300000, 27433, 200000, 25488, 1000 } },
            { name = 'Ninja*', stock = { 26765, 270000, 26923, 830000, 27077, 350000, 27262, 300000, 27436, 200000, 25494, 10000 } },
            { name = 'Dragoon', stock = {} },
            { name = 'Summoner', stock = {} },
            { name = 'Blue Mage', stock = {} },
            { name = 'Corsair', stock = {} },
            { name = 'Puppetmaster*', stock = { 26775, 270000, 26932, 830000, 27087, 350000, 27271, 300000, 27446, 200000, 25522, 10000, 28588, 10000 } },
            { name = 'Dancer*', stock = { 26777, 270000, 26934, 830000, 27088, 350000, 27274, 300000, 25528, 10000 } },
            { name = 'Scholar*', stock = { 26779, 270000, 26937, 830000, 27091, 350000, 27276, 300000, 27450, 200000, 25536, 10000 } },
            { name = 'Geomancer*', stock = { 26781, 270000, 26939, 830000, 27093, 350000, 27278, 300000, 27452, 200000, 25542, 10000 } },
            { name = 'Rune Fencer', stock = {} },
        },
    },
}

-- Function to generate pages for the menu
local function generatePages(options)
    local page = {}
    local pageCount = 1
    local pages = {}

    for i, option in ipairs(options) do
        table.insert(page, option)
        if #page >= 6 then
            pages[pageCount] = page
            page = {}
            pageCount = pageCount + 1
        end
    end
    if #page > 0 then
        pages[pageCount] = page
    end
    return pages
end

-- Function to display a specific page of the menu
local function displayPage(player, pageNumber)
    menu.options = menu.pages[pageNumber] or {}

    -- Add "Next Page" option if there's a next page
    if menu.pages[pageNumber + 1] then
        table.insert(menu.options, {
            'Next Page',
            function(playerArg)
                menu.currentPage = menu.currentPage + 1
                displayPage(playerArg, menu.currentPage)
            end
        })
    end

    -- Add "Previous Page" option if it's not the first page
    if pageNumber > 1 then
        table.insert(menu.options, {
            'Previous Page',
            function(playerArg)
                menu.currentPage = menu.currentPage - 1
                displayPage(playerArg, menu.currentPage)
            end
        })
    end

    delaySendMenu(player)
end

-- Generate gear type menus
local gearTypeMenus = {}
for _, gearType in ipairs(gearData) do
    local subMenu = {} -- Create a sub-menu for each gear type

    -- Sub-menu options (jobs)
    for _, job in ipairs(gearType.jobs) do
        table.insert(subMenu, {
            job.name,
            function(playerArg)
                xi.shop.general(playerArg, job.stock)
            end,
        })
    end

    -- Add a "Back" option to the sub-menu
    table.insert(subMenu, {
        'Back',
        function(playerArg)
            local page1 = {} -- Initialize page1 locally
            for _, gearType in ipairs(gearData) do
                table.insert(page1, {
                    gearType.name .. ' Gear',
                    function(playerArg)
                        menu.pages = generatePages(gearTypeMenus[gearType.name])
                        menu.currentPage = 1
                        displayPage(playerArg, menu.currentPage)
                    end,
                })
            end
            menu.pages = generatePages(page1)
            menu.currentPage = 1
            displayPage(playerArg, menu.currentPage)
        end,
    })

    gearTypeMenus[gearType.name] = subMenu
end

m:addOverride('xi.zones.Lower_Jeuno.Zone.onInitialize', function(zone)
    super(zone)

    zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Equipment',
        look = 2433,
        x = -26.2980,
        y = -0.0001,
        z = -16.2946,
        rotation = 150,
        widescan = 1,
        onTrigger = function(player, npc)
            local page1 = {} -- Initialize page1 locally
            for _, gearType in ipairs(gearData) do
                table.insert(page1, {
                    gearType.name .. ' Gear',
                    function(playerArg)
                        menu.pages = generatePages(gearTypeMenus[gearType.name])
                        menu.currentPage = 1
                        displayPage(playerArg, menu.currentPage)
                    end,
                })
            end
            menu.pages = generatePages(page1)
            menu.currentPage = 1
            displayPage(player, menu.currentPage)
        end,
    })
end)

return m
