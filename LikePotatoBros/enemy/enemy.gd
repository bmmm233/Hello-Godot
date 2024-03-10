extends CharacterBody2D

var dir = Vector2.ZERO
var speed = 200
var target = null
var hp = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_tree().get_first_node_in_group("player")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target:
		dir = (target.global_position - self.global_position).normalized()
		velocity = dir * speed
		move_and_slide()
	pass
