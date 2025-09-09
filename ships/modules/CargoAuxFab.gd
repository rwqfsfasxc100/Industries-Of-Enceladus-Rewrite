extends "res://IndustriesOfEnceladusRevamp/ships/modules/CargoAuxBase.gd"

export  var dronePrintTime = 0.0
export  var bulletPrintTime = 0.0
export  var powerDrawPrint = 70000.0
export (bool) var enabled = true
export  var modify_kgps_add = 0
export  (int, 10, 1000, 1) var modify_kgps_percent_multi = 100
onready var area = get_node_or_null("ProcessingArea")
onready var top = get_node_or_null("ProcessingArea/ZoneTop")
onready var bottom = get_node_or_null("ProcessingArea/ZoneBottom")
const droneUnit = 0.1
const droneCostPerKg = {
	"Fe":0.8, 
	"Pt":0.2
}

const massDriverUnit = 10.0
const massDriverCostPerKg = {
	"Fe":0.9, 
	"V":0.1
}

onready var printA = $PrintAudio

onready var dronePrintCtr = dronePrintTime
onready var bulletPrintCtr = bulletPrintTime

var power = 0

func getStatus():
	return 100
func getPower():
	return clamp(power, 0, 1)

func tryToDraw(cost:Dictionary, unit:float)->bool:
	var have = true
	for m in cost:
		var how = cost[m] * unit
		if ship.getProcessedCargo(m) < how:
			have = false
	if not have:
		return false
		
	for m in cost:
		var how = cost[m] * unit
		ship.removeProcessedCargo(m, how)
	return true

var made_adjustment = false

var has_modified = false

var current_model = ""

var base

func _physics_process(delta):
	
	if not has_modified:
		var ship = getShip()
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
					
					modifyProcessor(processor,basekgps,basePowerDrawPerKg)
				
#				breakpoint
				
	if enabled:
		if Tool.claim(ship):
			if ship.droneParts + droneUnit <= ship.dronePartsMax and powerDrawPrint > 0:
				if dronePrintCtr < dronePrintTime:
					var p = powerDrawPrint * delta
					if ship.drawEnergy(p) >= p * 0.9:
						dronePrintCtr += delta
						
			if ship.massDriverAmmo + massDriverUnit <= ship.massDriverAmmoMax and powerDrawPrint > 0:
				if bulletPrintCtr < bulletPrintTime:
					var p = powerDrawPrint * delta
					if ship.drawEnergy(p) >= p * 0.9:
						bulletPrintCtr += delta
					
			if bulletPrintTime > 0 and bulletPrintCtr >= bulletPrintTime:
				if tryToDraw(massDriverCostPerKg, massDriverUnit):
					ship.addAmmo(massDriverUnit)
					bulletPrintCtr -= bulletPrintTime
					if bulletPrintTime > 1:
						if ship.isPlayerControlled() and printA:
							printA.play()
							
			if dronePrintTime > 0 and dronePrintCtr >= dronePrintTime:
				if tryToDraw(droneCostPerKg, droneUnit):
					ship.addDrones(droneUnit)
					dronePrintCtr -= dronePrintTime
					if dronePrintTime > 1:
						if ship.isPlayerControlled() and printA:
							printA.play()
							
			Tool.release(ship)


func modifyProcessor(processor,nodeKGPS,nodePower):
	
	var clp = clamp(modify_kgps_percent_multi,10,1000)
	var cc = clp/100.0
	var pl = nodeKGPS * cc
	var om = pl + modify_kgps_add
	var newKGPS = int(pl)
	
	var powerFactor = float((float(newKGPS)/float(nodeKGPS)))
	var newPower = int(nodePower * powerFactor)
	
	processor.set("powerDrawPerKg",newPower)
	processor.set("kgps",newKGPS)

func adjustShape(data):
	if "rotation" in data:
		var d = data["rotation"]
		self.rotation = deg2rad(d)
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
			self.rotation = deg2rad(data)
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
			self.rotation = deg2rad(data)
		if systemName in sdata:
			var data = sdata[systemName]
			adjustShape(data)
	
