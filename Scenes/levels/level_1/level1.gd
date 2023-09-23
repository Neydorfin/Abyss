extends Node2D


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

const start: String = "res://Scenes/levels/level_1/tiles/start.tscn"

func load_scenes(scenes: Array):
	var load_scene: Array[PackedScene] = []
	for scene in scenes:
		load_scene.append(load(scene))
	return load_scene

func generate():
	var generate_tree := load("res://Scripts/generate_class_tree.gd")
	
	var close_scenes: Array[PackedScene] = load_scenes(close)
	var f_left_scenes: Array[PackedScene] = load_scenes(f_left)
	var f_right_scenes: Array[PackedScene] = load_scenes(f_right)
	var f_up_scenes: Array[PackedScene] = load_scenes(f_up)
	var start_scene = load(start).instantiate()
	
	add_child(start_scene)
	var left_1 = f_left_scenes[0].instantiate()
	add_child(left_1)
	left_1.position.x = 256
	
	var left_2 = f_left_scenes[0].instantiate()
	add_child(left_2)
	left_2.position.x = 512

# Called when the node enters the scene tree for the first time.
func _ready():
	generate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
