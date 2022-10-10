tool
extends Node

export(NodePath) var player1Camera;
export(NodePath) var player2Camera;
export(NodePath) var player3Camera;
export(NodePath) var player4Camera;

onready var player1CameraNode = get_node(player1Camera);
onready var player2CameraNode = get_node(player2Camera);
onready var player3CameraNode = get_node(player3Camera);
onready var player4CameraNode = get_node(player4Camera);

var cameras = [player1CameraNode, player2CameraNode, player3CameraNode, player4CameraNode];

func _ready():
	pass
