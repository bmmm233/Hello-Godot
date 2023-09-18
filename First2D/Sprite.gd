extends Sprite2D

signal health_depleted(old_health, new_health)

var health = 10
var speed = 400
var angular_speed = PI

func _init():
	pass

func _ready():
	var timer = get_node("Timer1")
	timer.connect("timeout", _on_Timer_timeout)
	
func _on_Timer_timeout():
	visible = not visible

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()

func _on_button_pressed():
	set_process(not is_processing())

func take_damage(amount):
	var old_health = health
	var new_health = health - amount
	if health <= 0:
		emit_signal("health_depleted", old_health, new_health)
