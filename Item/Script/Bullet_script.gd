extends Area2D
@export var stat:Model_Bullet

var _creater:CharacterBody2D

func _physics_process(delta):
	var dir = Vector2(0,-1)
	translate(dir*delta*stat.Speed)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body == _creater:
		return
	body.getHit(stat.Damage)
	queue_free()
