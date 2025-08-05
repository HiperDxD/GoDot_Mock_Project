extends Node2D

@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta):
	if player_controller.direction == 1:
		sprite.flip_h = false
	elif player_controller.direction == -1:
		sprite.flip_h = true
	
	if not player_controller.is_on_floor():
		if player_controller.velocity.y < 0.0:
			animation_player.play("jump_anim")
		elif player_controller.velocity.y > 0.0:
			animation_player.play("fall_anim")
	else:
		if Input.is_action_pressed("duck") and player_controller.is_on_floor():
			animation_player.play("duck_anim")
		elif abs(player_controller.velocity.x) >0.0:
			animation_player.play("run_anim")
		elif abs(player_controller.velocity.x) == 0.0:
			animation_player.play("idle_anim")
		
