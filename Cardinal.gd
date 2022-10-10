tool
extends Node


export var defaultScene : PackedScene
export(NodePath) var sceneOwner : NodePath

onready var sceneOwnerNode = get_node(sceneOwner)


func _ready():
	sceneOwnerNode.add_child(defaultScene.instance())
