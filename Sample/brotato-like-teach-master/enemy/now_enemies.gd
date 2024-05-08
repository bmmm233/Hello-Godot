extends Node2D

@onready var enemy = preload("res://enemy/enemy.tscn")
var tilemap = null

# Called when the node enters the scene tree for the first time.
func _ready():
	tilemap = get_tree().get_first_node_in_group("map")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var ran = RandomNumberGenerator.new()
	var num = ran.randi_range(0, len(tilemap.get_used_cells(0)) - 1)
	#print(len(tilemap.get_used_cells(0)) - 1)
	#var local_position = tilemap.map_to_local(tilemap.get_used_cells(0)[num])
	var local_position = tilemap.map_to_local(tilemap.get_used_cells(0)[499])
	print("raw:"+str(local_position))
	print((local_position)/16)
	var enemyTemp = enemy.instantiate()
	enemyTemp.position = local_position * Vector2(6,6)
	self.add_child(enemyTemp)
	pass # Replace with function body.

func delete_enemies():
	for n in self.get_children():
		if n.name != 'Timer':
			self.remove_child(n)
			n.queue_free()
	pass
