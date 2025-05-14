extends "res://weapons/drone-plant.gd"

func getTuneables():
	if droneFunction == "repair":
		return {}
	
	var opts = {
		"TUNE_RANGE_MIN":{
			"type":"float", 
			"min":0, 
			"max":maxDroneDistance / 10,
			"step":10, 
			"default":minDroneDistance / 10, 
			"current":getRangeMin(), 
			"unit":"m", 
			"testProtocol":"drone"
		}, 
		"TUNE_RANGE_MAX":{
			"type":"float", 
			"min":0, 
			"max":maxDroneDistance / 10,
			"step":10, 
			"default":maxDroneDistance / 10,
			"current":getRangeMax(), 
			"unit":"m", 
			"testProtocol":"drone"
		}
	}
	match droneFunction:
		"haul":
			opts.TUNE_RANGE_KEEP_AWAY = {
				"type":"float", 
				"min":0, 
				"max":maxDroneDistance / 20, 
				"step":10, 
				"default": 50, 
				"current": getMinProximity(), 
				"unit":"m", 
				"testProtocol":"drone"
			}
			opts.TUNE_SLOW_ZONE = {
				"type":"float", 
				"min":0, 
				"max":maxDroneDistance / 10, 
				"step":10, 
				"default": 100, 
				"current": getProximity(), 
				"unit":"m", 
				"testProtocol":"drone"
			}
	return opts

func _setEnabled(how:bool):
	enabled = how
	var equipment = self
	var children = equipment.get_children()
	var DP
	for child in children:
		var childname = child.name
		if childname == "DronePickupArea":
			DP = child
	DP.monitoring = how
	if not how:
		ship.clearSystemTarget(self)
