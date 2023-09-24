extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	# new_game()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_score_timer_timeout():
	score += 1

func _on_mob_timer_timeout():
	# 新建一个mob实例
	var mob = mob_scene.instantiate() 
	# 在路径上随便选择一个位置
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	# 设方向为垂直于路径方向
	var direction = mob_spawn_location.rotation + PI / 2
	# 将敌人的位置设为随机位置
	mob.position = mob_spawn_location.position
	# 为方向增加一点随机性
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	# 为敌人增加速度
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	# 通过添加生物到主场景来生成生物
	add_child(mob)
	
	
	
