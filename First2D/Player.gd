extends Area2D

@export var speed = 400
var screen_size
signal hit

func _ready():
	hide()
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 0.1
	if Input.is_action_pressed("move_right"):
		velocity.x += 0.1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 0.1
	if Input.is_action_pressed("move_down"):
		velocity.y += 0.1
	
	if velocity.length() >= 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0

func _on_body_entered(body):
	hide() # 玩家受伤后隐藏
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
