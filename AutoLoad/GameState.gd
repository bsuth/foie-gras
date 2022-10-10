extends Node

# ------------------------------------------------------------------------------
# Enums, Constants, Signals
# ------------------------------------------------------------------------------

enum { PREY, PREDATOR }

const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)

signal tick

# ------------------------------------------------------------------------------
# Player
# ------------------------------------------------------------------------------

class Player extends PlayerManager.Player:
	var position = Vector2(0, 0)
	var direction = DOWN
	var type = PREY


	func _init(player: PlayerManager.Player).(player.id):
		self.device = player.device

# ------------------------------------------------------------------------------
# Main
# ------------------------------------------------------------------------------

var players: Array = []
var stage_size = Vector2(10, 6)
