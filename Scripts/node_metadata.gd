class_name Node_MD extends Node2D

signal area_overplace

@export var Enter: String
@export var has_ext: bool
@export var _Exits: Array[String]
@export var left: Node_MD
@export var right: Node_MD
@export var down: Node_MD

func get_enter():
	return Enter

func get_exits():
	return _Exits

func set_left(data):
	left = data
	left.position.x -= 256
	add_child(left)
	
func set_right(data):
	right = data
	right.position.x += 256
	add_child(right)

func set_down(data):
	down = data
	down.position.y += 256
	add_child(down)

func generate():
	print(self, Enter, get_exits())
	if !get_exits():
		return
	for exit in get_exits():
		TileManager.total_tile += 1
		if exit == 'left':
			set_left(TileManager.get_right())
			left.generate()
		elif exit == 'right':
			set_right(TileManager.get_left())
			right.generate()
		elif exit == 'down':
			set_down(TileManager.get_down())
			down.generate()
	
func _on_area_2d_area_entered(_area):
	var parent = get_parent()
	var node = self
	parent.remove_child(node)
	
