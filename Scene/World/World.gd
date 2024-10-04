extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var scene_1 = preload("res://Scene/Scene_1/Scene_1.tscn").instantiate()
	add_child(scene_1)
