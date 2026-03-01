extends Node2D

const  SPEED = 60

var direction = 1

@onready var raycast_right: RayCast2D = $"raycast right"
@onready var ray_cast_left: RayCast2D = $"ray cast left"

func _process(delta: float) -> void:
	if raycast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
	position.x += direction * SPEED * delta
