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
	for player in GameState.players:
		var player_instance = PLAYER_SCENE.instance()
		player_instance.player = player
		player_instances.push_back(player_instance)
		self.add_child(player_instance)
	_update_player_instances()

	self.clear()
	for x in range(GameState.stage_size.x):
		for y in range(GameState.stage_size.y):
			self.set_cell(x, y, 0)
	
	var width = GameState.stage_size.x * self.cell_size.x
	var height = GameState.stage_size.y * self.cell_size.y
	var viewport = self.get_viewport_rect().size
	self.position = Vector2((viewport.x - width) / 2, (viewport.y - height) / 2)

	GameState.connect("tick", self, "_update_player_instances")


func _update_player_instances():
	for player_instance in player_instances:
		var player = player_instance.player
		player_instance.position.x = player.position.x * self.cell_size.x + self.cell_size.x / 2
		player_instance.position.y = player.position.y * self.cell_size.y + self.cell_size.y / 2
