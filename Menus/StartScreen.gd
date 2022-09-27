tool extends Control

export var nextScene : PackedScene;

func _input(event):
	if event.is_action_pressed("ui_accept"):
		var instance = nextScene.instance()
		add_child(instance)

func _ready():
	pass
