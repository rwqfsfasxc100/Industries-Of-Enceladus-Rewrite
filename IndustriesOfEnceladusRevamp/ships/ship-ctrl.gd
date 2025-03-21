extends "res://ships/ship-ctrl.gd"

export var crewBonus = 0

func _ready():
	CurrentGame.validateEmployment()
	pass

func sensorGet(sensor):
	match sensor:
		"hold":
			match processedCargoStorageType:
				"divided":
					return processedCargoCapacity * 6
				"amorphic":
					return processedCargoCapacity
				"mono":
					return processedCargoCapacity
		"hold.fill":
			return getProcessedCargoMass() / sensorGet("hold")
		"crew.quality":
			return crewMoraleBonus + 1
		_:
			return .sensorGet(sensor)

func hasFbw()->bool:
	var typePatch = getAutopilotType()
	
	match typePatch:
		"SYSTEM_AUTOPILOT_337MOD":
			return true
		_:
			return .hasFbw()
	
func autopilotControl(delta, fbw = false):
	var solveThrust = false
	var observeRotation = false
	var computeRotation = false
	
	.autopilotControl(delta, hasFbw())
	
	var typePatch = getAutopilotType()
	
	match (typePatch):
		"SYSTEM_AUTOPILOT_337MOD":
			solveThrust = true
			observeRotation = true
			computeRotation = false
# don't know how, don't know why, but this is necessary
# this is gonna be a bastard to update every time a patch affects this code
# sorry in advance
		"SYSTEM_AUTOPILOT_MK4":
			solveThrust = true
			observeRotation = true
			computeRotation = true
			if not ai:
				aiImperativeStrenght = 100.0
				aiImperative = AI.go
				var rotationOverride = autopilotDesiredRotation
				if autopilotVelocityOffsetTarget:
					aiImperativeTarget = autopilotVelocityOffsetTarget
					if Input.is_action_pressed("autopilot_stop"):
						aiImperative = AI.shadow
					else :
						if CurrentGame.isValidCargo(aiImperativeTarget):
							aiImperative = AI.catch
						else :
							aiImperative = AI.watch
				else :
					aiImperative = AI.go
					aiImperativeTarget = null
				if autopilotVectorAdjust or autopilotVelocityOffsetTarget or autopilotHeadingAdjust:
					if not adjustingAI:
						autopilotDesiredVelocity = aiImperativeDirection
						mouseOffsetForAutopilotDesiredVelocity = autopilotDesiredVelocity
						adjustingAI = true
					else :
						aiImperativeDirection = autopilotDesiredVelocity
				else :
					adjustingAI = false

				if not cutscene and not autopilotVectorAdjust and not fbw and not autopilotHeadingAdjust and not trajectoryTarget:
					aiControl(lastDelta)
				if autopilotHeadingAdjust:
					autopilotDesiredRotation = rotationOverride
			else :
				adjustingAI = false

# done to make crew count increases work
# i call setupShip to safe crew count increases prior to actually increasing
# them with CrewModifiers
func setupShip():
	self.setConfig("crewCount", crew)
	.setupShip()
