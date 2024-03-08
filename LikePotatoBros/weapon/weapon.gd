extends Node2D

@onready var weaponAni = $AnimatedSprite2D
@onready var shoot_pos = $shoot_pos
@onready var timer = $Timer

var bullet_shoot_time = 0.5
var bullet_speed = 2000
var bullet_hurt = 1

const weapon_level = {
	level1 = "#b0c3d9",
	level2 = "#4b69ff",
	level3 = "#d32ce6",
	level4 = "#8847ff",
	level5 = "#eb4b4b"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	var ran = RandomNumberGenerator.new();
	#var materialTemp = weaponAni.material.duplicate();
	#weaponAni.material = materialTemp;
	weaponAni.material.set_shader_parameter("color", Color(weapon_level["level"+str(ran.randi_range(1,5))]));
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	pass # Replace with function body.
