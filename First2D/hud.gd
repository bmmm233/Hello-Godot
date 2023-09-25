extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_message_timer_timeout():
	$Message.hide()

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func update_score(score):
	$ScoreLabel.text = str(score)

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("游戏结束!")
	# 等待时间结束
	await $MessageTimer.timeout
	
	$Message.text = "躲开他们"
	# 创造一个一次性计时器并等待完成
	await get_tree().create_timer(1.0).timeout
	$Message.show()
	$StartButton.show()
