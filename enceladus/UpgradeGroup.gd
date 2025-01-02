extends "res://enceladus/UpgradeGroup.gd"

export (Array, String) var onlyForShipNames
export (bool) var invertNameLogic = false

func reexamine():	
	var ship = CurrentGame.getPlayerShip()
	
	.reexamine()
	# don't override base logic
	if visible:
		var logic:bool
		#print("Fired! %s" % slot)
		if onlyForShipNames:
			if ship.shipName in onlyForShipNames:
				logic = true
			else:
				logic = false
			
			if invertNameLogic:
				visible = !logic
			else:
				visible = logic
				
			#print("ShipName fired: %s / %s" % [logic, visible])
