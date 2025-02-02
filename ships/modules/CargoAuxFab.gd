extends "res://IndustriesOfEnceladusRevamp/ships/modules/CargoAuxBase.gd"

export  var dronePrintTime = 0.0
export  var bulletPrintTime = 0.0
export  var powerDrawPrint = 70000.0
export (bool) var enabled = true

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
	
func _physics_process(delta):
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
