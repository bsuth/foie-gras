extends Node2D


const INITIAL_TICK_TIMEOUT = 3.0


var _tick_timeout: float = INITIAL_TICK_TIMEOUT
var _seconds_since_last_tick: float = 0
var _predator_order = []


func _init():
	GameState.players = []
	_predator_order = []

	for player in PlayerManager.players:
		if player.device != -1:
			GameState.players.push_back(GameState.Player.new(player))
			_predator_order.push_back(player.id)

	randomize()
	_predator_order.shuffle()


func _input(event):
	var inputPlayer

	for player in GameState.players:
		if player.device == event.device:
			inputPlayer = player
			break

	if inputPlayer:
		if event.is_action_pressed("up"):
			if inputPlayer.position.y != 0:
				inputPlayer.direction = GameState.UP
		elif event.is_action_pressed("down"):
			if inputPlayer.position.y != GameState.stage_size.y - 1:
				inputPlayer.direction = GameState.DOWN
		elif event.is_action_pressed("left"):
			if inputPlayer.position.x != 0:
				inputPlayer.direction = GameState.LEFT
		elif event.is_action_pressed("right"):
			if inputPlayer.position.x != GameState.stage_size.x - 1:
				inputPlayer.direction = GameState.RIGHT


func _physics_process(delta: float):
	_seconds_since_last_tick += delta

	if _seconds_since_last_tick > _tick_timeout:
		_seconds_since_last_tick = 0
		_tick_timeout *= 0.95

		for player in GameState.players:
			player.position += player.direction
			if player.direction.x != 0: 
				if player.position.x == 0 || player.position.x == GameState.stage_size.x - 1:
					player.direction *= -1
			elif player.position.y == 0 || player.position.y == GameState.stage_size.y - 1:
				player.direction *= -1

		GameState.emit_signal("tick")
