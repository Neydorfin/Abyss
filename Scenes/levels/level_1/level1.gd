extends Node2D

const start: String = "res://Scenes/levels/level_1/tiles/start.tscn"

func generate():
	var start_scene = load(start).instantiate()
	var Generate_tree = GenerateTree.new(start_scene)
	Generate_tree.generate()
	$generator.add_child(Generate_tree)

# Called when the node enters the scene tree for the first time.
func _ready():
	generate()
  
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
