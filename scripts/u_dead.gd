extends Area2D

@onready var timer: Timer = $Timer
var lives: int = 5

func _on_body_entered(_body: Node2D) -> void:
	lives -= 1
	timer.start()

func _on_timer_timeout() -> void:
	print("you died: ", lives, " lives left")
	var p = AudioStreamPlayer.new()
	p.stream = preload("res://assets/brackeys_platformer_assets/sounds/hurt.wav")
	get_tree().current_scene.add_child(p)
	p.play()
	get_tree().reload_current_scene()
