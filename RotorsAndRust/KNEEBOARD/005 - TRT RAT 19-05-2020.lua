--↓↓ RAT ↓↓---------------------------------------------------------------------------------------------------------------------------------------------------------
local F14Bskins = {
    'VF-11 Red Rippers (1997)',
    'VF-24 Renegades',
    'VF-32 Fighting Swordsmen 101',
    'VF-32 Fighting Swordsmen 102',
    'VF-32 Fighting Swordsmen 103',
    'VF-74 BeDevilers 1991',
    'VF-101 Dark',
    'VF-101 Grim Reapers Low Vis',
    'VF-101 Red',
    'VF-102 Diamondbacks',
    'VF-102 Diamondbacks 102',
    'VF-103 Jolly Rogers Hi Viz',
    'VF-103 Last Ride',
    'VF-103 Sluggers 206 (1995)',
    'VF-103 Sluggers 207 (1991)',
    'VF-142 Ghostriders',
    'VF-143 Pukin Dogs CAG',
    'VF-143 Pukin Dogs Low Vis',
    'VF-143 Pukin Dogs Low Vis (1995)',
    'VF-211 Fighting Checkmates'
}

local F18Cskins = {
    'VFA-34',
    'VFA-37',
    'VFA-83',
    'VFA-87',
    'VFA-97',
    'VFA-106',
    'VFA-106 high visibility',
    'VFA-113',
    'VFA-122',
    'VFA-131',
    'VFA-192',
    'VFC-12',
    'VMFA-122',
    'VMFA-122 high visibility',
    'VMFA-232',
    'VMFA-232 high visibility',
    'VMFA-251',
    'VMFA-251 high visibility',
    'VMFA-312',
    'VMFA-312 high visibility',
    'VMFA-314',
    'VMFA-323',
    'VMFA-323_high visibility',
    'VMFA-531',
    'VMFAT-101',
    'VMFAT-101 high visibility',
    'VMFAT-101 high visibility 2005',
    'VX-31 CoNA'
}

local f5e3skins = {
    'US Aggressor VFC-13 01',
    'US Aggressor VFC-13 25',
    'US Aggressor VFC-13 28 Fict Splinter',
    'US Aggressor VFC-13 40',
    'US Aggressor VFC-111 01',
    'US Aggressor VFC-111 105 WWII B',
    'US Aggressor VFC-111 115',
    'US Aggressor VFC-111 116',
    'US Aggressor VMFT-401 02 2011',
    'US USAF Grape 31',
    'USA standard',
    "USAF 'Southeast Asia'"
}

local f15cskins = {
    '12th Fighter SQN (AK)',
    '58th Fighter SQN (EG)',
    '65th Aggressor SQN (WA) Flanker',
    '65th Aggressor SQN (WA) MiG',
    '65th Aggressor SQN (WA) SUPER_Flanker',
    '106th SQN (8th Airbase)',
    '390th Fighter SQN',
    '433rd Weapons SQN (WA)',
    '493rd Fighter SQN (LN)',
    'Ferris Scheme',
    'HAF AEGEAN GHOST'
}

local Harrierskins = {
    'VMA-211',
    'VMA-211D',
    'VMA-214',
    'VMA-214D',
    'VMA-223D',
    'VMA-231-1',
    'VMA-231-2',
    'VMA-231D',
    'VMA-311',
    'VMA-311D',
    'VMA-513',
    'VMA-513D',
    'VMA-542',
    'VMAT-203',
    'VMAT-203S'
}

local A10Cskins = {
    '23rd TFW England AFB (EL)',
    '25th FS Osan AB, Korea (OS)',
    '47th FS Barksdale AFB, Louisiana (BD)',
    '66th WS Nellis AFB, Nevada (WA)',
    '74th FS Moody AFB, Georgia (FT)',
    '104th FS Maryland ANG, Baltimore (MD)',
    '118th FS Bradley ANGB, Connecticut (CT)',
    '118th FS Bradley ANGB, Connecticut (CT) N621',
    '172nd FS Battle Creek ANGB, Michigan (BC)',
    '184th FS Arkansas ANG, Fort Smith (FS)',
    '190th FS Boise ANGB, Idaho (ID)',
    '354th FS Davis Monthan AFB, Arizona (DM)',
    '355th FS Eielson AFB, Alaska (AK)',
    '357th FS Davis Monthan AFB, Arizona (DM)',
    '422nd TES Nellis AFB, Nevada (OT)'
}

if enable_AirTraffic == true then
    local RATF14B =
        RAT:New('RAT_F14B', 'F14B managed'):Livery(F14Bskins):SetTakeoff('hot'):SetROT('noreaction'):SetFLcruise(360):SetFLmin(
        140
    ):SetEPLRS(true):EnableATC(false)

    local RATF18C =
        RAT:New('RAT_F18C', 'F18C managed'):Livery(F18Cskins):SetTakeoff('hot'):SetROT('noreaction'):SetFLcruise(360):SetFLmin(
        140
    ):SetEPLRS(true):EnableATC(false)

    local RATF5E3 =
        RAT:New('RAT_F5', 'F5 managed'):Livery(f5e3skins):SetTakeoff('hot'):SetROT('noreaction'):SetFLcruise(360):SetFLmin(
        140
    ):SetEPLRS(true):EnableATC(false)

    local RATJF17 =
        RAT:New('RAT_JF17', 'JF17 managed'):Livery(CeagleeIIskins):SetTakeoff('hot'):SetROT('noreaction'):SetFLcruise(
        360
    ):SetFLmin(140):SetEPLRS(true):EnableATC(false)

    local RATF15C =
        RAT:New('RAT_F15C', 'F15C managed'):Livery(f15cskins):SetTakeoff('hot'):SetROT('noreaction'):SetFLcruise(360):SetFLmin(
        140
    ):SetEPLRS(true):EnableATC(false)

    local RATharrier =
        RAT:New('RAT_Harrier', 'Harrier managed'):Livery(Harrierskins):SetTakeoff('hot'):SetROT('noreaction'):SetFLcruise(
        360
    ):SetFLmin(140):SetEPLRS(true):EnableATC(false)

    local RATA10C =
        RAT:New('RAT_A10C', 'A10C managed'):Livery(A10Cskins):SetTakeoff('hot'):SetROT('noreaction'):SetFLcruise(360):SetFLmin(
        140
    ):SetEPLRS(true):EnableATC(false)

    local manager = RATMANAGER:New(MAX_Air_Traffic_Planes)
    manager:Add(RATF14B, 1)
    manager:Add(RATF18C, 1)
    manager:Add(RATF5E3, 1)
    manager:Add(RATJF17, 1)
    manager:Add(RATF15C, 1)
    manager:Add(RATharrier, 1)
    manager:Add(RATA10C, 1)
    manager:Start(2)
end
--↓↓ FIN ↓↓---------------------------------------------------------------------------------------------------------------------------------------------------------
