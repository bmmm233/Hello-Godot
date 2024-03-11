extends Node

var animation_scene = preload("res://animations/animations.tscn")
var animation_scene_obj = null

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_scene_obj = animation_scene.instantiate()
	add_child(animation_scene_obj)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
