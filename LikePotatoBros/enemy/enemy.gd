extends CharacterBody2D

var dir = Vector2.ZERO
var speed = 200
var target = null
var hp = 6

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

func enemy_hurt(hurt):
	self.hp -= hurt
	enemy_flash()
	# 添加受伤动画
	GameMain.animation_scene_obj.run_animation({
		"box": self,
		"ani_name": "enemy_hurt",
		"position": Vector2(0, 0),
		"scale": Vector2(1.1, 1.1)
	})
	
	if self.hp <= 0:
		enemy_dead()

func enemy_dead():
	# 添加死亡动画
	GameMain.animation_scene_obj.run_animation({
		"ani_name": "enemy_dead",
		"position": self.global_position,
		"scale": Vector2(0.7, 0.7)
	})
	# 添加掉落物
	GameMain.drop_item_scene_obj.gen_drop_item({
		"ani_name": "gold",
		"position": self.global_position,
		"scale": Vector2(3, 3)
	})
	self.queue_free()
	pass
	
func enemy_flash():
	$AnimatedSprite2D.material.set_shader_parameter("flash_opacity", 1)
	await get_tree().create_timer(0.1).timeout
	$AnimatedSprite2D.material.set_shader_parameter("flash_opacity", 0)
