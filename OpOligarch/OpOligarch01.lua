env.info( '*** OP OLIGARCH START *** ' )

env.info( '*** Initialising Carrier Script *** ' )
-- # Wrench.carrierSetup("RTFM", 30, {"SCM_ARCO"})

env.info( '*** Initialising AWACS *** ' )
local awacsCV=RECOVERYTANKER:New("RTFM", "SCM_DARKSTAR")
awacsCV:SetAWACS()
awacsCV:SetCallsign(CALLSIGN.AWACS.DARKSTAR, 1)
-- awacsCV:SetTakeoffAir()
awacsCV:SetAltitude(20000)
awacsCV:SetRadio(261)
awacsCV:SetTACAN(11, "DRK")
awacsCV:Start()

env.info( '*** Initialising JFAC *** ' )

ctld.JTAC_LIMIT_RED = 10 -- max number of JTAC Crates for the RED Side
ctld.JTAC_LIMIT_BLUE = 10 -- max number of JTAC Crates for the BLUE Side

ctld.JTAC_dropEnabled = true -- allow JTAC Crate spawn from F10 menu

ctld.JTAC_maxDistance = 10000 -- How far a JTAC can "see" in meters (with Line of Sight)

ctld.JTAC_smokeOn_RED = true -- enables marking of target with smoke for RED forces
ctld.JTAC_smokeOn_BLUE = true -- enables marking of target with smoke for BLUE forces

ctld.JTAC_smokeColour_RED = 4 -- RED side smoke colour -- Green = 0 , Red = 1, White = 2, Orange = 3, Blue = 4
ctld.JTAC_smokeColour_BLUE = 1 -- BLUE side smoke colour -- Green = 0 , Red = 1, White = 2, Orange = 3, Blue = 4

ctld.JTAC_jtacStatusF10 = true -- enables F10 JTAC Status menu

ctld.JTAC_location = true -- shows location of target in JTAC message

ctld.JTAC_lock =  "all" -- "vehicle" OR "troop" OR "all" forces JTAC to only lock vehicles or troops or all ground units

-- ctld.JTACAutoLase('BLUE-REAPER-1', 1681)

env.info( '*** OP OLIGARCH END *** ' )
