-- MODULE CONFIG.LUA
-- by Garran Plum
--
-- GP Configuration for this individual mod.
-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("config.lua", GP:version())

-- MY CONFIG Mod Name
local modName = "REMIX"

-- MY CONFIG Remix
local remix = {
    TOPIARY = {
        "BUILDING_PART_OFFICINAL_GARDEN_BUSHY_PLANT",
        "BUILDING_PART_OFFICINAL_GARDEN_CLIMBER_PLANT"
    },
    FISH = {"BUILDING_PART_Roughy", "BUILDING_PART_Trout"},
    STORAGE = {"BUILDING_PART_MARKET_BARRELS", "BUILDING_PART_Crate"}
}

-- 
--
--
--
--
-- WARNING!
--
-- MY CONFIG Ends Here. Changing code below this line will change *GPS*, not just your mod!
--
--
--

-- GP Function Config
-- Returns a copy of the remixed, canonized configuration.
-- CLOSURES, IDEMPOTENT
function GP:config()

    -- Create the config table.
    local config = {
        version = GP:version(),
        remix = remix or {},
        modName = modName,
        modelFiles = modelFiles or {},
        categories = categories or {},
        nodeTypes = nodeTypes or {},
        jobs = jobs or {},
        workplaces = workplaces or {},
        monuments = monuments or {}
    }

    -- Create a remix monument.
    config.monuments[modName] = config.monuments[modName] or
                                    {Categories = {}}

    -- Remix each category on the list.
    for category, partsList in pairs(config.remix) do

        -- Add the category in config.categories.
        config.categories[category] = {}

        -- Remix each part in the category.
        for index, partId in ipairs(partsList) do

            -- Build a partEntry
            local partEntry = {
                AssetRegistered = true,
                BuildingRegistered = true
            }

            -- Add the partEntry to the config category
            config.categories[category][partId] = partEntry

        end

        -- Add the category to the monument.
        config.monuments[modName].Categories[category] = {}

    end

    -- Return canonized copy.
    return GP:copyTable(config)
end
