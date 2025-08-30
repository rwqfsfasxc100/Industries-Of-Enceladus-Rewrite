extends Node

# Set mod priority if you want it to load before/after other mods
# Mods are loaded from lowest to highest priority, default is 0
const MOD_PRIORITY = -99
# Name of the mod, used for writing to the logs
const MOD_NAME = "IoE Compatability Rewrite"
const MOD_VERSION = "2.3.12"
const MOD_VERSION_MAJOR = 2
const MOD_VERSION_MINOR = 3
const MOD_VERSION_BUGFIX = 12
const MOD_VERSION_METADATA = ""
# Path of the mod folder, automatically generated on runtime
var modPath:String = get_script().resource_path.get_base_dir() + "/"
# Required var for the replaceScene() func to work
var _savedObjects := []

var aesthetics:bool = true
var addShips:bool = true
var verbose:bool = true # failsafe

var modSettings = {}

var ADD_EQUIPMENT_SLOTS = []
var ADD_EQUIPMENT_ITEMS = []
var EQUIPMENT_TAGS = {}
var SLOT_TAGS = {}

func _init(modLoader = ModLoader):
# Must load DLC early for it to properly function.
	# Modify Settings.gd first so we can load config and DLC
	installScriptExtension("Settings.gd")
	loadSettings()
	
	loadDLC()
	
	var self_path = self.get_script().get_path()
	var self_directory = self_path.split(self_path.split("/")[self_path.split("/").size() - 1])[0]
	var self_check = load(self_directory + "mod_checker_script.tscn").instance()
	add_child(self_check)
# replace ShipParams for hold percentage fill readout
	replaceScene("hud/trtl/ShipParams.tscn")
	
# install ship-ctrl.gd, adds hold sensors and AP setup
	installScriptExtension("ships/ship-ctrl.gd")
# install AutopilotOverlay.gd for new AP type
	installScriptExtension("hud/AutopilotOverlay.gd")

# replace slots for all our new equipment
#	installScriptExtension("weapons/WeaponSlot.gd")
#	installScriptExtension("weapons/drone-plant.patch.gd")
#	replaceScene("weapons/drone-plant.tscn")
	replaceScene("sfx/torch-PMS.tscn")
	replaceScene("sfx/torch-ZUBRIN.tscn")
	
	replaceScene("ships/modules/AuxSlot.tscn")
	replaceScene("ships/modules/ThrusterSlot.tscn")
	replaceScene("ships/modules/TorchSlot.tscn")
	
	
	
# replace weapons and WeaponSlot
	if aesthetics:
		l("Setting up aesthetic adjustments")
		replaceScene("weapons/railgun_tor.tscn")
		
# replace Dealer.tscn for our "promo images" (that i don't have lol)
	if addShips:
		replaceScene("enceladus/Dealer.tscn")
	
# replace the Upgrades.tscn containing equipment modifications
#	replaceScene("weapons/WeaponSlot.tscn")
#	replaceScene("res://IndustriesOfEnceladusRevamp/tagging_assignments/Upgrades.tscn","res://enceladus/Upgrades.tscn")
	
	
# install the Shipyard.gd script extension, which loads replacements + new ships
	shipReplacements()
	
	# install CurrentGame.gd which loads new ships into the game
	if addShips:
		l("Injecting new ships")
		installScriptExtension("CurrentGame.gd")
	installScriptExtension("ships/Shipyard.gd")
# Load custom translations
	updateTL("en") 
	updateTL("uk_UA") 

	
	l("Initialised!", MOD_NAME)


func _ready():
	# Adds IoE-specific ships to the event pool
	replaceScene("story/TheRing.tscn")
	replaceScene("comms/conversation/subtrees/DIALOG_PIRATE_SUPPORT.tscn")
	# Game.tscn should be loaded on ready, separate from TheRing.tscn to allow for other mods to add their own events
	replaceScene("Game.tscn")
	made_additions()
	l("Ready!")



func loadSettings():
	l(MOD_NAME + ": Loading mod settings")
	var settings = load("res://Settings.gd").new()
	settings.loadIoEFromFile()
	settings.saveIoEToFile()
	modSettings = settings.IoEConfig
	l(MOD_NAME + ": Current settings: %s" % modSettings)
	settings.queue_free()
	l(MOD_NAME + ": Finished loading settings")

