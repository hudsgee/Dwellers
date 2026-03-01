extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var score: int = 0

func add_score(amount: int):
	score += amount
	if score >= 10:
		$ScoreLabel.text = "YOU WIN 
		Score: %d" % score
	else:
		$ScoreLabel.text = "Score: %d" % score  # Updates the floating score
	print(score)
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		var p = AudioStreamPlayer.new()
		p.stream = preload("res://assets/brackeys_platformer_assets/sounds/jump.wav")
		get_tree().current_scene.add_child(p)  # or add_child(self) if you like
		p.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false  # Facing right
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true   # Facing left
	move_and_slide()
