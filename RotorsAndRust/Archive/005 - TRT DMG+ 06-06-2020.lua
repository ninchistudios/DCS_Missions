--↓↓ EXPLOSIVES OVER 9000 ↓↓----------------------------------------------------------------------------------------------------------------------------------------
MAIN = {
    MISSION = {
        Missile = {},
        EnBlast = {}
    }
}

ACFT = SET_GROUP:New():FilterCoalitions('blue'):FilterStart()

function FX_EXPLOSION(Coordinate, Radius, Power)
    trigger.action.explosion(
        {
            x = Coordinate.x + math.random(5, Radius),
            y = Coordinate.y + math.random(-5, Radius),
            z = Coordinate.z + math.random(5, Radius)
        },
        Power
    )
end

EVT = BASE:New()
function EVT:OnEventShot(Data)
    ACFT:FilterOnce()
    local INI = Data.IniUnit
    local ORD = Data.Weapon
    local OrdName = ORD:getName()
    local OrdDesc = ORD:getDesc()
    local OrdType = OrdDesc['category']
    if OrdType == 1 then --missiles
        local Table = MAIN.MISSION.EnBlast
        Table[OrdName] = {}
        Table[OrdName].TypeName = ORD:getTypeName()
        Table[OrdName].OrdPos = nil
        Table[OrdName].Sched =
            SCHEDULER:New(
            nil,
            function()
                if ORD:isExist() then
                    Table[OrdName].OrdPos = COORDINATE:NewFromVec3(ORD:getPoint())
                else
                    Table[OrdName].Sched:Clear()
                    Table[OrdName].Sched = nil
                    local Coord = Table[OrdName].OrdPos
                    if
                        string.find(Table[OrdName].TypeName, '_65') ~= nil or
                            string.find(Table[OrdName].TypeName, '_75T') ~= nil or
                            string.find(Table[OrdName].TypeName, 'LAU-61') ~= nil or
                            string.find(Table[OrdName].TypeName, 'LAU-68') ~= nil or
                            string.find(Table[OrdName].TypeName, 'B-13') ~= nil or
                            string.find(Table[OrdName].TypeName, 'B-8V20A') ~= nil or
                            string.find(Table[OrdName].TypeName, 'AGM-114') ~= nil or
                            string.find(Table[OrdName].TypeName, '_Sidearm') ~= nil or
                            string.find(Table[OrdName].TypeName, '_Vikhr') ~= nil or
                            string.find(Table[OrdName].TypeName, '_88') ~= nil
                     then
                        for Angle = 000, 359, 60 do
                            for Radius = 10, 10, 10 do
                                local Translate = Coord:Translate(Radius, Angle)
                                FX_EXPLOSION(Translate, Radius, 50)
                            end
                        end
                    elseif
                        string.find(Table[OrdName].TypeName, '_62') ~= nil or
                            string.find(Table[OrdName].TypeName, 'Kh_25') ~= nil or
                            string.find(Table[OrdName].TypeName, 'C-701T') ~= nil or
                            string.find(Table[OrdName].TypeName, 'C-701IR') ~= nil or
                            string.find(Table[OrdName].TypeName, '_LD-10') ~= nil or
                            string.find(Table[OrdName].TypeName, 'Mistral') ~= nil
                     then
                        for Angle = 000, 359, 60 do
                            for Radius = 10, 20, 10 do
                                local Translate = Coord:Translate(Radius, Angle)
                                FX_EXPLOSION(Translate, Radius, 750)
                            end
                        end
                    elseif
                        string.find(Table[OrdName].TypeName, '_84') ~= nil or
                            string.find(Table[OrdName].TypeName, '_15F') ~= nil or
                            string.find(Table[OrdName].TypeName, '802AK') ~= nil or
                            string.find(Table[OrdName].TypeName, '802AKG') ~= nil or
                            string.find(Table[OrdName].TypeName, '_LS_6_500') ~= nil or
                            string.find(Table[OrdName].TypeName, '_04E') ~= nil
                     then
                        for Angle = 000, 359, 60 do
                            for Radius = 10, 30, 10 do
                                local Translate = Coord:Translate(Radius, Angle)
                                FX_EXPLOSION(Translate, Radius, 1000)
                            end
                        end
                    end
                    Table[OrdName].OrdPos = nil
                    Table[OrdName] = nil
                end
            end,
            {},
            1,
            .01,
            nil,
            nil
        )
    elseif OrdType == 3 then --bombs
        local Table = MAIN.MISSION.EnBlast
        Table[OrdName] = {}
        Table[OrdName].TypeName = ORD:getTypeName()
        Table[OrdName].OrdPos = nil
        Table[OrdName].Sched =
            SCHEDULER:New(
            nil,
            function()
                if ORD:isExist() then
                    Table[OrdName].OrdPos = COORDINATE:NewFromVec3(ORD:getPoint())
                else
                    Table[OrdName].Sched:Clear()
                    Table[OrdName].Sched = nil
                    local Coord = Table[OrdName].OrdPos
                    if
                        string.find(Table[OrdName].TypeName, '_82') ~= nil or
                            string.find(Table[OrdName].TypeName, '_97') ~= nil or
                            string.find(Table[OrdName].TypeName, '_250') ~= nil or
                            string.find(Table[OrdName].TypeName, '_250_24') ~= nil or
                            string.find(Table[OrdName].TypeName, '_250_33') ~= nil or
                            string.find(Table[OrdName].TypeName, '_250_M54') ~= nil or
                            string.find(Table[OrdName].TypeName, '_250_M54_TU') ~= nil or
                            string.find(Table[OrdName].TypeName, '_38') ~= nil or
                            string.find(Table[OrdName].TypeName, '_GBU_12') ~= nil or
                            string.find(Table[OrdName].TypeName, '_12') ~= nil
                     then
                        for Angle = 000, 359, 60 do
                            for Radius = 10, 10, 10 do
                                local Translate = Coord:Translate(Radius, Angle)
                                FX_EXPLOSION(Translate, Radius, 500)
                            end
                        end
                    elseif
                        string.find(Table[OrdName].TypeName, '_83') ~= nil or
                            string.find(Table[OrdName].TypeName, '_500') ~= nil or
                            string.find(Table[OrdName].TypeName, '_500_12') ~= nil or
                            string.find(Table[OrdName].TypeName, '_500_33') ~= nil or
                            string.find(Table[OrdName].TypeName, '_500_6') ~= nil or
                            string.find(Table[OrdName].TypeName, '_500_M54') ~= nil or
                            string.find(Table[OrdName].TypeName, '_500_M54_TU') ~= nil or
                            string.find(Table[OrdName].TypeName, '_500_M62') ~= nil or
                            string.find(Table[OrdName].TypeName, '_500_SL') ~= nil or
                            string.find(Table[OrdName].TypeName, '_500_TA') ~= nil or
                            string.find(Table[OrdName].TypeName, '_16') ~= nil
                     then
                        for Angle = 000, 359, 60 do
                            for Radius = 10, 20, 10 do
                                local Translate = Coord:Translate(Radius, Angle)
                                FX_EXPLOSION(Translate, Radius, 750)
                            end
                        end
                    elseif
                        string.find(Table[OrdName].TypeName, '_84') ~= nil or
                            string.find(Table[OrdName].TypeName, '_31') ~= nil or
                            string.find(Table[OrdName].TypeName, '_24') ~= nil or
                            string.find(Table[OrdName].TypeName, '_27') ~= nil or
                            string.find(Table[OrdName].TypeName, '_28') ~= nil or
                            string.find(Table[OrdName].TypeName, '_10') ~= nil
                     then
                        for Angle = 000, 359, 60 do
                            for Radius = 10, 30, 10 do
                                local Translate = Coord:Translate(Radius, Angle)
                                FX_EXPLOSION(Translate, Radius, 1000)
                            end
                        end
                    end
                    Table[OrdName].OrdPos = nil
                    Table[OrdName] = nil
                end
            end,
            {},
            1,
            .01,
            nil,
            nil
        )
    elseif OrdType == 2 then --rockets
        local Table = MAIN.MISSION.EnBlast
        Table[OrdName] = {}
        Table[OrdName].TypeName = ORD:getTypeName()
        Table[OrdName].OrdPos = nil
        Table[OrdName].Sched =
            SCHEDULER:New(
            nil,
            function()
                if ORD:isExist() then
                    Table[OrdName].OrdPos = COORDINATE:NewFromVec3(ORD:getPoint())
                else
                    Table[OrdName].Sched:Clear()
                    Table[OrdName].Sched = nil
                    local Coord = Table[OrdName].OrdPos
                    if
                        string.find(Table[OrdName].TypeName, '8V20A') ~= nil or
                            string.find(Table[OrdName].TypeName, '_250') ~= nil or
                            string.find(Table[OrdName].TypeName, '_250_24') ~= nil or
                            string.find(Table[OrdName].TypeName, '_250_33') ~= nil or
                            string.find(Table[OrdName].TypeName, '_250_M54') ~= nil or
                            string.find(Table[OrdName].TypeName, '_250_M54_TU') ~= nil or
                            string.find(Table[OrdName].TypeName, 'Mk1_HE') ~= nil or
                            string.find(Table[OrdName].TypeName, 'Mk5_HEAT') ~= nil or
                            string.find(Table[OrdName].TypeName, 'S_24A') ~= nil or
                            string.find(Table[OrdName].TypeName, 'S_24B') ~= nil or
                            string.find(Table[OrdName].TypeName, '_16UM') ~= nil or
                            string.find(Table[OrdName].TypeName, '_32M') ~= nil or
                            string.find(Table[OrdName].TypeName, '_8KOM') ~= nil or
                            string.find(Table[OrdName].TypeName, '_8OFP2') ~= nil or
                            string.find(Table[OrdName].TypeName, '_8TsM') ~= nil or
                            string.find(Table[OrdName].TypeName, 'UB_32') ~= nil
                     then
                        for Angle = 000, 359, 60 do
                            for Radius = 10, 10, 10 do
                                local Translate = Coord:Translate(Radius, Angle)
                                FX_EXPLOSION(Translate, Radius, 75)
                            end
                        end
                    elseif
                        string.find(Table[OrdName].TypeName, '13_OF') ~= nil or
                            string.find(Table[OrdName].TypeName, '_M151') ~= nil or
                            string.find(Table[OrdName].TypeName, '_M156') ~= nil or
                            string.find(Table[OrdName].TypeName, '_M257') ~= nil or
                            string.find(Table[OrdName].TypeName, '_M274') ~= nil or
                            string.find(Table[OrdName].TypeName, '_MK5') ~= nil or
                            string.find(Table[OrdName].TypeName, '_BRM1_90') ~= nil or
                            string.find(Table[OrdName].TypeName, '_M151') ~= nil or
                            string.find(Table[OrdName].TypeName, '_WP61') ~= nil or
                            string.find(Table[OrdName].TypeName, '_WTU1B') ~= nil or
                            string.find(Table[OrdName].TypeName, '_MK_71') ~= nil or
                            string.find(Table[OrdName].TypeName, '_M70B') ~= nil or
                            string.find(Table[OrdName].TypeName, 'Matra_Type_155_Rocket_Pod') ~= nil or
                            string.find(Table[OrdName].TypeName, '_57K') ~= nil or
                            string.find(Table[OrdName].TypeName, '25_OFM') ~= nil
                     then
                        for Angle = 000, 359, 60 do
                            for Radius = 10, 10, 10 do
                                local Translate = Coord:Translate(Radius, Angle)
                                FX_EXPLOSION(Translate, Radius, 100)
                            end
                        end
                    end
                    Table[OrdName].OrdPos = nil
                    Table[OrdName] = nil
                end
            end,
            {},
            1,
            .01,
            nil,
            nil
        )
    end
end
EVT:HandleEvent(EVENTS.Shot)

env.info("DAMAGE IT´S OVER 9000!!!!!!!!!!!!!!!!!!!!!!!!")
--FIN---------------------------------------------------------------------------------------------------------------------------------------------------------------
