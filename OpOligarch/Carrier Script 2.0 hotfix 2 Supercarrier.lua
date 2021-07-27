--[[ Wrench's Carrier Script
	This will have the carrier turn intro the wind and obey a Landing and Recovery Cycle (LARC)
	start with the command Wrench.carrierSetup(unit1, LARC, tankers).
		unit1 - Unit name of the carrier
		LARC - LARC time (recovery to recovery in minutes)
		tankers - Carrier bourne tankers to be controlled by script
			formatted as a table of unit names i.e.
			{'tanker1', 'tanker2'}

]]
if not Wrench then
	Wrench = {}
end
local myLog = mist.Logger:new('Carrier Script')
myLog:msg('Carrier Script by Wrench loaded')
Wrench.Carrier = {}
Wrench.Carrier.Groups = {}
Wrench.Carrier.Groups['all'] = {}
allgroups = mist.DBs.MEgroupsById
for key,value in pairs(allgroups) do
	Wrench.Carrier.Groups['all'][#Wrench.Carrier.Groups['all']+1] = value
end
CarScript = missionCommands.addSubMenu('Mother' ,nil)

Wrench.Carrier.marknumbers = {}
Wrench.Carrier.Tankmarks = false

function Wrench.Carrier_getGroupsByCoa(coa,inputList)
	local coaGroups = {}
	for i=1,#inputList do
		if inputList[i] then
			if inputList[i]["coalition"] ==  coa then
				coaGroups[#coaGroups+1] = inputList[i]
			end
		end
	end
	return coaGroups
end
Wrench.Carrier.Groups[2] = Wrench.Carrier_getGroupsByCoa("blue",Wrench.Carrier.Groups['all'])
Wrench.Carrier.Groups[1] = Wrench.Carrier_getGroupsByCoa("red",Wrench.Carrier.Groups['all'])
function Wrench.carrierSetup(unit1, LARC, tankers)
	myLog:msg('Carrier Script by Wrench Called for '..unit1)
	Wrench.carrier_startupInfo(unit1)
	Wrench.Carrier_getTACAN(unit1)
	Wrench.Carrier[unit1]['LARC'] = LARC*60
	Wrench.Carrier[unit1]['ET'] = 0
	Wrench.Carrier_carrierMenu(unit1)
	Wrench.carrierAtIp(unit1)
	Wrench.Carrier_loop(unit1, distip)
	mist.scheduleFunction(Wrench.Carrier_loop, {unit1}, timer.getTime() + 10, 10, timer.getTime() + 1/0)

	if tankers then
		Wrench.Carrier[unit1]['tankmenu'] = missionCommands.addSubMenuForCoalition(Wrench.Carrier[unit1]['coa'],'Tankers' , Wrench.Carrier[unit1]['menu'])
		Wrench.Carrier_tankerStartupInfo(unit1,tankers)
	end
end
function Wrench.carrier_startupInfo(unit1)
	Wrench.Carrier[unit1] = {}
	Wrench.Carrier[unit1]["unit"] = Unit.getByName(unit1)
	Wrench.Carrier[unit1]['name'] = unit1
	trigger.action.setUserFlag(Wrench.Carrier[unit1]['name'], 1)
	Wrench.Carrier[unit1]['startpos'] = Wrench.Carrier[unit1]["unit"]:getPosition().p
	Wrench.Carrier[unit1]['returning'] = false
	Wrench.Carrier[unit1]['override'] = false
	Wrench.Carrier[unit1]['stop'] = false
	Wrench.Carrier[unit1]['coa'] = Unit.getCoalition(Wrench.Carrier[unit1]["unit"])
	Wrench.Carrier[unit1]['group'] = Unit.getGroup(Wrench.Carrier[unit1]["unit"])
	Wrench.Carrier[unit1]['offset'] = Wrench.getCarrierType(Wrench.Carrier[unit1]["unit"])
end
function Wrench.Carrier_getTACAN(unit1)
	Wrench.Carrier[unit1]['tacan'] = {}
	Wrench.Carrier[unit1]['ICLS'] = {}
	Wrench.Carrier[unit1]['startTasks'] = {}
	local route = mist.getGroupRoute(Wrench.Carrier[unit1]['group']:getName() , true)
		local tasks = route[1]["task"]["params"]["tasks"]
		Wrench.Carrier[unit1]['startTasks'] = route[1]["task"]["params"]["tasks"]
		for i=1,#tasks do
			if tasks[i]["params"]["action"]["id"] == "ActivateBeacon" then
				Wrench.Carrier[unit1]['tacan']["callsign"] = tasks[i]["params"]["action"]["params"]["callsign"]
				Wrench.Carrier[unit1]['tacan']["modeChannel"] = tasks[i]["params"]["action"]["params"]["modeChannel"]
				Wrench.Carrier[unit1]['tacan']["channel"] = tasks[i]["params"]["action"]["params"]["channel"]
			elseif tasks[i]["params"]["action"]["id"] == "ActivateICLS" then
				Wrench.Carrier[unit1]['ICLS']["channel"] = tasks[i]["params"]["action"]["params"]["channel"]
			end
		end
end
function Wrench.getCarrierType(unit1)
	unit1desc = Unit.getDesc(unit1)["typeName"]
	if unit1desc == "Tarawa" then
		return 0
	else
		return 0.174533 --10°
	end
end
function Wrench.carrierAtIp(unit1)
	local unittable = mist.makeUnitTable({unit1})
	local ipzone = {}
	ipzone[1] = {x = ((math.cos(0) * 500) + Wrench.Carrier[unit1]['startpos'].x), z = ((math.sin(0) * 500) + Wrench.Carrier[unit1]['startpos'].z), y = 0}
	ipzone[2] = {x = ((math.cos(1.5708) * 500) + Wrench.Carrier[unit1]['startpos'].x), z = ((math.sin(1.5708) * 500) + Wrench.Carrier[unit1]['startpos'].z), y = 0}
	ipzone[3] = {x = ((math.cos(3.14159) * 500) + Wrench.Carrier[unit1]['startpos'].x), z = ((math.sin(3.14159) * 500) + Wrench.Carrier[unit1]['startpos'].z), y = 0}
	ipzone[4] = {x = ((math.cos(4.71239) * 500) + Wrench.Carrier[unit1]['startpos'].x), z = ((math.sin(4.71239) * 500) + Wrench.Carrier[unit1]['startpos'].z), y = 0}
	local vars =
		{
		units = unittable,
		zone = ipzone,
		flag = Wrench.Carrier[unit1]['name'],
		stopFlag = nil,
		maxalt = 200,
		req_num = 1,
		interval = 1,
		toggle = true,
		}
	mist.flagFunc.units_in_polygon(vars)
end
function Wrench.CarrierToIp(unit1)
	Wrench.Carrier[unit1]['returning'] = true
	local group1 = Unit.getGroup((Wrench.Carrier[unit1]["unit"]))
	local retdir = mist.utils.getDir(Wrench.Carrier[unit1]['position'] , Wrench.Carrier[unit1]['startpos'])
	local new = {}
		local new = {x = ((math.cos(retdir+0.785398) * 1500) + Wrench.Carrier[unit1]['position'].x), z = ((math.sin(retdir+0.785398) * 1500) + Wrench.Carrier[unit1]['position'].z), y = 0}
	local path = {}
	path[#path + 1] = mist.ground.buildWP(Wrench.Carrier[unit1]['position'], 'Diamond', 5.14444)
	path[#path + 1] = mist.ground.buildWP(new, 'Diamond', 5.14444)
	path[#path + 1] = mist.ground.buildWP(Wrench.Carrier[unit1]['startpos'], 'Diamond', 30.3522)
	mist.goRoute(group1 ,path)
end
function Wrench.Carrier_loop(unit1)
	if	trigger.misc.getUserFlag(Wrench.Carrier[unit1]['name']) == 1 then
		Wrench.Carrier[unit1]['returning'] = false
		Wrench.Carrier[unit1]['ET'] = 0
		Wrench.Carrier[unit1]['Traveled'] = 0
	end
	Wrench.Carrier[unit1]['heading'] = mist.getHeading(Wrench.Carrier[unit1]['unit'] , false )
	Wrench.Carrier[unit1]['position'] = Wrench.Carrier[unit1]['unit']:getPosition().p
	Wrench.Carrier[unit1]['magvar'] = mist.getNorthCorrection(Wrench.Carrier[unit1]['position'])
	Wrench.Carrier[unit1]['position'].y=Wrench.Carrier[unit1]['position'].y+1
	local setDir, setSpeed = Wrench.Carrier_getSpeedandDir(unit1)
	setDir = setDir + Wrench.Carrier[unit1]['offset'] - Wrench.Carrier[unit1]['magvar']
	if setDir < 1 then
		setDir = setDir + 6.28319 --360°
	end
	Wrench.Carrier[unit1]['brc'] = math.floor(mist.utils.toDegree(setDir))+ math.floor(mist.utils.toDegree(Wrench.Carrier[unit1]['magvar']))
	if Wrench.Carrier[unit1]['brc'] < 0 then
		Wrench.Carrier[unit1]['brc'] = Wrench.Carrier[unit1]['brc'] + 360
	end
	if not Wrench.Carrier[unit1]['override'] then
		if 	Wrench.Carrier_Larc(unit1) or Wrench.Carrier_shipShore(unit1) then
			if not Wrench.Carrier[unit1]['returning'] then
				Wrench.CarrierToIp(unit1)
			end
		else
			Wrench.Carrier_goDirection(unit1,setDir,setSpeed)
		end
	else
		Wrench.Carrier_goDirection(unit1,setDir,setSpeed)
	end
end
function Wrench.Carrier_getSpeedandDir(unit1)
	local wind = {}
	local wind = atmosphere.getWind(Wrench.Carrier[unit1]['position'])
	local windSpeed = mist.vec.mag(wind)
	wind = math.atan2(wind.z, wind.x)
	setDir = wind-(math.pi)--180°
	setSpeed = 12.8611 - windSpeed
	return setDir, setSpeed
end
function Wrench.Carrier_Larc(unit1)
	Wrench.Carrier[unit1]['ET'] = Wrench.Carrier[unit1]['ET'] + 10
	Wrench.Carrier[unit1]['Traveled'] = mist.utils.get3DDist(Wrench.Carrier[unit1]['position'] ,Wrench.Carrier[unit1]['startpos'])
	Wrench.Carrier[unit1]['estimated return time'] = (Wrench.Carrier[unit1]['Traveled']/12.8611)+813
	if Wrench.Carrier[unit1]['ET'] + Wrench.Carrier[unit1]['estimated return time'] >= Wrench.Carrier[unit1]['LARC'] then
		return true
	else
		return false
	end
end
function Wrench.Carrier_shipShore(unit1)
	local lookAheadPos =
	{
		x = ((math.cos(Wrench.Carrier[unit1]['heading']) * 18520) + Wrench.Carrier[unit1]['position'].x),
		z = ((math.sin(Wrench.Carrier[unit1]['heading']) * 18520) + Wrench.Carrier[unit1]['position'].z),
		y = Wrench.Carrier[unit1]['position'].y
	}
	local surfType = land.getSurfaceType(mist.utils.makeVec2(lookAheadPos))
	if surfType == 3 then
		return false
	else
		return true
	end
end
function Wrench.Carrier_Speed(unit1,dir,speed)
	if (Wrench.Carrier[unit1]['heading'] < dir+0.523599) and (Wrench.Carrier[unit1]['heading'] > dir-0.523599) then
		return speed
	else
		return 5.14444
	end
end
function Wrench.Carrier_goDirection(unit1,dir,speed)
	if Wrench.Carrier[unit1]['position'] ~= nil then
		local group1 = Wrench.Carrier[unit1]['group']
		local new = {}
		local new =
		{
			x = ((math.cos(dir) * 1000) + Wrench.Carrier[unit1]['position'].x),
			z = ((math.sin(dir) * 1000) + Wrench.Carrier[unit1]['position'].z),
			y = 0
		}
		local path = {}
			path[#path + 1] = mist.ground.buildWP(Wrench.Carrier[unit1]['position'], 'Diamond', Wrench.Carrier_Speed(unit1,dir,speed))
			path[#path + 1] = mist.ground.buildWP(new, 'Diamond', Wrench.Carrier_Speed(unit1,dir,speed))
		mist.goRoute(group1 ,path)
	end
end
function Wrench.Carrier_carrierMenu(unit1)
	Wrench.Carrier[unit1]['menu'] = missionCommands.addSubMenuForCoalition(Wrench.Carrier[unit1]['coa'],unit1 ,CarScript)
	for i=1,#Wrench.Carrier.Groups[Wrench.Carrier[unit1]['coa']] do
		local gid = Wrench.Carrier.Groups[Wrench.Carrier[unit1]['coa']][i]["groupId"]
		local grpName = Wrench.Carrier.Groups[Wrench.Carrier[unit1]['coa']][i]["groupName"]
		missionCommands.addCommandForGroup(
			gid,
			('Recovery Data for '..unit1),
			Wrench.Carrier[unit1]['menu'],function()
			trigger.action.outTextForGroup(
				gid,
				Wrench.Carrier_menu_buildText(unit1,grpName),
				30 , false)
			end, nil)

		missionCommands.addCommandForGroup(
			gid,
			('Toggle '..unit1..' Recovery Ops'),
			Wrench.Carrier[unit1]['menu'],function()
			trigger.action.outTextForGroup(
				gid,
				Wrench.Carrier_menu_toggleOverride(unit1),
				30 , false)
			end, nil)

	end
end
function Wrench.Carrier_menu_toggleOverride(unit1)
	local overrideStatus = 'Override Off'
	if Wrench.Carrier[unit1]['override'] then
		Wrench.Carrier[unit1]['override'] = false
		overrideStatus = 'Override Off'
	else
		Wrench.Carrier[unit1]['returning'] = false
		Wrench.Carrier[unit1]['override'] = true
		overrideStatus = 'Override On'
	end
	return overrideStatus
end
function Wrench.Carrier_menu_buildText(unit1,grp)
	local leadpos = mist.getLeadPos(grp)
	local text = unit1..' information:\n'
	text = text .. 'BRC: ' .. (mist.utils.round(Wrench.Carrier[unit1]['brc'])) ..'\t\t\t\t\t\t\t\t\t\t'
	text = text .. 'Status: ' .. Wrench.Carrier_menu_querymode(unit1) .. '\n'
	text = text .. 'Bearing/Range: ' .. select(1,Wrench.get_carpos_BR(unit1,leadpos)) .. '\n'
	text = text ..  'Coordinates: ' .. Wrench.Carrier_menu_position(unit1,leadpos) .. '\n'
	text = text ..  'TACAN:\t\t\t\t\t\t\t\t\t\t\t'.. select(2,Wrench.get_carpos_BR(unit1,leadpos)) .. '\n'
	text = text .. tostring('\tCallsign: ' .. Wrench.Carrier[unit1]['tacan']["callsign"] or 'N/A') .. '\n'
	text = text .. tostring('\tChannel: ' .. Wrench.Carrier[unit1]['tacan']["channel"] or 'N/A')
	text = text .. tostring(Wrench.Carrier[unit1]['tacan']["modeChannel"] or 'N/A') .. '\n'
	text = text ..  tostring('ICLS: ' .. Wrench.Carrier[unit1]['ICLS']["channel"] or 'N/A') .. '\n'

	return text
end
function Wrench.get_carpos_BR(unit1,leadpos)
	local unit1pos = Unit.getByName(unit1):getPosition().p
	local magvar =  mist.getNorthCorrection(unit1pos)
	local vars =
	{
		units = {unit1} ,
		ref = leadpos,
		alt = false,
		metric = false,
	}
	local bulls = coalition.getMainRefPoint(Unit.getByName(unit1):getCoalition())
	local bearing = math.floor(mist.utils.toDegree(mist.utils.getDir(mist.vec.sub(unit1pos,bulls)))+magvar)
	local dist = math.floor(mist.utils.metersToNM(mist.utils.get2DDist(bulls ,unit1pos)))
	local text = mist.getBRString(vars)--..'\n'..'BULLS ' .. bearing .. ' for ' .. dist
	local text2 = 'BULLS ' .. bearing .. ' for ' .. dist
	return text,text2
end
function Wrench.Carrier_menu_position(unit1,leadpos)
	local unit1pos = Unit.getByName(unit1):getPosition().p
	local RawNorthing = (coord.LOtoLL(unit1pos))
	local RawEasting = (select(2,coord.LOtoLL(unit1pos)))
	local DegreesNorthing = math.floor(RawNorthing)
	local DegreesEasting = math.floor(RawEasting)
	local MinutesNorthing = (RawNorthing - DegreesNorthing)*60
	local MinutesEasting = (RawEasting - DegreesEasting)*60
	local SecondsNorthing = mist.utils.round((MinutesNorthing-math.floor(MinutesNorthing))*60)
	local SecondsEasting = mist.utils.round((MinutesEasting-math.floor(MinutesEasting))*60)
	local EastingDir = 'E'

	if MinutesEasting < 0 then
		MinutesEasting = math.abs(MinutesEasting)
		Eastingdir = 'W'
	else
		Eastingdir = 'E'
	end
	--text = 'Coordinates: ' ..
	text = string.format("%02d",DegreesNorthing) .. '°' ..
		string.format("%02d",math.floor(MinutesNorthing)) .. "'" ..
		string.format("%02d",SecondsNorthing) .. '"N, ' ..
		string.format("%02d",DegreesEasting) .. '°' ..
		string.format("%02d",math.floor(MinutesEasting)) .. "'" ..
		string.format("%02d",SecondsEasting) .. '"'..Eastingdir
	return text
end
function Wrench.Carrier_menu_querymode(unit1)
	local brc = Wrench.Carrier[unit1]['brc']
	local heading = mist.utils.toDegree(Wrench.Carrier[unit1]['heading'])
	local text = ''
	if Wrench.Carrier[unit1]['returning'] then
		text = 'Returning'
		if Wrench.Carrier[unit1]['estimated return time'] then
			text = 'Returning, CHARLIE in ' .. tostring(math.floor(Wrench.Carrier[unit1]['estimated return time']/60)-2) .. ' minutes.'
		end
	elseif (heading < brc+3) and (heading > brc-3) then
		local charlietime = math.floor(((Wrench.Carrier[unit1]['LARC']/2)/60)-(Wrench.Carrier[unit1]['ET']/60)-5)
		text = 'Ready. CHARLIE TIME '..charlietime..' minutes.'
	else
		text = 'Turning to BRC. Current heading ' .. mist.utils.round(heading)
	end
	if Wrench.Carrier[unit1]['override'] then
		text = 'Manual Override.'
	end
	return text
end

---------------TANKER SCRIPT---------------
function Wrench.Carrier_tankerStartupInfo(unit1,tankers)
	for i=1, #tankers do
		Wrench.Carrier[unit1][tankers[i]] = {}
		Wrench.Carrier[unit1][tankers[i]]['unit'] = Unit.getByName(tankers[i])
		Wrench.Carrier[unit1][tankers[i]]['group'] = Unit.getByName(tankers[i]):getGroup()
		Wrench.Carrier[unit1][tankers[i]]['callsign'] = Unit.getByName(tankers[i]):getCallsign()
		if Unit.getByName(tankers[i]) then
			myLog:msg('Tanker Script by Wrench Called for '..tankers[i])
			Wrench.Carrier_tankerGetTACAN(unit1,tankers[i])
			Wrench.Carrier_TankerMenu(unit1,tankers[i])
		end
	end
end
function Wrench.Carrier_tankerGetTACAN(unit1,tanker)
	local route = mist.getGroupRoute(Wrench.Carrier[unit1][tanker]['group']:getName() , true)
		local tasks = route[1]["task"]["params"]["tasks"]
		Wrench.Carrier[unit1][tanker]['tacan'] = {}
		Wrench.Carrier[unit1][tanker]['tacan']["callsign"] = {}
		for j=1,#tasks do
			if tasks[j]["params"]["action"] then
				if tasks[j]["params"]["action"]["id"] == "ActivateBeacon" then
				myLog:msg(tanker..'tanker tacan added')
					Wrench.Carrier[unit1][tanker]['tacan']["callsign"] = tasks[j]["params"]["action"]["params"]["callsign"]
					Wrench.Carrier[unit1][tanker]['tacan']["modeChannel"] = tasks[j]["params"]["action"]["params"]["modeChannel"]
					Wrench.Carrier[unit1][tanker]['tacan']["channel"] = tasks[j]["params"]["action"]["params"]["channel"]
				end
			end
		end
end
function Wrench.Carrier_TankerMenu(unit1,tanker)
	for i=1,#Wrench.Carrier.Groups[Wrench.Carrier[unit1]['coa']] do
		local gid = Wrench.Carrier.Groups[Wrench.Carrier[unit1]['coa']][i]["groupId"]
		local grpName = Wrench.Carrier.Groups[Wrench.Carrier[unit1]['coa']][i]["groupName"]
		missionCommands.addCommandForGroup(
			gid,
			('Refuel Data for '..Wrench.Carrier[unit1][tanker]['callsign']),
			Wrench.Carrier[unit1]['tankmenu'],function()
			trigger.action.outTextForGroup(
				gid,
				Wrench.Carrier_tanker_menu_buildText(unit1,grpName,tanker),
				30 , false)
		end, nil)


		missionCommands.addCommandForGroup(
			gid,
			('Launch ' .. Wrench.Carrier[unit1][tanker]['callsign']),
			Wrench.Carrier[unit1]['tankmenu'],function()
			spawntanker = mist.respawnGroup(Wrench.Carrier[unit1][tanker]['group']:getName(),true)
			spawntanker = spawntanker["units"][1]["name"]
			mist.scheduleFunction(Wrench.orbit_carrier, {unit1, spawntanker,Wrench.Carrier[unit1]['brc']}, timer.getTime() + 5, 1, timer.getTime() + 6)
		end, nil)
	end
end
function Wrench.Carrier_tanker_menu_buildText(unit1,grp,tanker)
	local leadpos = mist.getLeadPos(grp)
	local text = Wrench.Carrier[unit1][tanker]['callsign']..' information:\n'
	text = text ..  'TACAN:\t\t\t\t\t\t\t\t\t\t\t\t\t   Fuel: '..mist.utils.round((Unit.getFuel(Unit.getByName(tanker))*17.225),1)..'\n'
	text = text .. tostring('\tCallsign: ' .. Wrench.Carrier[unit1][tanker]['tacan']["callsign"] or 'N/A') .. '\n'
	text = text .. tostring('\tChannel: ' .. Wrench.Carrier[unit1][tanker]['tacan']["channel"] or 'N/A')
	text = text .. tostring(Wrench.Carrier[unit1][tanker]['tacan']["modeChannel"] or 'N/A') .. '\n'
	text = text .. 'Bearing/Range: ' .. select(1,Wrench.get_carpos_BR(unit1,leadpos)) .. '\t\t\t\t\t\t\t'
	text = text .. select(2,Wrench.get_carpos_BR(unit1,leadpos)) .. '\n'
	text = text ..  Wrench.Carrier_menu_position(tanker,leadpos)

	return text
end

function Wrench.orbit_carrier(carrier,tanker,dir)
	if Wrench.Carrier.Tankmarks then
		for i=1, #Wrench.Carrier.marknumbers do
			trigger.action.removeMark(i)
		end
	end
	local durrad = mist.utils.toRadian(dir+7)
	local carpos = Unit.getByName(carrier):getPosition().p
	local airpos = Unit.getByName(tanker):getPosition().p
	local group1 = Unit.getByName(tanker):getGroup()
	local track = {}
	local path = {}
	track[1] = {x = airpos.x, z = airpos.z, y = airpos.y}
	track[2] = {x = ((math.cos(durrad) * 3*1852/2) + carpos.x), z = ((math.sin(durrad) * 3*1852/2) + carpos.z), y = 1828.8}
	track[3] = {x = ((math.cos(durrad - 1.5708) * 3*1852) + track[2].x), z = ((math.sin(durrad - 1.5708) * 3*1852) + track[2].z), y = 1828.8}
	track[4] = {x = ((math.cos(durrad - 3.14159) * 3*1852) + track[3].x), z = ((math.sin(durrad - 3.14159) * 3*1852) + track[3].z), y = 1828.8}
	track[5] = {x = ((math.cos(durrad - 4.71239) * 3*1852) + track[4].x), z = ((math.sin(durrad - 4.71239) * 3*1852) + track[4].z), y = 1828.8}

	if Wrench.Carrier.Tankmarks then
		for i=1, #track do
			Wrench.Carrier.marknumbers[#Wrench.Carrier.marknumbers+1] = track[i]
		end
		for i=1, #Wrench.Carrier.marknumbers do
			trigger.action.markToAll(i, tostring(i), Wrench.Carrier.marknumbers[i] , false, nil)
		end
	end

	for i = 1, #track do
		path[i] = mist.fixedWing.buildWP(track[i], 'turningpoint' ,169.767 ,457.2 ,'Baro' )
	end
	local funcstring = 'Wrench.orbit_carrier'.."(".."'"..carrier.."'"..",".."'"..tanker.."'"..","..dir..")"
	for i=1,#path do
	path[i]= -- needed to keep tanker tanking
	{
		--retain original keys&values
		["alt"] = path[i]["alt"],
		["x"] = path[i]["x"],
		["action"] = path[i]["action"],
		["alt_type"] = path[i]["alt_type"],
		["speed"] = path[i]["speed"],
		["type"] = path[i]["type"],
		["y"] = path[i]["y"],
		--add tasking
		["task"] =
		{
			["id"] = "ComboTask",
			["params"] =
			{
				["tasks"] =
				{
					[1] =
					{
						["enabled"] = true,
						["auto"] = true,
						["id"] = "Tanker",
						["number"] = 1,
						["params"] =
						{
						},
					},
				},
			},
		},
	}
	end

	path[5]=
	{
		--retain original keys&values
		["alt"] = path[5]["alt"],
		["x"] = path[5]["x"],
		["action"] = path[5]["action"],
		["alt_type"] = path[5]["alt_type"],
		["speed"] = path[5]["speed"],
		["type"] = path[5]["type"],
		["y"] = path[5]["y"],
		--add tasking
		["task"] =
		{
			["id"] = "ComboTask",
			["params"] =
			{
				["tasks"] =
				{
					["tasks"] =
					{
						[1] =
						{
							["enabled"] = true,
							["auto"] = true,
							["id"] = "Tanker",
							["number"] = 1,
							["params"] =
							{
							},
						},
					},
					[2] =
					{
						["enabled"] = true,
						["auto"] = false,
						["id"] = "WrappedAction",
						["number"] = 1,
						["params"] =
						{
							["action"] =
							{
								["id"] = "Script",
								["params"] =
								{
									["command"] = funcstring,
								}, -- end of ["params"]
							}, -- end of ["action"]
						}, -- end of ["params"]
					}, -- end of [1]
					[2] =
					{
						["number"] = 2,
						["enabled"] = true,
						["auto"] = true,
						["id"] = "Tanker",
						["params"] =
						{
						},-- end of ["params"]
					},-- end of [2]
				}, -- end of ["tasks"]
			}, -- end of ["params"]
		}, -- end of ["task"]
	}
	local tankerfuel = Unit.getFuel(Unit.getByName(tanker))
	if tankerfuel < .15 then
		path = {}
		track = {}
		path[1] = {x = carpos.x, z = carpos.z, y = 0}
		path[1] = mist.fixedWing.buildWP(path[1], 'turningpoint' ,180.056 ,6096 ,'Baro' )
		path[1]=
		{
		--retain original keys&values
			["alt"] = 100,
			["x"] = path[1]["x"],
			["action"] = "Landing",
			["alt_type"] = path[1]["alt_type"],
			["speed"] = path[1]["speed"],
			["type"] = path[1]["type"],
			["y"] = path[1]["y"],
		}
	end
	mist.goRoute(group1 ,path)
end
