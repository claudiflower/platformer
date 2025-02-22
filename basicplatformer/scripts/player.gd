extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# runs at 60 times per second, independent of frame rate to standardize movement
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# changes direction based on left or right key press
	var direction := Input.get_axis("move_left", "move_right")
	
	# flip animation of the sprite based on direction
	if direction > 0:
		# moving right
		animated_sprite.flip_h = false
	elif direction < 0:
		# moving left
		animated_sprite.flip_h = true
		
	# Play Animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
