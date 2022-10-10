tool
extends Node 

export(Array, PackedScene) var characterPackedScenes setget setCharacterPackedScenes
export(float) var spacing setget setSpacing
var positioners = []

func cleanup():
	for positioner in positioners:
		positioner.queue_free();

func setSpacing(value):
	for i in len(positioners):
		positioners[i].position = Vector2( self.position.x + ( i * value ), 0 )
	spacing = value
	

func setCharacterPackedScenes(values):
	cleanup()
	for value in values:
		if value != null:
			var nodePositioner = Position2D.new()
			nodePositioner.add_child(value.instance())
			positioners.append(nodePositioner)
			self.add_child(nodePositioner)
	setSpacing(spacing)
	characterPackedScenes = values
	
	# for positioner in positioners:
	# 	positioner.queue_free()
	# for i in len(value):
	# 	var nodePositioner = Position2D.new()
	# 	nodePositioner.position = Vector2( self.position.x + ( i * spacing ), 0 )
	# 	positioners.append(nodePositioner)
	# 	self.add_child(nodePositioner)
	# 	if (value[i] != null):
	# 		nodePositioner.add_child(value[i].instance())

	# characterPackedScenes = value

func _ready():
	setSpacing(spacing)
