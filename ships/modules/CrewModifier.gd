extends "res://IndustriesOfEnceladusRevamp/ships/modules/BaseModifier.gd"

export (int) var crewCountChange = 0
export (float, -0.5, 0.5, 0.05) var moraleChange = 0.0

func extend(ship):
	var crewCount = ship.get("crew")
	var crewMorale = ship.get("crewMoraleBonus")
	
	# this will be accessed by CurrentGame.gd later
	ship.setConfig("crewCount", crewCount + crewCountChange)
	
	ship.set("crew", crewCount + crewCountChange)
	ship.set("crewMoraleBonus", crewMorale + moraleChange)
