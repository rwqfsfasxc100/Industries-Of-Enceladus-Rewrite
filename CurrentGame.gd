extends "res://CurrentGame.gd"

func _init():
	usedShipsPool = usedShipsPool + [
		{"name":"Tsukuyomi-Decom", "age":24 * 3600 * 365 * 200},
		{"name":"AT225-STUB", "age":24 * 3600 * 365 * 200},
		{"name":"ATLAS-WASP", "age":24 * 3600 * 365 * 200},
		{"name":"COTHON-LUX", "age":24 * 3600 * 365 * 200},
		{"name":"PIGEON-PROSPECTOR", "age":24 * 3600 * 365 * 200},
		{"name":"MAD-CERF-CIV", "age":24 * 3600 * 365 * 200},
		{"name":"OBERON", "age":24 * 3600 * 365 * 200},
		{"name":"OCP209-DD", "age":24 * 3600 * 365 * 200},
		{"name":"OCP209-SNAP", "age":24 * 3600 * 365 * 200},
		{"name":"TRTL-OCP", "age":24 * 3600 * 365 * 200},
		{"name":"TRTL-RAM", "age":24 * 3600 * 365 * 200}
		]

# need to do this so that maxMembers is valid
func validateEmployment():
	var ship = getPlayerShip()
	var preferredCrew = state.ship.config.get("preferredCrew", getCurrentlyActiveCrewNames())
	var maxMembers = state.ship.config.get("crewCount")
	var maxActive = maxMembers
	var changed = false
	if ship.zone != "rings":
		for memberName in state.crew:
			var member = state.crew[memberName]
			var preferActve = preferredCrew.has(memberName)
			if preferActve:
				var wasActive = isCrewMemberActive(member)
				if not isCrewOnLeave(member):
					if not wasActive:
						member.active = true
						changed = true
						
					maxMembers -= 1
					if maxMembers < 0:
						member.active = false
						changed = true
			else :
				if isCrewMemberActive(member):
					member.active = false
					changed = true
	if maxMembers <= 0:
		Achivements.achive("CREW_FULL")
		
	for memberName in state.crew:
		var member = state.crew[memberName]
		if member.get("active", false):
			maxActive -= 1
			
	for memberName in state.crew:
		var member = state.crew[memberName]
		if maxActive < 0 and isCrewOnLeave(member):
			maxActive += 1
			member.active = false
			changed = true
			
	if changed:
		emit_signal("employmentChanged")
