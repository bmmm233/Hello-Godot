extends CharacterBody2D

@onready var playerAni = $playerAni

#设置方向
var dir = Vector2.ZERO
var speed = 600
var flip = false
var can_Move = true
var stop = false

var now_hp = 100
var max_hp = 100
var max_exp = 5
var now_exp = 0
var level = 1
var gold = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	choosePlayer("player1")
	pass # Replace with function body.

func choosePlayer(type):
	var player_path = "res://player/assets/"
	playerAni.sprite_frames.clear_all()
	var sprite_frame_custom = SpriteFrames.new()
	#sprite_frame_custom.set_animation_loop("default", true)
	var texture_size = Vector2(960, 240)
	var sprite_size = Vector2(240, 240)
	# 获取雪碧图
	var full_texture:Texture = load(player_path + "/" + type + "-sheet.png")
	# 准备自动化，先分割，获取列数
	var num_columns = int(texture_size.x / sprite_size.x)
	var num_row = int(texture_size.y / sprite_size.y)
	
	for x in num_columns:
		for y in num_row:
			var frame = AtlasTexture.new()
			frame.atlas = full_texture
			frame.region = Rect2(Vector2(x, y) * sprite_size, sprite_size)
			sprite_frame_custom.add_frame("default", frame)
	
	playerAni.sprite_frames = sprite_frame_custom
	playerAni.play("default")
	
	pass

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


func _on_drop_item_area_body_entered(body):
	if body.is_in_group("drop_item"):
		self.now_exp += 1
		if self.now_exp >= self.max_exp:
			self.level += 1
			self.now_exp = 0
		body.canMoving = true
	pass # Replace with function body.


func _on_stop_body_entered(body):
	if body.is_in_group("enemy"):
		self.now_hp -= 1
	if body.is_in_group("drop_item"):
		body.queue_free()
	pass # Replace with function body.
