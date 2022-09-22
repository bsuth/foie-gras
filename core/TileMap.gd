tool
extends TileMap

export (String, '6 x 10', '5 x 8') var layout = '6 x 10' setget set_layout

func set_layout(new_layout):
	layout = new_layout
	
	var layout_size: PoolStringArray = layout.split(' x ')
	var width := int(layout_size[1])
	var height := int(layout_size[0])

	self.clear()
	for x in range(width):
		for y in range(height):
			self.set_cell(x, y, 0)
	
	self.get_parent().set_size(Vector2(width * self.cell_size[0], height * self.cell_size[1]))
