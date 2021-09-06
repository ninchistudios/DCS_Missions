env.info( '*** RNR COMMON START *** ' )

env.info( '*** RNR Initialising Carrier Script *** ' )
Wrench.carrierSetup("CV73", 30, {"SHELL"})

env.info( '*** Initialising Recovery Tanker *** ' )
local TexacoCVN=RECOVERYTANKER:New("CV73", "TEXACO")
TexacoCVN:SetTACAN(10, "TXO")
TexacoCVN:SetRadio(251)
TexacoCVN:SetCallsign(CALLSIGN.Tanker.Texaco)
TexacoCVN:Start(1)

env.info( '*** RNR Initialising JFAC *** ' )

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


ctld.JTACAutoLase('JTAC1', 1688) -- These were the original JTAC options for Phase 1 and 2
ctld.JTACAutoLase('JTAC2', 1688)
-- ctld.JTACAutoLase('JTAC3', 1683)


-- RADIO PARAMETERS HAVE BEEN SET FOR COMMS THROUGH SRS --

-- ctld.JTACAutoLase('JTAC1', 1688, true, all, 1 {freq = "270.00", mod = "AM", name = "JTAC1"})
-- ctld.JTACAutoLase('JTAC2', 1688, true, all, 1 {freq = "271.00", mod = "AM", name = "JTAC2"})
-- ctld.JTACAutoLase('JTAC3', 1688, true, all, 1 {freq = "272.00", mod = "AM", name = "BLUE-REAPER-3-SOUTH-272"})

env.info( '*** RNR COMMON END *** ' )
