extends "res://hud/AutopilotOverlay.gd"

func _draw():
	var lidarNode = ship.lidar
	var cam = ship.get_global_transform_with_canvas()
	var center = cam.origin
	
	if lidarNode and autopilotType == "SYSTEM_AUTOPILOT_337MOD":
		drawLidar(lidarNode, center, overcircle, lidarSize)
