extends CollisionPolygon2D

export  var repairReplacementPrice = 1000
export  var repairReplacementTime = 1
export  var repairFixPrice = 1000
export  var repairFixTime = 1
var equipment = true

export var mass = 1000
export  var systemName = "SYSTEM_CARGO_AUX"
export  var slot = "cargo.aux"

export (float, 0, 25000, 500) var internalStorage = 0.0
export (float, 0, 25000, 500) var ammoStorage = 0.0
export (float, 0, 25000, 500) var droneStorage = 0.0
export  var registerExternal = false

export var mirrorCollider = false
export (Vector2) var mirrorCentreOffset = Vector2(0,0)

var ship
var duped = false

func _ready():
	ship = getShip()
	if ship.getConfig(slot) != systemName:
		self.queue_free()
	else: if not duped:
		var dupe = self.duplicate()
		dupe.duped = true
		dupe.set_position(self.position + self.get_parent().position)
		dupe.set_rotation(self.rotation)
		ship.call_deferred("add_child", dupe)
		self.queue_free()
		return true
	else :
		visible = true
		if registerExternal:
			ship.externalSystems.append(self)
			
		match ship.processedCargoStorageType:
			"divided":
				ship.processedCargoCapacity += internalStorage
			"amorphic":
				ship.processedCargoCapacity += internalStorage * 6
		
		ship.massDriverAmmoMax = ship.getConfig("ammo.capacity") + ammoStorage
		ship.dronePartsMax = ship.getConfig("drones.capacity") + droneStorage
		
		extend(ship)
			
		# flip the collider if it's requested
		if mirrorCollider:
			# get the position and scale of the existing collider
			var selfPos = self.get_position()
			var selfScale = self.scale
			# instantiate a new collider
			var copy = CollisionPolygon2D.new()
			
			# copy over properties
			copy.visible = true
			copy.z_index = self.z_index
			copy.set_polygon(self.polygon)
			copy.set_build_mode(self.build_mode)
			copy.set_disabled(false)
			copy.set_one_way_collision(self.one_way_collision)
			copy.set_one_way_collision_margin(self.one_way_collision_margin)
			
			# flip the x coordinate and adjust for the centre offset
			copy.set_position(Vector2(-(selfPos[0]), selfPos[1])
				+ mirrorCentreOffset)
			# set the scale to the equivalent of self
			copy.set_scale(Vector2(-(selfScale[0]), selfScale[1]))
			
			# clear the script, just to be sure
			copy.set_script(null)
			# set a property for the cargo scanner? i'm not sure
#			copy.equipment = true
			# add the collider to the ship
			ship.add_child(copy)
			
			#print("Made copy %s with scale %s at %s, parent is %s" % [copy.to_string(), String(copy.scale), String(copy.position), copy.get_parent().to_string()])

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
