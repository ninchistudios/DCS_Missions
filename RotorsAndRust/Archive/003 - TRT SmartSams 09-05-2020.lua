SEAD_launch = {}												
function SEAD_launch:onEvent(event)

	if event.id == world.event.S_EVENT_SHOT then -- Detect weapon being fired
		local _grp = Unit.getGroup(event.initiator)-- Identify the group that fired 
		local _groupname = _grp:getName() -- return the name of the group
		local _unittable = {event.initiator:getName()} -- return the name of the units in the group
		local _SEADmissile = event.weapon -- Identify the weapon fired						
		local _SEADmissileName = _SEADmissile:getTypeName()	-- return weapon type
		--trigger.action.outText( string.format("Alerte, depart missile " ..string.format(_SEADmissileName)), 20) --debug message
		-- Start of the 2nd loop
		if _SEADmissileName == "KH-58" or _SEADmissileName == "KH-25MPU" or _SEADmissileName == "AGM-88" or _SEADmissileName == "AGM-122 Sidearm" then -- Check if the missile is a SEAD
			local _evade = mist.random (1,100) -- random number for chance of evading action
			local _targetMim = Weapon.getTarget(_SEADmissile) -- Identify target
			local _targetMimname = Unit.getName(_targetMim)
			local _targetMimgroup = Unit.getGroup(Weapon.getTarget(_SEADmissile))
			local _targetMimcont= _targetMimgroup:getController()
			local _targetskill =  mist.DBs.unitsByName[_targetMimname].skill
			--trigger.action.outText( string.format("target skill  " ..string.format(_targetskill)), 60) -- debug message for skill check
				if _targetskill == "Average" then
					if (_evade > 90) then
						-- trigger.action.outText( string.format("Evading, target skill  " ..string.format(_targetskill)), 60) --debug message
						local _targetMim = Weapon.getTarget(_SEADmissile)
						local _targetMimname = Unit.getName(_targetMim)
						local _targetMimgroup = Unit.getGroup(Weapon.getTarget(_SEADmissile))
						local _targetMimcont= _targetMimgroup:getController()
						mist.groupRandomDistSelf(_targetMimgroup,300,'Rank',250,20) -- move randomly
						local SuppressedGroups1 = {} -- unit suppressed radar off for a random time
							local function SuppressionEnd1(id)
								id.ctrl:setOption(AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.GREEN)
								SuppressedGroups1[id.groupName] = nil
							end
							local id = {
							groupName = _targetMimgroup,
							ctrl = _targetMimcont
							}
							local delay1 = math.random(25, 45)
							if SuppressedGroups1[id.groupName] == nil then
								SuppressedGroups1[id.groupName] = {
								SuppressionEndTime1 = timer.getTime() + delay1,
								SuppressionEndN1 = SuppressionEndCounter1	--Store instance of SuppressionEnd() scheduled function
								}	
							Controller.setOption(_targetMimcont, AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.GREEN)
							timer.scheduleFunction(SuppressionEnd1, id, SuppressedGroups1[id.groupName].SuppressionEndTime1)	--Schedule the SuppressionEnd() function
							trigger.action.outText( string.format("Radar Off " ..string.format(delay1)), 20)
							end
						
						local SuppressedGroups = {}
							local function SuppressionEnd(id)
								id.ctrl:setOption(AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.RED)
								SuppressedGroups[id.groupName] = nil
							end
							local id = {
								groupName = _targetMimgroup,
								ctrl = _targetMimcont
							}
							local delay = math.random(45, 60)
							if SuppressedGroups[id.groupName] == nil then
								SuppressedGroups[id.groupName] = {
								SuppressionEndTime = timer.getTime() + delay,
								SuppressionEndN = SuppressionEndCounter	--Store instance of SuppressionEnd() scheduled function
								}
							timer.scheduleFunction(SuppressionEnd, id, SuppressedGroups[id.groupName].SuppressionEndTime)	--Schedule the SuppressionEnd() function
							trigger.action.outText( string.format("Radar On " ..string.format(delay)), 20)
							end
					end
				end
				if _targetskill == "Good" then --one day I will learn how to use elseif :)
					if (_evade > 50) then
						local _targetMim = Weapon.getTarget(_SEADmissile)
						local _targetMimname = Unit.getName(_targetMim)
						local _targetMimgroup = Unit.getGroup(Weapon.getTarget(_SEADmissile))
						local _targetMimcont= _targetMimgroup:getController()
						mist.groupRandomDistSelf(_targetMimgroup,300,'Rank',250,20)
						local SuppressedGroups1 = {}
							local function SuppressionEnd1(id)
								id.ctrl:setOption(AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.GREEN)
								SuppressedGroups1[id.groupName] = nil
							end
							local id = {
							groupName = _targetMimgroup,
							ctrl = _targetMimcont
							}
							local delay1 = math.random(25, 45)
							if SuppressedGroups1[id.groupName] == nil then
								SuppressedGroups1[id.groupName] = {
								SuppressionEndTime1 = timer.getTime() + delay1,
								SuppressionEndN1 = SuppressionEndCounter1	--Store instance of SuppressionEnd() scheduled function
								}	
							Controller.setOption(_targetMimcont, AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.GREEN)
							timer.scheduleFunction(SuppressionEnd1, id, SuppressedGroups1[id.groupName].SuppressionEndTime1)	--Schedule the SuppressionEnd() function
							trigger.action.outText( string.format("Radar Off " ..string.format(delay1)), 20)
							end
						
						local SuppressedGroups = {}
							local function SuppressionEnd(id)
								id.ctrl:setOption(AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.RED)
								SuppressedGroups[id.groupName] = nil
							end
							local id = {
								groupName = _targetMimgroup,
								ctrl = _targetMimcont
							}
							local delay = math.random(45, 60)
							if SuppressedGroups[id.groupName] == nil then
								SuppressedGroups[id.groupName] = {
								SuppressionEndTime = timer.getTime() + delay,
								SuppressionEndN = SuppressionEndCounter	--Store instance of SuppressionEnd() scheduled function
								}
							timer.scheduleFunction(SuppressionEnd, id, SuppressedGroups[id.groupName].SuppressionEndTime)	--Schedule the SuppressionEnd() function
							trigger.action.outText( string.format("Radar On " ..string.format(delay)), 20)
							end
					end
				end
				if _targetskill == "High" then
					if (_evade > 30) then
						local _targetMim = Weapon.getTarget(_SEADmissile)
						local _targetMimname = Unit.getName(_targetMim)
						local _targetMimgroup = Unit.getGroup(Weapon.getTarget(_SEADmissile))
						local _targetMimcont= _targetMimgroup:getController()
						mist.groupRandomDistSelf(_targetMimgroup,300,'Rank',250,20)
						local SuppressedGroups1 = {}
							local function SuppressionEnd1(id)
								id.ctrl:setOption(AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.GREEN)
								SuppressedGroups1[id.groupName] = nil
							end
							local id = {
							groupName = _targetMimgroup,
							ctrl = _targetMimcont
							}
							local delay1 = math.random(25, 45)
							if SuppressedGroups1[id.groupName] == nil then
								SuppressedGroups1[id.groupName] = {
								SuppressionEndTime1 = timer.getTime() + delay1,
								SuppressionEndN1 = SuppressionEndCounter1	--Store instance of SuppressionEnd() scheduled function
								}	
							Controller.setOption(_targetMimcont, AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.GREEN)
							timer.scheduleFunction(SuppressionEnd1, id, SuppressedGroups1[id.groupName].SuppressionEndTime1)	--Schedule the SuppressionEnd() function
							trigger.action.outText( string.format("Radar Off " ..string.format(delay1)), 20)
							end
						
						local SuppressedGroups = {}
							local function SuppressionEnd(id)
								id.ctrl:setOption(AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.RED)
								SuppressedGroups[id.groupName] = nil
							end
							local id = {
								groupName = _targetMimgroup,
								ctrl = _targetMimcont
							}
							local delay = math.random(45, 60)
							if SuppressedGroups[id.groupName] == nil then
								SuppressedGroups[id.groupName] = {
								SuppressionEndTime = timer.getTime() + delay,
								SuppressionEndN = SuppressionEndCounter	--Store instance of SuppressionEnd() scheduled function
								}
							timer.scheduleFunction(SuppressionEnd, id, SuppressedGroups[id.groupName].SuppressionEndTime)	--Schedule the SuppressionEnd() function
							trigger.action.outText( string.format("Radar On " ..string.format(delay)), 20)
							end
					end
				end
				if _targetskill == "Excellent" then
					if (_evade > 10) then
						local _targetMim = Weapon.getTarget(_SEADmissile)
						local _targetMimname = Unit.getName(_targetMim)
						local _targetMimgroup = Unit.getGroup(Weapon.getTarget(_SEADmissile))
						local _targetMimcont= _targetMimgroup:getController()
						mist.groupRandomDistSelf(_targetMimgroup,300,'Rank',250,20)
						local SuppressedGroups1 = {}
							local function SuppressionEnd1(id)
								id.ctrl:setOption(AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.GREEN)
								SuppressedGroups1[id.groupName] = nil
							end
							local id = {
							groupName = _targetMimgroup,
							ctrl = _targetMimcont
							}
							local delay1 = math.random(25, 45)
							if SuppressedGroups1[id.groupName] == nil then
								SuppressedGroups1[id.groupName] = {
								SuppressionEndTime1 = timer.getTime() + delay1,
								SuppressionEndN1 = SuppressionEndCounter1	--Store instance of SuppressionEnd() scheduled function
								}	
							Controller.setOption(_targetMimcont, AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.GREEN)
							timer.scheduleFunction(SuppressionEnd1, id, SuppressedGroups1[id.groupName].SuppressionEndTime1)	--Schedule the SuppressionEnd() function
							trigger.action.outText( string.format("Radar Off " ..string.format(delay1)), 20)
							end
						
						local SuppressedGroups = {}
							local function SuppressionEnd(id)
								id.ctrl:setOption(AI.Option.Ground.id.ALARM_STATE,AI.Option.Ground.val.ALARM_STATE.RED)
								SuppressedGroups[id.groupName] = nil
							end
							local id = {
								groupName = _targetMimgroup,
								ctrl = _targetMimcont
							}
							local delay = math.random(45, 60)
							if SuppressedGroups[id.groupName] == nil then
								SuppressedGroups[id.groupName] = {
								SuppressionEndTime = timer.getTime() + delay,
								SuppressionEndN = SuppressionEndCounter	--Store instance of SuppressionEnd() scheduled function
								}
							timer.scheduleFunction(SuppressionEnd, id, SuppressedGroups[id.groupName].SuppressionEndTime)	--Schedule the SuppressionEnd() function
							trigger.action.outText( string.format("Radar On " ..string.format(delay)), 20)
							end
					end
				end
		end
	end
	
end

world.addEventHandler(SEAD_launch)