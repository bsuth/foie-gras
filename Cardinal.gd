tool extends Node

export var defaultScene : PackedScene;

func _ready():
	var instance = defaultScene.instance();
	add_child(instance);
