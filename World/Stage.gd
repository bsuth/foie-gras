tool
extends TileMap

# ------------------------------------------------------------------------------
# Enums, Constants, Signals
# ------------------------------------------------------------------------------

var PLAYER_SCENE = load("res://World/Player.tscn")

# ------------------------------------------------------------------------------
# Main
# ------------------------------------------------------------------------------

var player_instances = []


func _ready():
	for player in GameState.players.values():
		var player_instance = PLAYER_SCENE.instance()
		player_instance.player = player
		player_instances.push_back(player_instance)
		self.add_child(player_instance)

	self.clear()
	for x in range(GameState.stage_size[0]):
		for y in range(GameState.stage_size[1]):
			self.set_cell(x, y, 0)
	
	var width = GameState.stage_size[0] * self.cell_size[0]
	var height = GameState.stage_size[1] * self.cell_size[1]
	var viewport = self.get_viewport_rect().size
	self.position = Vector2((viewport[0] - width) / 2, (viewport[1] - height) / 2)

	GameState.connect("tick", self, "_on_tick")


func _on_tick():
	for player_instance in player_instances:
		var player = player_instance.player
		player_instance.position.x = player.position.x * self.cell_size[0]
		player_instance.position.y = player.position.y * self.cell_size[1]
