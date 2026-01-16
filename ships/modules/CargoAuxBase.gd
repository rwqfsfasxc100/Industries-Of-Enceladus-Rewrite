extends CollisionPolygon2D

export  var repairReplacementPrice = 1000
export  var repairReplacementTime = 1
export  var repairFixPrice = 1000
export  var repairFixTime = 1
var equipment = true
onready var slotName = "CargoAux_" + systemName
#export (String) var slotName = "CargoAux_" + systemName

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

var preproc_default_shapes = preload("res://IndustriesOfEnceladusRewrite/ships/modules/data/preproc_default_shapes.gd")
var preproc_ship_shape_mods = preload("res://IndustriesOfEnceladusRewrite/ships/modules/data/preproc_ship_shape_mods.gd")
var DataFormat = preload("res://HevLib/pointers/DataFormat.gd")

var ship
var duped = false

var ship_name = ""
var base_ship_name = ""

onready var area = get_node_or_null("ProcessingArea")
onready var top = get_node_or_null("ProcessingArea/ZoneTop")
onready var bottom = get_node_or_null("ProcessingArea/ZoneBottom")

var capacity = 3000
var shipHoldType = "divided"

var hs_modified = false

var isready = false

func _ready():
	ship = getShip()
	self.name = systemName
	ship.registerCapability(slot, systemName)
	if ship.getConfig(slot) != systemName:
		Tool.remove(self)
	else:
		visible = true
		if registerExternal:
			ship.externalSystems.append(self)
#	modify_shape()
	make_mirror()
	isready = true
	
	

func _physics_process(delta):
	
	if isready:
		var ship = getShip()
		if ship.isPlayerControlled():
			if !ship.cutscene:
				shipHoldType = ship.get("processedCargoStorageType")
				ship_name = ship.shipName
				base_ship_name = ship.baseShipName
				var cfg = ship.shipConfig
#				var baseAmmo = cfg["ammo"]["capacity"]
#				var baseDrones = cfg["drones"]["capacity"]
#				if ship == null:
#					breakpoint
#				else:
#					hs_modified = true
				visible = true
				
#				match shipHoldType:
#					"divided":
#						ship.processedCargoCapacity = capacity + internalStorage
#					"amorphic":
#						ship.processedCargoCapacity = capacity + (internalStorage * 6)
				
#				ship.bay_aux_capacity = internalStorage
				
#				var newAmmo = baseAmmo + ammoStorage
#
#				var newDrones = baseDrones + droneStorage
#				ship.massDriverAmmoMax = newAmmo
#				ship.dronePartsMax = newDrones
				
				extend(ship)
				
#				modify_shape()
#				make_mirror()

func make_mirror():
	self.rotation = -deg2rad(set_rot)
	var current_pos = self.position
	var new_position = DataFormat.__rotate_point(current_pos,set_rot)
	self.position = new_position
	# flip the collider if it's requested
	var has = ship.getConfig(slot) == systemName
	if has and mirrorCollider:
		var colliderName = systemName + "_COLLIDER_MIRROR"
		var node = ship.get_node_or_null(colliderName)
		var selfScale = self.scale
		if node:
			node.set_polygon(make_poly())
			node.set_position(modify_position())
			node.rotation = deg2rad(set_rot)
			node.scale = selfScale
		else:
			var copy = CollisionPolygon2D.new()
			copy.name = colliderName
			copy.visible = true
			copy.z_index = self.z_index
			copy.set_polygon(make_poly())
			copy.set_build_mode(self.build_mode)
			copy.set_disabled(false)
			copy.set_one_way_collision(self.one_way_collision)
			copy.set_one_way_collision_margin(self.one_way_collision_margin)
			copy.scale = selfScale
			copy.set_position(modify_position())
			copy.rotation = deg2rad(set_rot)
			copy.set_script(null)
			ship.call_deferred("add_child",copy)
			$Mirror.visible = false
			$Mirror.disabled = true

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

func getShip():
	var c = self
	while not c.has_method("getConfig") and c != null:
		c = c.get_parent()
	return c

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





func adjust(data):
	if "rotation" in data:
		var d = data["rotation"]
		self.set_rot = d
	if "position" in data:
		var a = data["position"][0]
		var b = data["position"][1]
		self.position = Vector2(a,b)
#		breakpoint
	if "shape" in data:
		var shape = convert_arr_to_vec2arr(data["shape"])
		self.polygon = shape
	if top and "ZoneTop" in data:
		var shape = convert_arr_to_vec2arr(data["ZoneTop"])
		top.polygon = shape
	if bottom and "ZoneBottom" in data:
		var shape = convert_arr_to_vec2arr(data["ZoneBottom"])
		bottom.polygon = shape
	if "scale" in data:
		if data["scale"].size() >= 2:
			var x = data["scale"][0]
			var y = data["scale"][1]
			var poly = PoolVector2Array([])
			for p in self.polygon:
				var v = Vector2(p[0]*x,p[1]*y)
				poly.append(v)
			self.polygon = poly
		else:
			var x = data["scale"][0]
			var poly = PoolVector2Array([])
			for p in self.polygon:
				var v = Vector2(p[0]*x,p[1]*x)
				poly.append(v)
			self.polygon = poly
	

func modify_shape():
	var shapes = preproc_default_shapes.get_script_constant_map()
	var shipMod = preproc_ship_shape_mods.get_script_constant_map()
	
	if systemName in shapes:
		var data = shapes[systemName]
		adjust(data)
	else:
		var data = shapes["_DEFAULT"]
		adjust(data)
	var current_pos = self.position
	if base_ship_name in shipMod:
		mod_ship(shipMod,base_ship_name,current_pos)
	if ship_name in shipMod:
		mod_ship(shipMod,ship_name,current_pos)
	
func mod_ship(shipMod,base_ship_name,current_pos):
	var sdata = shipMod[base_ship_name]
	if "position" in sdata:
		var data = sdata["position"]
		var a = data[0]
		var b = data[1]
		self.position = current_pos + Vector2(a,b)
	if "rotation" in sdata:
		var data = sdata["rotation"]
		self.set_rot = data
	if "mirrorCollider" in sdata:
		self.mirrorCollider = sdata["mirrorCollider"]
	if "mirrorVertical" in sdata:
		self.mirrorVertical = sdata["mirrorVertical"]
	if "mirrorCentreOffset" in sdata:
		var d = sdata["mirrorCentreOffset"]
		var a = d[0]
		var b = d[1]
		self.mirrorCentreOffset = Vector2(a,b)
	if "scale" in sdata:
		var nscale = sdata["scale"]
		var new_scale = Vector2(1,1)
		if nscale.size() >=2:
			new_scale = Vector2(nscale[0],nscale[1])
		elif nscale.size() == 1:
			new_scale = Vector2(nscale[0],nscale[0])
		self.scale = new_scale
		
	if systemName in sdata:
		var data = sdata[systemName]
		adjust(data)
