extends Sprite


var player: GameState.Player


func _process(delta: float):
	if player.direction == GameState.UP:
		self.rotation = 0
	elif player.direction == GameState.DOWN:
		self.rotation = PI
	elif player.direction == GameState.LEFT:
		self.rotation = 3 * PI / 2
	elif player.direction == GameState.RIGHT:
		self.rotation = PI / 2
