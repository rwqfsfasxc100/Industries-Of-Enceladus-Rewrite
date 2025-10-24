extends "res://IndustriesOfEnceladusRewrite/ships/modules/CargoAuxBase.gd"

export  var dronePrintTime = 0.0
export  var bulletPrintTime = 0.0
export  var powerDrawPrint = 70000.0
export (bool) var enabled = true
export  var modify_kgps_add = 0
export  (int, 10, 1000, 1) var modify_kgps_percent_multi = 100

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

var baseMineralEfficiency = 0
var basekgps = 0
var basePowerDrawPerKg = 0

func _physics_process(delta):
	
	var ship = getShip()
	if !ship.cutscene and ship.isPlayerControlled():
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
				if not has_modified:
					baseMineralEfficiency = processor.mineralEfficiency
					basekgps = processor.kgps
					basePowerDrawPerKg = processor.powerDrawPerKg
					modifyProcessor(processor,basekgps,basePowerDrawPerKg)
					has_modified = true
				else:
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
