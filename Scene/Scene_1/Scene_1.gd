extends Node2D

var speed = 100

func _ready():
	Global.currentScene = self
	
func _physics_process(delta):
	$Path2D/PathFollow2D.progress += speed*delta
