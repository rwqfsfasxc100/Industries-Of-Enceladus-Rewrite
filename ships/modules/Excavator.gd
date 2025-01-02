extends "res://ships/Front Bumper.gd"

export (bool) var removeThis = false

func _ready():
	#print("Firing Excavator code")
	if removeThis:
		self.queue_free()
