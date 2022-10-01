tool extends Node

export var nextScene : PackedScene;

func _input(event):
	if event.is_action_pressed("ui_accept"):
		GlobalUtils.Node.delete_children(self)
		replace_by(nextScene.instance())

func _ready():
	pass
