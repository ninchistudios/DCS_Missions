SupportHandler = EVENTHANDLER:New()

function AlturaRNG()
    local ATLrng = math.random(3500, 8000)
    return ATLrng
end

--RED

--A2A ZEUS RED
f5_red = SPAWN:New('f5_red'):InitHeading(0, 360):InitCleanUp(60)
f4_red = SPAWN:New('f4_red'):InitHeading(0, 360):InitCleanUp(60)
f14_red = SPAWN:New('f14_red'):InitHeading(0, 360):InitCleanUp(60)
f16_red = SPAWN:New('f16_red'):InitHeading(0, 360):InitCleanUp(60)
f15_red = SPAWN:New('f15_red'):InitHeading(0, 360):InitCleanUp(60)
m2000_red = SPAWN:New('m2000_red'):InitHeading(0, 360):InitCleanUp(60)
su30_red = SPAWN:New('su30_red'):InitHeading(0, 360):InitCleanUp(60)
su33_red = SPAWN:New('su33_red'):InitHeading(0, 360):InitCleanUp(60)
su27_red = SPAWN:New('su27_red'):InitHeading(0, 360):InitCleanUp(60)
mig21_red = SPAWN:New('mig21_red'):InitHeading(0, 360):InitCleanUp(60)
mig29_red = SPAWN:New('mig29_red'):InitHeading(0, 360):InitCleanUp(60)
drone_red = SPAWN:New('drone_red'):InitHeading(0, 360):InitCleanUp(60)
mig23_red = SPAWN:New('mig23_red'):InitHeading(0, 360):InitCleanUp(60)
jf17_red = SPAWN:New('jf17_red'):InitHeading(0, 360):InitCleanUp(60)
j11_red = SPAWN:New('j11_red'):InitHeading(0, 360):InitCleanUp(60)
f18_red = SPAWN:New('f18_red'):InitHeading(0, 360):InitCleanUp(60)
ajs37_red = SPAWN:New('ajs37_red'):InitHeading(0, 360):InitCleanUp(60)
c101_red = SPAWN:New('c101_red'):InitHeading(0, 360):InitCleanUp(60)
l39_red = SPAWN:New('l39_red'):InitHeading(0, 360):InitCleanUp(60)
mig19_red = SPAWN:New('mig19_red'):InitHeading(0, 360):InitCleanUp(60)
--A2G ZEUS RED
abrams_red = SPAWN:New('abrams_red'):InitHeading(0, 360)
t80_red = SPAWN:New('t80_red'):InitHeading(0, 360)
bmp_red = SPAWN:New('bmp_red'):InitHeading(0, 360)
truck_red = SPAWN:New('truck_red'):InitHeading(0, 360)
armor_group_red = SPAWN:New('armor_group_red'):InitHeading(0, 360)
infantry_group_red = SPAWN:New('infantry_group_red'):InitHeading(0, 360)
--SHIP RED SPECIFIC
tanker_ship_red = SPAWN:New('tanker_ship_red'):InitHeading(0, 360)
type052b_ship_red = SPAWN:New('type052b_ship_red'):InitHeading(0, 360)
type052c_ship_red = SPAWN:New('type052c_ship_red'):InitHeading(0, 360)
type054a_ship_red = SPAWN:New('type054a_ship_red'):InitHeading(0, 360)
grisha_ship_red = SPAWN:New('grisha_ship_red'):InitHeading(0, 360)
moskva_ship_red = SPAWN:New('moskva_ship_red'):InitHeading(0, 360)
neus_ship_red = SPAWN:New('neus_ship_red'):InitHeading(0, 360)
ssk_ship_red = SPAWN:New('ssk_ship_red'):InitHeading(0, 360)
fast_ship_red = SPAWN:New('fast_ship_red'):InitHeading(0, 360)

