extends Node2D

export  var systemName = "SYSTEM_CARGO_MOD"
export  var slot = "cargo.modifier"
export  var slotName = "cargo.modifier"
export  var repairReplacementPrice = 0
export  var repairReplacementTime = 0
export  var repairFixPrice = 0
export  var repairFixTime = 0
export (int) var mass = 0
var enabled = true
export var registerExternal = false

var ship

func _ready():
	var ship = getShip()
	extend(ship)
	
func extend(ship):
	return true
	
func getShip(from:Node = self, maxLoops = 10):
	var node = from
	var counter = 0
	
	while not node.has_method("getConfig") and node != null:
		node = node.get_parent()
		counter += 1
		if counter > maxLoops:
			Debug.l("%s exceeded max loop limit!" % from.name)
			return ERR_PRINTER_ON_FIRE
		
	return node
