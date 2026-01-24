extends "res://IndustriesOfEnceladusRewrite/ships/modules/CargoAuxBase.gd"

# ok this is very stupid
# _physics_process can't be explicitly overriden in 3.5.3
# goddamnit. i have to cpy the entire fucking thing
# fuck! fuck! fuck!

export  var ventTime = 0.5
export  var massDamageScale = 20.0
export  var self_kgps = 100
export  var powerDrawPerKg = 100
export (int, 50, 150) var modify_mineralEfficiency = 100
export (float, 0, 1, 0.05) var self_remassEfficiency = 0.5
export (int) var modify_kgps_add = 0
export  (int, 10, 1000, 1) var modify_kgps_percent_multi = 100

export (float) var tunable_speed_min = 0.5
export (float) var tunable_speed_max = 1.5

export (int,-50,50,1) var tunable_mpu_min = -15
export (int,-50,50,1) var tunable_mpu_max = 15

export  var enabled = true


var processing = []
var power = 0

func getStatus():
	return 100
func getPower():
	return clamp(power, 0, 1)

func get_preprocessor_kgps() -> float:
	return ship.getTunedValue(slotName, "IOE_TUNE_PREPROC_RECLAIM", self_kgps)

func get_preprocessor_efficiency() -> float:
	var tuned = ship.getTunedValue(slotName, "IOE_TUNE_PREPROC_RECLAIM", self_kgps)
	var val = pow(self_remassEfficiency,tuned / self_kgps)
	return val

func get_mpu_efficiency() -> float:
	return ship.getTunedValue(slotName, "IOE_TUNE_PREPROC_MODIFY", modify_mineralEfficiency)

func get_mpu_speed() -> float:
	var tuned = float(ship.getTunedValue(slotName, "IOE_TUNE_PREPROC_MODIFY", modify_mineralEfficiency))
	
	var val = pow(modify_kgps_percent_multi, 2.0 - (tuned / float(modify_mineralEfficiency)))
	return val

func powerFromRatio(x: float) -> float:
	return ((1.0 / (x * (2.0 - x)) - 1) * 1.8 + 1)

func get_power():
	var dynamicKgps = get_preprocessor_kgps()
	var ratio = dynamicKgps / self_kgps
	var pv = powerFromRatio(ratio) * dynamicKgps
	var powerDrawKw = (powerDrawPerKg * pv)/self_kgps
	return powerDrawKw

func get_mpu_power():
	var dynamicKgps = (get_mpu_speed()/100) * self_kgps
	var ratio = dynamicKgps / basekgps
	var pv = powerFromRatio(ratio) * dynamicKgps
	var powerDrawKw = (basePowerDrawPerKg * pv)/basekgps
	return powerDrawKw

func getParameters():
	if self_kgps == 0 or powerDrawPerKg == 0:
		return {}
	var powerDrawKw = get_power()
	var powerDrawHuman = ["%s" % [CurrentGame.formatThousands(powerDrawKw / 1000)], "MW"] if powerDrawKw > 1000 else ["%s" % [CurrentGame.formatThousands(powerDrawKw)], "kW"]
	var out = {}
	if self_remassEfficiency > 0.0 or self_kgps > 0.0:
		out.merge({"IOE_TUNE_PARAMETER_PREPROC_MELT_REMASS_EFFICIENCY": ["%.1f" % [(get_preprocessor_efficiency() * 100.0)], "%"]})
		out.merge({"IOE_TUNE_PARAMETER_PREPROC_MELT_POWER_DRAW": powerDrawHuman})
	if modify_mineralEfficiency != 100 or modify_kgps_percent_multi != 100:
		out.merge({"IOE_TUNE_PARAMETER_PREPROC_MPU_EFFICIENCY_MODIFIER": ["%.1f" % [get_mpu_speed()], "%"]})
		
	return out

