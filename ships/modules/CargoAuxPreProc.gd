extends "res://IndustriesOfEnceladusRevamp/ships/modules/CargoAuxBase.gd"

# ok this is very stupid
# _physics_process can't be explicitly overriden in 3.5.3
# goddamnit. i have to cpy the entire fucking thing
# fuck! fuck! fuck!

export  var ventTime = 0.5
export  var massDamageScale = 20.0
export  var self_kgps = 100
export  var powerDrawPerKg = 100
export (float, 0, 1, 0.05) var modify_mineralEfficiency = 0.0
export (float, 0, 1, 0.05) var self_remassEfficiency = 0.5
export  var modify_kgps_add = 0
export  (int, 10, 1000, 1) var modify_kgps_percent_multi = 100


export  var enabled = true


var processing = []
var power = 0

func getStatus():
	return 100
func getPower():
	return clamp(power, 0, 1)

#func extend(ship):
	# and this part which boosts MPU efficiency
#	for child in ship.get_children():
#		var scriptobj = child.get_script()
#		if scriptobj != null:
#			var script = scriptobj.get_path()
#			if script == "res://ships/modules/MineralProcessingUnit.gd":
#				MPUs.append(child)
#	for node in ship.get_children():
#		var nname = node.name
#		var inst = is_instance_valid(node)
#		var valid = node.is_processing()
#		if "MineralProcessingUnit" in node.name:
#			if valid:
#				var nodeMinEff = node.mineralEfficiency
#				var newMinEff = clamp(nodeMinEff + (nodeMinEff * modify_mineralEfficiency),
#					0, 0.95)
#
#				var nodeKGPS = node.kgps
#				var newKGPS = (nodeKGPS * (clamp(modify_kgps_percent_multi,10,1000)/100)) + modify_kgps_add
#
#				# clamped to 0.95 since it'll violate the laws of physics otherwise
#				# maybe 1? i can change it later i guess
#				ship.set("mineralEfficiency", newMinEff)
##				#print("New efficiency of %s is %s" % [node.systemName, String(newMinEff)])
#	return .extend(ship)
	#print("%s just fired" % systemName)
			
onready var ventRemass = $VentRemass
onready var processingA = $Processing
onready var proStart = $ProStart
onready var proStop = $ProStop

onready var area = get_node_or_null("ProcessingArea")
onready var top = get_node_or_null("ProcessingArea/ZoneTop")
onready var bottom = get_node_or_null("ProcessingArea/ZoneBottom")

var ventingMineral = 0.0

var made_adjustment = false

var has_modified = false

var current_model = ""

var base

func _physics_process(delta):
	var ship = getShip()
	if not has_modified:
		if !ship.cutscene and ship.isPlayerControlled():
			modify_preproc_shape()
			var processor
			var reinstance = false
			var current_aux = ship.getConfig("cargo.aux")
			var current_mpu = ship.getConfig("cargo.equipment")
			if current_aux == systemName:
				if current_model != current_mpu:
					reinstance = true
					current_model = current_mpu
				var self_aux = systemName
				for node in ship.get_children():
					if "systemName" in node:
						var nname = node.name
						if node.systemName == current_mpu:
							processor = node
				if processor:
					var path = processor.filename
					if reinstance:
						if base != null:
							base.free()
						base = load(path).instance()
					if base == null:
						base = load(path).instance()
					var baseMineralEfficiency = base.mineralEfficiency
					var basekgps = base.kgps
					var basePowerDrawPerKg = base.powerDrawPerKg
					
					
					modifyProcessor(processor,baseMineralEfficiency,basekgps,basePowerDrawPerKg)
#				breakpoint
				
				
				
				
#				if "MineralProcessingUnit" in nname:
#					processors.append(node)
#			var num = processors.size()
#			if num == 0:
##				breakpoint
#				made_adjustment = true
#				has_modified = true
#			if num >= 1:
#				breakpoint
#				var MPU_BASE_KGPS = processor.kgps
#				var MPU_BASE_MINERAL_EFFICIENCY = processor.mineralEfficiency
#				for processor in processors:
#					modifyProcessor(processor)
#				has_modified = true
				
	
	ventingMineral = max(0, ventingMineral - delta)
	power = 0

	var venting = false
	var isproc = false
	
	if enabled:
		if self_kgps == 0 or powerDrawPerKg == 0:
			pass
		else:
			for p in processing:
				if Tool.claim(p):
					if "fillerContent" in p:
						if p.fillerContent > 0.01:
							var fillerMass = p.fillerContent * p.mass
							var mineralMass = p.mineralContent * p.mass
							var procDelta = min(fillerMass, delta * self_kgps / 1000)
							var requiredPower = procDelta * powerDrawPerKg * 1000
							var gotPower = ship.drawEnergy(requiredPower)
							if gotPower / requiredPower > 0.9:
								# for some reason it doesn't work if this isn't in place
								var nm = max(mineralMass, p.mass - procDelta)
								
								if nm > 0:
									p.mass = nm
									p.mineralContent = mineralMass / nm
								
								p.fillerContent = 1 - p.mineralContent
								# stuff from the original imp
								var newMass = max(mineralMass, p.mass - procDelta)
								var massChange = p.mass - newMass
								var shipRemass = ship.reactiveMass
								var procRemass = massChange * 1000 * self_remassEfficiency
								var newRemass = clamp(shipRemass + procRemass, 0, ship.reactiveMassMax)
								ship.reactiveMass = newRemass
								isproc = true
								power += 1.0
								venting = (newRemass - shipRemass < procRemass / 2)
								ship.cargoMass = max(ship.cargoMass - massChange * 1000, 0)
					else :
						if p.has_method("getScan") and p.getScan() == "H2O" and p.has_method("applyEnergyDamage"):
							var mad = max(1, p.mass / massDamageScale)
							var proc = min(p.mass, delta * self_kgps / 1000) * mad
							var requiredPower = proc * powerDrawPerKg * 1000 * delta * 60
							var gotPower = ship.drawEnergy(requiredPower)
							var prm = ship.reactiveMass
							if gotPower / requiredPower > 0.9:
								p.applyEnergyDamage(gotPower, p.global_position, delta)
								var st = self_remassEfficiency * proc * 1000
								var nrm = clamp(prm + st, 0, ship.reactiveMassMax)
								ship.reactiveMass = nrm
								isproc = true
								power += 1.0
								venting = (nrm - prm < st / 2)
				Tool.release(p)
							
	ventRemass.emitting = venting
	
	if ship.isPlayerControlled():
		if isproc:
			if not processingA.playing:
				processingA.play()
				proStart.play()
		else :
			if processingA.playing:
				processingA.stop()
				proStop.play()


func modifyProcessor(processor,nodeMinEff,nodeKGPS,nodePower):
	var newMinEff = clamp(nodeMinEff + (nodeMinEff * modify_mineralEfficiency),
		0, 0.95)

	var clp = clamp(modify_kgps_percent_multi,10,1000)
	var cc = clp/100.0
	var pl = nodeKGPS * cc
	var om = pl + modify_kgps_add
	var newKGPS = int(pl)
	
	var powerFactor = (float(newKGPS)/float(nodeKGPS))
	var newPower = int(nodePower * powerFactor)
	
	processor.set("mineralEfficiency", newMinEff)
	processor.set("kgps",newKGPS)
	processor.set("powerDrawPerKg",newPower)

									
func _on_ProcessingArea_body_entered(body):
	
	processing.append(body)

func _on_ProcessingArea_body_exited(body):
	
	processing.remove(processing.find(body))

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
	
