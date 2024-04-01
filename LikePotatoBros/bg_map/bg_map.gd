extends Node2D

@onready var tilemap = $TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	random_tile()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func random_tile():
	tilemap.clear_layer(1)
	var bg1_cells = tilemap.get_used_cells(0)
	var ran = RandomNumberGenerator.new()
	for cell in bg1_cells:
		var num = ran.randi_range(0,100)
		if num <= 5:
			tilemap.set_cell(1,cell,0,Vector2i(18,1))
		if num <= 1:
			tilemap.set_cell(1,cell,0,Vector2i(9,3))


func _on_game_ui_round_stop():
	print("round_end")
	pass # Replace with function body.
