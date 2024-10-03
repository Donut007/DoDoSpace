extends Area2D
class_name module_bullet

@export_category('Bullet setting')
@export var BulletName:String
@export var Damage:float
@export var Speed:float
@export var cooldown:float

var _creater:CharacterBody2D
var dir:Vector2
