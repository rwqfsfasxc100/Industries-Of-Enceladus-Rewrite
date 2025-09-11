extends CollisionPolygon2D

export  var repairReplacementPrice = 1000
export  var repairReplacementTime = 1
export  var repairFixPrice = 1000
export  var repairFixTime = 1
var equipment = true
export (String) var slotName = name

export var mass = 1000
export  var systemName = "SYSTEM_CARGO_AUX"
export  var slot = "cargo.aux"

export (float, 0, 25000, 500) var internalStorage = 0.0
export (float, 0, 25000, 500) var ammoStorage = 0.0
export (float, 0, 25000, 500) var droneStorage = 0.0
export  var registerExternal = false

export var mirrorCollider = false
export var mirrorVertical = false
export (Vector2) var mirrorCentreOffset = Vector2(0,0)
var set_rot = 0.0

var preproc_default_shapes = preload("res://IndustriesOfEnceladusRevamp/ships/modules/data/preproc_default_shapes.gd")
var preproc_ship_shape_mods = preload("res://IndustriesOfEnceladusRevamp/ships/modules/data/preproc_ship_shape_mods.gd")
var DataFormat = preload("res://HevLib/pointers/DataFormat.gd")

var ship
var duped = false

var ship_name = ""
var base_ship_name = ""

var hs_modified = false

func _physics_process(delta):
	var ship = getShip()
	if ship.isPlayerControlled():
		if !ship.cutscene:
			ship_name = ship.shipName
			base_ship_name = ship.baseShipName
			var cfg = ship.shipConfig
			var baseAmmo = cfg["ammo"]["capacity"]
			var baseDrones = cfg["drones"]["capacity"]
			if ship == null:
				breakpoint
			else:
				hs_modified = true
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
				
				var newAmmo = baseAmmo + ammoStorage
				
				var newDrones = baseDrones + droneStorage
				
				ship.massDriverAmmoMax = newAmmo
				ship.dronePartsMax = newDrones
				
				extend(ship)
				
				self.rotation = -deg2rad(set_rot)
				var current_pos = self.position
				var new_position = DataFormat.__rotate_point(current_pos,set_rot)
				self.position = new_position
				# flip the collider if it's requested
				if mirrorCollider:
					var colliderName = systemName + "_COLLIDER_MIRROR"
					var node = ship.get_node_or_null(colliderName)
					if node:
						node.set_polygon(make_poly())
						node.set_position(modify_position())
						node.rotation = deg2rad(set_rot)
						
					else:
					
					
						# get the position and scale of the existing collider
						
						var selfScale = self.scale
						# instantiate a new collider
						var copy = CollisionPolygon2D.new()
						copy.name = colliderName
						# copy over properties
						copy.visible = true
						copy.z_index = self.z_index
						
#						breakpoint
						copy.set_polygon(make_poly())
						copy.set_build_mode(self.build_mode)
						copy.set_disabled(false)
						copy.set_one_way_collision(self.one_way_collision)
						copy.set_one_way_collision_margin(self.one_way_collision_margin)
						
						# flip the x coordinate and adjust for the centre offset
						
						copy.set_position(modify_position())
						# set the scale to the equivalent of self
						copy.rotation = deg2rad(set_rot)
						# clear the script, just to be sure
						copy.set_script(null)
						# set a property for the cargo scanner? i'm not sure
			#			copy.equipment = true
						# add the collider to the ship
						ship.add_child(copy)
#						copy.visible = true
#						copy.disabled = false
#						breakpoint
						$Mirror.visible = false
						$Mirror.disabled = true
						#print("Made copy %s with scale %s at %s, parent is %s" % [copy.to_string(), String(copy.scale), String(copy.position), copy.get_parent().to_string()])

func modify_position() -> Vector2:
	var selfPos = self.get_position()
	var nselfPos = DataFormat.__rotate_point(selfPos,(1/2)*set_rot)
	var modifyP = Vector2(nselfPos[0], nselfPos[1])
	if mirrorVertical:
		modifyP[1] = -modifyP[1]#*2
	else:
		modifyP[0] = -modifyP[0]#*2
	var newpos = modifyP + mirrorCentreOffset
	return newpos

func make_poly() -> PoolVector2Array:
	var poly = self.polygon
	var newPoly = PoolVector2Array([])
	for vec in poly:
		if mirrorVertical:
			var newVec = Vector2(vec[0],-vec[1])
			newPoly.append(newVec)
		else:
			var newVec = Vector2(-vec[0],vec[1])
			newPoly.append(newVec)
	return newPoly

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

func convert_arr_to_vec2arr(array:Array) -> PoolVector2Array:
	var converted = PoolVector2Array([])
	var size = array.size()
	if size % 2 == 1:
		Debug.l("Cannot convert array to PoolVector2Array with an odd number of entries")
		return PoolVector2Array([])
	var index = 0
	while index < size:
		var a = array[index]
		var b = array[index + 1]
		var atype = typeof(a)
		var btype = typeof(b)
		if atype == TYPE_INT:
			pass
		elif atype == TYPE_REAL:
			pass
		else:
			Debug.l("Cannot convert type %s for PoolVector2Array" % atype)
			return PoolVector2Array([])
		if btype == TYPE_INT:
			pass
		elif btype == TYPE_REAL:
			pass
		else:
			Debug.l("Cannot convert type %s for PoolVector2Array" % btype)
			return PoolVector2Array([])
		var pooling = Vector2(a,b)
		converted.append(pooling)
		index += 2
#	breakpoint
	return converted

