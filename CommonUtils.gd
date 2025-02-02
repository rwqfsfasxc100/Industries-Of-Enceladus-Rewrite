extends Node

var modID = "blehhh"
var verbose = true

# frequently used internal function
# very basic but incredibly useful as it allows nodes that are the children of
# ships to get their parent and do things to it, like change values or add bits
# this is a slightly changed version but by default functions the same as every
# other implementation
func getShip(from:Node = self):
	var node = from
	
	while not node.has_method("getConfig") and node != null:
		node = node.get_parent()
		
	return node

# unchanged from Za'krin's implementation - thank you!
# Instances Settings.gd, loads DLC, then frees the script.
func loadDLC():
	sLog("Preloading DLC")
	var DLCLoader = load("res://Settings.gd").new()
	DLCLoader.loadDLC()
	DLCLoader.queue_free()
	sLog("Finished loading DLC")

# only slightly changed from Za'krin's implementation - thank you!
# Helper function to replace scenes
func replaceScene(path:String, oldPath:String = "none"):
	if verbose: sLog("Updating scene %s" % path)
	
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
	
	if verbose: sLog("Updated %s" % path)

# only slightly changed from Za'krin's implementation - thank you!
# Helper function to extend scripts
func installScriptExtension(path:String , oldPath:String = "none"):
	var childPath = str(modPath + path)
	var childScript = ResourceLoader.load(childPath)

	childScript.new()

	var parentScript = childScript.get_base_script()
	var parentPath = parentScript.resource_path

	if verbose: sLog("Installing script extension (%s <- %s)" % [parentPath, childPath])

	childScript.take_over_path(parentPath)

# quick helper for Debug.l "soft log"
# this will error in this script but don't worry about it, as long as you have
# a modID in your ModMain.gd this works fine
func sLog(text:String, title:String = modID):
	Debug.l("%s: %s" % [title, text])
