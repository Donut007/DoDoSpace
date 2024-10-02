extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var Bullet:PackedScene
@export var stat:damage_control
@export var _MaxSpeed:float = 1000.0;
@export var _Accel:float = 1000.0;
@onready var _fire_cooldown = $Fire_Cooldown
var _delta:float = 0.0;


func _ready() -> void:
	_fire_cooldown.wait_time = Bullet.instantiate().stat.cooldown
	_fire_cooldown.start()
	
func _physics_process(delta):
	_delta = delta
	#CalculateMovement()
	EasyMovement()

func EasyMovement():
	var X_vector = int(Input.is_action_pressed("Right"))-int(Input.is_action_pressed("Left"))
	var Y_vector = int(Input.is_action_pressed("Down"))-int(Input.is_action_pressed("Up"))	
	var move_pos:Vector2 = Vector2(X_vector,Y_vector).normalized();
	position += move_pos*_delta*_MaxSpeed
	move_and_slide()
	
func CalculateMovement():
	var X_vector = int(Input.is_action_pressed("Right"))-int(Input.is_action_pressed("Left"))
	var Y_vector = int(Input.is_action_pressed("Down"))-int(Input.is_action_pressed("Up"))	
	var move_pos:Vector2 = Vector2(X_vector,Y_vector).normalized();
	
	if move_pos == Vector2.ZERO:
		if velocity.length() > (_Accel*_delta):
			velocity -= velocity.normalized()*(_Accel*_delta);
		else:
			velocity = Vector2.ZERO
	else:
		velocity += move_pos*_Accel*_delta
		velocity = velocity.limit_length(_MaxSpeed)
	move_and_slide()

func _process(delta: float):
	if Input.is_action_just_pressed("Fire"):
		var bullet:Area2D = Bullet.instantiate()
		bullet._creater = self
		Global.currentScene.add_child(bullet)
		bullet.global_position = $Marker2D.global_position
		
func getHit(damage:float):
	stat.HP -= damage
	if stat.HP <= 0:
		queue_free()
		
