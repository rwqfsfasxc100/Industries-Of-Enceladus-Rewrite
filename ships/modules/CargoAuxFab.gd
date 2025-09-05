extends "res://IndustriesOfEnceladusRevamp/ships/modules/CargoAuxBase.gd"

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
	
var processor

var made_adjustment = false

var has_modified = false

var MPU_BASE_KGPS = 100

func _physics_process(delta):
	
	if not has_modified:
		if !ship.cutscene and ship.isPlayerControlled():
			var processors = []
			for node in ship.get_children():
				var nname = node.name
				var inst = is_instance_valid(node)
				var valid = node.is_processing()
				if "MineralProcessingUnit" in nname and inst:
					processors.append(node)
			var num = processors.size()
			if num == 0:
#				breakpoint
				made_adjustment = true
				has_modified = true
			if num == 1:
#				breakpoint
				processor = processors[0]
				MPU_BASE_KGPS = processor.kgps
				has_modified = true
				
	if has_modified and not made_adjustment:
		if processor:

			var nodeKGPS = processor.kgps
			var newKGPS = (nodeKGPS * (clamp(modify_kgps_percent_multi,10,1000)/100)) + modify_kgps_add
			
			var nodePower = processor.powerDrawPerKg
			var powerFactor = (newKGPS/nodeKGPS)
			var newPower = nodePower * powerFactor
			
			processor.set("kgps",newKGPS)
			made_adjustment = true
		else:
			breakpoint
	
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