--A2G ZEUS RED SPECIFIC
s10_red = SPAWN:New('s10_red'):InitHeading(0, 360)
s11_red = SPAWN:New('s11_red'):InitHeading(0, 360)
s3_red = SPAWN:New('s3_red'):InitHeading(0, 360)
s2_red = SPAWN:New('s2_red'):InitHeading(0, 360)
s6_red = SPAWN:New('s6_red'):InitHeading(0, 360)
ural_red = SPAWN:New('ural_red'):InitHeading(0, 360)
shilka_red = SPAWN:New('shilka_red'):InitHeading(0, 360)
strella_red = SPAWN:New('strella_red'):InitHeading(0, 360)
osa_red = SPAWN:New('osa_red'):InitHeading(0, 360)
tunguska_red = SPAWN:New('tunguska_red'):InitHeading(0, 360)
tor_red = SPAWN:New('tor_red'):InitHeading(0, 360)
buk_red = SPAWN:New('buk_red'):InitHeading(0, 360)
igla_manpads_red = SPAWN:New('igla_manpads_red'):InitHeading(0, 360)
mig31_red = SPAWN:New('mig31_red'):InitHeading(0, 360):InitCleanUp(60)
t90_red = SPAWN:New('t90_red'):InitHeading(0, 360):InitCleanUp(60)
tu142_red = SPAWN:New('tu142_red'):InitHeading(0, 360):InitCleanUp(60)
tu160_red = SPAWN:New('tu160_red'):InitHeading(0, 360):InitCleanUp(60)
tu22m3_red = SPAWN:New('tu22m3_red'):InitHeading(0, 360):InitCleanUp(60)
tu95ms_red = SPAWN:New('tu95ms_red'):InitHeading(0, 360):InitCleanUp(60)
a10cas_red = SPAWN:New('a10cas_red'):InitHeading(0, 360):InitCleanUp(60)
harriercas_red = SPAWN:New('harriercas_red'):InitHeading(0, 360):InitCleanUp(60)
f18sead_red = SPAWN:New('f18sead_red'):InitHeading(0, 360):InitCleanUp(60)
hawk_red = SPAWN:New('hawk_red'):InitHeading(0, 360)
helicas_red = SPAWN:New('helicas_red'):InitHeading(0, 360):InitCleanUp(60)
fob1_red = SPAWN:New('fob1_red'):InitHeading(0, 360)
fob2_red = SPAWN:New('fob2_red'):InitHeading(0, 360)
fob3_red = SPAWN:New('fob3_red'):InitHeading(0, 360)
fob4_red = SPAWN:New('fob4_red'):InitHeading(0, 360)
fob5_red = SPAWN:New('fob5_red'):InitHeading(0, 360)
fob6_red = SPAWN:New('fob6_red'):InitHeading(0, 360)
su25cas_red = SPAWN:New('su25cas_red'):InitHeading(0, 360):InitCleanUp(60)
yak52_red = SPAWN:New('yak52_red'):InitHeading(0, 360):InitCleanUp(60)
uh1h_red = SPAWN:New('uh1h_red'):InitHeading(0, 360):InitCleanUp(60)

--BLUE

