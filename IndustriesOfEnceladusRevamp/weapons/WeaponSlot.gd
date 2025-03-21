extends "res://ships/WeaponSlot.gd"

func _getCommand():
	if system and "command" in system:
		return system.command
	else :
		return command
