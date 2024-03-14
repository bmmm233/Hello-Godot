extends Node

var animation_scene = preload("res://animations/animations.tscn")
var animation_scene_obj = null

var duplicate_node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_scene_obj = animation_scene.instantiate()
	add_child(animation_scene_obj)
	
	var node_2d = Node2D.new()
	node_2d.name = "HHHHH"
	get_window().add_child.call_deferred(node_2d)
	duplicate_node = node_2d
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
