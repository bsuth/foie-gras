tool
extends TileMap

# ------------------------------------------------------------------------------
# Enums, Constants, Signals
# ------------------------------------------------------------------------------

var PLAYER_SCENE = load("res://World/Player.tscn")

# ------------------------------------------------------------------------------
# Main
# ------------------------------------------------------------------------------

var player_instances = {}


func _ready():
	for player in GameState.players.values():
		var player_instance = PLAYER_SCENE.instance()
		player_instances[player.device] = player_instance
		self.add_child(player_instance)

	self.clear()
	for x in range(GameState.stage_size[0]):
		for y in range(GameState.stage_size[1]):
			self.set_cell(x, y, 0)
	
	if self.is_inside_tree():
		var width = GameState.stage_size[0] * self.cell_size[0]
		var height = GameState.stage_size[1] * self.cell_size[1]
		var viewport = self.get_viewport_rect().size
		self.position = Vector2((viewport[0] - width) / 2, (viewport[1] - height) / 2)

	GameState.connect("tick", self, "_on_tick")


func _on_tick():
	for device in player_instances:
		var player = GameState.players[device]
		var player_instance = player_instances[device]
		player_instance.position.x = player.position.x * self.cell_size[0]
		player_instance.position.y = player.position.y * self.cell_size[1]