# helper script for translations
# based on Za'krin's helper script!!
func updateTL(locale:String, path:String = modPath + "i18n"):
	l("Updating translations for locale %s" % locale)

	# preprocess i18n directory files
	var operatingPath = "%s/%s/" % [path, locale]
	var dir = Directory.new()
	if dir.open(operatingPath) == OK:
		dir.list_dir_begin(true)
		
		var tlFile = File.new()
		var marchDone = false

		var translation = Translation.new()
		translation.locale = locale
		
		while not marchDone:
			var fileName = dir.get_next()
			
			if fileName:
				var tFileConcat = operatingPath + fileName
				
				tlFile.open(tFileConcat, File.READ)
				
				if verbose: l("Loaded translation file %s" % fileName)
		
				while tlFile.get_position() < tlFile.get_len():
					var line = tlFile.get_line()
					var split = line.split("|", false)
					if split.size() == 2:
						var key = split[0]
						var val = tr(split[1]).c_unescape()
						
						translation.add_message(key, val)
						if verbose: Debug.l("Added translation %s" % key)
				
				tlFile.close()
			else:
				marchDone = true
				break

		TranslationServer.add_translation(translation)
	else:
		l("ERROR! Couldn't find path '%s'!" % operatingPath)

	l("Translations updated for locale %s" % locale)


# Instances Settings.gd, loads DLC, then frees the script.
func loadDLC():
	l("Preloading DLC")
	var DLCLoader = load("res://Settings.gd").new()
	DLCLoader.loadDLC()
	DLCLoader.queue_free()
	l("Finished loading DLC")


# Helper function to replace scenes
func replaceScene(path:String, oldPath:String = "none"):
	if verbose: l("Updating scene %s" % path)
	
	var newScene
	var oldScene

	if oldPath == "none":
		newScene = str(modPath + path)
		oldScene = str("res://" + path)

	else:
		newScene = path
		oldScene = oldPath

	var scene = load(newScene)
	scene.take_over_path(oldScene)
	_savedObjects.append(scene)
	
	if verbose: l("Updated %s" % path)

# Helper function to extend scripts
func installScriptExtension(path:String , oldPath:String = "none"):
	var childPath = str(modPath + path)
	var childScript = ResourceLoader.load(childPath)

	childScript.new()

	var parentScript = childScript.get_base_script()
	var parentPath = parentScript.resource_path

	if verbose: l("Installing script extension (%s <- %s)" % [parentPath, childPath])

	childScript.take_over_path(parentPath)

func l(msg:String, title:String = MOD_NAME, version:String = MOD_VERSION):
	Debug.l("[%s V%s]: %s" % [title, version, msg])

func shipReplacements():
	replaceScene("ships/ATK225-B.tscn")
	replaceScene("ships/ATK225-R.tscn")
	replaceScene("ships/ATK225.tscn")
	replaceScene("ships/ocp-209.tscn")
	replaceScene("ships/kitsune.tscn")
	replaceScene("ships/Eagle-Prospector-VP.tscn")
	replaceScene("ships/Eagle-Prospector-Lux.tscn")
	replaceScene("ships/Eagle-Prospector-Fat.tscn")
	replaceScene("ships/Eagle-Prospector-Bald.tscn")
	replaceScene("ships/Eagle-Prospector.tscn")
	replaceScene("ships/EIME.tscn")
	replaceScene("ships/RA-TRTL-K44.tscn")
	replaceScene("ships/RA-TRTL-R.tscn")
	replaceScene("ships/RA-TRTL-T.tscn")
	replaceScene("ships/RA-TRTL-LCB.tscn")
	replaceScene("ships/RA-TRTL.tscn")
	replaceScene("ships/Cothon-V.tscn")
	replaceScene("ships/Cothon-CHK.tscn")
	replaceScene("ships/Cothon-Lnd.tscn")
	replaceScene("ships/Cothon.tscn")

func made_additions():
	var slots = load("res://IndustriesOfEnceladusRevamp/tagging_assignments/slots.gd")
	var assignments = load("res://IndustriesOfEnceladusRevamp/tagging_assignments/slot_assignments.gd")
	var tags = load("res://IndustriesOfEnceladusRevamp/tagging_assignments/tags.gd")
	for slot in slots.get_script_constant_map():
		addEquipmentSlot(slots.get(slot))
	EQUIPMENT_TAGS = tags.EQUIPMENT_TAGS
	SLOT_TAGS = tags.SLOT_TAGS
	for slot in assignments.get_script_constant_map():
		addEquipmentItem(assignments.get(slot))

func addEquipmentSlot(slot_data: Dictionary):
	ADD_EQUIPMENT_SLOTS.append(slot_data)
func addEquipmentItem(item_data: Dictionary):
	ADD_EQUIPMENT_ITEMS.append(item_data)
