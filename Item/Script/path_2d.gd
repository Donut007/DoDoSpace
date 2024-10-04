extends Path2D

@export var _speed:float = 100.0

func _physics_process(delta):
	for item  in get_children() as Array[PathFollow2D]:
		item.progress += _speed*delta