--A2A ZEUS blue
f5_blue = SPAWN:New('f5_blue'):InitHeading(0, 360):InitCleanUp(60)
f4_blue = SPAWN:New('f4_blue'):InitHeading(0, 360):InitCleanUp(60)
f14_blue = SPAWN:New('f14_blue'):InitHeading(0, 360):InitCleanUp(60)
f16_blue = SPAWN:New('f16_blue'):InitHeading(0, 360):InitCleanUp(60)
f15_blue = SPAWN:New('f15_blue'):InitHeading(0, 360):InitCleanUp(60)
m2000_blue = SPAWN:New('m2000_blue'):InitHeading(0, 360):InitCleanUp(60)
su27_blue = SPAWN:New('su27_blue'):InitHeading(0, 360):InitCleanUp(60)
mig21_blue = SPAWN:New('mig21_blue'):InitHeading(0, 360):InitCleanUp(60)
mig29_blue = SPAWN:New('mig29_blue'):InitHeading(0, 360):InitCleanUp(60)
drone_blue = SPAWN:New('drone_blue'):InitHeading(0, 360):InitCleanUp(60)
mig23_blue = SPAWN:New('mig23_blue'):InitHeading(0, 360):InitCleanUp(60)
jf17_blue = SPAWN:New('jf17_blue'):InitHeading(0, 360):InitCleanUp(60)
j11_blue = SPAWN:New('j11_blue'):InitHeading(0, 360):InitCleanUp(60)
f18_blue = SPAWN:New('f18_blue'):InitHeading(0, 360):InitCleanUp(60)
ajs37_blue = SPAWN:New('ajs37_blue'):InitHeading(0, 360):InitCleanUp(60)
c101_blue = SPAWN:New('c101_blue'):InitHeading(0, 360):InitCleanUp(60)
l39_blue = SPAWN:New('l39_blue'):InitHeading(0, 360):InitCleanUp(60)
mig19_blue = SPAWN:New('mig19_blue'):InitHeading(0, 360):InitCleanUp(60)
--A2G ZEUS blue
abrams_blue = SPAWN:New('abrams_blue'):InitHeading(0, 360)
t80_blue = SPAWN:New('t80_blue'):InitHeading(0, 360)
bmp_blue = SPAWN:New('bmp_blue'):InitHeading(0, 360)
truck_blue = SPAWN:New('truck_blue'):InitHeading(0, 360)
armor_group_blue = SPAWN:New('armor_group_blue'):InitHeading(0, 360)
infantry_group_blue = SPAWN:New('infantry_group_blue'):InitHeading(0, 360)
Stryker_blue = SPAWN:New('Stryker_blue'):InitHeading(0, 360)

-- ADD NEW JTAC SPAWN DYNAMIC WITH LASE
--jtac = SPAWN:New("jtac")
hmv = SPAWN:New('hmv')
JTAC_MQ_ZEUS = SPAWN:New('jtac')

--A2G ZEUS BLUE SPECIFIC
hawk_blue = SPAWN:New('hawk_blue'):InitHeading(0, 360)
patriot_blue = SPAWN:New('patriot_blue'):InitHeading(0, 360)
avenger_blue = SPAWN:New('avenger_blue'):InitHeading(0, 360)
linebacker_blue = SPAWN:New('linebacker_blue'):InitHeading(0, 360)
stinger_manpads_blue = SPAWN:New('stinger_manpads_blue'):InitHeading(0, 360)
chaparral_blue = SPAWN:New('chaparral_blue'):InitHeading(0, 360)
vulcan_blue = SPAWN:New('vulcan_blue'):InitHeading(0, 360)
b1b_blue = SPAWN:New('b1b_blue'):InitHeading(0, 360):InitCleanUp(60)
b52_blue = SPAWN:New('b52_blue'):InitHeading(0, 360):InitCleanUp(60)
f11a_blue = SPAWN:New('f11a_blue'):InitHeading(0, 360):InitCleanUp(60)
a10cas_blue = SPAWN:New('a10cas_blue'):InitHeading(0, 360):InitCleanUp(60)
harriercas_blue = SPAWN:New('harriercas_blue'):InitHeading(0, 360):InitCleanUp(60)
f18sead_blue = SPAWN:New('f18sead_blue'):InitHeading(0, 360):InitCleanUp(60)
helicas_blue = SPAWN:New('helicas_blue'):InitHeading(0, 360):InitCleanUp(60)
su25cas_blue = SPAWN:New('su25cas_blue'):InitHeading(0, 360):InitCleanUp(60)
--SHIP Blue SPECIFIC
tanker_ship_blue = SPAWN:New('tanker_ship_blue'):InitHeading(0, 360)
type052b_ship_blue = SPAWN:New('type052b_ship_blue'):InitHeading(0, 360)
type052c_ship_blue = SPAWN:New('type052c_ship_blue'):InitHeading(0, 360)
type054a_ship_blue = SPAWN:New('type054a_ship_blue'):InitHeading(0, 360)
oliver_ship_blue = SPAWN:New('oliver_ship_blue'):InitHeading(0, 360)
ticonderoga_ship_blue = SPAWN:New('ticonderoga_ship_blue'):InitHeading(0, 360)

csarx1 = SPAWN:New('csarx1'):InitHeading(0, 360)
csarx2 = SPAWN:New('csarx2'):InitHeading(0, 360)

