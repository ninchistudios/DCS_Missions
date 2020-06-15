
-- TODO Messages
-- Steve Irwin waits for both pilots to be in the aircraft and clears them for departure
-- When both clear of 10nm Steve hands them off
-- Nearing Sukhumi Steve relays intel of insurgent anti-aircraft gun harrassing military traffic 2nm SE of Sukhumi airfield, clear to engage

-- TODO Events
-- scramble appropriate intercept if violate airspace

-- TODO Success params
-- Success > Partial Success > Unsuccessful > Failure > Disastrous
-- Partial Success: INS gun not destroyed | < 3 waypoint zones visited
-- Unsuccessful: violate RUS airspace | < 2 waypoint zones visited | carrier shoots down Russian
-- Failure: shot down | < 1 waypoint zones visited
-- Disastrous: death

-- TODO stuff
-- check airboss

-- Random Air Traffic
local RAT_AN26 = RAT:New("RAT_AN26")
RAT_AN26:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_AN26:Spawn(5)
local RAT_IL76 = RAT:New("RAT_IL76")
RAT_IL76:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_IL76:Spawn(5)

-- Set up polygon exclusion zones
exclZone1 = ZONE_POLYGON:New("TUR-ZONE-EXCL-01",GROUP:FindByName("TUR-ZONE-EXCL-01"))
exclZone2 = ZONE_POLYGON:New("RUS-ZONE-EXCL-01",GROUP:FindByName("RUS-ZONE-EXCL-01"))
exclZone3 = ZONE_POLYGON:New("RUS-ZONE-EXCL-02",GROUP:FindByName("RUS-ZONE-EXCL-02"))
exclZone4 = ZONE_POLYGON:New("GEO-ZONE-EXCL-01",GROUP:FindByName("GEO-ZONE-EXCL-01"))
testZone1 = ZONE:New("Test-Zone")

-- Set up unit globals TODO only after players spawned?
CarrierGrp = GROUP:FindByName("AUS MV Steve Irwin")
-- Player1Grp = GROUP:FindByName("AUS Skyhawk 1")
-- Player2Grp = GROUP:FindByName("AUS Skyhawk 2")

-- testZone1:E( { "Group is completely in Zone:", CarrierGrp:IsCompletelyInZone( testZone1 ) } )
-- testZone1:E( { "Group is partially in Zone:", CarrierGrp:IsPartlyInZone( testZone1 ) } )
-- testZone1:E( { "Group is not in Zone:", CarrierGrp:IsNotInZone( testZone1 ) } )

-- SCHEDULER:New(MasterObject, SchedulerFunction, SchedulerArguments, Start, Repeat, RandomizeFactor, Stop)
carrierTestMessager = SCHEDULER:New(CarrierGrp,
  function()
    if CarrierGrp:IsCompletelyInZone(testZone1) then
      -- CarrierGrp:GetUnit(1):SmokeGreen()
      CarrierGrp:MessageToBlue("Carrier in Test Zone",5)
    end
  end,
  {}, 0, 5)

--[[

p1ExclMessager = SCHEDULER:New(Player1,
  function()
    Player1:MessageToAll( ( Player1:IsCompletelyInZone(exclZone1)) and "Violating Turkish airspace!", 10)
    Player1:MessageToAll( ( Player1:IsCompletelyInZone(exclZone2)) and "Violating western Russian exclusion zone!", 10)
    Player1:MessageToAll( ( Player1:IsCompletelyInZone(exclZone3)) and "Violating northern Russian exclusion zone!", 10)
    Player1:MessageToAll( ( Player1:IsCompletelyInZone(exclZone4)) and "Breaching Georgian airspace!", 10)    
    if (Player1:IsCompletelyInZone(exclZone1) or Player1:IsCompletelyInZone(exclZone2) or Player1:IsCompletelyInZone(exclZone3) or Player1:IsCompletelyInZone(exclZone4)) then
      -- TODO remove
      Player1:GetUnit(1):SmokeRed()
    end
  end,
  {}, 0, 5)

p2ExclMessager = SCHEDULER:New(Player2,
  function()
    Player2:MessageToAll( ( Player2:IsCompletelyInZone(exclZone1)) and "Violating Turkish airspace!", 10)
    Player2:MessageToAll( ( Player2:IsCompletelyInZone(exclZone2)) and "Violating western Russian exclusion zone!", 10)
    Player2:MessageToAll( ( Player2:IsCompletelyInZone(exclZone3)) and "Violating northern Russian exclusion zone!", 10)
    Player2:MessageToAll( ( Player2:IsCompletelyInZone(exclZone4)) and "Breaching Georgian airspace!", 10)    
    if (Player2:IsCompletelyInZone(exclZone1) or Player2:IsCompletelyInZone(exclZone2) or Player2:IsCompletelyInZone(exclZone3) or Player2:IsCompletelyInZone(exclZone4)) then
      -- TODO remove
      Player2:GetUnit(1):SmokeRed()
    end
  end,
  {}, 0, 5)
  
]]--

