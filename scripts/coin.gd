extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("add_score"):
		body.add_score(1)
		var p = AudioStreamPlayer.new()
		p.stream = preload("res://assets/brackeys_platformer_assets/sounds/coin.wav")
		get_tree().current_scene.add_child(p)  # or add_child(self) if you like
		p.play()
		queue_free()