function handleSpawnRequest(text, coord)
    local zeusSpawn = nil
    --RED
    if text:find('f5_red') then
        zeusSpawn = f5_red
    elseif text:find('f4_red') then
        zeusSpawn = f4_red
    elseif text:find('f14_red') then
        zeusSpawn = f14_red
    elseif text:find('f16_red') then
        zeusSpawn = f16_red
    elseif text:find('f15_red') then
        zeusSpawn = f15_red
    elseif text:find('m2000_red') then
        zeusSpawn = m2000_red
    elseif text:find('su30_red') then
        zeusSpawn = su30_red
    elseif text:find('mig21_red') then
        zeusSpawn = mig21_red
    elseif text:find('mig29_red') then
        zeusSpawn = mig29_red
    elseif text:find('drone_red') then
        zeusSpawn = drone_red
    elseif text:find('mig23_red') then
        zeusSpawn = mig23_red
    elseif text:find('abrams_red') then
        zeusSpawn = abrams_red
    elseif text:find('t80_red') then
        zeusSpawn = t80_red
    elseif text:find('bmp_red') then
        zeusSpawn = bmp_red
    elseif text:find('truck_red') then
        zeusSpawn = truck_red
    elseif text:find('armor_group_red') then
        zeusSpawn = armor_group_red
    elseif text:find('infantry_group_red') then
        --RED SPECelseifIC
        zeusSpawn = infantry_group_red
    elseif text:find('s10_red') then
        zeusSpawn = s10_red
    elseif text:find('s11_red') then
        zeusSpawn = s11_red
    elseif text:find('s3_red') then
        zeusSpawn = s3_red
    elseif text:find('s2_red') then
        zeusSpawn = s2_red
    elseif text:find('s6_red') then
        zeusSpawn = s6_red
    elseif text:find('ural_red') then
        zeusSpawn = ural_red
    elseif text:find('shilka_red') then
        zeusSpawn = shilka_red
    elseif text:find('strella_red') then
        zeusSpawn = strella_red
    elseif text:find('osa_red') then
        zeusSpawn = osa_red
    elseif text:find('tunguska_red') then
        zeusSpawn = tunguska_red
    elseif text:find('tor_red') then
        zeusSpawn = tor_red
    elseif text:find('buk_red') then
        zeusSpawn = buk_red
    elseif text:find('igla_manpads_red') then
        zeusSpawn = igla_manpads_red
    elseif text:find('mig31_red') then
        zeusSpawn = mig31_red
    elseif text:find('su33_red') then
        zeusSpawn = su33_red
    elseif text:find('su27_red') then
        zeusSpawn = su27_red
    elseif text:find('t90_red') then
        zeusSpawn = t90_red
    elseif text:find('jf17_red') then
        zeusSpawn = jf17_red
    elseif text:find('j11_red') then
        zeusSpawn = j11_red
    elseif text:find('f18_red') then
        zeusSpawn = f18_red
    elseif text:find('ajs37_red') then
        zeusSpawn = ajs37_red
    elseif text:find('c101_red') then
        zeusSpawn = c101_red
    elseif text:find('l39_red') then
        zeusSpawn = l39_red
    elseif text:find('mig19_red') then
        zeusSpawn = mig19_red
    elseif text:find('tanker_ship_red') then
        zeusSpawn = tanker_ship_red
    elseif text:find('type052b_ship_red') then
        zeusSpawn = type052b_ship_red
    elseif text:find('type052c_ship_red') then
        zeusSpawn = type052c_ship_red
    elseif text:find('type054a_ship_red') then
        zeusSpawn = type054a_ship_red
    elseif text:find('grisha_ship_red') then
        zeusSpawn = grisha_ship_red
    elseif text:find('moskva_ship_red') then
        zeusSpawn = moskva_ship_red
    elseif text:find('neus_ship_red') then
        zeusSpawn = neus_ship_red
    elseif text:find('ssk_ship_red') then
        zeusSpawn = ssk_ship_red
    elseif text:find('tu142_red') then
        zeusSpawn = tu142_red
    elseif text:find('tu160_red') then
        zeusSpawn = tu160_red
    elseif text:find('tu22m3_red') then
        zeusSpawn = tu22m3_red
    elseif text:find('tu95ms_red') then
        zeusSpawn = tu95ms_red
    elseif text:find('a10cas_red') then
        zeusSpawn = a10cas_red
    elseif text:find('harriercas_red') then
        zeusSpawn = harriercas_red
    elseif text:find('f18sead_red') then
        zeusSpawn = f18sead_red
    elseif text:find('hawk_red') then
        zeusSpawn = hawk_red
    elseif text:find('helicas_red') then
        zeusSpawn = helicas_red
    elseif text:find('fob1_red') then
        zeusSpawn = fob1_red
    elseif text:find('fob2_red') then
        zeusSpawn = fob2_red
    elseif text:find('fob3_red') then
        zeusSpawn = fob3_red
    elseif text:find('fob4_red') then
        zeusSpawn = fob4_red
    elseif text:find('fob5_red') then
        zeusSpawn = fob5_red
    elseif text:find('fob6_red') then
        zeusSpawn = fob6_red
    elseif text:find('su25cas_red') then
        zeusSpawn = su25cas_red
    elseif text:find('yak52_red') then
        zeusSpawn = yak52_red
    elseif text:find('uh1h_red') then
        --BLUE
        zeusSpawn = uh1h_red
    elseif text:find('f5_blue') then
        zeusSpawn = f5_blue
    elseif text:find('f4_blue') then
        zeusSpawn = f4_blue
    elseif text:find('f14_blue') then
        zeusSpawn = f14_blue
    elseif text:find('f16_blue') then
        zeusSpawn = f16_blue
    elseif text:find('f15_blue') then
        zeusSpawn = f15_blue
    elseif text:find('m2000_blue') then
        zeusSpawn = m2000_blue
    elseif text:find('su27_blue') then
        zeusSpawn = su27_blue
    elseif text:find('mig21_blue') then
        zeusSpawn = mig21_blue
    elseif text:find('mig29_blue') then
        zeusSpawn = mig29_blue
    elseif text:find('drone_blue') then
        zeusSpawn = drone_blue
    elseif text:find('mig23_blue') then
        zeusSpawn = mig23_blue
    elseif text:find('jf17_blue') then
        zeusSpawn = jf17_blue
    elseif text:find('j11_blue') then
        zeusSpawn = j11_blue
    elseif text:find('f18_blue') then
        zeusSpawn = f18_blue
    elseif text:find('ajs37_blue') then
        zeusSpawn = ajs37_blue
    elseif text:find('c101_blue') then
        zeusSpawn = c101_blue
    elseif text:find('l39_blue') then
        zeusSpawn = l39_blue
    elseif text:find('mig19_blue') then
        zeusSpawn = mig19_blue
    elseif text:find('abrams_blue') then
        zeusSpawn = abrams_blue
    elseif text:find('t80_blue') then
        zeusSpawn = t80_blue
    elseif text:find('bmp_blue') then
        zeusSpawn = bmp_blue
    elseif text:find('truck_blue') then
        zeusSpawn = truck_blue
    elseif text:find('armor_group_blue') then
        zeusSpawn = armor_group_blue
    elseif text:find('infantry_group_blue') then
        zeusSpawn = infantry_group_blue
    elseif text:find('Stryker_blue') then
        --BLUE SPECelseifIC
        zeusSpawn = Stryker_blue
    elseif text:find('hawk_blue') then
        zeusSpawn = hawk_blue
    elseif text:find('patriot_blue') then
        zeusSpawn = patriot_blue
    elseif text:find('avenger_blue') then
        zeusSpawn = avenger_blue
    elseif text:find('linebacker_blue') then
        zeusSpawn = linebacker_blue
    elseif text:find('stinger_manpads_blue') then
        zeusSpawn = stinger_manpads_blue
    elseif text:find('chaparral_blue') then
        zeusSpawn = chaparral_blue
    elseif text:find('vulcan_blue') then
        zeusSpawn = vulcan_blue
    elseif text:find('tanker_ship_blue') then
        zeusSpawn = tanker_ship_blue
    elseif text:find('type052b_ship_blue') then
        zeusSpawn = type052b_ship_blue
    elseif text:find('type052c_ship_blue') then
        zeusSpawn = type052c_ship_blue
    elseif text:find('type054a_ship_blue') then
        zeusSpawn = type054a_ship_blue
    elseif text:find('oliver_ship_blue') then
        zeusSpawn = oliver_ship_blue
    elseif text:find('ticonderoga_ship_blue') then
        zeusSpawn = ticonderoga_ship_blue
    elseif text:find('b1b_blue') then
        zeusSpawn = b1b_blue
    elseif text:find('b52_blue') then
        zeusSpawn = b52_blue
    elseif text:find('f11a_blue') then
        zeusSpawn = f11a_blue
    elseif text:find('a10cas_blue') then
        zeusSpawn = a10cas_blue
    elseif text:find('harriercas_blue') then
        zeusSpawn = harriercas_blue
    elseif text:find('f18sead_blue') then
        zeusSpawn = f18sead_blue
    elseif text:find('helicas_blue') then
        zeusSpawn = helicas_blue
    elseif text:find('su25cas_blue') then
        zeusSpawn = su25cas_blue
    elseif text:find('csarx1') then
        zeusSpawn = csarx1
    elseif text:find('csarx2') then
        zeusSpawn = csarx2
    elseif text:find('jtac') then
        JTAC_ZEUS = JTAC_MQ_ZEUS:SpawnFromVec3(coord)
        JTAC_ZEUS_NAME = JTAC_ZEUS:GetName()
        JTACAutoLase(JTAC_ZEUS_NAME, 1688, true, 'all')
        trigger.action.outText('✈ JTAC:  ' .. JTAC_ZEUS_NAME .. ' on station', 60)
    end

    spawnAltitude = AlturaRNG()

    zeusSpawn:SpawnFromVec3(coord)

    env.info('' .. text .. ' ejecutado correctamente.')
    trigger.action.outText('' .. text .. 'succesfully CREATED..', 10)
    trigger.action.outSoundForCoalition(coalition.side.BLUE, 'TransmisionEntrante.ogg')