-- No MOOSE settings menu. Comment out this line if required.
-- _SETTINGS:SetPlayerMenuOff()

-- S-3B Recovery Tanker spawning in air.
-- local tanker=RECOVERYTANKER:New("Steve Irwin", "Caltex Group")
-- tanker:SetTakeoffAir()
-- tanker:SetRadio(250)
-- tanker:SetModex(511)
-- tanker:SetTACAN(1, "TKR")
-- tanker:__Start(1)

-- E-2D AWACS spawning on Carrier.
local awacs=RECOVERYTANKER:New(UNIT:FindByName("Steve Irwin"), "AUS Wizard AWACS")
awacs:SetAWACS()
awacs:SetRadio(260)
awacs:SetAltitude(20000)
awacs:SetCallsign(CALLSIGN.AWACS.Wizard)
awacs:SetRacetrackDistances(30, 15)
awacs:SetModex(611)
awacs:SetTACAN(2, "WIZ")
awacs:__Start(1)

-- Rescue Helo has to be a global object!
rescuehelo=RESCUEHELO:New(UNIT:FindByName("Steve Irwin"), "AUS Rescue")
rescuehelo:SetModex(42)
rescuehelo:__Start(1)
  
-- Create AIRBOSS object.
local AirbossStennis=AIRBOSS:New("Steve Irwin")

-- Add recovery windows:
-- AIRBOSS:AddRecoveryWindow(starttime, stoptime, case, holdingoffset, turnintowind, speed, uturn)
local window1=AirbossStennis:AddRecoveryWindow( "15:30", "20:00", 1, nil, true, 15, false)

-- Set folder of airboss sound files within miz file.
AirbossStennis:SetSoundfilesFolder("Airboss Soundfiles/")

-- Single carrier menu optimization.
AirbossStennis:SetMenuSingleCarrier()

-- Skipper menu.
-- AIRBOSS:SetMenuRecovery(duration, windondeck, uturn, offset)
AirbossStennis:SetMenuRecovery(30, 15, false, 30)

-- Remove landed AI planes from flight deck.
AirbossStennis:SetDespawnOnEngineShutdown()

-- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
AirbossStennis:Load()

-- Automatically save player results to your "Saved Games\DCS" folder each time a player get a final grade from the LSO.
AirbossStennis:SetAutoSave()

-- Enable trap sheet.
AirbossStennis:SetTrapSheet()

-- Start airboss class.
AirbossStennis:Start()

--[[
--- Function called when recovery tanker is started.
function tanker:OnAfterStart(From,Event,To)
  -- Set recovery tanker.
  AirbossStennis:SetRecoveryTanker(tanker)  
  -- Use tanker as radio relay unit for LSO transmissions.
  AirbossStennis:SetRadioRelayLSO(self:GetUnitName())
end
]]--

--- Function called when AWACS is started.
function awacs:OnAfterStart(From,Event,To)
  -- Set AWACS.
  AirbossStennis:SetRecoveryTanker(tanker)  
end


--- Function called when rescue helo is started.
function rescuehelo:OnAfterStart(From,Event,To)
  -- Use rescue helo as radio relay for Marshal.
  AirbossStennis:SetRadioRelayMarshal(self:GetUnitName())
end

--- Function called when a player gets graded by the LSO.
function AirbossStennis:OnAfterLSOGrade(From, Event, To, playerData, grade)
  local PlayerData=playerData --Ops.Airboss#AIRBOSS.PlayerData
  local Grade=grade --Ops.Airboss#AIRBOSS.LSOgrade

  ----------------------------------------
  --- Interface your Discord bot here! ---
  ----------------------------------------
  
  local score=tonumber(Grade.points)
  local name=tostring(PlayerData.name)
  
  -- Report LSO grade to dcs.log file.
  env.info(string.format("Player %s scored %.1f", name, score))
end


