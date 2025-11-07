extends Node

export  var velocity = 2000
export  var randomVelocity = 500
export  var angular = 5.0
export  var number = 250
var aim = true
var clump = true

func _exit_tree():
	aimerAsteroids.clear()

export  var chaosLimit = 0.5
export  var densityLimit = 0.2

var drones = [
	preload("res://ships/drone/DroneMine.tscn"),
	preload("res://ships/drone/DroneMike.tscn"),
]
var pods = [
	preload("res://ships/Lifepod.tscn"),
]
var vessels_common = [
	"TRTL",
	"PROSPECTOR",
	"COTHON",
	"KITSUNE",
]
var vessels_common_variants = [
	"TRTL-LCB",
	"TRTL-R",
	"TRTL-T",
	"PROSPECTOR-LUX",
	"PROSPECTOR-VP",
	"PROSPECTOR-FAT",
	"COTHON-CHK",
	"COTHON-LND",
	"COTHON-V",
]

var vessels_rare = [
	"EIME",
	"AT225",
	"OCP209",
	"AT225-B",
	"TRTL-44",
]

var aimerAsteroids = [
	preload("res://asteroids/class-31.tscn"), 
	preload("res://asteroids/class-32.tscn"), 
	preload("res://asteroids/class-33.tscn"), 
	preload("res://asteroids/class-34.tscn"), 
	preload("res://asteroids/class-35.tscn"), 
	preload("res://asteroids/class-36.tscn"), 
	preload("res://asteroids/class-37.tscn"), 
	preload("res://asteroids/class-38.tscn"), 
	preload("res://asteroids/class-39.tscn"), 
	preload("res://asteroids/class-21.tscn"), 
	preload("res://asteroids/class-22.tscn"), 
	preload("res://asteroids/class-23.tscn"), 
	preload("res://asteroids/class-24.tscn"), 
	preload("res://asteroids/class-25.tscn"), 
	preload("res://asteroids/class-26.tscn"), 
	preload("res://asteroids/class-27.tscn"), 
	preload("res://asteroids/class-11.tscn"), 
	preload("res://asteroids/class-12.tscn"), 
	preload("res://asteroids/class-13.tscn")
]

export  var derelictConversation = preload("res://comms/conversation/DerelictConversation.tscn")

onready var asteroidField = get_tree().get_root().get_node_or_null("Game/AsteroidField")
var rng = RandomNumberGenerator.new()
func canBeAt(pos):
	var chaos = get_parent().getChaosAt(pos)
	if chaos < chaosLimit:
		return false
	var density = get_parent().getRawDensityAt(pos)
	if density > densityLimit:
		return false
	return true
func makeAt(pos):
	clump = false
	aim = false
	if randf() < 0.85:
		clump = true
	if randf() < 0.85:
		aim = true
	var out = []
	var player = CurrentGame.getPlayerShip()
	var ores = asteroidField.objectClass[-1]
	var pc = CurrentGame.globalCoords(player.position)
	var target = (pc - pos).normalized()
	var tv = target * velocity + player.linear_velocity
	var angularV = (randf() - 0.5) * angular
	rng.randomize()
	for i in range(number):
		var a = null
		if randf() < 0.6:
			var bp = aimerAsteroids[randi() % aimerAsteroids.size()]
			a = bp.instance()
			a.asteroidClass = 4
			if aim:
				a.linear_velocity = tv
		else:
			var mineral = ores[ores.keys()[randi() % ores.size()]]
			a = mineral[randi() % mineral.size()].instance()
			if aim:
				a.linear_velocity = tv
		a.angular_velocity = angularV
		if clump:
			a.connect("tree_entered", self, "doClump", [a, pos])
		if a:
			out.append(a)
	out.append_array(add_oddities(tv,angularV,pos))
	randomize()
	out.shuffle()
	return out

func procure_derelicts(current: Array,tv):
	var a = null
	if randf() < 0.15:
		if randf() < 0.95:
			a = make_derelict(vessels_rare[randi() % vessels_rare.size()])
		else:
			a = make_derelict("PROSPECTOR-BALD")
	else:
		if randf() < 0.4:
			a = make_derelict(vessels_common_variants[randi() % vessels_common_variants.size()])
		else:
			a = make_derelict(vessels_common[randi() % vessels_common.size()])
	if a:
		var player = CurrentGame.getPlayerShip()
		a.linear_velocity = tv * 1.2
	current.append(a)
	if randf() <= 0.33:
		current.append_array(procure_derelicts(current,tv))
	return current

func add_oddities(tv,angularV,pos):
	var oddities = []
	if randf() < 0.5:
		oddities.append_array(procure_derelicts([],tv))
	if randf() < 0.85:
		for i in range(randi() % 5):
			var a = drones[randi() % drones.size()].instance()
			a.ai = true
			a.preheat = false
			if aim:
				a.linear_velocity = tv * 0.8
			oddities.append(a)
	for i in range(randi() % 2):
		var a = pods[randi() % pods.size()].instance()
		if aim:
			a.linear_velocity = tv * 0.7
		
		oddities.append(a)
	for i in oddities:
		if clump:
			i.connect("tree_entered", self, "doClump", [i, pos])
		i.angular_velocity = angularV
	return oddities

func make_derelict(model):
	var a = Shipyard.createShipBuildByName(model, "helpless", randf() > 0.95)
	a.setReactorState(false)
	a.rotation = randf() * 2 * PI
	a.ai = true
	a.alwaysAI = true
	a.factionIndependent = true
	a.reactiveMass = 0
	a.aiMinimumReactiveMass = 0
	a.aiCuriosityDisance = 1500
	a.initialize = false
	a.abandoned = true
	a.hailable = false
	a.astrogating = false
	a.damageLimit = 1
	var dci = derelictConversation.instance()
	a.add_child(dci)
	a.dialogTree = a.get_path_to(dci)
	a.connect("setup", self, "applyExtraDamage", [a])
	return a

func doClump(what, towards):
	Debug.l("Clumping asteroid %s towards %s" % [what, towards])
	var pos = CurrentGame.globalCoords(what.position)
	var target = (towards - pos).normalized()
	var tv = target * velocity
	what.linear_velocity = tv
