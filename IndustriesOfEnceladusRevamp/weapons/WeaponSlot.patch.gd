extends "res://ships/WeaponSlot.gd"

export (Vector2) var armVelocityMultiplier = Vector2(1,1)

# this is just so that arms that need their feed velocity adjusted
# can be adjusted on the fly, since inheritance is a bitch
# this is remarkably unsafe and i know it so it'll be the first
# thing i look at if something breaks later
func loadPlaceholder():
	var t = "weaponSlot.%s.type" % slot
	var placeholder:InstancePlaceholder = get_node_or_null(String(mounted))
	if placeholder:
		if directMount:
			key = name + "_" + mounted
		else :
			key = t + "_" + mounted
		placeholder.replace_by_instance()
		system = get_node_or_null(mounted)
		# custom code
		if system.get("feedVelocity"):
			system.feedVelocity *= armVelocityMultiplier
		# end of custom code
		system.name = name + "_" + system.name
		system.visible = true
		if key in system:
			system.key = key
		if "slotName" in system:
			system.slotName = t + "_" + system.systemName
	ship.changeExternalPlaceholders( - 1)
