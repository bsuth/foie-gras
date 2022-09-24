extends Node

signal player_connected(Player)
signal player_disconnected(Player)

var players: Array = []

class Player:
	var device: int
	var connected: bool

func _ready():
	Input.connect("joy_connection_changed", self, "on_joy_connection_changed")

func on_joy_connection_changed(device, connected):
	var existing_player: Player
	for player in players:
		if player.device == device:
			existing_player = player
			break
	
	if not existing_player:
		existing_player = Player.new()
		existing_player.device = device

	existing_player.connected = connected
	if connected:
		emit_signal("player_connected", existing_player)
	else:
		emit_signal("player_disconnected", existing_player)
