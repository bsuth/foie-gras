tool
extends Node2D


const INITIAL_TICK_TIMEOUT = 3.0


var _tick_timeout: float = INITIAL_TICK_TIMEOUT
var _seconds_since_last_tick: float = 0


func _init():
	GameState.players = {}
	for player in PlayerManager.players:
		if player.device != -1:
			GameState.players[player.device] = GameState.Player.new(player)


func _input(event):
	var player = GameState.players[event.device]
	if player:
		if event.is_action_pressed("up"):
			if player.position.y != 0:
				player.direction = GameState.UP
		elif player && event.is_action_pressed("down"):
			if player.position.y != GameState.stage_size.y - 1:
				player.direction = GameState.DOWN
		elif player && event.is_action_pressed("left"):
			if player.position.x != 0:
				player.direction = GameState.LEFT
		elif player && event.is_action_pressed("right"):
			if player.position.x != GameState.stage_size.x - 1:
				player.direction = GameState.RIGHT


func _physics_process(delta: float):
	_seconds_since_last_tick += delta

	if _seconds_since_last_tick > _tick_timeout:
		_seconds_since_last_tick = 0
		_tick_timeout *= 0.95

		for player in GameState.players.values():
			player.position += player.direction
			if player.direction.x != 0: 
				if player.position.x == 0 || player.position.x == GameState.stage_size.x - 1:
					player.direction *= -1
			elif player.position.y == 0 || player.position.y == GameState.stage_size.y - 1:
				player.direction *= -1

		GameState.emit_signal("tick")
