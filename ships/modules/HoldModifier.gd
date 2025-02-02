extends "res://IndustriesOfEnceladusRevamp/ships/modules/BaseModifier.gd"

export (String, "divided", "amorphic", "both") var holdType
export (int) var addedSpace = 0
export (int) var amorphicRatio = 0

func extend(ship):
	var capacity = ship.get("processedCargoCapacity")
	var shipHoldType = ship.get("processedCargoStorageType")
	
	#print(shipHoldType)
	
	match holdType:
		"divided":
			match shipHoldType:
				"divided":
					# just increase the hold capacity by the addedSpace factor
					ship.set("processedCargoCapacity",
						capacity + addedSpace)
					#print("branch divided divided")
				"amorphic":
					# this will change the hold type to divided
					ship.set("processedCargoStorageType", "divided")
					# and divide the total storage space
					ship.set("processedCargoCapacity",
						capacity / amorphicRatio)
					#print("branch divided amorphic")
		"amorphic":
			match shipHoldType:
				"divided":
					# convert to amorphic
					ship.set("processedCargoStorageType", "amorphic")
					# and multiply the total storage space
					ship.set("processedCargoCapacity",
						capacity * amorphicRatio)
					#print("branch amorphic divided")
				"amorphic":
					# increase the hold capacity
					ship.set("processedCargoCapacity",
						capacity + (addedSpace * amorphicRatio))
					#print("branch amorphic amorphic")
		"both":
			match shipHoldType:
				"divided":
					# flat increase
					ship.set("processedCargoCapacity",
						capacity + addedSpace)
					#print("branch both divided")
				"amorphic":
					ship.set("processedCargoCapacity",
						capacity + (addedSpace * amorphicRatio))
					#print("branch both amorphic")
