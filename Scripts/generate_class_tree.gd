class_name GenerateTree extends Node2D


const exit_to_enter: Dictionary ={
	"down" : "up",
	"left" : "right",
	"right" : "left"
}

var root: Node_MD

func _init(start: Node_MD):
	root = start
	add_child(root)
	

func generate():
	var node = root
	node.generate()
