extends "res://Settings.gd"

# Default config values
var IoEConfig = {
	"input":{
		"ship_slot_9":[ "9" ],
		"ship_slot_minus":[ "Minus" ],
		"ship_slot_equal":[ "Equal" ],
	}, 
}


var IoEPath = "user://cfg/IoER.cfg"
var IoEFile = ConfigFile.new()

func _ready():
	loadIoEFromFile()
	saveIoEToFile()


func saveIoEToFile():
	for section in IoEConfig:
		for key in IoEConfig[section]:
			IoEFile.set_value(section, key, IoEConfig[section][key])
	IoEFile.save(IoEPath)


func loadIoEFromFile():
	var error = IoEFile.load(IoEPath)
	if error != OK:
		Debug.l("IoE: Error loading settings %s" % error)
		return 
	for section in IoEConfig:
		for key in IoEConfig[section]:
			IoEConfig[section][key] = IoEFile.get_value(section, key, IoEConfig[section][key])
	loadKeymapsFromConfig()

# Keybind setting handlers
func loadKeymapsFromConfig():
	for action_name in IoEConfig.input:
		var addAction = true
		for m in InputMap.get_actions():
			if m == action_name:
				addAction = false
		if addAction:
			InputMap.add_action(action_name)
		for key in IoEConfig.input[action_name]:
			var event = InputEventKey.new()
			event.scancode = OS.find_scancode_from_string(key)
			InputMap.action_add_event(action_name, event)
	emit_signal("controlSchemeChaged")
	
	var actions = InputMap.get_action_list("debugger")
	var keys = []
	for a in actions:
		var scancode = char(a.scancode)
		keys.append(scancode)
	
