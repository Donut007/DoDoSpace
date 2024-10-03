extends CharacterBody2D

@export var Bullet:PackedScene
@export var stat:damage_control
@onready var _fire_cooldown = $Fire_Cooldown
var _default_bullet:module_bullet

func _ready():
	_default_bullet = Bullet.instantiate()
	_fire_cooldown.wait_time = _default_bullet.cooldown
	_fire_cooldown.start()
	
func _on_fire_cooldown_timeout():
	var bullet:module_bullet = Bullet.instantiate()
	bullet._creater = self
	Global.currentScene.add_child(bullet)
	bullet.global_position = $Marker2D.global_position
	
func getHit(damage:float):
	stat.HP -= damage
	if stat.HP <= 0:
		queue_free()
