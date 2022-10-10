extends Node

# ------------------------------------------------------------------------------
# Enums, Constants, Signals
# ------------------------------------------------------------------------------

signal player_connected(Player)
signal player_disconnected(Player)

# ------------------------------------------------------------------------------
# Player
# ------------------------------------------------------------------------------

class Player:
	var device: int = -1

# ------------------------------------------------------------------------------
# Main
# ------------------------------------------------------------------------------

var players: Array = [
	Player.new(),
	Player.new(),
	Player.new(),
	Player.new(),
]


func _ready():
	var connected_joypads = Input.get_connected_joypads()
	for i in range(min(players.size(), connected_joypads.size())):
		players[i].device = connected_joypads[i]
		emit_signal("player_connected", players[i])

	Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")


func _on_joy_connection_changed(device, connected):
	if connected:
		for player in players:
			if player.device == -1:
				player.device = device
				emit_signal("player_connected", player)
				break
	else:
		for player in players:
			if player.device == device:
				player.device = -1
				emit_signal("player_disconnected", player)
				break
