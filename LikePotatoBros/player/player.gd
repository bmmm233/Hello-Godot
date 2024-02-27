extends CharacterBody2D

@onready var playerAni = $AnimatedSprite2D

#设置方向
var dir = Vector2.ZERO
var speed = 600
var flip = false
var can_Move = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var self_pos = position
	#归一化？确定方向
	if mouse_pos.x >= self_pos.x:
		flip = false
	else:
		flip = true
	playerAni.flip_h = flip
	dir = (mouse_pos-self_pos).normalized()
	if can_Move:
		velocity = dir * speed
		move_and_slide()
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		can_Move = false
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.is_pressed():
		can_Move = true


func _on_stop_mouse_entered():
	can_Move = false # Replace with function body.


func _on_stop_mouse_exited():
	can_Move = true # Replace with function body.
