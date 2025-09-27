extends Node

export  var type = "cargo.aux"

export var default = "SYSTEM_NONE"

var mounted

var ship

func _ready():
	ship = get_parent()
	while not ship.has_method("getConfig"):
		ship = ship.get_parent()
	mounted = ship.getConfig(type)
	if not mounted:
		ship.setConfig(type, default)
		mounted = default
	Tool.remove(self)
