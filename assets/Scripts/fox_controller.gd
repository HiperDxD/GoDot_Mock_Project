extends CharacterBody2D

class_name PlayerController

@export var speed = 10.0
@export var jump_power = 10.0

var speed_multiplier = 30.0
var jump_multiplier = -30.0
var is_ducking = false
var direction = 0

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and not is_ducking:
		velocity.y = jump_power * jump_multiplier
	# Handle Duck
	is_ducking = Input.is_action_pressed("duck") and is_on_floor()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction and not is_ducking:
		velocity.x = direction * speed * speed_multiplier
	elif not is_ducking:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
	else:
		velocity.x = 0 

	move_and_slide()
