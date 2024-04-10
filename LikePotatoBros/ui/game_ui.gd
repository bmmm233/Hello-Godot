extends CanvasLayer

@onready var hp_value_bar = $%hp_value_bar
@onready var exp_value_bar = $%exp_value_bar
@onready var gold = $%gold

@onready var now_round = $%now_round
@onready var time_show = $%time_show
@onready var timer = $count_down/Timer

signal round_stop;

var player;
var now_round_num = 0:
	set(val):
		now_round_num = val
		now_round.text = "第%s波" % [str(val)]
var round_time = 3:
	set(val):
		round_time = val
		time_show.text = str(val)

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("player")
	_init_round()
	pass # Replace with function body.

func _init_round():
	now_round_num += 1
	round_time = 15
	timer.start()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hp_value_bar.max_value = player.max_hp
	hp_value_bar.value = player.now_hp
	hp_value_bar.get_node("Label").text = str(player.now_hp) + "/" + str(player.max_hp)
	
	exp_value_bar.max_value = player.max_exp
	exp_value_bar.value = player.now_exp
	exp_value_bar.get_node("Label").text = "Lv." + str(player.level)
	
	gold.text = str(player.gold)
	pass

func _on_timer_timeout():
	round_time -= 1
	if round_time <= 0:
		timer.stop()
		emit_signal("round_stop")
	pass # Replace with function body.
