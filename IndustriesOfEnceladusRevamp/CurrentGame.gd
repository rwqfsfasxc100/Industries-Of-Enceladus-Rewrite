extends "res://CurrentGame.gd"

func _init():
	usedShipsPool = usedShipsPool + [
		{"name":"AT225", "age":24 * 3600 * 365 * 20}, 
		{"name":"AT225", "age":24 * 3600 * 365 * 20}, 
		{"name":"AT225-B", "age":24 * 3600 * 365 * 15}, 
		{"name":"OCP209", "age":24 * 3600 * 365 * 60}, 
		{"name":"OCP209", "age":24 * 3600 * 365 * 60}, 
		{"name":"COTHON", "age":24 * 3600 * 365 * 200}, 
		{"name":"COTHON", "age":24 * 3600 * 365 * 200}, 
		{"name":"COTHON-LND", "age":24 * 3600 * 365 * 200}, 
		{"name":"COTHON-CHK", "age":24 * 3600 * 365 * 200}, 
		{"name":"COTHON-V", "age":24 * 3600 * 365 * 20}, 
		{"name":"TRTL", "age":24 * 3600 * 365 * 120}, 
		{"name":"TRTL", "age":24 * 3600 * 365 * 120}, 
		{"name":"TRTL", "age":24 * 3600 * 365 * 120}, 
		{"name":"TRTL", "age":24 * 3600 * 365 * 120}, 
		{"name":"TRTL", "age":24 * 3600 * 365 * 120}, 
		{"name":"TRTL", "age":24 * 3600 * 365 * 120}, 
		{"name":"TRTL-LCB", "age":24 * 3600 * 365 * 120}, 
		{"name":"TRTL-LCB", "age":24 * 3600 * 365 * 120}, 
		{"name":"TRTL-R", "age":24 * 3600 * 365 * 40}, 
		{"name":"TRTL-T", "age":24 * 3600 * 365 * 60}, 
		{"name":"PROSPECTOR-VP", "age":24 * 3600 * 365 * 40}, 
		{"name":"PROSPECTOR-LUX", "age":24 * 3600 * 365 * 40}, 
		{"name":"PROSPECTOR-FAT", "age":24 * 3600 * 365 * 40}, 
		{"name":"PROSPECTOR", "age":24 * 3600 * 365 * 40}, 
		{"name":"PROSPECTOR", "age":24 * 3600 * 365 * 40}, 
		{"name":"KITSUNE", "age":24 * 3600 * 365 * 40}, 
		{"name":"KITSUNE", "age":24 * 3600 * 365 * 40},
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
		{"name":"TRTL-RAM", "age":24 * 3600 * 365 * 200},
		{"name":"CK65", "age":24 * 3600 * 365 * 20},
		{"name":"CK69", "age":24 * 3600 * 365 * 20},
		{"name":"YME", "age":24*3600*365*2},
		{"name":"OCP-SALVAGE", "age":24*3600*365*200},
		]

# need to do this so that maxMembers is valid
func validateEmployment():
	var ship = getPlayerShip()
	var preferredCrew = {}
	var maxMembers
	var ss = state.ship
	if ss.keys() == null or ss.keys() == []:
		preferredCrew = {}
	else:
		preferredCrew = state.ship.config.get("preferredCrew", getCurrentlyActiveCrewNames())
		maxMembers = state.ship.config.get("crewCount")
	
	var maxActive = maxMembers
	var changed = false
	if not ship == null:
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
