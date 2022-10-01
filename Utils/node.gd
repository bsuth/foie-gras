extends Node

class_name NodeUtils

static func delete_children( node: Node ):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
