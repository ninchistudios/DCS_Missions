env.info( '*** RNR COMMON START 02 *** ' )

local TexacoCVN=RECOVERYTANKER:New("KMART", "Texaco Group")
TexacoCVN:SetTACAN(10, "TXO")
TexacoCVN:SetRadio(251)
TexacoCVN:SetCallsign(CALLSIGN.Tanker.Texaco)
TexacoCVN:Start(1)
