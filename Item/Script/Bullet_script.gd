extends module_bullet

func _ready() -> void:
	var rot = _creater.rotation
	dir = Vector2(0,-1).rotated(_creater.rotation)
	rotate(_creater.rotation)
	
func _physics_process(delta):
	translate(dir*delta*Speed)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	var target = body as Node2D
	var target_group = target.get_groups()
	var owner_group = _creater.get_groups()
	var isSameGroup:bool = target_group.any(func(g):return owner_group.any(func(o):return o==g))
	
	if isSameGroup or (body as CharacterBody2D) == null:
		return
	body.getHit(Damage)
	queue_free()
