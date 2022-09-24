tool extends Node

export var defaultScene : PackedScene = load("res://World.tscn");

func _init():
	var instance = defaultScene.instance();
	add_child(instance);
