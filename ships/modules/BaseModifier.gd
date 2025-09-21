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

var capacity = 3000
var shipHoldType = "divided"

var ship

func _ready():
	var ship = getShip()
	extend(ship)



func extend(ship):
	return true
	
func getShip(from:Node = self, maxLoops = 10):
	var c = self
	while not c.has_method("getConfig") and c != null:
		c = c.get_parent()
	return c
