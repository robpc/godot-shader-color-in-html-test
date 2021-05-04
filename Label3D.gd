extends Position3D

onready var label = $Label

func get_camera():
	return get_node('/root').get_viewport().get_camera()

func position_label():
	var camera = get_camera()
	var cam_pos = camera.translation
	var offset = Vector2(label.get_size().x/2, 0)
	var pos = camera.unproject_position(global_transform.origin) - offset
	label.rect_position = pos

func _process(_delta):
	var cam = get_camera()
	if not cam.is_position_behind(global_transform.origin):
		#if global_transform.origin.distance_to(cam.global_transform.origin) < 8.0:
			position_label()
