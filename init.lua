dofile_once("mods/moles_things/lib/gusgui/gusgui.lua").init("mods/moles_things/lib/gusgui")
--dofile_once("mods/moles_things/lib/Noitilities/NL_Init.lua").init("mods/moles_things/files/lib/Noitilities")
--ModMagicNumbersFileAdd( "mods/moles_things/files/magic_numbers.xml" )
ModMaterialsFileAdd("mods/moles_things/files/materials.xml")

dofile_once("mods/moles_things/files/scripts/utils.lua")
dofile_once("mods/moles_things/files/scripts/souls.lua")
dofile_once("mods/moles_things/files/scripts/molebiomes.lua")

--dofile_once("mods/moles_things/lib/Noitilities/NT_ModuleLoader.lua").DofileModules({"GunPatch"})
--PatchGunSystem()

local nxml = dofile_once("mods/moles_things/lib/nxml.lua")

dofile_once("mods/moles_things/files/gui.lua")

-- set & append
SetFileContent("data/scripts/buildings/sun/spot_4.lua", "spot_4.lua")
SetFileContent("data/scripts/buildings/sun/sun_collision.lua", "sun_collision.lua")
SetFileContent("data/entities/items/pickup/sun/sunbaby.xml", "sunbaby.xml")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/moles_things/files/actions.lua" )
ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/moles_things/files/perks.lua" )
ModLuaFileAppend( "data/scripts/items/orb_pickup.lua", "mods/moles_things/files/scripts/orb_pickup_append.lua" )
ModLuaFileAppend( "data/scripts/biomes/orbrooms/orbroom_07.lua", "mods/moles_things/files/scripts/orbroom_07_append.lua" )

local xml = nxml.parse(ModTextFileGetContent("data/entities/animals/shotgunner.xml"))
xml:add_child(nxml.parse([[
	<LuaComponent
		script_death="mods/moles_things/files/scripts/death/hiisi_shotgunner.lua"
		>
	</LuaComponent>
]]))
ModTextFileSetContent("data/entities/animals/shotgunner.xml", tostring(xml))

-- biomes
local content = ModTextFileGetContent("data/biome/_biomes_all.xml")
local xml = nxml.parse(content)
xml:add_children(nxml.parse_many[[
    <Biome height_index="0" color="ff9dceb9" biome_filename="mods/moles_things/files/biome/sunlab/sunlab.xml" />
]])
ModTextFileSetContent("data/biome/_biomes_all.xml", tostring(xml))

-- player
function OnPlayerSpawned( player ) 
    if GameHasFlagRun("moles_things_init") then return end
    SoulsInit()
    --[[EntityAddComponent2(player, "LuaComponent", {
        script_source_file="mods/moles_things/files/scripts/player.lua",
        execute_every_n_frame="2",
    })]]--
    EntityAddComponent2(player, "VariableStorageComponent", {
        _tags="brilliance_stored",
        name="brilliance_stored",
        value_int=0,
    })
    EntityAddComponent2(player, "VariableStorageComponent", {
        _tags="brilliance_max",
        name="brilliance_max",
        value_int=500,
    })

    --AddFlagPersistent("progress_greensun")
    --AddFlagPersistent("progress_redsun")
    --AddFlagPersistent("progress_bluesun")
    
    if HasFlagPersistent("progress_greensun") and HasFlagPersistent("progress_redsun") and HasFlagPersistent("progress_bluesun") then
        EntitySetComponentsWithTagEnabled( player, "player_hat2", false )
        EntitySetComponentsWithTagEnabled( player, "player_hat", true ) -- placeholder hat
    end
    
    GameAddFlagRun("molething_sunbook_unlocked") -- for testing purposes
    GameAddFlagRun("moles_things_init")
end

-- moles spawning
if not GameHasFlagRun("moles_things_moles_init") then -- thanks conga
    for i=1,#molebiomes do v = molebiomes[i]
        local biomepath = table.concat({"data/scripts/biomes/", v.biome, ".lua"})
        local spawnerpath = "mods/moles_things/files/scripts/molespawner.lua"
        if v.modded ~= nil and v.modded == true then
            biomepath = v.biome
        end
        ModLuaFileAppend(biomepath, spawnerpath)
    end
    GameAddFlagRun("moles_things_moles_init")
end

-- nxml
local content = ModTextFileGetContent("data/materials.xml")
local xml = nxml.parse(content)
for element in xml:each_child() do
    if element.attr.name == "magic_liquid_hp_regeneration" or element.attr.name == "magic_liquid_hp_regeneration_unstable" then
        element.attr.tags = "[liquid],[water],[magic_liquid],[regenerative],[greensun_fuel],[sunbaby_ignore_list]"
    end
end
ModTextFileSetContent("data/materials.xml", tostring(xml))

function OnModSettingsChanged()
    RenderSouls()
end