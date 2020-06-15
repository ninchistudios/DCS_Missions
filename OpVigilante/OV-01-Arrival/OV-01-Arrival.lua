
-- TODO Messages
-- Steve Irwin waits for both pilots to be in the aircraft and clears them for departure
-- When both clear of 10nm Steve hands them off
-- Nearing Sukhumi Steve relays intel of insurgent anti-aircraft gun harrassing military traffic 2nm SE of Sukhumi airfield, clear to engage

-- TODO Success params
-- If gun destroyed, Max success. Not destroyed, max partial success.
-- If violate RUS airspace, scramble appropriate intercept, max partial fail.
-- If shot down, max partial fail.
-- If dead, max fail.
-- If carrier shoots down Russian, max partial fail.

-- TODO stuff
-- check airboss

-- Set up players
local Player1 = GROUP:FindByName("AUS Skyhawk 1")
local Player2 = GROUP:FindByName("AUS Skyhawk 2")

-- Set up polygon exclusion zones
local exclZone1 = ZONE_POLYGON:New("TUR-ZONE-EXCL-01",GROUP:FindByName("TUR-ZONE-EXCL-01"))
local exclZone2 = ZONE_POLYGON:New("RUS-ZONE-EXCL-01",GROUP:FindByName("RUS-ZONE-EXCL-01"))
local exclZone3 = ZONE_POLYGON:New("RUS-ZONE-EXCL-02",GROUP:FindByName("RUS-ZONE-EXCL-02"))
local exclZone4 = ZONE_POLYGON:New("GEO-ZONE-EXCL-01",GROUP:FindByName("GEO-ZONE-EXCL-01"))

p1ExclMessager = SCHEDULER:New(Player1,
  function()
    Player1:MessageToAll( ( Player1:IsCompletelyInZone(exclZone1)) and "Violating Turkish airspace!", 10)
    Player1:MessageToAll( ( Player1:IsCompletelyInZone(exclZone2)) and "Violating western Russian exclusion zone!", 10)
    Player1:MessageToAll( ( Player1:IsCompletelyInZone(exclZone3)) and "Violating northern Russian exclusion zone!", 10)
    Player1:MessageToAll( ( Player1:IsCompletelyInZone(exclZone4)) and "Breaching Georgian airspace!", 10)    
    if Player1:IsCompletelyInZone(exclZone1) or Player1:IsCompletelyInZone(exclZone2) or Player1:IsCompletelyInZone(exclZone3) or Player1:IsCompletelyInZone(exclZone4)  then
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
    if Player2:IsCompletelyInZone(exclZone1) or Player2:IsCompletelyInZone(exclZone2) or Player2:IsCompletelyInZone(exclZone3) or Player2:IsCompletelyInZone(exclZone4)  then
      -- TODO remove
      Player2:GetUnit(1):SmokeRed()
    end
  end,
  {}, 0, 5)

-- No MOOSE settings menu. Comment out this line if required.
-- _SETTINGS:SetPlayerMenuOff()

-- S-3B Recovery Tanker spawning in air.
-- local tanker=RECOVERYTANKER:New("Steve Irwin", "Caltex Group")
-- tanker:SetTakeoffAir()
-- tanker:SetRadio(250)
-- tanker:SetModex(511)
-- tanker:SetTACAN(1, "TKR")
-- tanker:__Start(1)

-- E-2D AWACS spawning on Stennis.
local awacs=RECOVERYTANKER:New("Steve Irwin", "E-2D Wizard Group")
awacs:SetAWACS()
awacs:SetRadio(260)
awacs:SetAltitude(20000)
awacs:SetCallsign(CALLSIGN.AWACS.Wizard)
awacs:SetRacetrackDistances(30, 15)
awacs:SetModex(611)
awacs:SetTACAN(2, "WIZ")
awacs:__Start(1)

-- Rescue Helo with home base Lake Erie. Has to be a global object!
rescuehelo=RESCUEHELO:New("Steve Irwin", "Rescue Helo")
rescuehelo:SetHomeBase(AIRBASE:FindByName("Gaduata"))
rescuehelo:SetModex(42)
rescuehelo:__Start(1)
  
-- Create AIRBOSS object.
local AirbossStennis=AIRBOSS:New("Steve Irwin")

-- Add recovery windows:
-- Case I from 9 to 10 am.
local window1=AirbossStennis:AddRecoveryWindow( "15:00", "20:00", 1, nil, false, 25)

-- Set folder of airboss sound files within miz file.
AirbossStennis:SetSoundfilesFolder("Airboss Soundfiles/")

-- Single carrier menu optimization.
AirbossStennis:SetMenuSingleCarrier()

-- Skipper menu.
AirbossStennis:SetMenuRecovery(30, 20, false)

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


--- Function called when recovery tanker is started.
function tanker:OnAfterStart(From,Event,To)

  -- Set recovery tanker.
  AirbossStennis:SetRecoveryTanker(tanker)  


  -- Use tanker as radio relay unit for LSO transmissions.
  AirbossStennis:SetRadioRelayLSO(self:GetUnitName())
  
end

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


