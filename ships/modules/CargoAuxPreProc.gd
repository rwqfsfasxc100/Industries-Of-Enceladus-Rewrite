extends "res://IndustriesOfEnceladusRevamp/ships/modules/CargoAuxBase.gd"

# ok this is very stupid
# _physics_process can't be explicitly overriden in 3.5.3
# goddamnit. i have to cpy the entire fucking thing
# fuck! fuck! fuck!

export  var ventTime = 0.5
export  var massDamageScale = 20.0
export  var kgps = 100
export  var powerDrawPerKg = 100
export (float, 0, 1, 0.05) var mineralEfficiency = 0.0
export (float, 0, 1, 0.05) var remassEfficiency = 0.5

export  var enabled = true

var processing = []
var power = 0

func getStatus():
	return 100
func getPower():
	return clamp(power, 0, 1)

var NodeAccess = preload("res://HevLib/pointers/NodeAccess.gd")

func extend(ship):
	# and this part which boosts MPU efficiency
	for node in ship.get_children():
		var valid = node.is_processing()
		if valid:
			if "MineralProcessingUnit" in node.name:
				var nodeMinEff = node.mineralEfficiency
				var newMinEff = clamp(nodeMinEff + (nodeMinEff * mineralEfficiency),
					0, 0.95)
				# clamped to 0.95 since it'll violate the laws of physics otherwise
				# maybe 1? i can change it later i guess
				ship.set("mineralEfficiency", newMinEff)
				#print("New efficiency of %s is %s" % [node.systemName, String(newMinEff)])
	pass
	#print("%s just fired" % systemName)
			
onready var ventRemass = $VentRemass
onready var processingA = $Processing
onready var proStart = $ProStart
onready var proStop = $ProStop
	
var ventingMineral = 0.0

func _physics_process(delta):
	ventingMineral = max(0, ventingMineral - delta)
	power = 0

	var venting = false
	var isproc = false
	
	if enabled:
		for p in processing:
			if Tool.claim(p):
				if "fillerContent" in p:
					if p.fillerContent > 0.01:
						var fillerMass = p.fillerContent * p.mass
						var mineralMass = p.mineralContent * p.mass
						var procDelta = min(fillerMass, delta * kgps / 1000)
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
							var procRemass = massChange * 1000 * remassEfficiency
							var newRemass = clamp(shipRemass + procRemass, 0, ship.reactiveMassMax)
							ship.reactiveMass = newRemass
							isproc = true
							power += 1.0
							venting = (newRemass - shipRemass < procRemass / 2)
							ship.cargoMass = max(ship.cargoMass - massChange * 1000, 0)
				else :
					if p.has_method("getScan") and p.getScan() == "H2O" and p.has_method("applyEnergyDamage"):
						var mad = max(1, p.mass / massDamageScale)
						var proc = min(p.mass, delta * kgps / 1000) * mad
						var requiredPower = proc * powerDrawPerKg * 1000 * delta * 60
						var gotPower = ship.drawEnergy(requiredPower)
						var prm = ship.reactiveMass
						if gotPower / requiredPower > 0.9:
							p.applyEnergyDamage(gotPower, p.global_position, delta)
							var st = remassEfficiency * proc * 1000
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


									
func _on_ProcessingArea_body_entered(body):
	
	processing.append(body)

func _on_ProcessingArea_body_exited(body):
	
	processing.remove(processing.find(body))
