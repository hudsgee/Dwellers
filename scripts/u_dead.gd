extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("you died")
	var p = AudioStreamPlayer.new()
	p.stream = preload("res://assets/brackeys_platformer_assets/sounds/hurt.wav")
	get_tree().current_scene.add_child(p)  # or add_child(self) if you like
	p.play()
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
