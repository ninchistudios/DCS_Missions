-- TODO Messages

-- TODO Events

-- TODO Success params
-- Success > Partial Success > Unsuccessful > Failure > Disastrous
-- Partial Success:
-- Unsuccessful:
-- Failure:
-- Disastrous:

-- TODO stuff

-- Blue Globals
P1Grp = nil -- wait for birth event
P2Grp = nil -- wait for birth event
P3Grp = nil -- wait for birth event
P4Grp = nil -- wait for birth event

CarrierGrp = GROUP:FindByName("AUS HMAS Adelaide")

-- detect MP clients connecting
BirthHandler = EVENTHANDLER:New()
BirthHandler:HandleEvent( EVENTS.Birth )

--- @param Core.Event#EVENT self
-- @param Core.Event#EVENTDATA EventData
function BirthHandler:OnEventBirth( EventData )
  self:E(string.format("BirthHandler received OnEventBirth from %s", EventData.IniGroup.GroupName))
  if EventData.IniGroup.GroupName == "AUS 211" then
    P1Grp = EventData.IniGroup
    self:E("Player 211 connected")
  elseif EventData.IniGroup.GroupName == "AUS 221" then
    P2Grp = EventData.IniGroup
    self:E("Player 221 connected")
  elseif EventData.IniGroup.GroupName == "AUS 231" then
    P3Grp = EventData.IniGroup
    self:E("Player 231 connected")
  elseif EventData.IniGroup.GroupName == "AUS 241" then
    P4Grp = EventData.IniGroup
    self:E("Player 241 connected")
  end
end

-- Random Air Traffic
local RAT_AN26 = RAT:New("RAT_AN26")
RAT_AN26:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_AN26:Spawn(1)
local RAT_IL76 = RAT:New("RAT_IL76")
RAT_IL76:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_IL76:Spawn(1)

-- Set up polygon exclusion zones
exclZone1 = ZONE_POLYGON:New("TUR-ZONE-EXCL-01",GROUP:FindByName("TUR-ZONE-EXCL-01"))
exclZone2 = ZONE_POLYGON:New("RUS-ZONE-EXCL-01",GROUP:FindByName("RUS-ZONE-EXCL-01"))
exclZone3 = ZONE_POLYGON:New("RUS-ZONE-EXCL-02",GROUP:FindByName("RUS-ZONE-EXCL-02"))
exclZone4 = ZONE_POLYGON:New("GEO-ZONE-EXCL-01",GROUP:FindByName("GEO-ZONE-EXCL-01"))
testZone1 = ZONE:New("Test-Zone")

-- SCHEDULER:New(MasterObject, SchedulerFunction, SchedulerArguments, Start, Repeat, RandomizeFactor, Stop)
AirspaceMessager = SCHEDULER:New(CarrierGrp,
  function()
    if P1Grp == nil then
      -- CarrierGrp:E({"P1Grp is nil", P1Grp})
    else
      if P1Grp:IsCompletelyInZone(exclZone1) then
        CarrierGrp:MessageToBlue("Skyhawk 211 you are trespassing neutral Turkish airspace, fighters will be scrambled if you do not immediately divert.", 10)
      end
      if P1Grp:IsCompletelyInZone(exclZone2) then
        CarrierGrp:MessageToBlue("Skyhawk 211 you are trespassing Russian coastal airspace, fighters will be scrambled if you do not immediately divert.", 10)
      end
      if P1Grp:IsCompletelyInZone(exclZone3) then
        CarrierGrp:MessageToBlue("Skyhawk 211 you are trespassing Russian mainland airspace, fighters will be scrambled if you do not immediately divert.", 10)
      end
      if P1Grp:IsCompletelyInZone(exclZone4) then
        CarrierGrp:MessageToBlue("Skyhawk 211 you are trespassing friendly Georgian airspace, you risk a diplomatic incident if you do not immediately divert.", 10)
      end
      --[[ if P1Grp:IsCompletelyInZone(testZone1) then
        CarrierGrp:MessageToBlue("Skyhawk 211 you are transiting test zone.", 10)
        P1Grp:GetUnit(1):SmokeWhite()
      end ]]--
    end
    if P2Grp == nil then
      -- CarrierGrp:E({"P2Grp is nil", P2Grp})
    else
      if P2Grp:IsCompletelyInZone(exclZone1) then
        CarrierGrp:MessageToBlue("Skyhawk 221 you are trespassing neutral Turkish airspace, fighters will be scrambled if you do not immediately divert.", 10)
      end
      if P2Grp:IsCompletelyInZone(exclZone2) then
        CarrierGrp:MessageToBlue("Skyhawk 221 you are trespassing Russian coastal airspace, fighters will be scrambled if you do not immediately divert.", 10)
      end
      if P2Grp:IsCompletelyInZone(exclZone3) then
        CarrierGrp:MessageToBlue("Skyhawk 221 you are trespassing Russian mainland airspace, fighters will be scrambled if you do not immediately divert.", 10)
      end
      if P2Grp:IsCompletelyInZone(exclZone4) then
        CarrierGrp:MessageToBlue("Skyhawk 221 you are trespassing friendly Georgian airspace, you risk a diplomatic incident if you do not immediately divert.", 10)
      end
      --[[ if P2Grp:IsCompletelyInZone(testZone1) then
        CarrierGrp:MessageToBlue("Skyhawk 221 you are transiting test zone.", 10)
        P2Grp:GetUnit(1):SmokeWhite()
      end ]]--
    end

  end,
  {}, 0, 10)

-- No MOOSE settings menu. Comment out this line if required.
-- _SETTINGS:SetPlayerMenuOff()

-- S-3B Recovery Tanker spawning in air.
local tanker=RECOVERYTANKER:New(UNIT:FindByName("Steve Irwin"), "AUS Shell Tanker")
tanker:SetTakeoffAir()
tanker:SetRadio(250)
tanker:SetModex(511)
tanker:SetTACAN(1, "TKR")
tanker:__Start(1)

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

-- Rescue Helo (must be global)
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
  -- Discord bot here
  local score=tonumber(Grade.points)
  local name=tostring(PlayerData.name)

  --- Report LSO grade to dcs.log file.
  env.info(string.format("Player %s scored %.1f", name, score))
end
