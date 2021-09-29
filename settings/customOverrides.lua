-- CUSTOM OVERRIDES.LUA
-- by Garran Plum
--
-- Custom overrides for the entire mod.

-- IMPORT GP OBJECT
local myMod, GP = ... 

GP:log("script/overrides.lua",GP:version())

-- Set building and menu visual part.
myMod:override({
    Id = GP:magicWords().building.idPrefix .. GP:config().modName,
    -- AssetCoreBuildingPart = "BUILDING_PART_LUSH_GARDEN_SMALL_TREE"
    AssetCoreBuildingPart = GP:ids().monumentPole
})


