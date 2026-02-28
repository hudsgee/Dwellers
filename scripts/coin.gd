extends Area2D


func _on_body_entered(body: Node2D) -> void:
	get_node("COINSFX").play()
	print("+1coin")
	queue_free()
