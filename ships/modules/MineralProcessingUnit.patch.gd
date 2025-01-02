extends "res://ships/modules/MineralProcessingUnit.gd"

export (bool) var removeThis = false

func _ready():
	var mounted = ship.getConfig(slot)
	
	if removeThis:
		Tool.remove(self)
		
	else: if mounted == systemName:
		if ship.processedCargoStorageType == "amorphic":
			ship.processedCargoCapacity += internalStorage * 6
		else:
			ship.processedCargoCapacity += internalStorage

func getShip(from:Node = self, maxLoops = 10):
	var node = from
	var counter = 0
	
	while not node.has_method("getConfig") and node != null:
		node = node.get_parent()
		counter += 1
		if counter > maxLoops:
			print("%s exceeded max loop limit!" % from.name)
			return ERR_PRINTER_ON_FIRE
			break
	
	if node == null:
		print("Failed to get ship from %s!" % from.name)
		return ERR_DOES_NOT_EXIST
		
	return node