func getTuneables():
	if self_kgps <= 0.0 or powerDrawPerKg <= 0.0:
		return {}
	var out = {}
	if self_remassEfficiency > 0.0:
		out.merge({"IOE_TUNE_PREPROC_RECLAIM": {
			"type": "float", 
			"min": float(self_kgps) * tunable_speed_min, 
			"max": float(self_kgps) * tunable_speed_max, 
			"step": ceil(float(self_kgps) / 100), 
			"default": self_kgps, 
			"current": get_preprocessor_kgps(), 
			"unit": "kg/s", 
			"testProtocol": "cargo"
		}})
	if modify_mineralEfficiency != 100 or modify_kgps_percent_multi != 100:
		out.merge({"IOE_TUNE_PREPROC_MODIFY": {
			"type": "float", 
			"min": modify_mineralEfficiency + tunable_mpu_min, 
			"max": modify_mineralEfficiency + tunable_mpu_max, 
			"step": 1, 
			"default": modify_mineralEfficiency, 
			"current": get_mpu_efficiency(), 
			"unit": "%", 
			"testProtocol": "cargo"
		}})
	return out

var processor = null

func _ready():
#	yield(get_tree(),"idle_frame")
	ship = getShip()
#	if !ship.cutscene and ship.isPlayerControlled():
		
#	var reinstance = false
	var current_aux = ship.getConfig("cargo.aux")
	var current_mpu = ship.getConfig("cargo.equipment")
	if current_aux == systemName:
		if current_model != current_mpu:
#			reinstance = true
			current_model = current_mpu
		var self_aux = systemName
		for node in ship.get_children():
			if "systemName" in node:
				var nname = node.name
				if node.systemName == current_mpu:
					processor = node
		if processor:
			baseMineralEfficiency = processor.mineralEfficiency
			basekgps = processor.kgps
			basePowerDrawPerKg = processor.powerDrawPerKg
			modifyProcessor()

onready var ventRemass = $VentRemass
onready var processingA = $Processing
onready var proStart = $ProStart
onready var proStop = $ProStop

var ventingMineral = 0.0

var made_adjustment = false

var current_model = ""

var baseMineralEfficiency = 0
var basekgps = 0
var basePowerDrawPerKg = 0

func _physics_process(delta):
	ventingMineral = max(0, ventingMineral - delta)
	power = 0

	var venting = false
	var isproc = false
	
	if enabled:
		if self_kgps <= 0.0 or powerDrawPerKg <= 0.0:
			pass
		else:
			for p in processing:
				var current_kgps = get_preprocessor_kgps()
				var current_powerdraw = get_power()
				var current_remassefficiency = get_preprocessor_efficiency()
				if Tool.claim(p):
					if "fillerContent" in p:
						if p.fillerContent > 0.01:
							var fillerMass = p.fillerContent * p.mass
							var mineralMass = p.mineralContent * p.mass
							var procDelta = min(fillerMass, delta * current_kgps / 1000)
							var requiredPower = procDelta * current_powerdraw * 1000
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
								var procRemass = massChange * 1000 * current_remassefficiency
								var newRemass = clamp(shipRemass + procRemass, 0, ship.reactiveMassMax)
								ship.reactiveMass = newRemass
								isproc = true
								power += 1.0
								venting = (newRemass - shipRemass < procRemass / 2)
								ship.cargoMass = max(ship.cargoMass - massChange * 1000, 0)
					else :
						if p.has_method("getScan") and p.getScan() == "H2O" and p.has_method("applyEnergyDamage"):
							var mad = max(1, p.mass / massDamageScale)
							var proc = min(p.mass, delta * current_kgps / 1000) * mad
							var requiredPower = proc * current_powerdraw * 1000 * delta * 60
							var gotPower = ship.drawEnergy(requiredPower)
							var prm = ship.reactiveMass
							if gotPower / requiredPower > 0.9:
								p.applyEnergyDamage(gotPower, p.global_position, delta)
								var st = current_remassefficiency * proc * 1000
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


func modifyProcessor():
	var current_efficiency_multi = get_mpu_efficiency()
	
	
	var newMinEff = clamp(baseMineralEfficiency * (current_efficiency_multi/100), 0.05, 0.995)
	
	var current_speed_multi = get_mpu_speed()
	var clp = clamp(current_speed_multi,10,1000)
	var cc = clp/100.0
	var pl = basekgps * cc
	var om = pl + modify_kgps_add
	var newKGPS = int(pl)
	
	
	var newPower = get_mpu_power()
	
	processor.set("mineralEfficiency", newMinEff)
	processor.set("kgps",newKGPS)
	processor.set("powerDrawPerKg",newPower)

									
func _on_ProcessingArea_body_entered(body):
	
	processing.append(body)

func _on_ProcessingArea_body_exited(body):
	
	processing.remove(processing.find(body))
