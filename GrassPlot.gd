tool
extends MultiMeshInstance

export var extents := Vector2.ONE
export var density: int = 6

func _enter_tree():
	var error = connect("visibility_changed", self, "_on_WindGrass_visibility_changed")
	if error:
		print_debug(error)


func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	
	var size = extents * 2
	var area = size.x * size.y
	var total = area * density
	
	multimesh.instance_count = total
	for i in multimesh.instance_count:
		var cx = (i % int(size.x)) - extents.x
		var cy = int(i / (size.x * density)) - extents.y
		var transform := Transform().rotated(Vector3.UP, rng.randf_range(-PI / 2, PI / 2))
		var x: float = rng.randf() + cx
		var z: float = rng.randf() + cy 

		transform.origin = Vector3(x, 0, z)

		multimesh.set_instance_transform(i, transform)

	print('size=', size, ' area=', area, ' total=',total)

func _on_WindGrass_visibility_changed():
	if visible:
		_ready()
