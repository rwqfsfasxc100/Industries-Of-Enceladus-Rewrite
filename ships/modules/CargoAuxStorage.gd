extends "res://IndustriesOfEnceladusRevamp/ships/modules/CargoAuxBase.gd"

var has_modified = false

func _physics_process(delta):
	
	if not has_modified:
		var ship = getShip()
		if !ship.cutscene and ship.isPlayerControlled():
			modify_preproc_shape()
			




func adjustShape(data):
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
	

func modify_preproc_shape():
	var shapes = preproc_default_shapes.get_script_constant_map()
	var shipMod = preproc_ship_shape_mods.get_script_constant_map()
	
	if systemName in shapes:
		var data = shapes[systemName]
		adjustShape(data)
	else:
		var data = shapes["_DEFAULT"]
		adjustShape(data)
	var current_pos = self.position
	if base_ship_name in shipMod:
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
		if systemName in sdata:
			var data = sdata[systemName]
			adjustShape(data)
	if ship_name in shipMod:
		var sdata = shipMod[ship_name]
		if "position" in sdata:
			var data = sdata["position"]
			self.position = current_pos + Vector2(data[0],data[1])
		if "rotation" in sdata:
			var data = sdata["rotation"]
			self.set_rot = data
		if systemName in sdata:
			var data = sdata[systemName]
			adjustShape(data)
	