end

function handleDebugRequest(text, coord)
end

local destroyZoneCount = 0
function handleDestroyRequest(text, coord)
    local destroyZoneName = string.format('destroy %d', destroyZoneCount)
    local zoneRadiusToDestroy = ZONE_RADIUS:New(destroyZoneName, coord:GetVec2(), 1000)
    destroyZoneCount = destroyZoneCount + 1
    trigger.action.outText('Unit(s) succesfully destroyed.', 10)
    local function destroyUnit(unit)
        unit:Destroy()
        return true
    end

    zoneRadiusToDestroy:SearchZone(destroyUnit, Object.Category.UNIT)
end

function handleDeleteJtacRequest()
    Group.getByName(JTAC_ZEUS_NAME):destroy()
    trigger.action.outText('ZEUS JTAC:  ' .. JTAC_ZEUS_NAME .. ' deactivated', 60)
end

function markRemoved(Event)
    if Event.text ~= nil and Event.text:lower():find('-') then
        local text = Event.text:lower()
        local vec3 = {z = Event.pos.z, x = Event.pos.x}
        local coord = COORDINATE:NewFromVec3(vec3)

        if Event.text:lower():find('-create') then
            handleSpawnRequest(text, coord)
        elseif Event.text:lower():find('-debug') then
            handleDebugRequest(text, coord)
        elseif Event.text:lower():find('-destroy') then
            handleDestroyRequest(text, coord)
        elseif Event.text:lower():find('-delete jtac') then
            handleDeleteJtacRequest()
        end
    end
end

function SupportHandler:onEvent(Event)
    if Event.id == world.event.S_EVENT_MARK_ADDED then
    elseif Event.id == world.event.S_EVENT_MARK_CHANGE then
    elseif Event.id == world.event.S_EVENT_MARK_REMOVED then
        markRemoved(Event)
    end
end

world.addEventHandler(SupportHandler)