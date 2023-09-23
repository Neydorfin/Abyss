class_name RandomTile extends Node2D


var total_tile: int 

func _init():
	total_tile = 0

func load_scenes(scenes: Array):
	var load_scene: Array[PackedScene] = []
	for scene in scenes:
		load_scene.append(load(scene))
	return load_scene

const close: Array[String] = [
	"res://Scenes/levels/level_1/tiles/close-down.tscn",
	"res://Scenes/levels/level_1/tiles/close-left.tscn",
	"res://Scenes/levels/level_1/tiles/close-right.tscn",
]

const f_left: Array[String] = [
	"res://Scenes/levels/level_1/tiles/f-left-to-down-right.tscn",
	"res://Scenes/levels/level_1/tiles/f-left-to-down.tscn",
	"res://Scenes/levels/level_1/tiles/f-left-to-right.tscn",
]

const f_right: Array[String] = [
	"res://Scenes/levels/level_1/tiles/f-right-to-down-left.tscn",
	"res://Scenes/levels/level_1/tiles/f-right-to-down.tscn",
	"res://Scenes/levels/level_1/tiles/f-right-to-left.tscn",
]

const f_up: Array[String] = [
	"res://Scenes/levels/level_1/tiles/f-up-to-down.tscn",
	 "res://Scenes/levels/level_1/tiles/f-up-to-left-down.tscn",
	 "res://Scenes/levels/level_1/tiles/f-up-to-left-right-down.tscn",
	 "res://Scenes/levels/level_1/tiles/f-up-to-left-right.tscn",
	 "res://Scenes/levels/level_1/tiles/f-up-to-left.tscn",
	 "res://Scenes/levels/level_1/tiles/f-up-to-right-down.tscn",
	 "res://Scenes/levels/level_1/tiles/f-up-to-right.tscn"
]


var close_scenes: Array[PackedScene] = load_scenes(close)
var f_left_scenes: Array[PackedScene] = load_scenes(f_left)
var f_right_scenes: Array[PackedScene] = load_scenes(f_right)
var f_up_scenes: Array[PackedScene] = load_scenes(f_up)

func get_left():
	if TileManager.total_tile > 20:
		return close_scenes[2].instantiate()
	return f_left_scenes[randi_range(0, len(f_left_scenes)-1)].instantiate()


func get_right():
	if TileManager.total_tile > 20:
		return close_scenes[1].instantiate()
	return f_right_scenes[randi_range(0, len(f_right_scenes)-1)].instantiate()
	
func get_down():
	if TileManager.total_tile > 20:
		return close_scenes[0].instantiate()
	return f_up_scenes[randi_range(0, len(f_up_scenes)-1)].instantiate()
