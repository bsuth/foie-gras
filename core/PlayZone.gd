tool
extends TileMap

export (String, '6 x 10', '5 x 8') var layout = '6 x 10' setget set_layout

func set_layout(new_layout):
	layout = new_layout
	
	var layout_size: PoolStringArray = layout.split(' x ')
	var num_width_cells := int(layout_size[1])
	var num_height_cells := int(layout_size[0])

	self.clear()
	for x in range(num_width_cells):
		for y in range(num_height_cells):
			self.set_cell(x, y, 0)
	
	if self.is_inside_tree():
		var width = num_width_cells * self.cell_size[0]
		var height = num_height_cells * self.cell_size[1]
		var viewport = self.get_viewport_rect().size
		self.position = Vector2((viewport[0] - width) / 2, (viewport[1] - height) / 2)
