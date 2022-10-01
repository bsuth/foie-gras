extends Node

# ------------------------------------------------------------------------------
# Enums, Constants, Signals
# ------------------------------------------------------------------------------

enum { PREY, PREDATOR }

const NORTH = Vector2(0, -1)
const SOUTH = Vector2(0, 1)
const EAST = Vector2(1, 0)
const WEST = Vector2(-1, 0)

signal tick

# ------------------------------------------------------------------------------
# Player
# ------------------------------------------------------------------------------

class Player extends PlayerManager.Player:
	var position = Vector2(0, 0)
	var direction = SOUTH
	var type = PREY


	func _init(player: PlayerManager.Player):
		self.device = player.device

# ------------------------------------------------------------------------------
# Main
# ------------------------------------------------------------------------------

var players = {}
var stage_size = Vector2(10, 6)
