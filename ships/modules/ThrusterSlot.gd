extends "res://ships/modules/ThrusterSlot.gd"

func _getMass():
	var valid = is_instance_valid(system)
	if system:
		if "mass" in system:
			return system.mass
		else:
			return 0.0
	else:
		return 0.0


func getSystem():
	if is_instance_valid(system):
		return system
	else:
		return null

func loadPlaceholder():
	.loadPlaceholder()
	var valid = is_instance_valid(system)
	if valid:
		pass
	else:
		system = null


func _setEnabled(how):
	enabled = how
	if is_instance_valid(system) and system and "enabled" in system:
		system.enabled = how
		
func getFuelLeft():
	if is_instance_valid(system) and system and system.has_method("getFuelLeft"):
		return system.getFuelLeft()
	else:
		return null
		
func getCapacity():
	if is_instance_valid(system) and system and system.has_method("getCapacity"):
		return system.getCapacity()
	else:
		return 0
	
func getTuneables():
	var system = getSystem()
	if is_instance_valid(system) and system and system.has_method("getTuneables"):
		var t = system.getTuneables()
		return t
	return {}
	
func _getRepairFixPrice():
	if is_instance_valid(system) and system and "repairReplacementTime" in system:
		var s = system.repairFixPrice
		return s
	return 0
	
func _repairReplacementPrice():
	if is_instance_valid(system) and system and "repairReplacementPrice" in system:
		var s = system.repairReplacementPrice
		return s
	return 0
	
func _getRepairFixTime():
	if is_instance_valid(system) and system and "repairFixTime" in system:
		var s = system.repairFixTime
		return s
	return 0
	
func _repairReplacementTime():
	if is_instance_valid(system) and system and "repairReplacementTime" in system:
		var s = system.repairReplacementTime
		return s
	return 0


func fire(p, mx = 1, vector = null):
	if is_instance_valid(system) and system and system.has_method("fire"):
		if enabled or ship.cutscene:
			system.fire(p, mx, vector)
		else:
			system.fire(0, mx, null)
		
func getThrustVector(v = null):
	if is_instance_valid(system) and system:
		if system.has_method("getThrustVector"):
			return system.getThrustVector(v)
	return null
	
func _getThrust():
	if is_instance_valid(system) and system:
		if "thrust" in system:
			return system.thrust
	return null

func _getPowerSupply():
	if is_instance_valid(system) and system:
		if "powerSupply" in system:
			return system.powerSupply
	return 0

func _getSpecificImpulse():
	if is_instance_valid(system) and system:
		if "specificImpulse" in system:
			return system.specificImpulse
	return 0

func _getPriority():
	if is_instance_valid(system) and system:
		if "priorityOffset" in system:
			return system.priorityOffset
	return 1

func _getSystemName():
	if is_instance_valid(system) and system and "systemName" in system:
		return system.systemName
	else:
		return "SYSTEM_NONE"
	
func getPower():
	if is_instance_valid(system) and system and system.has_method("getPower"):
		return system.getPower()
	return 0
	
func getKey():
	if is_instance_valid(system) and system:
		return system.name
	else:
		return name
	
func getStatus():
	if is_instance_valid(system) and system:
		if system.has_method("getStatus"):
			return system.getStatus()
	return null
	
func getDamage():
	if is_instance_valid(system) and system:
		if system.has_method("getDamage"):
			return system.getDamage()
	return {}
